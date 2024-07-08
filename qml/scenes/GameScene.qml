import QtQuick 2.0
import Sailfish.Silica 1.0
import Bacon2D 1.0
import QtQuick.Particles 2.0
import "../components"
import "../entities"
import "../effects"

Scene {
    id: root

    onGameChanged: {
        player.x = game.width * 0.5
        player.y = game.height - player.height - Theme.paddingLarge
    }

    debug: true
    physics: true

    width: game.width
    height: game.height

    ParticleSystem {
        id: particleSystem
    }

    Turbine {
        id: turbine
        sys: particleSystem
        x: player.x - turbine.width * 0.5
        y: player.y
    }

    Player {
        id: player
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent

        onPositionChanged: {
            player.fingerX = mouseX
            player.fingerY = mouseY
            player.positionChanged()
        }

        onPressed: {
            player.fingerX = mouseX
            player.fingerY = mouseY
            player.positionChanged()
        }
    }

    // UI Layer

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
