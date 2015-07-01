class Scope
  attr_accessor :mapper, :scope

  def intialiize(mapper)
    @mapper = mapper
    @scope = mapper.export_class
  end

  def method_missing(method_name, *args, &block)
    @scope = scope.send(method_name, *args, &_map_block(block))

    scope.is_a?(ActiveRecord::Relation) ? self : _map(scope)
  end

  def _map_block(block)
    Proc.new { |*args| block.call(_map(*args)) } if block
  end

  def _map(object)
    if object.is_a?(mapper.export_class)
      mapper.map(object)
    elsif object.is_a?(Enumerable)
      object.map { |e| e.is_a?(mapper.export_class) ? mapper.map(e) : e }
    else
      object
    end
  end

  def respond_to?(method_name, include_private = false)
    scope.respond_to(method_name, include_private) || super
  end
end
