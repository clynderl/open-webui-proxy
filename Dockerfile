FROM ghcr.io/open-webui/open-webui:main

USER root

RUN apt-get update && apt-get install -y proxychains4

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
