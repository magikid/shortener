require 'rails_helper'

RSpec.describe "sites/index", type: :view do
  it "renders a list of sites" do
    site1 = build_stubbed(:site, short_code: "abc123", url: "https://google.com", hits: 2)
    site2 = build_stubbed(:site, short_code: "zyx987", url: "https://bing.com", hits: 2)
    assign(:sites, [site1, site2])

    render

    assert_select "tr>td", :text => "abc123".to_s, :count => 1
    assert_select "tr>td", :text => "zyx987".to_s, :count => 1
    assert_select "tr>td", :text => "https://google.com".to_s, :count => 1
    assert_select "tr>td", :text => "https://bing.com".to_s, :count => 1
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
