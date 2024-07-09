pragma Singleton
import QtQuick 2.0
import Bacon2D 1.0
import QtQuick.Particles 2.0
import "components"
import "effects"

QtObject {
    readonly property FontLoader fntPixy: FontLoader {
        source: Qt.resolvedUrl("../assets/fonts/PIXY.ttf")
    }
    property bool sound: true
    // fixture categories
    readonly property int fcPlayer : Fixture.Category1
    readonly property int fcAsteroid : Fixture.Category2
    // current scene emitters
    property Emitter asteroidBlowEmitter
    // game properties
    property real playerSpeed: 20
    property real playerHealth: 100
    property real playerCurrentXSpeed: 0

}
