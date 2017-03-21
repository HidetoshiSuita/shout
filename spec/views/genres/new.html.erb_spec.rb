require 'rails_helper'

RSpec.describe "genres/new", type: :view do
  before(:each) do
    assign(:genre, Genre.new(
      :name => "MyString",
      :user_id => 1
    ))
  end

  it "renders new genre form" do
    render

    assert_select "form[action=?][method=?]", genres_path, "post" do

      assert_select "input#genre_name[name=?]", "genre[name]"

      assert_select "input#genre_user_id[name=?]", "genre[user_id]"
    end
  end
end
