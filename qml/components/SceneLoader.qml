import QtQuick 2.0
import Bacon2D 1.0

Loader {
    id: sceneLoader

    property Game game

    width: game.contentWidth
    height: game.conentHeight
    asynchronous: true
    visible: false

    function load(url) {
        loadingSplash.nextScene = url
        loadingSplash.opacity = 1.0
    }

    onLoaded: {
        sceneLoader.item.anchors.centerIn = game
        sceneLoader.item.width = game.width
        sceneLoader.item.height = game.height
        loadingSplash.opacity = 0
        game.pushScene(sceneLoader.item)
    }

    LoadingSplash {
        id: loadingSplash

        anchors.centerIn: parent
        width: game.width
        height: game.height

        onOpacityChanged: {
            if (opacity === 1.0 && loadingSplash.nextScene.length > 0) {
                game.popScene()
                sceneLoader.setSource(loadingSplash.nextScene, {"game" : game})
                loadingSplash.nextScene = ""
            }
        }

        z: 2
        opacity: 0.99
    }

    Component.onCompleted: {
        if (!game) {
            console.warn("No game property set!")
        }
    }
}
