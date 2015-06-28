# Roku Toolkit

A simple set of Roku development tools to ease and simplify deployment. Tested on OSX and Linux, should work on Windows.

## Installation

Add this line to your application's Gemfile:

    gem 'roku'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install roku

## Configuration

In order to use the Roku Toolkit, you must first initialize a `roku.yml` file. You have two options for placement of the `roku.yml` file.

### Home Directory / Global Configuration (recommended if you only have one project)

This method is recommended if you only have one Roku project because it will allow you to run the `roku` command from any directory, including sub directories and from paths outside of your project root.

File location: 
- Unix/OSX: `~/roku.yml` or `/Users/<username>/roku.yml`
- Windows XP: `<root>\Documents and Settings\<username>`
- Windows Vista and Up: `<root>\Users\<username>\roku.yml`

Example File:
```yml
ip          : "192.168.1.6"
username    : "rokudev"
password    : "1234"
directory   : "/Users/exampleuser/code/brightscript/example_project"
```

**Note:** It is important to note the additional `directory` key that is required for Global Configuration so that the Roku Toolkit may know where your project lives.

### Project Configuration (recommended for multiple projects)

This method is recommended for multiple Roku projects because it allows for per-directory based configuration files. The downside to this method is that you must ensure you run the `roku` command from the project root where your `roku.yml` file is located.

File Location:
- File location should be the root of your project. (ie: ~/code/brightscript/example_project/roku.yml)

Example File:
```yml
ip          : "192.168.1.6"
username    : "rokudev"
password    : "1234"
```

## Usage

Depending on your configuration (see above), simply run `roku` from your command line to build and deploy your project to your Roku development box. 

## Contributing

1. Fork it ( http://github.com/<my-github-username>/roku/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
