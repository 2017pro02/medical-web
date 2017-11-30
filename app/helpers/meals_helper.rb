module MealsHelper
  def show_date(date)
    [date.year, "%02d" % date.month, "%02d" % date.day].join("/")
  end

  def get_week_num(date)
    (date.day - date.wday + 13) / 7
  end
end
