FROM python:alpine3.12

RUN apk add make
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

COPY startup.sh /opt/startup.sh
RUN chmod +x /opt/startup.sh

COPY Makefile /opt/Makefile
COPY requirements.txt /opt/requirements.txt
COPY VERSION /opt/VERSION
COPY config /opt/config

WORKDIR /opt/

RUN make build

COPY app /opt/app

USER appuser
CMD ["/opt/startup.sh"]

