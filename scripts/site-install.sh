#!/bin/bash
set -e

# DB起動待ち
until docker-compose exec drupal-quickstart-db mysqladmin ping -h"drupal-quickstart-db" -uroot -proot --silent 2>/dev/null; do
  echo "[INFO] データベースの起動を待っています..."
  sleep 2
done

# Drupalのインストール
echo "[INFO] Drupalをインストールしています..."
docker-compose exec drupal-quickstart-app vendor/bin/drush si standard \
  --locale=ja \
  --db-url=mysql://drupal:drupal@drupal-quickstart-db:3306/drupal \
  --account-name=admin --account-pass=admin --site-name=DrupalQuickstart --yes
echo "[INFO] Drupalのインストールが完了しました。"
