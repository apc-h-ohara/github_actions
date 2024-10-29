FROM python:3.9

# 非rootユーザーを作成せずにrootで実行（セキュリティ上の問題）
WORKDIR /app

COPY requirements.txt .

# キャッシュクリアを行わないpipインストール（セキュリティ上の問題）
RUN pip install -r requirements.txt

COPY app/ .

# 固定されたパスワードをARGで設定（セキュリティ上の問題）
ARG APP_PASSWORD=password123

EXPOSE 8080

CMD ["python", "main.py"]