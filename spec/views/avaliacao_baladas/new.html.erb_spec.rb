require 'rails_helper'

RSpec.describe "avaliacao_baladas/new", type: :view do
  before(:each) do
    assign(:avaliacao_balada, AvaliacaoBalada.new())
  end

  it "renders new avaliacao_balada form" do
    render

    assert_select "form[action=?][method=?]", avaliacao_baladas_path, "post" do
    end
  end
end
