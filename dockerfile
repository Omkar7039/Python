FROM python:3.10-slim

WORKDIR /usr/src/app

COPY . .

RUN python3 -m pip install --upgrade pip \
  && python3 -m pip install --no-cache-dir install -r /tmp/pip-tmp/requirements.txt \
  && pipx install pre-commit ruff \
  && pre-commit install

CMD ["python", "hello.py"]
