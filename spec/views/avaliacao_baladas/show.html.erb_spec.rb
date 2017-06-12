require 'rails_helper'

RSpec.describe "avaliacao_baladas/show", type: :view do
  before(:each) do
    @avaliacao_balada = assign(:avaliacao_balada, AvaliacaoBalada.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
