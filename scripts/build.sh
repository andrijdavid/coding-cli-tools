#!/usr/bin/env bash
set -e

# buil script to concatinate all files
OUT_FILE="install.sh"

echo "#!/usr/bin/env bash" > "$OUT_FILE"
echo "# auto genreted file, do not edit directly" >> "$OUT_FILE"
echo "" >> "$OUT_FILE"

cat src/core/*.sh >> "$OUT_FILE"
cat src/tools/*.sh >> "$OUT_FILE"
cat src/main.sh >> "$OUT_FILE"

chmod +x "$OUT_FILE"
echo "build completd: $OUT_FILE"
