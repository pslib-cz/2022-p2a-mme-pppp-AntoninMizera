#!/bin/bash
VERSION="6.3"
ARCH=""

if [[ -n $IS_AARCH64 ]]; then
ARCH="aarch64"
fi

flatpak install org.kde.Platform/$ARCH/$VERSION
flatpak install org.kde.Sdk/$ARCH/$VERSION
flatpak install com.riverbankcomputing.PyQt.BaseApp/$ARCH/$VERSION
