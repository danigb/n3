require 'yaml' 
YAML::ENGINE.yamler = 'syck'

# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.14' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

if Gem::VERSION >= "1.3.6"
  module Rails 
    class GemDependency 
      def requirement 
        r = super 
        (r == Gem::Requirement.default) ? nil : r 
      end 
    end 
  end 
end


Rails::Initializer.run do |config|
  config.gem 'will_paginate', :version => '~> 2.3.8'
  config.time_zone = 'UTC'
end
