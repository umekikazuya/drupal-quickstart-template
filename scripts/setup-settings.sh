#!/bin/bash
set -e
SCRIPT_DIR=$(cd $(dirname $0); pwd)
APP_ROOT="$SCRIPT_DIR/../app"
SETTINGS_PATH="$APP_ROOT/web/sites/default/settings.php"
DEFAULT_SETTINGS="$APP_ROOT/web/sites/default/default.settings.php"
if [ ! -f "$SETTINGS_PATH" ]; then
  cp "$DEFAULT_SETTINGS" "$SETTINGS_PATH"
  chmod 664 "$SETTINGS_PATH"
  cat << 'EOL' >> "$SETTINGS_PATH"

$databases['default']['default'] = array (
  'database' => 'drupal',
  'username' => 'drupal',
  'password' => 'drupal',
  'prefix' => '',
  'host' => 'drupal-quickstart-db',
  'port' => '3306',
  'isolation_level' => 'READ COMMITTED',
  'driver' => 'mysql',
  'namespace' => 'Drupal\\mysql\\Driver\\Database\\mysql',
  'autoload' => 'core/modules/mysql/src/Driver/Database/mysql/',
);
$settings['config_sync_directory'] = 'sites/default/config';

EOL
  echo "settings.phpを作成し、DB設定を追記しました。"
else
  echo "settings.phpはすでに存在します。"
fi
