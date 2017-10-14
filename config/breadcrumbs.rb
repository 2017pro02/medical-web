crumb :dashboard do
  link "Dashboard", dashboard_path
end

crumb :meals do |user, date|
  link user&.profile&.nickname || "全員", meals_path("q[user_id_eq]": user&.id, start_date: date)
  parent :dashboard
end

crumb :meal do |meal|
  link meal.created_at, meal_path(meal)
  parent :meals, meal.user, meal.created_at.strftime("%Y-%m-%d")
end
