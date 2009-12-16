class Presenter
  instance_methods.each do |method|
    undef_method(method) unless method =~ /^__/
  end
  
  attr_accessor :context
  def initialize(context)
    @context = context
  end
  
  def method_missing(method, *args, &block)
    method = method.to_s.gsub!(/^original_/, '').to_sym if method.to_s =~ /^original_/
    @context.__send__(method, *args, &block)
  end
  
end

class CollectionPresenter
  instance_methods.each do |method|
    undef_method(method) unless method =~ /^__/
  end
  
  def initialize(nodes)
    @nodes = nodes.map{ |n| n.presenter }
  end
  
  def method_missing(method, *attrs, &block)
    @nodes.__send__(method, *attrs, &block)
  end
end