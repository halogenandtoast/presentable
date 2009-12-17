require 'presentable'

ActiveRecord::Base.send(:include, Presentable) if defined? ActiveRecord
Presentable.send(:include, ActionView::Helpers) if defined? ActionView

Array.send(:include, Presentable::Collection)