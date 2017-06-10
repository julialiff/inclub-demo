require 'rails_helper'

RSpec.describe "cadastros/edit", type: :view do
  before(:each) do
    @cadastro = assign(:cadastro, Cadastro.create!())
  end

  it "renders the edit cadastro form" do
    render

    assert_select "form[action=?][method=?]", cadastro_path(@cadastro), "post" do
    end
  end
end
