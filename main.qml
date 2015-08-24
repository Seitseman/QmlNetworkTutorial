import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.2

// Remote github gist qml rectangle
//ApplicationWindow{
//    visible: true
//    Remote{}
//}

// Flikr
ApplicationWindow {
    visible: true
    width: 320
    height: 480

    ListView {
        id: view
        anchors.fill: parent
        delegate: Thumbnail {
            width: view.width
            height: image.height
            text: modelData.title
            iconSource: modelData.media.m
        }

    }

    function request() {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.HEADERS_RECEIVED) {
                console.log("HEADERS_RECEIVED")
            } else if (xhr.readyState === XMLHttpRequest.DONE) {
                console.log("DONE")
                var json;
                var fixedResponse = xhr.responseText.replace(/\\'/g, "'");
                json = JSON.parse(fixedResponse)
                view.model = json.items
            }
        }

        xhr.open("GET", "http://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1&tags=lviv")
        xhr.send()
    }

    Component.onCompleted: {
        request()
    }
}
