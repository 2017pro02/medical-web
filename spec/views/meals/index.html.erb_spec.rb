require "rails_helper"

RSpec.describe "meals/index", type: :view do
  let(:user) { FactoryGirl.build(:user) }

  before do
    assign(:meals, [
      Meal.create!(
        user: user,
        img: "Img",
      ),
      Meal.create!(
        user: user,
        img: "Img",
      ),
    ])
  end

  it "renders a list of meals" do
    render
    assert_select "tr>td", text: "Img".to_s, count: 2
  end
end
