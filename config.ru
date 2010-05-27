require 'rubygems'
require 'sinatra'
require "yaml"
require 'sinatra/x_send_file'

S_PARAMS = YAML::load(File.open("params.yml").read)

ENV['RACK_ENV'] = "development"
Sinatra::XSendFile.replace_send_file! #replaces sinatra's send_file with x_send_file

Sinatra::Base.set(:run, false)
Sinatra::Base.set(:environment, :production)
Sinatra::Base.set(:xsf_header, 'X-Accel-Redirect')


require 'files.rb'
run Sinatra::Application