require "rails_helper"

RSpec.describe "nutritions/new", type: :view do
  before do
    assign(:nutrition, Nutrition.new(
                         name: "MyString",
                         energy: 1.5,
                         protein: 1.5,
                         lipid: 1.5,
                         carbohydrate: 1.5,
                         dietary_fiber: 1.5,
                         saturated_fatty_acid: 1.5,
    ))
  end

  it "renders new nutrition form" do
    render

    assert_select "form[action=?][method=?]", nutritions_path, "post" do
      assert_select "input[name=?]", "nutrition[name]"
      assert_select "input[name=?]", "nutrition[energy]"
      assert_select "input[name=?]", "nutrition[protein]"
    end
  end
end
