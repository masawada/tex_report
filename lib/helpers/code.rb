def code(name, caption, label=nil, lang="C")
  label = name.gsub('.',  '-') if label.nil?
  caption = caption.gsub('_', '\\_') unless caption.nil?
  "\\lstinputlisting[caption=#{caption},label=#{label},language=#{lang}]{src/#{name}}"
end
