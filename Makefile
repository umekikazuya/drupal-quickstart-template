.PHONY: init up down clean cli app-url

init:
	composer create-project drupal/recommended-project app --no-interaction
	cd app && composer require drush/drush
	bash scripts/env-setup.sh
	docker-compose up -d
	docker-compose exec drupal-quickstart-app vendor/bin/drush --version
	bash -i scripts/site-install.sh
	@echo "[Success] Drupalのセットアップが完了しました。ブラウザで以下のURLにアクセスしてください:"
	make app-url
	@echo "--- ログイン情報 ---"
	@echo "ユーザー名: admin"
	@echo "パスワード: admin"

app-url:
	@echo "http://localhost:$(shell grep '^APP_PORT=' .env | cut -d '=' -f2)"

up:
	docker-compose up -d

down:
	docker-compose down

clean:
	docker-compose down -v

cli:
	docker-compose exec drupal-quickstart-app bash
