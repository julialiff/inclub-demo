require 'rails_helper'

RSpec.describe "baladas/edit", type: :view do
  before(:each) do
    @balada = assign(:balada, Balada.create!())
  end

  it "renders the edit balada form" do
    render

    assert_select "form[action=?][method=?]", balada_path(@balada), "post" do
    end
  end
end
