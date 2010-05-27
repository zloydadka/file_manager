require 'rubygems'
require 'sinatra'
require "yaml"
require "database.rb"

S_PARAMS = YAML::load(File.open("params.yml").read)

ENV['RACK_ENV'] = "development"

Sinatra::Base.set(:run, false)
Sinatra::Base.set(:environment, :production)


require 'files.rb'
run Sinatra::Application