FROM python:3.8.3-slim-buster

WORKDIR /usr/src/app

COPY requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt

RUN apt-get update
RUN apt-get -y install --no-install-recommends build-essential \
    && apt-get autoremove --purge \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/*

ENV LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:."

COPY . .

CMD ["make"]
