require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :email => "Email",
      :provider => "Provider",
      :uid => "Uid",
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Provider/)
    expect(rendered).to match(/Uid/)
    expect(rendered).to match(/Name/)
  end
end
