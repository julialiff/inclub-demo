require 'rails_helper'

RSpec.describe "administradors/edit", type: :view do
  before(:each) do
    @administrador = assign(:administrador, Administrador.create!())
  end

  it "renders the edit administrador form" do
    render

    assert_select "form[action=?][method=?]", administrador_path(@administrador), "post" do
    end
  end
end
