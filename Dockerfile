FROM python:3.7

RUN apt-get update
RUN pip install poetry

WORKDIR /app
ADD . /app
RUN poetry install

CMD ["poetry", "run", "python", "hossler_website/app.py"]
