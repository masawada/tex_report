namespace :body do
  desc "本文を生成します"
  task :generate do
    # load helpers
    Dir.glob("lib/helpers/*.rb").each { |f| require "./#{f}" }

    # main
    body = []
    open("#{CONFIG}/tex_files") do |file|
      while l = file.gets
        erb = ERB.new(File.read("#{TEX}/#{l.chomp}"), nil, '-')
        body << erb.result(binding)
      end
    end

    open("#{TMP}/body.tex", "w") { |f| f.write body.join("\n") }
  end
end
