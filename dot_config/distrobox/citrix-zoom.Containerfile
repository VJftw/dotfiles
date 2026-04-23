FROM ghcr.io/ublue-os/ubuntu-toolbox:latest
ARG ZOOM_VDI_PLUGIN_VERSION="6.4.17.26900"

RUN sudo apt update && sudo apt install --yes \
    curl vim \
    pavucontrol lldpd alsa-tools alsa-utils pipewire-audio-client-libraries webkit2gtk-driver \
    libqt5gui5 libqt5widgets5 libqt5gui5 libqt5dbus5 libqt5network5 libqt5core5a libqt5x11extras5-dev libqt5quickcontrols2-5 libqt5multimedia5 libqt5webengine5 libqt5quick5 libqt5qml5

RUN curl -fsSL https://www.citrix.com/downloads/workspace-app/linux/workspace-app-for-linux-latest.html | \
    grep -oE "[^\"]*_amd64\.deb\?[^\"]*" | sed 's/^/https:/g' | grep "icaclient" | \
    xargs curl -fsSL -o icaclient.deb && sudo apt install --yes ./icaclient.deb;

RUN export shortZoomPluginVersion="$(echo "${ZOOM_VDI_PLUGIN_VERSION}" | rev | cut -f2- -d. | rev)"; \
    curl -fsSL "https://zoom.us/download/vdi/${ZOOM_VDI_PLUGIN_VERSION}/zoomvdi-universal-plugin-ubuntu_$shortZoomPluginVersion.deb" -o zoomvdi.deb && \
    sudo apt install --yes ./zoomvdi.deb;
