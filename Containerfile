FROM quay.io/toolbx-images/alpine-toolbox:edge

LABEL com.github.containers.toolbox="true" \
      name="alpine-toolbox" \
      version="latest" \
      usage="This image is meant to be used with the toolbox command" \
      summary="My own toolbox based on alpine-toolbox" \
      maintainer="Sawyer Bristol <SawyerBristol@gmail.com>"

# Install packages
COPY packages /
RUN apk update && \
    apk upgrade && \
    cat /packages | xargs apk add --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing/
RUN rm /packages

# Clear out /media
RUN rm -rf /media
