require 'test_helper'

class PresenterTest < Test::Unit::TestCase
  def test_presenter
    post = Post.new.presenter
    assert post.is_post_presenter?
    assert post.is_rss_presenter? == false
  end
  
  def test_presenter_naming
    [:rss, 'rss', RssPresenter].each do |presenter|
      post = Post.new.presenter(presenter)
      assert post.is_rss_presenter?
      assert post.is_post_presenter? == false
    end
    post = Post.new.presenter
    assert post.is_post_presenter?
    assert post.is_rss_presenter? == false
  end
end