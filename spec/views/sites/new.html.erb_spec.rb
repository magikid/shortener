require 'rails_helper'

RSpec.describe "sites/new", type: :view do
  before(:each) do
    assign(:site, Site.new(
      :short_code => "MyString",
      :url => "MyString",
      :hits => 1,
      :user => nil
    ))
  end

  it "renders new site form" do
    render

    assert_select "form[action=?][method=?]", sites_path, "post" do

      assert_select "input[name=?]", "site[short_code]"

      assert_select "input[name=?]", "site[url]"

      assert_select "input[name=?]", "site[hits]"

      assert_select "input[name=?]", "site[user_id]"
    end
  end
end
