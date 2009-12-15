require 'presentable'

if defined? ActiveRecord
  ActiveRecord::Base.send(:extend, Presentable::ClassExtension)
end

Array.send(:extend, Presentable::Collection::ClassExtension)