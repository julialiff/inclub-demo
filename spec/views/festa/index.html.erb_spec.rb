require 'rails_helper'

RSpec.describe "festa/index", type: :view do
  before(:each) do
    assign(:festa, [
      Festum.create!(),
      Festum.create!()
    ])
  end

  it "renders a list of festa" do
    render
  end
end
