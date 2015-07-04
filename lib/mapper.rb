class Mapper
  class << self
    attr_reader :base_class, :export_class

    def maps(mapping)
      require 'byebug' ; byebug
      @base_class, @export_class = *mapping.first
    end

    def map(object)
      if object.is_a? base_class
        export(object)
      else
        import(object)
      end
    end

    def export(base, record = nil)
      return unless base

      if record
        record.assign_attributes(base.attributes)
      else
        record = export_class.new(base.attributes)
      end

      record
    end

    def import(record)
      base_class.new(record.attributes) if record
    end
  end
end
