require "rails_helper"

RSpec.describe "meals/index", type: :view do
  before do
    assign(:meals, [
      Meal.create!(
        user: nil,
        img: "Img",
      ),
      Meal.create!(
        user: nil,
        img: "Img",
      ),
    ])
  end

  it "renders a list of meals" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "Img".to_s, count: 2
  end
end
