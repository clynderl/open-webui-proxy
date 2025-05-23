FROM ubuntu:22.04

RUN apt-get update && apt-get install -y proxychains4 curl

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["curl", "https://api.ipify.org"]
