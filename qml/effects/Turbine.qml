import QtQuick 2.6
import QtQuick.Particles 2.0
import Sailfish.Silica 1.0

Emitter {
    id: emitter

    property ParticleSystem sys

    width: Theme.iconSizeSmall
    system: sys
    lifeSpan: 200
    emitRate: 160 // particles per second
    maximumEmitted: 24
    size: Theme.iconSizeMedium // start size of particle
    endSize: Theme.paddingMedium // end size of particle
    sizeVariation: 0.1

    velocity: AngleDirection {
        angle: 90
        magnitude: Theme.iconSizeLauncher * 8
    }

    ImageParticle {
        system: sys
        source: Qt.resolvedUrl("../../assets/effects/blow_32.png")
        color: "white"
        autoRotation: true
        rotationVariation: 180.0
        alpha: 0.1
    }
}

