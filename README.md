[Přečíst dokumentaci v češtině](README.cs.md)

# Informational Kiosk System
The goal of this project is to create a simple base for an informational kiosk system.

## Installation
The installation steps depend on the used platform for this project:
- [x86-64][install-x86-64]
- [Raspberry Pi 3B+/4][install-aarch64]

## Reference Application
The reference kiosk application shown to users consists of two primary components/packages:
- the main Python application in the [`app/`](app/) directory
- the Qt Quick (QML) UI in the [`qml/`](qml/) directory

The main Python application is responsible for setting up the environment for the QML UI to use &ndash; automatically loading fonts, using appropriate file paths for the local and Flatpak versions, and initializing additional QML types where the built-in Qt Quick library support isn't enough.

The UI bundled with the application has been designed to be highly configurable using the [`qml/Constants.js`](qml/Constants.js) file. However, you can replace the entire UI with your own as you wish.

The documentation sites for these frameworks can be found here:
- [PyQt][pyqt-docs]
- [Qt Quick/QML][qt-quick-docs]

For local development, it is enough to install appropriate packages (this guide doesn't cover their installation, as the [Flatpak version][build-instructions] can be used for this purpose as well). For ease of development, the application can be started using `run_local.sh`:

```bash
./run_local.sh
```

However, it is also possible to go to the `app` directory manually and launch `main.py` directly:

```bash
cd app
python3 main.py
```

A [guide][build-instructions] is available to build the Flatpak version primarily intended for production deployments.

## License
This project is licensed as follows:
- The documentation for this project along with the `assemble_rpi_hw` folder are licensed under the [CC BY-SA 4.0](LICENSE-DOCS) license.
- The reference application contains the [Noto Sans][noto-sans] font in the `qml/fonts` directory distributed under the [SIL OFL 1.1](qml/fonts/OFL.txt) license.
- The rest of the project is licensed under [GPL-3.0-or-later](LICENSE) license.


[install-x86-64]: install_archlinux_x86-64/INSTALL.md
[install-aarch64]: install_archlinux_aarch64_rpi/INSTALL.md
[build-instructions]: BUILD.md


[pyqt-docs]: https://www.riverbankcomputing.com/static/Docs/PyQt5/
[qt-quick-docs]: https://doc.qt.io/qt-5/qtquick-index.html
[noto-sans]: https://fonts.google.com/noto/specimen/Noto+Sans
