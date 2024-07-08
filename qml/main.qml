import QtQuick 2.0
import Sailfish.Silica 1.0
import Bacon2D 1.0

import "scenes"
import "components"

ApplicationWindow {
    objectName: "applicationWindow"

    initialPage: Page {
        allowedOrientations: Orientation.PortraitMask

        Game {
            id: game

            onStateChanged: {
                switch (game.state) {
                case "main_menu":
                    loadingSplash.nextScene = Qt.resolvedUrl("scenes/MainMenu.qml")
                    break
                case "game_scene":
                    loadingSplash.nextScene = Qt.resolvedUrl("scenes/GameScene.qml")
                    break
                }
                loadingSplash.opacity = 1.0
            }
            anchors.fill: parent

            state: ""
            gameName: "Space Ship"
            ups: 40
            currentScene: sceneLoader.item

            Loader {
                id: sceneLoader

                onLoaded: {
                    sceneLoader.item.anchors.centerIn = parent
                    sceneLoader.item.width = game.width
                    sceneLoader.item.height = game.height
                    loadingSplash.opacity = 0
                    game.pushScene(sceneLoader.item)
                }

                anchors.centerIn: parent

                width: game.contentWidth
                height: game.conentHeight
                asynchronous: true
                visible: false
            }
        }

        LoadingSplash {
            id: loadingSplash

            onOpacityChanged: {
                if (opacity === 1.0 && loadingSplash.nextScene.length > 0) {
                    console.log("Set source for scene loader: ", loadingSplash.nextScene)
                    game.popScene()
                    sceneLoader.setSource(loadingSplash.nextScene, {"game" : game})
                    loadingSplash.nextScene = ""
                }
            }

            opacity: 0.99

            anchors.fill: parent
        }
    }

    cover: ""
    allowedOrientations: defaultAllowedOrientations

    Component.onCompleted: game.state = "main_menu"
}
