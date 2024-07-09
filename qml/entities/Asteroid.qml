import QtQuick 2.0
import Bacon2D 1.0
import ".."
import "qrc:/bacon2d"

PhysicsEntity {
    id: asteroid
    objectName: "Asteroid"

    readonly property int number: Math.random() * 3 + 1
    readonly property int size: Math.random() * 3
    readonly property var sizes: [32, 64, 128]

    bodyType: Body.Dynamic
    sleepingAllowed: false

    fixtures: Circle {
        id: circle

        x: -radius
        y: -radius
        radius: asteroid.sizes[asteroid.size] * 0.5 - 6.0 * asteroid.size
        categories: Context.fcAsteroid
        collidesWith: Context.fcAsteroid | Context.fcPlayer

//        onBeginContact: function (fixture) {
//            if (fixture.getBody().target.objectName === "Player") {
//                gameScene.asteroidBlowEmitter.burst(5 * size, asteroid.x, asteroid.y)
//                asteroid.destroy()
//            }
//        }
    }

    onYChanged: {
        if (asteroid.y - image.height * 0.5 >= game.height) {
            asteroid.destroy()
        }
    }

    onXChanged: {
        if (asteroid.x + image.height * 0.5 < 0 || asteroid.x - image.height * 0.5 > game.width) {
            asteroid.destroy()
        }
    }

    Image {
        id: image

        anchors.centerIn: parent
        opacity: scene.debug ? 0.2 : 1.0
        source:
            Qt.resolvedUrl(
                "../../assets/asteroids/%1_%2.png"
                .arg(sizes[size])
                .arg(number)
            )
    }
}
