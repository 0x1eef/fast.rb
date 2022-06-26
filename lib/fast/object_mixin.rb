module Fast::ObjectMixin
  def fast(enum)
    Module.new {
      extend Fast
      define_singleton_method(:enum) { enum }
    }
  end
end

class Object
  include Fast::ObjectMixin
end
