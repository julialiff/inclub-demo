require 'rails_helper'

RSpec.describe "cadastros/index", type: :view do
  before(:each) do
    assign(:cadastros, [
      Cadastro.create!(),
      Cadastro.create!()
    ])
  end

  it "renders a list of cadastros" do
    render
  end
end
