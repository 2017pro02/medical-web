require "rails_helper"

RSpec.describe "nutritions/index", type: :view do
  before do
    assign(:nutritions, [
      Nutrition.create!(
        name: "Name",
        energy: 2.5,
        protein: 3.5,
        lipid: 4.5,
        carbohydrate: 5.5,
        dietary_fiber: 6.5,
        saturated_fatty_acid: 7.5,
      ),
      Nutrition.create!(
        name: "Name",
        energy: 2.5,
        protein: 3.5,
        lipid: 4.5,
        carbohydrate: 5.5,
        dietary_fiber: 6.5,
        saturated_fatty_acid: 7.5,
      ),
    ])
  end

  it "renders a list of nutritions" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: 2.5.to_s, count: 2
    assert_select "tr>td", text: 3.5.to_s, count: 2
    assert_select "tr>td", text: 4.5.to_s, count: 2
    assert_select "tr>td", text: 5.5.to_s, count: 2
    assert_select "tr>td", text: 6.5.to_s, count: 2
    assert_select "tr>td", text: 7.5.to_s, count: 2
  end
end
