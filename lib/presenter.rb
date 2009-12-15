class Presenter
  include ActionView::Helpers
  attr_accessor :resource
  def initialize(resource)
    @resource = resource
  end
  
  def method_missing(method, *args, &block)
    @resource.send(method, *args, &block)
  end
end

class CollectionPresenter
  include Enumerable
  def initialize(nodes)
    @nodes = nodes.map{ |n| n.presenter }
  end
  
  def each
    @nodes.each { |n| yield n }
  end
end