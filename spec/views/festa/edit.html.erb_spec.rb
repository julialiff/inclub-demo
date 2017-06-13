require 'rails_helper'

RSpec.describe "festa/edit", type: :view do
  before(:each) do
    @festum = assign(:festum, Festum.create!())
  end

  it "renders the edit festum form" do
    render

    assert_select "form[action=?][method=?]", festum_path(@festum), "post" do
    end
  end
end
