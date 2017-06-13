require 'rails_helper'

RSpec.describe "avaliacao_festa/show", type: :view do
  before(:each) do
    @avaliacao_festum = assign(:avaliacao_festum, AvaliacaoFestum.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
