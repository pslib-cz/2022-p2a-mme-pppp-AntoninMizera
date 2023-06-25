#!/bin/bash
cd /app
# WTF: Qt WebEngine plugin gets pushed to /app/qml?
export QML2_IMPORT_PATH=$QML2_IMPORT_PATH:/app/qml

python3 main.py
