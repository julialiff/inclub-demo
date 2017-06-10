require 'rails_helper'

RSpec.describe "baladas/index", type: :view do
  before(:each) do
    assign(:baladas, [
      Balada.create!(),
      Balada.create!()
    ])
  end

  it "renders a list of baladas" do
    render
  end
end
