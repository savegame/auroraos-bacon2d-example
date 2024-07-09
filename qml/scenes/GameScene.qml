import QtQuick 2.0
import Sailfish.Silica 1.0
import Bacon2D 1.0
import QtQuick.Particles 2.0
import "../components"
import "../entities"
import "../effects"
import ".."

Scene {
    id: gameScene

    width: game.width
    height: game.height
    debug: false
    physics: true
    world.gravity: Qt.point(0, 0)

    function emitAsteroid() {
        var node = asteroid.createObject(gameScene, {
            "x" : Math.random() * Math.floor(gameScene.width / 64) * 64,
//            "y" : Math.random() * Math.floor(gameScene.height / 64) * 64,
            "y" : -64,
            "angularVelocity" : 0.0 + Math.random() * 180 - 60.0,
            "linearVelocity" : Qt.point(0, 20.0 + Math.random() * 10),
            "scene" : gameScene
        })
    }

    onGameChanged: {
        player.x = game.width * 0.5
        player.y = game.height - player.height - Theme.paddingLarge
    }

    onPreSolve: {
        var playerFixture
        var otherFixture
        if (contact.fixtureA.categories & Context.fcPlayer) {
            playerFixture = contact.fixtureA
            otherFixture = contact.fixtureB
        } else if (contact.fixtureB.categories & Context.fcPlayer) {
            playerFixture = contact.fixtureB
            otherFixture = contact.fixtureA
        }

        if (!playerFixture) {
            return
        }

        if (otherFixture.categories & Context.fcAsteroid) {
            var asteroid = otherFixture.getBody().target
            blowEmmiter.burst(5 * asteroid.size, asteroid.x, asteroid.y)
            asteroid.destroy()
        }
    }

//    ImageLayer {
//        id: background

//        anchors.fill: parent
//        scene: parent
//        source: Qt.resolvedUrl("../../assets/background/level_background_1.png")
//        updateInterval: game.ups
//        behavior: ScrollBehavior {
//            verticalStep: Context.playerSpeed * 0.5
//        }
//    }
    Rectangle {
        anchors.fill: parent
        color: "black"
    }

    Turbine {
        id: turbine
        sys: particleTurbine
        x: player.x - turbine.width * 0.5
        y: player.y
    }

    Player {
        id: player
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent

        onPositionChanged: player.positionChanged(mouseX, mouseY)
        onPressed: player.positionChanged(mouseX, mouseY)
    }

    // UI Layer

    TextButton {
        anchors {
            left: parent.left
            leftMargin: Theme.horizontalPageMargin
            top: parent.top
            topMargin: Theme.paddingLarge
        }

        z: 2
        text: "back"

        onClicked: gameScene.game.state = "main_menu"
    }

    BigText {
        anchors {
            right: parent.right
            rightMargin: Theme.horizontalPageMargin
            top: parent.top
            topMargin: Theme.paddingLarge
        }

        z: 2
        text: Context.playerHealth
    }

    // Helper objects
    ParticleSystem {
        id: particleSystem
        anchors.fill: parent

        AsteroidBlow {
            id: blowEmmiter
        }
    }

    ParticleSystem {
        id: particleTurbine
        anchors.fill: parent
    }

    Timer {
        // asteroid timer (for demo debug)
        interval: 500
        running: game.gameState == Bacon2D.Running
        repeat: true

        onTriggered: emitAsteroid()
    }

    Component {
        id: asteroid
        Asteroid {}
    }
}
