namespace :create do
  task :tex do
    if ENV['NAME'].nil?
      puts "error: no name given"
      puts "execute `rake create NAME=section_name`"
      exit
    end

    cd TEX do
      sh "touch #{ENV['NAME']}.tex.erb"
    end

    cd CONFIG do
      open("tex_files", "a") { |f| f.write "#{ENV['NAME']}.tex.erb" }
    end
  end
end
