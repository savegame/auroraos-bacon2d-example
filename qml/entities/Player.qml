import QtQuick 2.6
import Bacon2D 1.0
import Sailfish.Silica 1.0

import "../effects"

Entity {
    id: player

    property real speed: 20.0
    property real fingerX
    property real fingerY

    signal positionChanged

    onPositionChanged: {
        var vector = Qt.vector2d(fingerX - x, fingerY - y)
        var duration = vector.length() / player.speed * 10.0

        moveAnim.stop()
        xanim.duration = duration
        xanim.from = x
        xanim.to = fingerX
        yanim.duration = duration
        yanim.from = y
        yanim.to = fingerY
        moveAnim.start()
    }

    width: image.width
    height: image.height

    ParallelAnimation {
        id: moveAnim
        NumberAnimation {
            id: xanim
            target: player
            property: "x"
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
    }

    Body {
        id: body

        bodyType: Body.Kinematic

        Box {
            x: player.x + image.x + 76
            y: player.y + image.y + 62
            width: 41
            height: 205
        }

        Box {
            x: player.x + image.x + 2
            y: player.y + image.y + 188
            width: 193
            height: 24
        }

        Box {
            x: player.x + image.x + 87
            y: player.y + image.y + 28
            width: 23
            height: 42
        }
    }
}
