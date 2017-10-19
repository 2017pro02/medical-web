User.seed(:id, {
  id: 1,
  email: "admin@346.pro",
  password: "password",
  password_confirmation: "password",
  is_admin: true,
})

(2..10).each do |i|
  User.seed do |u|
    u.id = i
    u.email = "user#{i}@346.pro"
    u.password = "password"
    u.password_confirmation = "password"
  end
end

User.find_each(&:confirm)
