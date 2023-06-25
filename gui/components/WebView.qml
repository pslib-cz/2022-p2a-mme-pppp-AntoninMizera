//pip install PyQtWebEngine
//This concept is more of an experiment

import QtQuick 2.12
import QtQuick.Controls.Basic 2.12
import QtQuick.Layouts 1.15
import QtWebEngine 1.12
import "../utils" as Utils
import "../api" as API
import "../Constants.js" as Constants

Item {
    id: root

    property alias url: webview.url

    property var allowedOrigins: Constants.allowedOrigins

    property var allowedUrls: [
        "https://bakalar.pslib.cz/rodice/Timetable/Public",
        "https://bakalar.pslib.cz/rodice/next/zmeny.aspx"
    ];


    WebEngineView {
        anchors.fill: root

        profile.offTheRecord: true
        id: webview
        onNewWindowRequested: function(request) {
            console.warn(`New view requested at ${request.requestedUrl}, origin: ${new URL(request.requestedUrl).hostname}`)
            if (root.allowedOrigins.includes(new URL(request.requestedUrl).hostname) 
                || root.allowedUrls.some(x => String(request.requestedUrl).startsWith(x))) {
                request.openIn(webview)
            } else {
                fadeIn.start()
                errorTimer.start()
                console.warn(`${request.requestedUrl} isn't in the list of allowed origins`)
            }
        }
        onNavigationRequested: function(request) {
            if (!request.isMainFrame && !Constants.applyAllowedOriginsToFrames) return;
            console.warn(`Navigation requested at ${request.url}, origin: ${new URL(request.url).hostname}`)
            if (root.allowedOrigins.includes(new URL(request.url).hostname) 
                || root.allowedUrls.some(x => String(request.url).startsWith(x))) {
                request.accept()
            } else {
                console.warn(`${request.url} isn't in the list of allowed origins`)

                if (request.isMainFrame) {
                    fadeIn.start()
                    errorTimer.start()
                }
                request.reject();
            }
        }

        onContextMenuRequested: function(ev) {
            // Disallow context menus
            ev.accepted = true;
        }
    }

    Rectangle {
        color: Constants.errorBackground
        id: errorRect

        z: 999
        opacity: 0

        anchors.horizontalCenter: root.horizontalCenter
        anchors.bottom: root.bottom
        anchors.bottomMargin: 8.75 * Constants.baseSize

        width: text.width + 2 * Constants.baseSize
        height: text.height + 2 * Constants.baseSize

        radius: Constants.baseSize / 4

        Text {
            id: text
            color: Constants.errorTextColor

            anchors.centerIn: errorRect
            anchors.margins: Constants.baseSize

            font.pixelSize: 1.5 * Constants.baseSize
            font.weight: Font.Bold
            font.family: Constants.fontFamily

            text: Constants.forbiddenNavigationText
        }

        NumberAnimation on opacity {
            id: fadeIn
            from: 0
            to: 1

            easing.type: Easing.InOutQuad

            running: false

            duration: Constants.animationDuration
        }

        NumberAnimation on opacity {
            id: fadeOut
            from: 1
            to: 0

            easing.type: Easing.OutInQuad

            running: false

            duration: Constants.animationDuration
        }

        Timer {
            id: errorTimer
            interval: 2500

            onTriggered: fadeOut.start()
        }
    }

    
    
    HomeButton {}
}
