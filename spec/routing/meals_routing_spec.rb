require "rails_helper"

RSpec.describe MealsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/@koume1/meals").to route_to("meals#index", user_name: "@koume1")
    end

    it "routes to #new" do
      expect(get: "/@koume1/meals/new").to route_to("meals#new", user_name: "@koume1")
    end

    it "routes to #show" do
      expect(get: "/@koume1/meals/2017/03/28").to route_to("meals#show", user_name: "@koume1", date: "2017/03/28")
    end

    it "routes to #edit" do
      expect(get: "/@koume1/meals/2017/03/28/edit").to route_to("meals#edit", user_name: "@koume1", date: "2017/03/28")
    end

    it "routes to #create" do
      expect(post: "/@koume1/meals").to route_to("meals#create", user_name: "@koume1")
    end

    it "routes to #update via PUT" do
      expect(put: "/@koume1/meals/2017/03/28").to route_to("meals#update", user_name: "@koume1", date: "2017/03/28")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/@koume1/meals/2017/03/28").to route_to("meals#update", user_name: "@koume1", date: "2017/03/28")
    end

    it "routes to #destroy" do
      expect(delete: "/@koume1/meals/2017/03/28").to route_to("meals#destroy", user_name: "@koume1", date: "2017/03/28")
    end
  end
end
