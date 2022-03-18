FROM alpine:3.14.1

ENV TERRAFORM_DOCS_VERSION="v0.15.0"

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

VOLUME /data

ADD ./resources /resources

RUN /resources/build && rm -rf /resources

WORKDIR /data

ENTRYPOINT ["terraform-docs"]

LABEL "maintainer"="cloudsquad@fxinnovation.com" \
      "org.label-schema.name"="terraform_docs" \
      "org.label-schema.base-image.name"="docker.io/library/alpine" \
      "org.label-schema.base-image.version"="3.14.1" \
      "org.label-schema.description"="Terrform docs in a container" \
      "org.label-schema.url"="https://www.terraform.io" \
      "org.label-schema.vcs-url"="https://github.com/FXinnovation/fx-docker-terraform-docs" \
      "org.label-schema.vendor"="FXinnovation" \
      "org.label-schema.schema-version"="1.0.0-rc.1" \
      "org.label-schema.applications.terraform-docs.version"=$TERRAFORM_DOCS_VERSION \
      "org.label-schema.vcs-ref"=$VCS_REF \
      "org.label-schema.version"=$VERSION \
      "org.label-schema.build-date"=$BUILD_DATE \
      "org.label-schema.usage"="docker run --rm $(pwd):/data fxinnovation/terraform-docs --help"
