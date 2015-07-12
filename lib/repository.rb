class Repository
  class << self
    attr_accessor :mapper

    def save!(domain)
      record = IdentityMap.get(mapper.export_class, domain.id)
      record = mapper.export(domain, record)
      response = record.save!
      IdentityMap.add(record)
      domain.id = record.id
      response
    end
  end

  # def self.method_missing(method_name, *args, &block)
  #   puts "method_name: #{method_name}"
  #   Scope.new(mapper).send(method_name, *args, &block)
  # end
end
