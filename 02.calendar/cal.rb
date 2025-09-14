#!/usr/bin/env ruby
require 'optparse'
require 'date'

def calendar

  # 引数の解析
  opt = OptionParser.new
  opt.on("-y YEAR", Integer) { |year| @year = year }
  opt.on("-m MONTH", Integer) { |month| @month = month }
  opt.parse!(ARGV)

  # デフォルト値の設定
  @year ||= Date.today.year
  @month ||= Date.today.month

  # 最初と最後の日を取得
  first_day = Date.new(@year, @month, 1)
  last_day = Date.new(@year, @month, -1)

  # 1行目：タイトルの表示
  puts "      #{first_day.month}月 #{first_day.year}"
  # 2行目：曜日の表示
  puts "日 月 火 水 木 金 土"
  # 月初の曜日に合わせて空白を表示
  print "   " * first_day.wday
  # 日付の表示
  (first_day..last_day).each do |number|
      if number.saturday?
        puts number.day.to_s.rjust(2) + " "
      else
        print number.day.to_s.rjust(2) + " "
      end
  end
end

calendar
