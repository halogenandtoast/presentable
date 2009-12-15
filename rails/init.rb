require 'presentable'

if defined? ActiveRecord
  ActiveRecord::Base.send(:extend, Presentable::ClassExtension)
end