require 'rails_helper'

RSpec.describe "avaliacao_festa/index", type: :view do
  before(:each) do
    assign(:avaliacao_festa, [
      AvaliacaoFestum.create!(),
      AvaliacaoFestum.create!()
    ])
  end

  it "renders a list of avaliacao_festa" do
    render
  end
end
