require 'oj'
require 'fluent/filter'
require 'fluent/plugin'

module Fluent
  class FilterWeblog < Filter
    Plugin.register_filter('filter_weblog', self)

    def initialize
      super
    end

    def configure(conf)
      super
    end

    def is_json(json)
      Oj.load(json)
        return true
      rescue Oj::ParseError => e
        return false
    end

    def filter(tag, time, record)
      log_hash = {}

      record.each do |key, array|
        if 0 < array.length 
          if is_json(array[0])
            act_json = array[0]
            act_hash = Oj.load(act_json)
            act_hash.each do |k, v|
              log_hash[k] = v
            end
          else
            log_hash[key] = array[0]
          end
        end
      end

      log_hash
    end
  end
end
