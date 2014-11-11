desc "タイトルの生成からPDFの生成までを一括して行います"
task :compile => ["title:generate",
                  "images:convert",
                  "codes:copy",
                  "body:generate",
                  "bibliography:generate",
                  "footer:generate",
                  "concat",
                  "pdf:make"]
