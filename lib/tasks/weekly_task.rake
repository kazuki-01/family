namespace :weekly_task do
  desc "postsテーブルの既存のweekタスクとeverydayタスクを削除" #タスクのメモ
    task :weekly_task_delete => :environment do #weekly_taskがタスク名

    #rakeタスクのログ
    logger = Logger.new 'log/weekly_task.log'

    #ここから処理を書いていく
    Post.all.each do |task|
      if task.classification == "week"
        task.destroy
      elsif task.classification == "everyday"
        task.destroy
      else

      end
    end

    #デバッグのため
    p "自動追加の未完了のタスクの削除OK"
  end

  desc "weekタスクとeverydayタスクの追加" #タスクのメモ
  task :weekly_task => :environment do #weekly_taskがタスク名

    #rakeタスクのログ
    logger = Logger.new 'log/weekly_task.log'

    #ここから処理を書いていく
    day = Date.today.wday #今日の曜日の整数をdayに代入
    Weekly.all.each do |task|
      if day == 1 && task.monday == true
        Post.create(task: task.task, emphasis: task.emphasis, labor: task.labor, classification: task.classification)
      end

      if day == 2 && task.tuesday == true
        Post.create(task: task.task, emphasis: task.emphasis, labor: task.labor, classification: task.classification)
      end

      if day == 3 && task.wednesday == true
        Post.create(task: task.task, emphasis: task.emphasis, labor: task.labor, classification: task.classification)
      end

      if day == 4 && task.thursday == true
        Post.create(task: task.task, emphasis: task.emphasis, labor: task.labor, classification: task.classification)
      end

      if day == 5 && task.friday == true
        Post.create(task: task.task, emphasis: task.emphasis, labor: task.labor, classification: task.classification)
      end

      if day == 6 && task.saturday == true
        Post.create(task: task.task, emphasis: task.emphasis, labor: task.labor, classification: task.classification)
      end

      if day == 0 && task.sunday == true
        Post.create(task: task.task, emphasis: task.emphasis, labor: task.labor, classification: task.classification)
      end

    end

    #デバッグのため
    p "ここまでOK"
  end
end