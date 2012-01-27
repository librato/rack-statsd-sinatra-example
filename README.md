[rack-statsd](https://github.com/github/rack-statsd) is rack middleware designed to automatically measure request latencies of rack applications and graph them over time via statsd. Since it works on the request level, it requires no access or modification to your application to function; simply add the middleware in front of your app and rack-statsd takes care of the rest.

This is an example Sinatra app written to show off its usage. To demonstrate how the middleware works, the application randomly delays itself while serving requests to simulate the real response times of a web application. You can swap in any other rack application without issue. The specifics are in `config.ru` where the statsd client is instantiated and passed to rack-statsd.

To get up and running:

* Install and configure a [statsd](https://github.com/etsy/statsd) instance. Librato provides its own [fork](https://github.com/librato/statsd) with stability improvements and Librato [Metrics](https://metrics.librato.com) support. By default statsd will accept connections at localhost on 8125.
* Run a `bundle install` to install needed packages.
* Configure the statsd client and rack-statsd options in `config.ru` if needed. See [RackStatsD::ProcessUtilization::initialize](https://github.com/github/rack-statsd/blob/master/lib/rack-statsd.rb) for more info.
* Run `bundle exec unicorn` to start the server. Access http://localhost:8080 and verify that stats are being sent to statsd. Note: enabling `dumpMessages` in statsd's configuration file will print each message received to standard out. This makes it easier to confirm that things are working.

Note: rack-statsd works under [Thin](http://code.macournoyer.com/thin/) and [Unicorn](http://unicorn.bogomips.org/). Additionally, the middleware is not thread-safe, take care to view the precautions in [rack-statsd.rb](https://github.com/github/rack-statsd/blob/master/lib/rack-statsd.rb).
