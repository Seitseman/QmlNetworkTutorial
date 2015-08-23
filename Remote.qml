import QtQuick 2.5

Loader {
    id: root
    source: 'https://gist.githubusercontent.com/Seitseman/9488801e4a94ada48c7c/raw/MyRectangle.qml'
    onLoaded: {
        root.width = item.width
        root.height = item.height
        console.log("#### Loaded..")
    }

}

