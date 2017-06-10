require 'rails_helper'

RSpec.describe "administradors/index", type: :view do
  before(:each) do
    assign(:administradors, [
      Administrador.create!(),
      Administrador.create!()
    ])
  end

  it "renders a list of administradors" do
    render
  end
end
