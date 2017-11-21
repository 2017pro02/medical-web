require "tempfile"
require "faraday"
require "json"

class GuessDishJob < ApplicationJob
  queue_as :default

  def perform(meal)
    path = get_img_path(meal.img)
    j = get_cutouter_res(path)
    tmp.close if Rails.env == "heroku"

    j.each do |jj|
      tag = jj["candidates"][0]["tag"]
      nutrition = Nutrition.find_or_create_by!(name: tag)
      Dish.create(meal: meal, nutrition: nutrition)
    end
  end

  private

    def get_img_path(img)
      if Rails.env == "heroku"
        tmp = Tempfile.new([
          File.basename(img.path),
          File.extname(img.path),
        ])
        tmp.binmode
        tmp.write img.read
        tmp.path
      else
        img.path
      end
    end

    def get_cutouter_res(path)
      conn = Faraday.new(url: ENV["CUTOUTER_URL"]) do |faraday|
        faraday.request :multipart
        faraday.request :url_encoded
        faraday.adapter :net_http
      end
      payload = {
        key: ENV["CUTOUTER_KEY"],
        file: Faraday::UploadIO.new(path, "image/png"),
      }
      res = conn.post "/", payload
      JSON.parse(res.body)
    end
end
