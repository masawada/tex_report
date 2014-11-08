namespace :pdf do
  desc "PDFを生成します"
  task :make do
    cd TMP do
      sh "platex report.tex && platex report.tex"
      sh "dvipdfmx report.dvi"
    end

    sh "mv #{TMP}/report.pdf #{OUT}/report.pdf"
  end
end
