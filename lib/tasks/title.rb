require 'yaml'
require 'erb'

namespace :title do
  desc "表紙を生成します"
  task :generate do
    @title = YAML.load_file "#{CONFIG}/title.yml"
    erb = ERB.new(File.read("#{LIB}/templates/title.tex.erb"))
    open("#{TMP}/title.tex", "w") { |f| f.write erb.result(binding) }
  end
end
