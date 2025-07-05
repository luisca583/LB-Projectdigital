#!/bin/bash

JSON_FILE="_data/courses.json"
OUTPUT_DIR="public/curso"

mkdir -p "$OUTPUT_DIR"

# Recorre cada curso en JSON
jq -c '.[]' "$JSON_FILE" | while read -r curso; do
  SLUG=$(echo "$curso" | jq -r '.slug')
  NOMBRE=$(echo "$curso" | jq -r '.nombre')
  PRECIO=$(echo "$curso" | jq -r '.precio')
  CATEGORIA=$(echo "$curso" | jq -r '.categoria')
  DESCRIPCION=$(echo "$curso" | jq -r '.descripcion')
  ENLACE=$(echo "$curso" | jq -r '.enlace')

  cat > "$OUTPUT_DIR/$SLUG.html" <<EOF
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>$NOMBRE</title>
  <link rel="stylesheet" href="/LB-Projectdigital/style.css">
</head>
<body>
  <h1>$NOMBRE</h1>
  <p><strong>Precio:</strong> $PRECIO</p>
  <p><strong>Categoría:</strong> $CATEGORIA</p>
  <p>$DESCRIPCION</p>
  <p><a href="$ENLACE" target="_blank">Ir al curso</a></p>
</body>
</html>
EOF
done
