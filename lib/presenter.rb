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