//pip install PyQtWebEngine
//This concept is more of an experiment

import "../components" as Components
import "../Constants.js" as Constants

Components.WebView {
    url: Constants.urls["timetable"]
    allowedOrigins: [
        new URL(Constants.urls["timetable"]).hostname
    ]

}