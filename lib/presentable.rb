path = File.expand_path(File.dirname(__FILE__))
$LOAD_PATH << path unless $LOAD_PATH.include?(path)
require 'presenter'

module Presentable
  module ClassExtension
    def self.extended(klass)
      klass.class_eval do
        include Presentable::PresentableMethods::InstanceMethods
      end
    end
  end
  
  module PresentableMethods
    module InstanceMethods
      def presenter_name
        @presenter_name ||= self.class.to_s + 'Presenter'
      end
      def presenter
        presenter_name.constantize.new(self)
      end
    end
  end
  
  module Collection
    module ClassExtension
      def self.extended(klass)
        klass.class_eval do
          include Presentable::Collection::PresentableMethods::InstanceMethods
        end
      end
    end

    module PresentableMethods
      module InstanceMethods
        def presenter
          CollectionPresenter.new(self)
        end
      end
    end
  end
   
end