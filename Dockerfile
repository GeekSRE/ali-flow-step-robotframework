FROM registry.cn-beijing.aliyuncs.com/rdc-builds/base:1.0
#FROM ubuntu:18.04

COPY .step/*.sh /root/
COPY robotframework/step.sh /root/step.sh
COPY robotframework/parse_output.py /root/parse_output.py
COPY robotframework/jq /usr/bin/

RUN sed -i -E 's/[a-z]+.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list &&\
        apt-get update && apt-get install -y python3 xvfb python3 python3-pip xvfb unzip wget &&\
        wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb &&\
        apt-get install ./google-chrome-stable_current_amd64.deb -y && rm -f google-chrome-stable_current_amd64.deb &&\
        wget http://npm.taobao.org/mirrors/chromedriver/87.0.4280.88/chromedriver_linux64.zip && unzip chromedriver_linux64.zip && mv chromedriver /usr/bin && rm -f chromedriver_linux64.zip &&\
        pip3 install -i https://pypi.douban.com/simple --no-cache-dir robotframework robotframework-selenium2library pyvirtualdisplay
RUN apt-get install -y curl language-pack-zh-hans fonts-droid-fallback ttf-wqy-zenhei ttf-wqy-microhei fonts-arphic-ukai fonts-arphic-uming && \
echo "LANG=\"zh_CN.UTF-8\"" >> /etc/environment && \
echo "LANGUAGE=\"zh_CN:zh:en_US:en\"" >> /etc/environment && \
echo "en_US.UTF-8 UTF-8" >> /var/lib/locales/supported.d/local && \
echo "zh_CN.UTF-8 UTF-8" >> /var/lib/locales/supported.d/local && \
echo "zh_CN.GBK GBK" >> /var/lib/locales/supported.d/local && \
echo "zh_CN GB2312" >> /var/lib/locales/supported.d/local

RUN locale-gen && echo "export LANG=C.UTF-8" >> /etc/profile
RUN chmod +x /root/*.sh

ENTRYPOINT [ "/root/entry.sh"]
