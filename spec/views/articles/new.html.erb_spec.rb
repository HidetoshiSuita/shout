require 'rails_helper'

RSpec.describe "articles/new", type: :view do
  before(:each) do
    assign(:article, Article.new(
      :title => "MyString",
      :tag => "MyString",
      :comment => "",
      :img => "",
      :genre_id => 1
    ))
  end

  it "renders new article form" do
    render

    assert_select "form[action=?][method=?]", articles_path, "post" do

      assert_select "input#article_title[name=?]", "article[title]"

      assert_select "input#article_tag[name=?]", "article[tag]"

      assert_select "input#article_comment[name=?]", "article[comment]"

      assert_select "input#article_img[name=?]", "article[img]"

      assert_select "input#article_genre_id[name=?]", "article[genre_id]"
    end
  end
end
