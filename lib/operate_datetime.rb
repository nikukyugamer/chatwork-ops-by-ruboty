class OperateDatetime
  def self.now
    Time.now.strftime("%Y/%m/%d(#{%w(日 月 火 水 木 金 土)[Time.now.wday]}) %H:%M:%S")
  end

  def self.gmt_to_jst(gmt_datetime)
    case gmt_datetime
    when Time
      gmt_datetime.localtime
    when String
      Time.parse(gmt_datetime).localtime
    else
      Time.now.localtime
    end
  end

  # https://qiita.com/prgseek/items/c0fc2ffc8e1736348486
  def self.time_class_to_string_ja(time_type)
    time_type.strftime("%Y/%m/%d(#{%w(日 月 火 水 木 金 土)[time_type.wday]}) %X") #=> 2018/01/22(月) 17:18:43
  end
end
