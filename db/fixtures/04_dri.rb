require "json"

json_path = Rails.root.join("db", "fixtures", "dri.json").to_path
data = open(json_path) do |io|
  JSON.load(io)
end

def get_val(val)
  if val.include?("〜")
    arr = val.split("〜")
    return arr.map(&:to_f).sum / arr.length
  end

  return 5 if val == "-"
  val.to_f
end

data.each_with_index do |dri, i|
  Dri.seed do |d|
    d.id = i
    d.nut_type = dri["nut_type"]
    d.gender = dri["gender"]
    d.age = dri["age_start"]..dri["age_end"]
    d.val = get_val(dri["val"])
  end
end
