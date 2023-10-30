#メタプログラミングrubyのp136,p137より引用

#lambdaの中の関数だけでsetupsとeventsを共有するため
lambda {
  setups = []
  events = {}

  #Kernelのdefine_methodという名前の関数を呼ぶ
  #define_methodは関数を定義する関数で引数とし
  #て関数の名前,ブロックが処理内容となる。
  
  #eventはイベントの内容と処理をハッシュで管理する
  Kernel.send :define_method, :event do |name, &block|
    events[name] = block
  end

  #setupはeventを実行する前に変数等を設定する
  #その処理をリストで管理
  Kernel.send :define_method, :setup do |&block|
    setups << block
  end

  #each_eventはそれぞれのイベントに対して、
  #ブロックで渡した処理をeventの名前と処理
  #内容を渡して実行する
  Kernel.send :define_method, :each_event do |&block|
    events.each_pair do |name, event|
      block.call name, event
    end
  end

  #each_setupはeach_eventとほぼ同じ
  Kernel.send :define_method, :each_setup do |&block|
    setups.each do |setup|
      block.call setup
    end
  end
}.call

#語尾にeventがつくファイルを読み込み
#そのファイルの中のevent()とsetup()を
#実行する
Dir.glob('*event.rb').each do |file|
  load file

  #それぞれのeventに対して、
  each_event do |name, event|
    env = Object.new
    
    #まずsetupをinstance_eval()を利用して
    #envの中で設定値等を定義する
    each_setup do |setup|
      env.instance_eval &setup
    end
    
    #setupがすべて終わった環境でeventの条件がそろっていれば
    #イベントが起きたことを標準出力で通知
    puts "ALERT: #{name}" if env.instance_eval &event
  end
end

