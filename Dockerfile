FROM alpine:3.20
RUN apk update
RUN apk add python3
RUN apk add py3-pip
RUN python3 -m venv /venv
ADD exporter /exporter
ENV PATH="/venv/bin:$PATH"
RUN pip install -r /exporter/requirements.txt
ENTRYPOINT ["python", "/exporter/main.py"]
