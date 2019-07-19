## [Overview](https://docs.fluentd.org/v1.0/articles/quickstart)
In Venraas, we use [td-agent](https://www.fluentd.org/faqs) to sync the streamming log from file into [BigQuery](https://cloud.google.com/bigquery/) and [GCS](https://cloud.google.com/storage/) for further analysis and backup, respectively.

![](https://drive.google.com/uc?id=1jYL61DTptrXzso7g7KgT1udDF0MtOgZT)

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

* [Plugin install command](https://docs.fluentd.org/v0.12/articles/plugin-management)
`/usr/sbin/td-agent-gem install fluent-plugin-${PluginName} -v ${Version}`

* Plugin uninstall command
`/usr/sbin/td-agent-gem uninstall fluent-plugin-${PluginName}`
* Logs
`/var/log/td-agent/td-agent.log`

## [Life of an Fluentd event](https://www.slideshare.net/tamuraaa/life-of-an-fluentd-event)
## [Configuration](https://docs.fluentd.org/v/0.12/configuration)

### [Concept](https://docs.fluentd.org/v0.12/articles/config-file#list-of-directives)
#### [How tag match patterns work](https://docs.fluentd.org/v/0.12/configuration/config-file#how-match-patterns-work)

### Plugins
#### [Input Plugin](https://docs.fluentd.org/v0.12/articles/input-plugin-overview)
* [tail](https://docs.fluentd.org/v0.12/articles/in_tail)

#### [Parser Plugin](http://docs.fluentd.org/v0.12/articles/parser-plugin-overview)
Customer defined the field keys of the event record.  
See [Built-in Parsers](http://docs.fluentd.org/v0.12/articles/parser-plugin-overview#list-of-built-in-parsers).

* [regexp](https://docs.fluentd.org/v0.12/articles/parser_regexp) - regexp for the format field
  * [Fluentular](http://fluentular.herokuapp.com/)
  * If the parameter value starts and ends with “/”, it is considered to be a regexp, e.g.
```
format /^(?<logdt>[^|]*)\|(?<loglevel>[^|]*)\|(?<logbody>.*)$/`
```

* [none](https://docs.fluentd.org/v0.12/articles/parser_none)
  * This will parse the line as-is with the key name “message”.

#### [Output Plugin](https://docs.fluentd.org/v0.12/articles/output-plugin-overview#overview)
* [Buffer Plugin](http://docs.fluentd.org/v0.12/articles/buffer-plugin-overview)
  * [Buffered Output Parameters](http://docs.fluentd.org/v0.12/articles/output-plugin-overview#buffered-output-parameters)

* [copy Output Plugin](http://docs.fluentd.org/v0.12/articles/out_copy)

* [fluent-plugin-copy_ex](https://github.com/sonots/fluent-plugin-copy_ex)

* [Google Cloud Storage Out](https://github.com/matsuokah/fluent-plugin-google-cloud-storage-out) - local file to google cloud storage
  * installation `td-agent-gem install fluent-plugin-google-cloud-storage-out`
  
* [BigQuery Output Plugin](https://github.com/kaizenplatform/fluent-plugin-bigquery) - local file to BigQuery
  * installation `td-agent-gem install fluent-plugin-bigquery`
  * [Bigquery Quota Policy](https://cloud.google.com/bigquery/quota-policy#streaminginserts)

## Reference
* [Life of an Fluentd event](https://www.slideshare.net/tamuraaa/life-of-an-fluentd-event)
* [Buffer Plugin Overview](https://docs.fluentd.org/v/0.12/output)
* [Plugin Management - td-agent-gem](https://docs.fluentd.org/v/0.12/deployment/plugin-management)
* [Writing plugins - Filter Plugins](https://docs.fluentd.org/v0.12/articles/plugin-development)
* [fluent-plugin-docker](https://github.com/edsiper/fluent-plugin-docker/blob/master/lib/fluent/plugin/filter_docker.rb)
* [rubydoc Module: Oj](http://www.rubydoc.info/github/ohler55/oj/Oj#load-class_method)
