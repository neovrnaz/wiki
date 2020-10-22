# frozen_string_literal: true
require File.expand_path('wiki', File.dirname(__FILE__))
require 'rack'

set :bind, '0.0.0.0'
set :port, 9494

run WikiApp
