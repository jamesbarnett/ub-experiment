class IdentityMap
  class << self
    def add(record)
      raise ArgumentError.new('Record could not be added with a nil id') unless record.id
      repository[key(record.class)][record.id] = record
    end

    def remove(record)
      repository[key(record.class)].delete(record.id)
    end

    def get(klass, id)
      repository[key(klass)][id]
    end

    def clear
      repository.clear
    end

    def repository
      Thread.current[:identity_map] ||= Hash.new { |h, k| h[k] = {} }
    end

    def key(klass)
      klass
    end
  end
end
