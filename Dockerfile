FROM python:3.9-slim

# تثبيت Tesseract والأدوات المطلوبة
RUN apt-get update && apt-get install -y \
    tesseract-ocr \
    libtesseract-dev \
    poppler-utils \
    && rm -rf /var/lib/apt/lists/*

# إعداد مجلد العمل
WORKDIR /app

# نسخ الملفات إلى الحاوية
COPY . .

# تثبيت المتطلبات
RUN pip install --no-cache-dir -r requirements.txt

# تحديد الأمر لتشغيل التطبيق
CMD ["python", "bot.py"]
