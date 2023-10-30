event "イベントの発生" do
  true
end

setup do
  puts "在庫の設定"
  @stock_quantity  = 100
end

setup do
  puts "注文数の設定"
  @order_quantity = 150
end


event "在庫が足りません" do
  @stock_quantity < @order_quantity
end