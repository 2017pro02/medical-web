crumb :dashboard do
  link "Dashboard", dashboard_path
end

crumb :meals do |user, start_date|
  link user.profile.nickname, user_meals_path(start_date: start_date)
  parent :dashboard
end

crumb :meal do |user, date|
  link show_date(date), user_meal_path(date: show_date(date))
  parent :meals, user, date
end

crumb :nutritions do
  link t("activerecord.models.nutrition"), nutritions_path
  parent :dashboard
end

crumb :nutrition_new do
  link "作成", new_nutrition_path
  parent :nutritions
end

crumb :nutrition do |nutrition|
  link nutrition.name, nutrition_path
  parent :nutritions
end

crumb :nutrition_edit do |nutrition|
  link "編集", edit_nutrition_path
  parent :nutrition, nutrition
end
