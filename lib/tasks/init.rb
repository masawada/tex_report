require 'readline'
require 'yaml'

def input(label)
  val = Readline.readline("#{label}: ")
  return val.chomp
end

desc "セットアップ"
task :init do
  # input meta data
  puts "== Input meta data"
  conf = {}
  conf["title"] = input "Title"
  conf["name"] = input "Name"
  conf["stdid"] = input "Student ID"
  conf["course"] = input "Course"
  puts ""

  # start
  puts "== Start initializing..."

  # create directories
  [TEX, TMP, OUT, CODES, IMAGES, CONFIG].each do |dirname|
    begin
      puts "create directory: #{dirname}"
      Dir.mkdir(dirname, 0755)
    rescue
      puts "warn: directory #{dirname} already exists"
    end
  end

  # create config files
  cd CONFIG do
    ["tex_files", "bibliography.yml", "title.yml"].each do |filename|
      puts "create file: #{filename}"
      sh "touch #{filename}"
    end

    puts "writing title.yml"
    open("title.yml", "w") { |f| f.write YAML.dump(conf) }
  end

  # remove remote origin
  begin
    sh "git remote remove origin"
  rescue
    puts "skip removing remote origin"
  end

  # finish
  puts "== Initializing finished"
end

desc "outとtmpディレクトリを消します"
task :clean do
  sh "rm -rf #{TMP} #{OUT}"
  [TMP, OUT].each do |dirname|
    begin
      puts "create directory: #{dirname}"
      Dir.mkdir(dirname, 0755)
    rescue
      puts "warn: directory #{dirname} already exists"
    end
  end
end
