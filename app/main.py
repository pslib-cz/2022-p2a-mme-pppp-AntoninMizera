from PyQt6.QtCore import *
from PyQt6.QtGui import *
from PyQt6.QtQml import *
from PyQt6.QtWebEngineQuick import *

from Meta import Meta
from sys import argv, exit
from os import scandir

import signal

signal.signal(signal.SIGINT, signal.SIG_DFL)

QtWebEngineQuick.initialize()
# QtWebEngine.initialize()
app = QGuiApplication(argv)


flatpak_info = QFile("/.flatpak-info")
# exists() does not work correctly under flatpak, open R/O instead
if flatpak_info.open(QIODeviceBase.OpenModeFlag.ReadOnly):
    print("Flatpak info exists")
    gui_file = QFile("./gui/main.qml")
    font_dir = QDir("./gui/fonts")
else:
    print("No flatpak info found")
    gui_file = QFile("../gui/main.qml")
    font_dir = QDir("../gui/fonts/")

# Automatically load fonts if bundled
if font_dir.exists():
    print("font dir found!")
    for entry in font_dir.entryList(["*.ttf"], QDir.Filter.Files):
        print(f"Loading font {entry}")
        QFontDatabase.addApplicationFont(f"{font_dir.path()}/{entry}")

engine = QQmlApplicationEngine()

qmlRegisterType(Meta, 'Meta', 1, 0, 'Meta')

engine.quit.connect(app.quit)

flatpak_info.close()

if not gui_file.exists():
    engine.load("./main.qml")
else:
    engine.load(gui_file.fileName())

app.exec()
