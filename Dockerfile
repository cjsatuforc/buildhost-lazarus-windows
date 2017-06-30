FROM alpine 
MAINTAINER Bailey Stoner <monokrome@monokro.me>

RUN apk update && \
    apk add wine xvfb curl bash

# Prefix commands passed into bash so that they run in xvfb
RUN cd /tmp && \
    curl -L "http://sourceforge.net/projects/lazarus/files/Lazarus%20Windows%2032%20bits/Lazarus%201.6.4/lazarus-1.6.4-fpc-3.0.2-win32.exe/download" -o lazarus-inst.exe
ENV DISPLAY :0
RUN Xvfb :0 -screen 0 1024x768x16 &
RUN exec wine64 "/tmp/lazarus-inst.exe" "/silent /nocancel /suppressmsgboxes=no"
ENTRYPOINT wine64 cmd
