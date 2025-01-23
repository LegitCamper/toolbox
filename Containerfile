FROM quay.io/toolbx-images/debian-toolbox:12

LABEL com.github.containers.toolbox="true" \
      name="my-custom-toolbox" \
      summary="My dev toolbox container" \
      maintainer="Sawyer Bristol"

# Install packages
RUN apt update  && apt install curl build-essential -y && \
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
COPY packages /
RUN ulimit -n 1024 && xargs /home/linuxbrew/.linuxbrew/bin/brew install < packages
RUN rm /packages
