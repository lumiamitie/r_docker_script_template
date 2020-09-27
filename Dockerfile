FROM rocker/tidyverse:3.6.1

# Install Vim
RUN apt-get update \
    && apt-get install -y vim

# Install R libraries
RUN install2.r --error \
    modules \
    docopt \
    logger \
    # Libraries to generate sample model
    cranlogs \
    forecast

# Change Default Locale to "ko_KR.UTF-8"
RUN sed -i 's/^# \(ko_KR.UTF-8\)/\1/' /etc/locale.gen \
    && localedef -f UTF-8 -i ko_KR ko_KR.UTF-8
ENV LC_ALL ko_KR.UTF-8

# Set Timezone
ENV TZ Asia/Seoul
# Set Timezone for R environment
RUN echo 'TZ=Asia/Seoul' >> /usr/local/lib/R/etc/Renviron

# Set working directory and Copy scripts into the container
WORKDIR /app
COPY . ./
