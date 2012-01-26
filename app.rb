# an example app which has randomized delay

require 'sinatra'

get '/' do
  sleep(rand)
  'woke up!'
end
