require 'rails_helper'

RSpec.describe "hash_tags/edit", type: :view do
  before(:each) do
    @hash_tag = assign(:hash_tag, HashTag.create!(
      :article_id => 1,
      :tag => "MyString"
    ))
  end

  it "renders the edit hash_tag form" do
    render

    assert_select "form[action=?][method=?]", hash_tag_path(@hash_tag), "post" do

      assert_select "input#hash_tag_article_id[name=?]", "hash_tag[article_id]"

      assert_select "input#hash_tag_tag[name=?]", "hash_tag[tag]"
    end
  end
end
