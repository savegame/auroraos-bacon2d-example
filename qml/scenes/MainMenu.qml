import QtQuick 2.6
import Bacon2D 1.0
import Sailfish.Silica 1.0
import "../components"
import ".."

Scene {
    id: root
    objectName: "MainMenuScene"

    Image {
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop
        source: Qt.resolvedUrl("../../assets/background/background_1.png")
    }

    BigText {
        text: "SPACE SHIP"
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: Theme.paddingLarge * 2
        }
    }

    Column {
        id: firstPage

        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        visible: opacity > 0

        onVisibleChanged: {
            if (visible || !secondPage) {
                return
            }
            secondPage.opacity = 1
        }

        Behavior on opacity {
            FadeAnimation {}
        }

        TextButton {
            anchors.horizontalCenter: parent.horizontalCenter

            text: qsTr("start game")

            onClicked: root.game.state = "GameScene"
        }

        TextButton {
            anchors.horizontalCenter: parent.horizontalCenter

            text: qsTr("options")

            onClicked: firstPage.opacity = 0
        }
    }

    Column {
        id: secondPage

        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        opacity: 0
        visible: opacity > 0

        onVisibleChanged: {
            if (visible) {
                return
            }
            firstPage.opacity = 1
        }

        Behavior on opacity {
            FadeAnimation {}
        }

        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: Theme.paddingMedium

            BigText {
                text: qsTr("Sound")
            }

            TextButton {
                text: Context.sound ? qsTr(" ON") : qsTr("OFF")
                onClicked: Context.sound = !Context.sound
            }
        }


        TextButton {
            anchors.horizontalCenter: parent.horizontalCenter

            text: qsTr("back")

            onClicked: secondPage.opacity = 0
        }
    }
}
