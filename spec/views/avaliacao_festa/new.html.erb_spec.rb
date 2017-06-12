require 'rails_helper'

RSpec.describe "avaliacao_festa/new", type: :view do
  before(:each) do
    assign(:avaliacao_festum, AvaliacaoFestum.new())
  end

  it "renders new avaliacao_festum form" do
    render

    assert_select "form[action=?][method=?]", avaliacao_festa_path, "post" do
    end
  end
end
