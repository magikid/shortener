require 'rails_helper'

RSpec.describe "sites/show", type: :view do
  it "renders attributes in <p>" do
    site = create(:site, short_code: "123abc",
                         url: "https://google.com",
                         hits: 2)
    assign(:site, site)

    render
    expect(rendered).to match(/123abc/)
    expect(rendered).to match(/https:\/\/google.com/)
    expect(rendered).to match(/2/)
  end
end
