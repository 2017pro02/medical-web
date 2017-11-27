Time::DATE_FORMATS[:human] = ->(date) {
  seconds = (Time.current - date).round
  days    = seconds / (60 * 60 * 24)
  hours   = seconds / (60 * 60)
  minutes = seconds / 60
  return "#{days}日前" if days > 0
  return "#{hours}時間前" if hours > 0
  return "#{minutes}分前" if minutes > 0
  return "#{seconds}秒前"
}
