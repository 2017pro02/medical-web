require "rails_helper"

RSpec.describe "meals/edit", type: :view do
  before do
    @meal = assign(:meal, Meal.create!(
                            user: nil,
                            img: "MyString",
    ))
  end

  it "renders the edit meal form" do
    render

    assert_select "form[action=?][method=?]", meal_path(@meal), "post" do
      assert_select "input[name=?]", "meal[user_id]"

      assert_select "input[name=?]", "meal[img]"
    end
  end
end