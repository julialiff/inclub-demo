require 'rails_helper'

RSpec.describe "baladas/show", type: :view do
  before(:each) do
    @balada = assign(:balada, Balada.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
