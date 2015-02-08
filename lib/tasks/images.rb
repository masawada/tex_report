namespace :images do
  desc "jpg, pngファイルを.xbbに変換します"
  task :convert do
    sh "cp -r #{IMAGES} #{TMP}/"

    cd TMP do
      exts = ["png",  "jpg",  "jpeg"]
      exts.each do |ext|
        begin
            Dir.glob "images/**/*.#{ext}" do |file|
              sh "extractbb #{file}"
            end
        rescue
          puts "info: skip converting #{ext} files"
        end
      end
    end
  end
end
