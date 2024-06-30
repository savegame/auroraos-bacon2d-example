import QtQuick 2.0
import Sailfish.Silica 1.0
import Bacon2D 1.0
import "../components"

Scene {
    id: root
    // TODO: create LayersScene width layers for UI, game, background
    BigText {
        anchors.centerIn: parent
        text: "Game Scene"
    }

    TextButton {
        onClicked: root.game.state = "main_menu"

        anchors {
            left: parent.left
            leftMargin: Theme.horizontalPageMargin
            top: parent.top
            topMargin: Theme.paddingLarge
        }

        text: "<"
    }
}
