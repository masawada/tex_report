require 'readline'
require 'yaml'

def input(label)
  val = Readline.readline("#{label}: ")
  return val.chomp
end

task :init do
  puts "== Input meta data"
  conf = {}
  conf["title"] = input "Title"
  conf["name"] = input "Name"
  conf["stdid"] = input "Student ID"
  conf["course"] = input "Course"

  puts ""
  puts "== Start initializing..."
  sh "mkdir -p #{TEX} #{TMP} #{OUT} #{CODES} #{IMAGES}"
  puts "writing #{CONFIG}/title.yml"
  open("#{CONFIG}/title.yml", "w") { |f| f.write YAML.dump(conf) }
  sh "touch #{CONFIG}/tex_files"
  sh "touch #{TMP}/title.tex"
  sh "touch #{TMP}/body.tex"
  sh "touch #{TMP}/footer.tex"
  sh "echo '\\end{document}' > #{TMP}/footer.tex"

  sh "git remote remove origin"
  puts "== Initializing finished"
end

task :reset do
  sh "rm -rf #{TMP} #{OUT}"
end
