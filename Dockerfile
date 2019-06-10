FROM heawercher/system_with_x_chrome_python36

RUN apt-get update && apt-get install -y x11vnc xvfb autossh language-pack-zh-hans locales locales-all && locale-gen zh_CN.UTF-8 && update-locale
#RUN apt-get install -y xterm


ENV LANG zh_CN.UTF-8
ENV TZ=Asia/Chongqing
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN useradd --create-home --no-log-init --shell /bin/bash l && adduser l sudo && echo 'l:l' | chpasswd
COPY Xresources /home/l/.Xresources
RUN cat /home/l/.Xresources >> /etc/X11/app-defaults/XTerm

COPY test /home/l/test

COPY bootstrap.sh ./
RUN chmod +x bootstrap.sh && chmod +x /home/l/test && chown l:l -R /home/l
ENV DISPLAY=:1
CMD '/bootstrap.sh'
