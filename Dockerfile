ARG DEBIAN_PYTHON_VERSION_TAG
FROM python:${DEBIAN_PYTHON_VERSION_TAG}
ENV PYTHONIOENCODING=UTF-8

RUN apt-get update \
  && apt-get install -y \
    jq \
    curl \
    gnupg \
    unzip \
    libdigest-sha-perl \
    make

ARG AWS_CLI_VERSION
RUN pip install --no-cache-dir awscli==${AWS_CLI_VERSION}

ARG TERRAFORM_VERSION
RUN curl -Os https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && curl -Os https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_SHA256SUMS \
    && curl https://keybase.io/hashicorp/pgp_keys.asc | gpg --import \
    && curl -Os https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_SHA256SUMS.sig \
    && gpg --verify terraform_${TERRAFORM_VERSION}_SHA256SUMS.sig terraform_${TERRAFORM_VERSION}_SHA256SUMS \
    && shasum -a 256 -c terraform_${TERRAFORM_VERSION}_SHA256SUMS 2>&1 | grep "${TERRAFORM_VERSION}_linux_amd64.zip:\sOK" \
    && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/local/bin \
    && rm /terraform_*
