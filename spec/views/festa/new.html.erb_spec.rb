require 'rails_helper'

RSpec.describe "festa/new", type: :view do
  before(:each) do
    assign(:festum, Festum.new())
  end

  it "renders new festum form" do
    render

    assert_select "form[action=?][method=?]", festa_path, "post" do
    end
  end
end
