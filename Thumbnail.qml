import QtQuick 2.0

Rectangle {

    border.color: "gray"
    border.width: 2

    property alias text: caption.text
    property alias iconSource: image.source
    property alias image: image

    Text{
        id: caption
//        anchors.top: parent.top
        text:  qsTr("...")
        onTextChanged: {
            console.log("### text: ", text)
        }
    }

    Image {
        id: image
//        anchors.bottom: parent.bottom
        fillMode: Image.PreserveAspectFit
//        source: "qtlogo.png"
        onSourceChanged: {
            console.log("### Source: ", source)
        }
    }

}

