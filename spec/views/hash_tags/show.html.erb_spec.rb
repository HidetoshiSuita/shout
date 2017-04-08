require 'rails_helper'

RSpec.describe "hash_tags/show", type: :view do
  before(:each) do
    @hash_tag = assign(:hash_tag, HashTag.create!(
      :article_id => 2,
      :tag => "Tag"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Tag/)
  end
end
