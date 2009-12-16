path = File.expand_path(File.dirname(__FILE__))
$LOAD_PATH << path unless $LOAD_PATH.include?(path)
require 'presenter'

module Presentable
  module ClassExtension
    attr_accessor :presenter_name
    def presenter_name
      @presenter_name ||= self.class.to_s + 'Presenter'
    end
    def presenter
      presenter_name.constantize.new(self)
    end
  end
  module Collection
    module ClassExtension
      def presenter
        CollectionPresenter.new(self)
      end
    end
  end
end