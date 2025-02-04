# Docker-команда FROM вказує базовий образ контейнера
# Наш базовий образ - це Linux з попередньо встановленим python-3.12
FROM python:3.12.5-slim

# Встановимо змінну середовища
ENV APP_HOME=/app

# Встановимо робочу директорію всередині контейнера
WORKDIR $APP_HOME

# Встановимо залежності всередині контейнера
COPY ./pyproject.toml $APP_HOME/pyproject.toml
COPY ./poetry.lock $APP_HOME/poetry.lock

RUN pip install poetry
RUN poetry config virtualenvs.create false && poetry install

# Скопіюємо інші файли в робочу директорію контейнера
COPY . .

CMD ["python", "Py_bot/Bot.py"]