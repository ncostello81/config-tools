FROM debian:stable-slim

RUN apt-get update && \
    apt-get install -y ca-certificates curl apt-transport-https lsb-release gnupg software-properties-common && \
    curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null && \
    echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ buster main" | tee /etc/apt/sources.list.d/azure-cli.list && \
    curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - && \
    apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com buster main" && \
    apt-get update && \
    apt-get install -y azure-cli terraform && \
    apt-get clean && \
    az aks install-cli

WORKDIR /config