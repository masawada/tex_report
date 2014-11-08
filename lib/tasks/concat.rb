task :concat do
  cd TMP do
    sh "cat title.tex body.tex bibliography.tex footer.tex > report.tex"
  end
end
