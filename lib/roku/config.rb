# This concern is abstracted only for readability within roku.rb
require 'yaml'
require 'tmpdir'

module Roku
  module Config

    def ensure_config!
      config # TODO: Clean up
    end

    private

    def config
      @config ||= fetch_config.tap do |config|
        @directory = config['directory'] if config['directory']
      end
    rescue Errno::ENOENT
      raise Exception::NotConfigured, "Please configure gem. See https://github.com/stephenbaldwin/roku#configuration for more information"
    end

    def directory
      @directory ||= dir_cmd
    end

    def dir_cmd
      Dir.pwd # TODO: Check Windows compatibility of Dir.pwd VS File.expand_path File.dirname(__FILE__)
    end

    def build_output
      @build_output ||= "#{Dir.tmpdir}/roku.zip" # TODO: Check Windows compatibility
    end

    def fetch_config
      YAML.load_file(dir_cmd + '/roku.yml')
    rescue Errno::ENOENT
      YAML.load_file(ENV['HOME'] + '/roku.yml')
    end

  end
end
