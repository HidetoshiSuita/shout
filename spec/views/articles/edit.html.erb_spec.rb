require 'rails_helper'

RSpec.describe "articles/edit", type: :view do
  before(:each) do
    @article = assign(:article, Article.create!(
      :title => "MyString",
      :tag => "MyString",
      :comment => "",
      :img => "",
      :genre_id => 1
    ))
  end

  it "renders the edit article form" do
    render

    assert_select "form[action=?][method=?]", article_path(@article), "post" do

      assert_select "input#article_title[name=?]", "article[title]"

      assert_select "input#article_tag[name=?]", "article[tag]"

      assert_select "input#article_comment[name=?]", "article[comment]"

      assert_select "input#article_img[name=?]", "article[img]"

      assert_select "input#article_genre_id[name=?]", "article[genre_id]"
    end
  end
end
