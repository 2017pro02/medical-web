json.two do
  json.array! @meals2, partial: "meals/meal", as: :meal
end

json.one do
  json.array! @meals1, partial: "meals/meal", as: :meal
end

json.zero do
  json.array! @meals0, partial: "meals/meal", as: :meal
end

json.comments do
  json.array! @comments do |comment|
    json.extract! comment, :id, :target_user, :message
  end
end
