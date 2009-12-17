class Presenter
  
  attr_accessor :context
  def initialize(context = nil)
    if context
      @context = context 
      class << self
        Object.instance_methods.each do |method|
          undef_method(method) unless method =~ /^__/ || method == 'method_missing'
        end
      end
    end
  end
  
  def method_missing(method, *args, &block)
    method = method.to_s.gsub!(/^original_/, '').to_sym if method.to_s =~ /^original_/
    @context.__send__(method, *args, &block)
  end
  
  def self.presents_like(*presenters)
    presenters.each do |other_presenter|
      other_presenter.instance_methods.each do |method|
        class_eval %[
          def #{method}(*args, &block)
            (@#{other_presenter.to_s.downcase} ||= #{other_presenter.to_s}.new(context)).__send__(:#{method}, *args, &block) 
          end
        ] unless method =~ /^__/ || [:context, :context=, :method_missing].include?(method.to_sym)
      end
    end
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