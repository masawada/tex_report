def code(name, caption, label=nil, lang="C")
  label = name.gsub('.',  '-') if label.nil?
  "\\lstinputlisting[caption=#{caption},label=#{label},language=#{lang}]{codes/#{name}}"
end
