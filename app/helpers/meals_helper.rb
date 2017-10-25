module MealsHelper
  def show_date(date)
    [date.year, date.month, date.day].join("/")
  end
end
