import QtQuick 2.0
import Sailfish.Silica 1.0
import QtGraphicalEffects 1.0
import ".."

Text {
    id: label

    property color outlineColor: "black"

    height: font.pixelSize + Theme.paddingSmall * 2
    width: contentWidth + Theme.paddingMedium * 2

    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
    color: "white"
    font.pixelSize: Theme.fontSizeExtraLarge * 2
    font.bold: true
    font.family: Context.fntPixy.name

    layer.effect: DropShadow {
        anchors.fill: label
        horizontalOffset: 0
        verticalOffset: 0
        radius: Theme.dp(3)
        samples: 2
        spread: 1
        color: outlineColor
        opacity: label.opacity
    }
    layer.enabled: true
}
