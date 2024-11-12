import QtQuick 2.0

Image {
    property int _background: Math.random() * 3 + 1
    property bool _showing: false

    signal showFinished()
    signal hideFinished()

    function showSplash() {
        _showing = true
        if (opacity == 1.0) {
            showFinished()
        } else {
            _background = Math.random() * 3 + 1
            opacity = 1.0
        }
    }

    function hideSplash() {
        _showing = false
        if (opacity == 0.0) {
            hideFinished()
        } else {
            opacity = 0.0
        }
    }

    visible: opacity > 0
    fillMode: Image.PreserveAspectCrop
    source: Qt.resolvedUrl("../../assets/background/loader_background_%1.png".arg(_background))

    onOpacityChanged: {
        if (opacity === 1.0 && _showing) {
            showFinished()
        } else if (opacity === 0.0 && !_showing) {
            hideFinished()
        }
    }

    Behavior on opacity {
        NumberAnimation {
            duration: 700
            easing.type: Easing.InOutQuart
        }
    }

    BigText {
        anchors.centerIn: parent
        text: qsTr("LOADING")
    }

    // Lock click while lodaing screen is visible
    MouseArea {
        anchors.fill: parent
    }
}
