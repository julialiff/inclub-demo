require 'rails_helper'

RSpec.describe "administradors/new", type: :view do
  before(:each) do
    assign(:administrador, Administrador.new())
  end

  it "renders new administrador form" do
    render

    assert_select "form[action=?][method=?]", administradors_path, "post" do
    end
  end
end
