class UserMailer < ApplicationMailer
  def notify_new_meal(to_user, monitored, meal)
    @to_user = to_user
    @monitored = monitored
    @meal = meal
    mail(to: @to_user.email, subject: "#{monitored}さんが食事を撮影しました")
  end
end
