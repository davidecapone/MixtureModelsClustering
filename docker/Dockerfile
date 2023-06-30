FROM balenalib/raspberry-pi-debian-python:3.11

RUN apt update && apt -y update
RUN apt install -y build-essential python3-dev libffi-dev

# Install prerequisites for some Pip package
RUN apt install libjpeg-dev zlib1g-dev gfortran\
    libopenblas-dev liblapack-dev libxml2-dev libxslt-dev python-dev
RUN apt install build-essential libssl-dev libffi-dev \
    python3-dev cargo pkg-config cmake

RUN pip3 install --no-cache-dir jupyterlab

RUN mkdir /work

COPY ./entrypoint.sh /work/entrypoint.sh

RUN pip3 install --upgrade pip

COPY ./requirements.txt /tmp
RUN pip3 install --no-cache-dir -r /tmp/requirements.txt

RUN mkdir /work/notebooks
WORKDIR /work/notebooks

EXPOSE 8081
RUN chmod -R 765 /work/*.sh
ENTRYPOINT ["/work/entrypoint.sh"]
CMD ["server"]