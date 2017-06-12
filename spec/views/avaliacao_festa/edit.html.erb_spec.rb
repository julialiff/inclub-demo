require 'rails_helper'

RSpec.describe "avaliacao_festa/edit", type: :view do
  before(:each) do
    @avaliacao_festum = assign(:avaliacao_festum, AvaliacaoFestum.create!())
  end

  it "renders the edit avaliacao_festum form" do
    render

    assert_select "form[action=?][method=?]", avaliacao_festum_path(@avaliacao_festum), "post" do
    end
  end
end
