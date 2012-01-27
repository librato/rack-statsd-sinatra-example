require './app.rb'
require 'rack-statsd'
require 'statsd'

statsd = Statsd.new('localhost',8125)

use RackStatsD::ProcessUtilization, "", "", {:stats => statsd}
run Sinatra::Application

# vim: set filetype=ruby :
