task :compile => ["title:generate",
                  "images:convert",
                  "body:generate",
                  "bibliography:generate",
                  "footer:generate",
                  "concat",
                  "pdf:make"]
