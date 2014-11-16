namespace :images do
  desc "jpg, pngファイルを.xbbに変換します"
  task :convert do
    exts = ["png",  "jpg",  "jpeg"]
    exts.each do |ext|
      begin
        sh "cp #{IMAGES}/*.#{ext} #{TMP}/"

        cd TMP do
          sh "extractbb *.#{ext}"
        end
      rescue
        puts "info: skip converting #{ext} files"
      end
    end
  end
end
