def image(name, caption, label=nil, size="15cm")
  label = name.gsub('.',  '-') if label.nil?
  <<-EOS
  \\begin{figure}[htbp]
    \\begin{center}
      \\includegraphics[width=#{size}]{images/#{name}}
      \\caption{#{caption}}
      \\label{#{label}}
    \\end{center}
  \\end{figure}
  EOS
end
