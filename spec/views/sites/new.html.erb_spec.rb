require 'rails_helper'

RSpec.describe "sites/new", type: :view do
  it "renders new site form" do
    site = build_stubbed(:site, short_code: "abc123", url: "https://google.com")

    render

    assert_select "form[action=?][method=?]", sites_path, "post" do

      assert_select "input[name=?]", "site[short_code]"

      assert_select "input[name=?]", "site[url]"
    end
  end
end
