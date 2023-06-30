FROM python:3.11

RUN apt update && apt -y update
RUN apt install -y build-essential python3-dev libffi-dev

RUN pip3 install --no-cache-dir jupyterlab

RUN mkdir /work

COPY ./entrypoint.sh /work/entrypoint.sh

RUN pip3 install --upgrade pip

COPY ./requirements.txt /tmp
#RUN pip3 install --no-cache-dir -r /tmp/requirements.txt

RUN mkdir /work/notebooks
WORKDIR /work/notebooks

EXPOSE 8081
RUN chmod -R 765 /work/*.sh
ENTRYPOINT ["/work/entrypoint.sh"]
CMD ["server"]