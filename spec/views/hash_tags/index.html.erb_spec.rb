require 'rails_helper'

RSpec.describe "hash_tags/index", type: :view do
  before(:each) do
    assign(:hash_tags, [
      HashTag.create!(
        :article_id => 2,
        :tag => "Tag"
      ),
      HashTag.create!(
        :article_id => 2,
        :tag => "Tag"
      )
    ])
  end

  it "renders a list of hash_tags" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Tag".to_s, :count => 2
  end
end
