FROM python:3

ENV WORKSPACE_VERSION 1.0

RUN mkdir -p /opt/ansible

WORKDIR /opt/ansible

COPY requirements.txt ./

# Install requirements
RUN pip install --no-cache-dir -r requirements.txt

# Bash Prompt Change
RUN /bin/bash -c "echo \"PS1='\[\033[01;31m\]\u@ansible-workspace-${WORKSPACE_VERSION}\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \$ '\" >> /root/.bashrc "

RUN rm requirements.txt
