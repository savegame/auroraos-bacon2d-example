import QtQuick 2.6
import Sailfish.Silica 1.0

MouseArea {
    id: root

    property alias text: label.text
    property alias font: label.font
    property alias color: label.color

    width: label.width
    height: label.height

    BigText {
        id: label
        anchors.centerIn: parent

        color: root.containsPress ? "#71b3ff" : "white"

        scale: root.containsPress ? 1.1 : 1.0

        Behavior on scale {
            NumberAnimation {
                easing.type: Easing.OutBounce
                duration: 200
            }
        }

        Behavior on color {
            ColorAnimation {
                easing.type: Easing.OutBounce
                duration: 200
            }
        }
    }
}
