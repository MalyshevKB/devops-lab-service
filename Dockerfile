FROM python:3.10-slim

WORKDIR /app

# 1. Копируем ТОЛЬКО файл зависимостей (ТРЕБОВАНИЕ ЛАБЫ)
COPY app/requirements.txt .

# 2. Устанавливаем зависимости ДО копирования кода (ТРЕБОВАНИЕ ЛАБЫ)
RUN pip install --no-cache-dir -r requirements.txt

# 3. Копируем всё приложение
COPY . .

# 4. Запускаем как модуль (решает проблему с relative imports)
# Добавляем текущую директорию в PYTHONPATH
ENV PYTHONPATH=/app
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
