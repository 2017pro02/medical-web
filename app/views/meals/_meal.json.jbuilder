json.extract! meal, :id, :user_id, :img, :created_at, :updated_at

json.nutritions do
  json.array! meal.nutritions, partial: "nutritions/nutrition", as: :nutrition
end
