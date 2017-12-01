require "json"

json_path = Rails.root.join("db", "fixtures", "nutritions.json").to_path
data = open(json_path) do |io|
  JSON.load(io)
end

def seikika(str)
  return 0 if str.blank?
  str.gsub(/[a-z]*(\s*\(.*\))?/, "").to_f
end

data.each_with_index do |nu, i|
  Nutrition.seed do |n|
    n.id = i
    n.name = nu["name"]
    nut = nu["nutritions"]
    n.energy = nut["エネルギー"]
    n.protein = seikika(nut["タンパク質"])
    n.lipid = seikika(nut["脂質"])
    n.carbohydrate = seikika(nut["炭水化物"])
    n.dietary_fiber = seikika(nut["食物繊維 総量"])
    n.saturated_fatty_acid = seikika(nut["脂肪酸 飽和"])
  end
end
