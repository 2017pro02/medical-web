require "rails_helper"

RSpec.describe "meals/show", type: :view do
  before do
    @meal = assign(:meal, Meal.create!(
                            user: nil,
                            img: "Img",
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Img/)
  end
end
