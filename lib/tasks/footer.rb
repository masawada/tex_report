namespace :footer do
  task :generate do
    open("#{TMP}/footer.tex", "w") { |f| f.write "\\end{document}" }
  end
end
