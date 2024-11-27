FROM quay.io/toolbx/arch-toolbox:latest

LABEL name="toolbox" \
      summary="My dev toolbox container" \
      maintainer="Sawyer Bristol"

# Install packages
COPY packages /
RUN pacman -Syu --needed --noconfirm - < packages
RUN rm /packages

# Clear out /media
RUN rm -rf /media
