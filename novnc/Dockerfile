# This Dockerfile is used to build an sakuli image based on Ubuntu
FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive
ENV DISPLAY :1
ENV NO_VNC_HOME /root/noVNC
ENV VNC_COL_DEPTH 24
ENV VNC_RESOLUTION 1900x1097
ENV VNC_PW g3mpx4k
ENV VIRTUAL_HOST stats.allancorfix.dk
ENV VIRTUAL_PORT 7777

RUN apt-get install software-properties-common
RUN add-apt-repository ppa:x2go/stable
RUN add-apt-repository ppa:openjdk-r/ppa

############### xvnc / xfce installation
RUN apt-get update && apt-get upgrade -y && apt-get install -y supervisor xubuntu-desktop x2goserver x2goserver-xsession vnc4server openjdk-8-jre wget unzip
### Install noVNC - HTML5 based VNC viewer
RUN mkdir -p $NO_VNC_HOME/utils/websockify \
    && wget -qO- https://github.com/kanaka/noVNC/archive/master.tar.gz | tar xz --strip 1 -C $NO_VNC_HOME \
    &&  wget -qO- https://github.com/kanaka/websockify/archive/v0.7.0.tar.gz | tar xz --strip 1 -C $NO_VNC_HOME/utils/websockify \
    && chmod +x -v /root/noVNC/utils/*.sh

# xvnc server porst, if $DISPLAY=:1 port will be 5901
EXPOSE 5901
# novnc web port
EXPOSE 6901

EXPOSE 2222
EXPOSE 7777
EXPOSE 8888

ADD .vnc /root/.vnc
ADD scripts /root/scripts
RUN chmod +x /root/.vnc/xstartup /etc/X11/xinit/xinitrc /root/scripts/*.sh

ENTRYPOINT ["/root/scripts/vnc_startup.sh"]
CMD ["--tail-log"]