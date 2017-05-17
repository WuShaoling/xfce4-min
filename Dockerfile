FROM cloudwarelabs/xorg:latest
MAINTAINER guodong <gd@tongjo.com>
RUN apt-get update
RUN apt-get install dictionaries-common
RUN /usr/share/debconf/fix_db.pl && dpkg-reconfigure dictionaries-common
RUN apt-get install -y gnome-themes-standard xfce4
RUN apt-get remove -y xscreensaver xscreensaver-data
RUN mkdir -p ~/.config/xfce4/xfconf/xfce-perchannel-xml
COPY xsettings.xml ~/.config/xfce4/xfconf/xfce-perchannel-xml/
COPY xfce4-panel.xml ~/.config/xfce4/xfconf/xfce-perchannel-xml/
RUN mkdir -p ~/.config/autostart
CMD startxfce4
