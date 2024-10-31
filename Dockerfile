# ベースイメージのバージョンを明示的に指定
FROM python:3.9-slim

# 非rootユーザーを作成
RUN adduser --disabled-password --gecos "" appuser

WORKDIR /app

COPY requirements.txt .

# パッケージリストを更新し、依存関係をインストール後にキャッシュをクリア
RUN pip install --no-cache-dir -r requirements.txt

COPY app/ .

# 所有者を非rootユーザーに変更
RUN chown -R appuser:appuser /app

USER appuser

EXPOSE 8080

CMD ["python", "main.py"]
