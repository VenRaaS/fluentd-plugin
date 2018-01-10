## [Fluentd](http://www.fluentd.org/) Overview

## Prerequisite
* td-agent 0.12.35
* Ruby 2.1
* fluent-plugin-bigquery (0.4.4)
* fluent-plugin-copy_ex (0.0.3)
* fluent-plugin-google-cloud-storage-out (0.1.12)

### [Installation](http://docs.fluentd.org/v0.12/categories/installation)
* [RPM Package (Redhat Linux)](http://docs.fluentd.org/v0.12/articles/install-by-rpm)
```
curl -L https://toolbelt.treasuredata.com/sh/install-redhat-td-agent2.sh | sh
```

* [DEB Package (Debian / Ubuntu Linux)](http://docs.fluentd.org/v0.12/articles/install-by-deb), ubuntu 14.04 LTS / Trusty
```
curl -L https://toolbelt.treasuredata.com/sh/install-ubuntu-trusty-td-agent2.sh | sh
```

### Service commands of [td-agent](http://www.fluentd.org/faqs)
* Launch daemon
`service td-agent start`

* Reload configuration
`service td-agent reload`

### Locations
* Main execution file
`/usr/sbin/td-agent`
* Configuration file
`/etc/td-agent/td-agent.conf`
* Plugin install command
`/usr/sbin/td-agent-gem install fluent-plugin-${PluginName}`
* Plugin uninstall command
`/usr/sbin/td-agent-gem uninstall fluent-plugin-${PluginName}`
* Logs
`/var/log/td-agent/td-agent.log`

### [Configuration](https://docs.fluentd.org/v0.12/articles/config-file)
#### [Parser Plugin](http://docs.fluentd.org/v0.12/articles/parser-plugin-overview)
Customer defined the field keys of the event record. Check [Here](http://docs.fluentd.org/v0.12/articles/parser-plugin-overview#list-of-built-in-parsers) for Built-in Parsers.

##### regexp - regexp for the format field
* [Fluentular](http://fluentular.herokuapp.com/)
* If the parameter value starts and ends with “/”, it is considered to be a regexp.
TODO...
```
format /^(?<logdt>[^|]*)\|(?<loglevel>[^|]*)\|(?<logbody>.*)$/`
```

##### none
* This will parse the line as-is with the key name “message”.

## Plugins
### [Buffer Plugin](http://docs.fluentd.org/v0.12/articles/buffer-plugin-overview)
* [Buffered Output Parameters](http://docs.fluentd.org/v0.12/articles/output-plugin-overview#buffered-output-parameters)

### [copy Output Plugin](http://docs.fluentd.org/v0.12/articles/out_copy)

### [fluent-plugin-copy_ex](https://github.com/sonots/fluent-plugin-copy_ex)

### Local File to BigQuery - [BigQuery Output Plugin](https://github.com/kaizenplatform/fluent-plugin-bigquery)
#### Installation
```
td-agent-gem install fluent-plugin-bigquery
```

#### Configuration
##### [Generates credential](https://cloud.google.com/solutions/real-time/fluentd-bigquery#docker-container-contents-and-usage-outside-of-compute-engine)

##### td-agent.conf

* [Bigquery Quota Policy](https://cloud.google.com/bigquery/quota-policy#streaminginserts)

### Local File to Google Storage - [Google Cloud Storage Out](https://github.com/matsuokah/fluent-plugin-google-cloud-storage-out)
#### Installation
```
td-agent-gem install fluent-plugin-google-cloud-storage-out
```

## Reference
* [Concept](https://docs.fluentd.org/v0.12/articles/config-file#list-of-directives)
* [Plugin Management - td-agent-gem](https://docs.fluentd.org/v0.12/articles/plugin-management)
* [Writing plugins - Filter Plugins](https://docs.fluentd.org/v0.12/articles/plugin-development)
* [fluent-plugin-docker](https://github.com/edsiper/fluent-plugin-docker/blob/master/lib/fluent/plugin/filter_docker.rb)
* [rubydoc Module: Oj](http://www.rubydoc.info/github/ohler55/oj/Oj#load-class_method)
