require 'rails_helper'

RSpec.describe "usuarios/index", type: :view do
  before(:each) do
    assign(:usuarios, [
      Usuario.create!(),
      Usuario.create!()
    ])
  end

  it "renders a list of usuarios" do
    render
  end
end
