require "rails_helper"

RSpec.describe "nutritions/show", type: :view do
  before do
    @nutrition = assign(:nutrition, Nutrition.create!(
                                      name: "Name",
                                      energy: 2.5,
                                      protein: 3.5,
                                      lipid: 4.5,
                                      carbohydrate: 5.5,
                                      dietary_fiber: 6.5,
                                      saturated_fatty_acid: 7.5,
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3.5/)
  end
end
