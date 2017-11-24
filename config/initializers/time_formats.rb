Time::DATE_FORMATS[:human] = lambda {|date|
  seconds = Time.now.change(hour:0) - date;
  days    = (seconds / (60 * 60 * 24)).ceil; return "#{days}日前" if days > 0
  hours   = (seconds / (60 * 60)).ceil; return "#{hours}時間前" if hours > 0
  minutes = (seconds / 60).ceil; return "#{minutes}分前" if minutes > 0
  return "#{seconds}秒前"
}
