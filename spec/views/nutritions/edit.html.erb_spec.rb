require "rails_helper"

RSpec.describe "nutritions/edit", type: :view do
  before do
    @nutrition = assign(:nutrition, Nutrition.create!(
                                      name: "MyString",
                                      energy: 1.5,
                                      protein: 1.5,
                                      lipid: 1.5,
                                      carbohydrate: 1.5,
                                      dietary_fiber: 1.5,
                                      saturated_fatty_acid: 1.5,
    ))
  end

  it "renders the edit nutrition form" do
    render

    assert_select "form[action=?][method=?]", nutrition_path(@nutrition), "post" do
      assert_select "input[name=?]", "nutrition[name]"
      assert_select "input[name=?]", "nutrition[energy]"
      assert_select "input[name=?]", "nutrition[protein]"
    end
  end
end
