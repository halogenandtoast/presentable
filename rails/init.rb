require 'presentable'

ActiveRecord::Base.send(:extend, Presentable) if defined? ActiveRecord
Presentable.send(:include, ActionView::Helpers) if defined? ActionView

Array.send(:extend, Presentable::Collection)