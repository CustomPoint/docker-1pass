FROM ubuntu:latest
# setting environment
ENV VERSION=0.8.0
WORKDIR /root
# bringing image up to date
RUN apt-get update && apt-get install -y curl unzip jq
# getting and setting up the 1Password CLI tools
# Releases: https://app-updates.agilebits.com/product_history/CLI
RUN curl -o 1password.zip https://cache.agilebits.com/dist/1P/op/pkg/v${VERSION}/op_linux_amd64_v${VERSION}.zip
RUN unzip 1password.zip -d /usr/bin && rm 1password.zip
# updating the tool if necessary
RUN op update

COPY entrypoint.sh /root/entrypoint.sh
RUN chmod +x /root/entrypoint.sh
ENTRYPOINT [ "/root/entrypoint.sh" ]
