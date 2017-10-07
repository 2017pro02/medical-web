require "rails_helper"

RSpec.describe "meals/new", type: :view do
  before do
    assign(:meal, Meal.new(
                    user: nil,
                    img: "MyString",
    ))
  end

  it "renders new meal form" do
    render

    assert_select "form[action=?][method=?]", meals_path, "post" do
      assert_select "input[name=?]", "meal[user_id]"

      assert_select "input[name=?]", "meal[img]"
    end
  end
end
