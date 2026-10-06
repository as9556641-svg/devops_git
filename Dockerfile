FROM alpine:3.20

RUN apk add --no-cache bash

WORKDIR /app
COPY sample.sh ./sample.sh
RUN chmod +x ./sample.sh

ENTRYPOINT ["./sample.sh"]
