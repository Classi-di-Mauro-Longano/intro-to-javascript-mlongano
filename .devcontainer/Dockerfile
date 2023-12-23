# Use an official Python runtime as a parent image
FROM quay.io/jupyter/minimal-notebook:x86_64-ubuntu-22.04

ARG JUPYTERLAB_PORT=8888
ARG NOTEBOOKS_DIR=/notebooks

# Set the working directory in the container to /notebooks
WORKDIR ${NOTEBOOKS_DIR}
ENV HOME=/root
USER root
ENV NB_USER=root \
  CHOWN_HOME=yes \
  CHOWN_HOME_OPTS='-R' \
  JUPYTER_ENABLE_LAB=yes

# Add the local directory (i.e., the contents of your project) to the container
ADD . ${NOTEBOOKS_DIR}
ADD .devcontainer/bash/.bashrc ${HOME}/.bashrc
ADD .devcontainer/bash/.bash_aliases ${HOME}/.bash_aliases
ADD .devcontainer/bash/.bash_history ${HOME}/.bash_history
ADD .devcontainer/bash/.bash_eternal_history ${HOME}/.bash_eternal_history
ADD .devcontainer/bash/.bash_aliases ${HOME}/.bash_aliases
ADD .devcontainer/.gitconfig ${HOME}/.gitconfig
ADD requirements.txt ${NOTEBOOKS_DIR}/requirements.txt

# Install some dependency packages, deno.js and Jupyter Lab
USER root
RUN  apt-get update && apt-get install -y ca-certificates gnupg procps micro iproute2 && \
  apt-get clean

RUN curl -OL https://github.com/lsd-rs/lsd/releases/download/v1.0.0/lsd_1.0.0_amd64.deb && \
  dpkg -i lsd_1.0.0_amd64.deb || apt-get install -f -y && \
  apt-get clean && rm lsd_1.0.0_amd64.deb


USER root
RUN  curl -fsSL https://deno.land/x/install/install.sh | sh

# pip install --upgrade pip
#pip install jupyterlab notebook

# Node.js version 16 is only needed for ijavascript kernel
# npm installation take a long time, so uncomment the following lines only if you really need ijavascript kernel

# Set Node.js version
# ENV NODE_MAJOR 16

# RUN   mkdir -p /etc/apt/keyrings && \
#   curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key |  gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg --yes && \
#   echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" > /etc/apt/sources.list.d/nodesource.list && \
#   apt-get update

# RUN apt-get install -y nodejs npm && \
#   apt-get clean && \
#   npm install -g ijavascript && \
#   ijsinstall

# Add Deno to PATH

ENV PATH="/root/.deno/bin:${PATH}"

# Install deno Jupyter kernel
USER root
RUN deno jupyter --unstable --install

RUN pip install -r ${NOTEBOOKS_DIR}/requirements.txt

# CMD jupyter lab --ip=0.0.0.0 --port="$JUPYTERLAB_PORT" --allow-root --NotebookApp.token='' --NotebookApp.password='' --notebook-dir="$NOTEBOOKS_DIR"

