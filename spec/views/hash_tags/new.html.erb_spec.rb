require 'rails_helper'

RSpec.describe "hash_tags/new", type: :view do
  before(:each) do
    assign(:hash_tag, HashTag.new(
      :article_id => 1,
      :tag => "MyString"
    ))
  end

  it "renders new hash_tag form" do
    render

    assert_select "form[action=?][method=?]", hash_tags_path, "post" do

      assert_select "input#hash_tag_article_id[name=?]", "hash_tag[article_id]"

      assert_select "input#hash_tag_tag[name=?]", "hash_tag[tag]"
    end
  end
end
