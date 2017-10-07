require "rails_helper"

RSpec.describe "meals/show", type: :view do
  let(:user) { FactoryGirl.build(:user) }

  before do
    @meal = assign(:meal, Meal.create!(
                            user: user,
                            img: "Img",
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Img/)
  end
end
