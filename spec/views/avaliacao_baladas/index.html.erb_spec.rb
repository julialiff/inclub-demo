require 'rails_helper'

RSpec.describe "avaliacao_baladas/index", type: :view do
  before(:each) do
    assign(:avaliacao_baladas, [
      AvaliacaoBalada.create!(),
      AvaliacaoBalada.create!()
    ])
  end

  it "renders a list of avaliacao_baladas" do
    render
  end
end
