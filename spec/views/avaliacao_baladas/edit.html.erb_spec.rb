require 'rails_helper'

RSpec.describe "avaliacao_baladas/edit", type: :view do
  before(:each) do
    @avaliacao_balada = assign(:avaliacao_balada, AvaliacaoBalada.create!())
  end

  it "renders the edit avaliacao_balada form" do
    render

    assert_select "form[action=?][method=?]", avaliacao_balada_path(@avaliacao_balada), "post" do
    end
  end
end
