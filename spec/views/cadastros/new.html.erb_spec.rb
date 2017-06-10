require 'rails_helper'

RSpec.describe "cadastros/new", type: :view do
  before(:each) do
    assign(:cadastro, Cadastro.new())
  end

  it "renders new cadastro form" do
    render

    assert_select "form[action=?][method=?]", cadastros_path, "post" do
    end
  end
end
