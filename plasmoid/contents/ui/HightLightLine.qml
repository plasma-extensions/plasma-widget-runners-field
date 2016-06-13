import QtQuick 2.0

Item {
    id: root
    property var steps: 2;
    property var selected: 0;
    
    Rectangle {
        anchors.left: parent.left;
        anchors.right: parent.right;
        anchors.bottom: parent.bottom
        
        height: 2
        color: "gray"
    }
    
    Rectangle {
        id: selectedRectangle
        anchors.bottom: parent.bottom
        
        color: "blue"
        width: icons.width / root.steps;
        height: 4
    }
    
    onSelectedChanged: {
        selectedRectangle.x = selected * selectedRectangle.width
    }
}