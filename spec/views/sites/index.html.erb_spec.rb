require 'rails_helper'

RSpec.describe "sites/index", type: :view do
  before(:each) do
    assign(:sites, [
      Site.create!(
        :short_code => "Short Code",
        :url => "Url",
        :hits => 2,
        :user => nil
      ),
      Site.create!(
        :short_code => "Short Code",
        :url => "Url",
        :hits => 2,
        :user => nil
      )
    ])
  end

  it "renders a list of sites" do
    render
    assert_select "tr>td", :text => "Short Code".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
