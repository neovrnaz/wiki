# frozen_string_literal: true

require File.expand_path('wiki', File.dirname(__FILE__))
require 'rack'

use Rack::MethodOverride

set :bind, '127.0.0.1'
set :port, 9494

run WikiApp
