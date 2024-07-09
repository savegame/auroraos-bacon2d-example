import QtQuick 2.6
import QtQuick.Particles 2.0
import Sailfish.Silica 1.0
import ".."

Emitter {
    id: emitter

    width: Theme.iconSizeSmall
    height: Theme.iconSizeSmall

    enabled: false
    lifeSpan: 1600
    emitRate: 32 // particles per second
    maximumEmitted: 100
    size: Theme.iconSizeMedium // start size of particle
    endSize: Theme.paddingMedium // end size of particle
    sizeVariation: 0.7

    velocity: AngleDirection {
        angle: 90
        magnitude: Theme.iconSizeLauncher * 8
        magnitudeVariation: Theme.iconSizeLauncher
    }

    ImageParticle {
        system: emitter.system
        source: Qt.resolvedUrl("../../assets/effects/dust_64.png")
        color: "white"
        autoRotation: true
        rotationVariation: 180.0
        alpha: 0.1
    }

    Component.onDestruction: {
        console.log("Destruction on emitter!")
    }
}
