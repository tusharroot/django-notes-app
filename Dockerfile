FROM python

WORKDIR /app/backend

COPY requirements.txt /app/backend/requirements.txt

RUN apt-get update \
&& apt-get upgrade -y \
&& apt-get install -y gcc default-libmysqlclient-dev pkg-config \
&& rm -rf /var/lib/apt/lists/*

RUN pip install mysqlclient
RUN pip install --no-cache-dir -r requirements.txt

COPY . /app/backend

EXPOSE 8000