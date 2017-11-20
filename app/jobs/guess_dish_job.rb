require "faraday"
require "json"

class GuessDishJob < ApplicationJob
  queue_as :default

  def perform(meal)
    conn = Faraday.new(url: ENV["CUTOUTER_URL"]) do |faraday|
      faraday.request :multipart
      faraday.request :url_encoded
      faraday.adapter :net_http
    end
    payload = {
      key: ENV["CUTOUTER_KEY"],
      file: Faraday::UploadIO.new(meal.img.path, "image/png"),
    }
    res = conn.post "/", payload
    j = JSON.parse(res.body)
    j.each do |jj|
      tag = jj["candidates"][0]["tag"]
      nutrition = Nutrition.find_or_create_by!(name: tag)
      Dish.create(meal: meal, nutrition: nutrition)
    end
  end
end
