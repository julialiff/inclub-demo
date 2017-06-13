require 'rails_helper'

RSpec.describe "usuarios/show", type: :view do
  before(:each) do
    @usuario = assign(:usuario, Usuario.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
