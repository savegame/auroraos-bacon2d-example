import QtQuick 2.6
import Bacon2D 1.0
import "../effects"
import ".."
import "qrc:/bacon2d"

PhysicsEntity {
    id: player
    objectName: "Player"

    width: image.width
    height: image.height
    bodyType: Body.Kinematic
    bullet: true

    fixtures: [
        Box {
            x: image.x + 76
            y: image.y + 62
            width: 41
            height: 205

            categories: Context.fcPlayer
            collidesWith: Context.fcAsteroid
        },

        Box {
            x: image.x + 2
            y: image.y + 188
            width: 193
            height: 24

            categories: Context.fcPlayer
            collidesWith: Context.fcAsteroid
        },

        Box {
            x: image.x + 87
            y: image.y + 28
            width: 23
            height: 42

            categories: Context.fcPlayer
            collidesWith: Context.fcAsteroid
        }
    ]

    function positionChanged(fingerX, fingerY) {
        var vector = Qt.vector2d(fingerX - x, fingerY - y)
        var duration = vector.length() / Context.playerSpeed * 10.0

        moveAnim.stop()

        xanim.duration = duration
        xanim.from = x
        xanim.to = fingerX

        Context.playerCurrentXSpeed = ((fingerX - x) / duration) * (1000 / game.ups)

        yanim.duration = duration
        yanim.from = y
        yanim.to = fingerY

        moveAnim.start()
    }

    ParallelAnimation {
        id: moveAnim
        NumberAnimation {
            id: xanim
            target: player
            property: "x"

            onStopped: Context.playerCurrentXSpeed = 0
        }
        NumberAnimation {
            id: yanim
            target: player
            property: "y"
        }
    }

    Image {
        id: image
        x: -image.width * 0.5
        y: -image.height + 10
        source: Qt.resolvedUrl("../../assets/spaceships/spaceship_0.png")
        opacity: scene.debug ? 0.2 : 1.0
    }
}
