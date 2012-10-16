#coding:utf-8
require 'csv'
require "gnuplot"

owarine_ary = []
CSV.foreach("./kabuka2.csv") do |row|
  unless row[5].to_f == 0
     owarine_ary << row[5]
  end
end

Gnuplot.open do |gp|
  Gnuplot::SPlot.new( gp ) do |plot|
    plot.grid
    x = []
    y = []
    z = []
    i = 0
    (owarine_ary.size-3).times do
      x << owarine_ary[i]
      y << owarine_ary[i+1]
      z << owarine_ary[i+2]
      i+=1
    end
    plot.data = [
                 Gnuplot::DataSet.new([x,y,z]) do |ds|
                   ds.with = 'lines'
                 end
                ]
  end
end
