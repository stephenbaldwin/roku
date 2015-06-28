require "roku/version"
require "roku/config"
require 'mechanize'
require 'fileutils'

module Roku
  autoload :Zip,        "roku/zip"
  autoload :Exception,  "roku/exception"

  extend Config, self

  ensure_config!

  def run
    build
    deploy
  end

  def build
    puts "Build started."

    FileUtils.rm build_output if File.exists? build_output
    Zip.generate directory, build_output

    puts "Build complete! Build available at #{build_output}"
  end

  def deploy
    raise Exception::NotBuilt, "No build found at #{build_output}" unless File.exists? build_output

    puts "Deployment started."

    mount = "http://#{config['ip']}"

    agent = Mechanize.new
    agent.add_auth mount, config['username'], config['password']
    agent.get mount # Roku does not respond unless the page has been viewed first

    agent.post "#{mount}/plugin_install", {
      archive: File.new(build_output),
      mysubmit: "Replace"
    }

    puts "Deployment complete."
  end

end
