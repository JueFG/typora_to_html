#!/usr/bin/env bash

TEMPLATE="toc-sidebar.html"
NAV="nav"
OUTDIR="output/source"
INDEX="output/index.html"

# 创建输出目录和复制样式
mkdir -p "$OUTDIR"
cp gothic.css "$OUTDIR"/ 2>/dev/null
cp -r gothic "$OUTDIR"/ 2>/dev/null

# 获取 .md 文件（排除 README.md），并排序
mdfiles=()
for f in *.md; do
  [[ "$f" == "README.md" ]] && continue
  mdfiles+=("$f")
done
IFS=$'\n' sorted=($(printf "%s\n" "${mdfiles[@]}" | sort -V))

# 写 index.html 页眉
cat <<EOF > "$INDEX"
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Document Index</title>
  <style>
    body { font-family: sans-serif; padding: 2em; }
    ul { list-style-type: none; padding: 0; }
    li { margin: 0.5em 0; }
    a { text-decoration: none; color: #0066cc; }
    a:hover { text-decoration: underline; }
  </style>
</head>
<body>
  <h1>📚 Document List</h1>
  <ul>
EOF

# 遍历并导出每个 Markdown 文件为 HTML
for mdfile in "${sorted[@]}"; do
  htmlfile="${mdfile%.md}.html"
  outfile="$OUTDIR/$htmlfile"
  title="${mdfile%.md}"

  echo "📄 Exporting: $mdfile → $outfile"

  pandoc "$mdfile" \
    --from markdown+mark \
    --template="$TEMPLATE" \
    --toc --toc-depth=4 \
    -B "$NAV" \
    --css=gothic.css \
    --metadata title="$title" \
    -o "$outfile"

  echo "    <li><a href=\"source/$htmlfile\">$title</a></li>" >> "$INDEX"
done

# 关闭 index.html 标签
cat <<EOF >> "$INDEX"
  </ul>
</body>
</html>
EOF

echo "✅ All files have been exported to '$OUTDIR/'"
echo "📄 Index page created at '$INDEX'"
