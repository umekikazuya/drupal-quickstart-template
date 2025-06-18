#!/bin/bash

# OSを検出
if [[ "$OSTYPE" == "darwin"* ]]; then
  # macOSの場合
  SED_CMD=(sed -i '')
else
  # Linuxの場合
  SED_CMD=(sed -i)
fi

# .envがなければ.env.exampleをコピーし、APP_PORTをインタラクティブに設定
if [ ! -f .env ]; then
  cp .env.example .env
  read -p "APP_PORTを入力してください（デフォルト: 8080）: " PORT
  PORT=${PORT:-8080}
  # .envのAPP_PORTを書き換え
  "${SED_CMD[@]}" "s/^APP_PORT=.*/APP_PORT=${PORT}/" .env
  echo ".envを作成し、APP_PORT=${PORT} に設定しました。"
fi
