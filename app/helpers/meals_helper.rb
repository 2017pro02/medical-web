module MealsHelper
  def show_date(date)
    [date.year, "%02d" % date.month, "%02d" % date.day].join("/")
  end

  def get_week_num(date)
    (date.day - date.wday + 13) / 7
  end

  def get_dri(profile)
    gender = profile.gender
    age = profile.age
    ds = Dri.where("age @> ?::int4", age).where(gender: gender)
    str = ""
    ds.each do |d|
      str += "#{d.nut_type}=#{d.val} "
    end
    str
  end
end
