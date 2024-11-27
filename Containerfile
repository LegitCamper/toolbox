FROM quay.io/toolbx/arch-toolbox:latest

LABEL com.github.containers.toolbox="true" \
      name="arch-toolbox" \
      version="latest" \
      usage="This image is meant to be used with the toolbox command" \
      summary="My own toolbox based on arch-toolbox" \
      maintainer="Sawyer Bristol <SawyerBristol@gmail.com>"

# Install packages
COPY packages /
RUN pacman -Syu --needed --noconfirm - < packages
RUN rm /packages

# Clear out /media
RUN rm -rf /media
