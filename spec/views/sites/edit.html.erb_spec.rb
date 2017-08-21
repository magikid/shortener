require 'rails_helper'

RSpec.describe "sites/edit", type: :view do
  before(:each) do
    @site = assign(:site, Site.create!(
      :short_code => "MyString",
      :url => "MyString",
      :hits => 1,
      :user => nil
    ))
  end

  it "renders the edit site form" do
    render

    assert_select "form[action=?][method=?]", site_path(@site), "post" do

      assert_select "input[name=?]", "site[short_code]"

      assert_select "input[name=?]", "site[url]"

      assert_select "input[name=?]", "site[hits]"

      assert_select "input[name=?]", "site[user_id]"
    end
  end
end
