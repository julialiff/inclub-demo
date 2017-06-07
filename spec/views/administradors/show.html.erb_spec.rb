require 'rails_helper'

RSpec.describe "administradors/show", type: :view do
  before(:each) do
    @administrador = assign(:administrador, Administrador.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
