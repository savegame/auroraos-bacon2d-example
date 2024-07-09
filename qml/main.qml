import QtQuick 2.0
import Sailfish.Silica 1.0
import Bacon2D 1.0

import "scenes"
import "components"
import "."

ApplicationWindow {
    objectName: "applicationWindow"

    initialPage: Page {
        allowedOrientations: Orientation.PortraitMask

        Game {
            id: game

            anchors.fill: parent

            gameName: "Space Ship"
            state: ""
            ups: 40

            onStateChanged: {
                var url = ""
                switch (game.state) {
                case "main_menu":
                    url = Qt.resolvedUrl("scenes/MainMenu.qml")
                    break
                case "game_scene":
                    url = Qt.resolvedUrl("scenes/GameScene.qml")
                    break
                }

                if (url !== "") {
                    sceneLoader.nextScene = url
                    loadingSplash.showSplash()
                }
            }

            Loader {
                id: sceneLoader

                property string nextScene

                onLoaded: {
                    game.pushScene(sceneLoader.item)
                    loadingSplash.hideSplash()
                }

                anchors.fill: parent
                asynchronous: true
            }
        }

        LoadingSplash {
            id: loadingSplash

            anchors.fill: parent
            opacity: 0.9999

            onShowFinished: {
                if (sceneLoader.nextScene !== "") {
                    game.popScene()
                    sceneLoader.setSource(sceneLoader.nextScene, {"game" : game})
                    sceneLoader.nextScene = ""
                }
            }
        }

        Component.onCompleted: game.state = "main_menu"
    }

    cover: ""
    allowedOrientations: defaultAllowedOrientations

}
