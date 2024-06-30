import QtQuick 2.0
import Bacon2D 1.0
import "../components"

Scene {
    id: root

    Image {
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop
        source: Qt.resolvedUrl("../../assets/background/background_1.png")
    }

    Column {
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        TextButton {
            anchors.horizontalCenter: parent.horizontalCenter

            text: qsTr("Start Game")

            onClicked: {
                console.log("game.state", root.game.state)
                root.game.state = "game_scene"
            }
        }
    }
}
