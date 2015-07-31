# This example is pulled straight from https://github.com/rubyzip/rubyzip/blob/master/samples/example_recursive.rb
# With the exception of a minor class method addition on line 8 and dot file exclusion on line 9
require 'zip'

module Roku
  class Zip

    def self.generate(input, output); new(input, output).write; end
    def files_in(dir)
      Dir.entries(dir).select {|file| file =~ /^[^\.]/ }
    end

    # Initialize with the directory to zip and the location of the output archive.
    def initialize(inputDir, outputFile)
      @inputDir = inputDir
      @outputFile = outputFile
    end

    # Zip the input directory.
    def write
      entries = files_in(@inputDir)
      io = ::Zip::File.open(@outputFile, ::Zip::File::CREATE);

      writeEntries(entries, "", io)
      io.close;
    end

    # A helper method to make the recursion work.
    private
    def writeEntries(entries, path, io)

      entries.each { |e|
        zipFilePath = path == "" ? e : ::File.join(path, e)
        diskFilePath = ::File.join(@inputDir, zipFilePath)
        puts "Deflating " + diskFilePath
        if  File.directory?(diskFilePath)
          io.mkdir(zipFilePath)
          subdir = files_in(diskFilePath)
          writeEntries(subdir, zipFilePath, io)
        else
          io.get_output_stream(zipFilePath) { |f| f.puts(File.open(diskFilePath, "rb").read())}
        end
      }
    end

  end

end
