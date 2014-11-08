require 'yaml'
require 'erb'

namespace :bibliography do
  desc "参考文献を生成します"
  task :generate do
    @bibliographies = YAML.load_file "#{CONFIG}/bibliography.yml"
    erb = ERB.new(File.read("#{LIB}/templates/bibliography.tex.erb"), nil, '-')
    open("#{TMP}/bibliography.tex", "w") { |f| f.write erb.result(binding) }
  end
end
