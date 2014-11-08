namespace :images do
  desc "pngファイルを.xbbに変換します"
  task :convert do
    begin
      sh "cp #{IMAGES}/*.png #{TMP}/"
      cd TMP do
        sh "extractbb *.png"
      end
    rescue
      puts "info: skip converting images"
    end
  end
end
