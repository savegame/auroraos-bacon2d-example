import QtQuick 2.0

Item {
    property string nextScene

    opacity: 0
    visible: opacity > 0

    Behavior on opacity {
        NumberAnimation {
            duration: 700
            easing.type: Easing.InOutQuart
        }
    }

    Image {
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop
        source: Qt.resolvedUrl("../../assets/background/background_0.png")
    }

    BigText {
        anchors.centerIn: parent
        text: "LOADING"
    }

    // Lock click while lodaing screen is visible
    MouseArea {
        anchors.fill: parent
    }
}
