require 'rails_helper'

RSpec.describe "sites/show", type: :view do
  before(:each) do
    @site = assign(:site, Site.create!(
      :short_code => "Short Code",
      :url => "Url",
      :hits => 2,
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Short Code/)
    expect(rendered).to match(/Url/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
  end
end
