class Presenter
  include ActionView::Helpers
  attr_accessor :resource
  def initialize(resource)
    @resource = resource
  end
  
  def method_missing(method, *args, &block)
    @resource.send(method, *args, &block)
  end
  
  def id
    @resource.id
  end
  
  def class
    @resource.class
  end
  
  def to_param
    @resource.to_param
  end
end

class CollectionPresenter

  def initialize(nodes)
    @nodes = nodes.map{ |n| n.presenter }
  end
  
  def method_missing(method, *attrs, &block)
    @nodes.send(method, *attrs, &block)
  end
end