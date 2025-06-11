# Drupal Quickstart Template

このリポジトリは、Drupal プロジェクトの素早いセットアップを目的としたテンプレートリポジトリです。
Docker・Makefile・スクリプトで、開発環境の構築を簡単に行えます。
※ 実案件での利用想定ではなく、検証環境やモジュール開発といった一時的に使いたいような環境構成にしています。

## ディレクトリ構成
```
drupal-quickstart-template/
  app/                # Drupal本体（web/, composer.json など）
  scripts/            # 環境構築・初期化用スクリプト
  docker-compose.yml  # Docker構成
  Makefile            # 環境構築・運用コマンド
  README.md
```

## 必要要件

- Docker
- make
- composer

## セットアップ手順

1. リポジトリをクローン
   ```sh
   git clone <repository-url>
   cd drupal-quickstart-template
   ```
2. 環境変数ファイルと初期セットアップ
   ```sh
   make init
   ```
   - `.env` がなければ `.env.example` からコピーされ、APP_PORT を対話的に設定できます。
   - DB・Drupalの初期化・Drushインストール・サイトインストールまで自動化されます。
3. ブラウザで `http://localhost:APP_PORT` にアクセス
   - APP_PORTはセットアップ時に指定したポート番号です。

## コマンド

| コマンド         | 説明                                      |
|------------------|-------------------------------------------|
| `make init`      | 環境セットアップ・初期化（全自動）         |
| `make up`        | Docker コンテナの起動                      |
| `make down`      | Docker コンテナの停止                      |
| `make clean`     | Docker コンテナとボリュームの削除          |
| `make cli`       | Drupal アプリケーションコンテナに入る      |

## スクリプト

- `scripts/env-setup.sh` : .env作成＆APP_PORTインタラクティブ設定
- `scripts/site-install.sh` : DB起動待ち＆DrushによるDrupalインストール

## ライセンス

MIT License
