FROM ubuntu

RUN apt-get update && \
    apt-get install -y -q software-properties-common
RUN add-apt-repository ppa:ondrej/php
RUN apt-get update && \
    apt-get install -y -q php5.6 php5.6-fpm php5.6-mbstring php5.6-gd php5.6-mysql php5.6-bcmath php5.6-bz2 php5.6-curl php5.6-dom php5.6-imagick php5.6-mcrypt php5.6-SimpleXML php5.6-wddx php5.6-xml php5.6-xmlreader php5.6-xmlwriter php5.6-xsl php5.6-zip
RUN apt-get update \
    && apt-get -yq install \
    apache2 \
    apache2-utils

COPY sh_script/enmod.sh /enmod.sh
RUN chmod +x /enmod.sh
EXPOSE 80 443
CMD ["/enmod.sh"]