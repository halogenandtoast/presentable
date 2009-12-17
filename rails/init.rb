require 'presentable'
Presenter.send(:include, ActionView::Helpers) if Object.const_get("ActionView")