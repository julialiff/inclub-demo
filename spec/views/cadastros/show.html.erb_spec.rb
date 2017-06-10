require 'rails_helper'

RSpec.describe "cadastros/show", type: :view do
  before(:each) do
    @cadastro = assign(:cadastro, Cadastro.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
