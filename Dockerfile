FROM python:3.9-slim

# تثبيت الأدوات الأساسية و curl و Tesseract والاعتماديات المطلوبة
RUN apt-get update && apt-get install -y \
    apt-utils \
    curl \
    tesseract-ocr \
    libtesseract-dev \
    poppler-utils \
    && rm -rf /var/lib/apt/lists/*

# تنزيل ملف تدريب اللغة العربية لـ Tesseract
RUN mkdir -p /usr/share/tesseract-ocr/4.00/tessdata/ && \
    curl -L https://github.com/tesseract-ocr/tessdata/raw/main/ara.traineddata \
    -o /usr/share/tesseract-ocr/4.00/tessdata/ara.traineddata

# إعداد مجلد العمل
WORKDIR /app

# نسخ الملفات إلى الحاوية
COPY . .

# تثبيت المكتبات المطلوبة
RUN pip install --no-cache-dir -r requirements.txt

# تحديد الأمر الأساسي لتشغيل التطبيق
CMD ["python", "bot.py"]
