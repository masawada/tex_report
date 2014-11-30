def printmat(row=1, column=1, items=[], type="pmatrix")
  result = []
  mat = []
  op = {pmatrix: "(", bmatrix: "[", vmatrix: "|"}[type.to_sym]
  cl = {pmatrix: ")", bmatrix: "]", vmatrix: "|"}[type.to_sym]

  result << "\\left#{op}"
  result << "\\begin{array}{#{"c"*column}}"
  row.times do |i|
    mat << items[i*column..(i+1)*column-1].join(" & ")
  end
  result << mat.join(" \\\\\n")
  result << "\\end{array}"
  result << "\\right#{cl}"

  result.join("\n")
end
