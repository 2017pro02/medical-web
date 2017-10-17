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
