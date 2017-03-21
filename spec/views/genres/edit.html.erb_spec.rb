require 'rails_helper'

RSpec.describe "genres/edit", type: :view do
  before(:each) do
    @genre = assign(:genre, Genre.create!(
      :name => "MyString",
      :user_id => 1
    ))
  end

  it "renders the edit genre form" do
    render

    assert_select "form[action=?][method=?]", genre_path(@genre), "post" do

      assert_select "input#genre_name[name=?]", "genre[name]"

      assert_select "input#genre_user_id[name=?]", "genre[user_id]"
    end
  end
end
