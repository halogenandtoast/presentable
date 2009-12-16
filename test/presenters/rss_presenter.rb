class RssPresenter < Presenter
  def is_rss_presenter?
    true
  end
  
  def is_post_presenter?
    false
  end
end