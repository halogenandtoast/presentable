path = File.expand_path(File.dirname(__FILE__))
$LOAD_PATH << path unless $LOAD_PATH.include?(path)
require 'presenter'

module Presentable
  attr_accessor :presenter_name, :presenter
  def presenter_name
    @presenter_name ||= self.class.to_s + 'Presenter'
  end
  
  def presenter(name = nil)
    klass_name = case name
      when NilClass then presenter_name
      when String, Symbol
        klass = name.to_s.gsub(/(?:^|_)(.)/) { $1.upcase }
        klass.gsub!(/$/, 'Presenter') unless klass_name =~ /Presenter$/
        klass
      else
        name.to_s
    end
    @presenter_name = klass_name
    Object.module_eval("::#{klass_name}", __FILE__, __LINE__).new(self)
  end
  
  module Collection
    def presenter
      CollectionPresenter.new(self)
    end
  end
end