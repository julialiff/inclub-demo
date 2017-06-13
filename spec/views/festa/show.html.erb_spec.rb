require 'rails_helper'

RSpec.describe "festa/show", type: :view do
  before(:each) do
    @festum = assign(:festum, Festum.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
