import QtQuick 2.12
import QtQuick.Controls.Basic 2.12
import QtQuick.Layouts 1.15
import Meta 1.0
import "../utils" as Utils
import "../api" as API
import "../components" as Components
import "../Constants.js" as Constants

Item {
    id: root

    Meta {
        id: meta
    }

    Image {
        id: skola
        source: Qt.resolvedUrl("../images/skola.png")

        anchors.fill: root

        fillMode: Image.PreserveAspectCrop
    }
    Rectangle {
        id: bg
        anchors.fill: root
        color: "#72e9e9e9"
    }

    Components.HomeButton {}

    Rectangle {
        id: rootRectangle
        radius: Constants.baseSize / 4
        z: 1
        anchors.centerIn: root

        color: "white"
        width: Math.min(root.width, 40 * Constants.baseSize + (anchors.topMargin + anchors.bottomMargin)) - (anchors.leftMargin + anchors.rightMargin)
        height: Math.min(root.height, 50 * Constants.baseSize + (anchors.topMargin + anchors.bottomMargin)) - (anchors.topMargin + anchors.bottomMargin)

        anchors.margins: Constants.baseSize / 2


        ScrollView {
            id: layout
            anchors.fill: parent
            contentWidth: parent.width
            contentHeight: contentColumn.implicitHeight + contentColumn.anchors.topMargin + contentColumn.anchors.bottomMargin

            Column {
                id: contentColumn
                anchors.fill: parent

                anchors.leftMargin: 2.25 * Constants.baseSize
                anchors.rightMargin: 2.25 * Constants.baseSize
                anchors.topMargin: 2.75 * Constants.baseSize
                anchors.bottomMargin: 2.75 * Constants.baseSize
                
                Text {
                    color: Constants.headingColor
                    font.pixelSize: 4 * Constants.baseSize
                    font.family: Constants.fontFamily
                    font.weight: Font.Bold
                    width: parent.width - (anchors.leftMargin + anchors.rightMargin)
                    text: Constants.mainPageText["btn4"]
                }

                Text {
                    color: Constants.textColor
                    font.pixelSize: 1.5 * Constants.baseSize
                    font.family: Constants.fontFamily
                    wrapMode: Text.Wrap
                    width: parent.width - (anchors.leftMargin + anchors.rightMargin)
                    text: `Střední průmyslová škola strojní a elektrotechnická v Liberci je renomovaným vzdělávacím zařízením, které nabízí kvalitní vzdělání v oblasti strojírenství a elektrotechniky. Tato škola je jednou z předních technických škol v Liberci a její význam se neustále rozšiřuje jak v rámci města, tak i v celém regionu.

Jedním z hlavních přínosů této školy je komplexní a moderní vzdělávací program, který připravuje studenty na jejich budoucí kariéru v technickém průmyslu. Škola nabízí řadu specializací v oblastech strojírenství, elektrotechniky, automatizace a informačních technologií, což umožňuje studentům vybrat si obor, který je nejvíce zajímá a odpovídá jejich schopnostem a zájmům.

Moderní vybavení školy je dalším klíčovým faktorem, který přispívá ke kvalitě vzdělání. Škola disponuje moderními laboratořemi, dílnami a učebnami vybavenými nejnovější technologií a zařízeními. To umožňuje studentům získat praktické dovednosti a zkušenosti s moderními nástroji a technologiemi, které jsou v průmyslovém prostředí běžně používány. Tím se zvyšuje jejich konkurenceschopnost na trhu práce a připravuje je na technologicky náročné pozice.

Dalším důležitým prvkem Střední průmyslové školy strojní a elektrotechnické v Liberci je kvalifikovaný pedagogický tým. Učitelé na této škole jsou odborníky ve svých oblastech a mají bohaté pracovní zkušenosti, které přinášejí do učeben. Jsou schopni sdílet své znalosti, dovednosti a praktické zkušenosti se studenty, což přispívá k jejich komplexnímu vzdělání. Učitelé také podporují rozvoj kreativity, samostatnosti a inovativního myšlení studentů, což je klíčové pro úspěch v technickém průmyslu.

Střední průmyslová škola strojní a elektrotechnická v Liberci také navazuje spolupráci se zaměstnavateli a průmyslovými firmami. Díky těmto partnerstvím mají studenti možnost absolvovat odbornou praxi ve skutečném průmyslovém prostředí a získat praktické zkušenosti. Tato spolupráce také umožňuje škole sledovat aktuální trendy a potřeby průmyslu, což se promítá do aktualizace vzdělávacího programu a přípravy studentů na požadavky moderního trhu práce.

V neposlední řadě je důležité zmínit i atmosféru na škole. Střední průmyslová škola strojní a elektrotechnická v Liberci vytváří přátelské a podpůrné prostředí, ve kterém se studenti cítí dobře a mohou se plně soustředit na své studium. Škola také pořádá různé akce a soutěže, které podporují soutěživost a týmovou spolupráci mezi studenty.

Celkově lze říci, že Střední průmyslová škola strojní a elektrotechnická v Liberci poskytuje kvalitní vzdělání v oblasti technických oborů. Díky modernímu vybavení, kvalifikovanému pedagogickému týmu, spolupráci se zaměstnavateli a přátelské atmosféře se studenti zde připravují na úspěšnou kariéru ve strojírenství, elektrotechnice a dalších příbuzných oborech. Tato škola má významný přínos pro technický průmysl v regionu a přispívá k rozvoji odborného vzdělávání ve městě Liberec.

Zdroj textu: ChatGPT

--

Built using Qt v${meta.qtVersion} and Python v${meta.pyVersion}`
                }
            }
        }
    }
}