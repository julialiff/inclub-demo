require 'rails_helper'

RSpec.describe "baladas/new", type: :view do
  before(:each) do
    assign(:balada, Balada.new())
  end

  it "renders new balada form" do
    render

    assert_select "form[action=?][method=?]", baladas_path, "post" do
    end
  end
end
