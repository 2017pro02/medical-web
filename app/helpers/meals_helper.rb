module MealsHelper
  def show_date(date)
    [date.year, "%02d" % date.month, "%02d" % date.day].join("/")
  end
end
