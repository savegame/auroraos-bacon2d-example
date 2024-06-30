import QtQuick 2.6
import Sailfish.Silica 1.0

MouseArea {
    id: root

    property alias text: label.text
    property alias font: label.font
    property alias color: label.color

    width: label.width
    height: label.height

    Rectangle {
        anchors.fill: parent

        radius: Theme.paddingMedium
        color: Theme.rgba("#71b3ff", root.containsPress ? Theme.opacityHigh : Theme.opacityLow)
        border.color: Theme.rgba("black", Theme.opacityHigh)
        border.width: Theme.dp(2)
    }

    BigText {
        id: label
        color: root.containsPress ? "#71b3ff" : "white"
    }
}
