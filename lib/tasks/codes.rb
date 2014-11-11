namespace :codes do
  desc "src以下をtmpに移動します"
  task :copy do
    begin
      sh "cp #{CODES}/* #{TMP}/"
    rescue
      puts "info: skip copy sourcecodes"
    end
  end
end
