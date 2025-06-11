#!/bin/bash
set -e
SCRIPT_DIR=$(cd $(dirname $0); pwd)
APP_ROOT="$SCRIPT_DIR/../app"
SETTINGS_PATH="$APP_ROOT/web/sites/default/settings.php"
DEFAULT_SETTINGS="$APP_ROOT/web/sites/default/default.settings.php"
if [ ! -f "$SETTINGS_PATH" ]; then
  cp "$DEFAULT_SETTINGS" "$SETTINGS_PATH"
  chmod 664 "$SETTINGS_PATH"
  echo "settings.phpを作成し、DB設定を追記しました。"
else
  echo "settings.phpはすでに存在します。"
fi
