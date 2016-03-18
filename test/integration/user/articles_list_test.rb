require 'test_helper'

class User::ArticlesListTest < IT
  include Loco::Emitter
  include CommonHelpers
  include UserHelpers

  def setup
    super
    sign_in_user 'zbigniew.humeniuk@example.com', 'secret'
  end

  test "should update the list to include a new article" do
    create_article_for :user_zbig
    assert page.has_content? 'Article #1'
    assert page.has_content? 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
  end

  test "should update published on the list" do
    visit '/user/articles'
    articles(:two).publish
    emit articles(:two), :updated, for: [users(:user_zbig)]
    within "#article_#{articles(:two).id} td.published" do
      assert page.has_content? "yes"
    end
  end

  test "should update title of updated article on the list" do
    visit '/user/articles'
    update_article :two
    assert page.has_content? 'WiAR'
  end

  test "should remove article from the list on destroy" do
    title = articles(:one).title
    destroy_article :one
    assert_not page.has_content? title
  end

  private

    def create_article_for user_name
      article = users(user_name).articles.new({
        title: 'Article #1',
        text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
      }).tap{ |a| a.save! }
      emit article, :created, for: [users(user_name)]
      article
    end

    def destroy_article name
      articles(name).tap do |article|
        article.destroy
        emit article, :destroyed, for: [users(:user_zbig)]
      end
    end
end