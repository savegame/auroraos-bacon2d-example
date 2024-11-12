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

            property var allowedStates: [
                "MainMenu",
                "GameScene"
            ]

            anchors.fill: parent

            gameName: "Space Ship"
            state: ""
            ups: 40

            onStateChanged: {
                var allowed = false
                for (var i = 0; i < allowedStates.length; i++) {
                    if (state === allowedStates[i]) {
                        allowed = true
                        break
                    }
                }
                var sceneName = state
                if (!allowed) {
                    console.log("Used not allowed state value: %1. Load %2 instead."
                                .arg(state)
                                .arg(allowedStates[0]))
                    sceneName = allowedStates[0]
                }

                sceneLoader.nextScene = Qt.resolvedUrl("scenes/%1.qml".arg(sceneName))
                loadingSplash.showSplash()
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

            onShowFinished: {
                if (sceneLoader.nextScene !== "") {
                    game.popScene()
                    sceneLoader.setSource(sceneLoader.nextScene, {"game" : game})
                    sceneLoader.nextScene = ""
                }
            }
        }

        Component.onCompleted: game.state = "MainMenu"
    }

    cover: ""
    allowedOrientations: defaultAllowedOrientations

}
