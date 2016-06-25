import QtQuick 2.5
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.3
import org.kde.plasma.core 2.0 as PlasmaCore

FocusScope {
    Keys.forwardTo: [icons]
    
    property alias currentIndex: icons.currentIndex;
    
    id: root
    width: 400; height: 38;
    
    Rectangle {
        id: separatorLine
        anchors.top: icons.bottom;
        anchors.left: parent.left; anchors.right: parent.right;
        
        color: "gray"
        height: 2
    }

    
    ListModel {
        id: listModel
        ListElement { icon: "document-open-recent" }
        ListElement { icon: "system-run" }
        ListElement { icon: "folder" }
        ListElement { icon: "accessories-calculator" }
        ListElement { icon: "favorites" }
    }
    
                
    ListView {
        id: icons
        anchors.top: parent.top;
        anchors.left: parent.left; anchors.right: parent.right;
        
        height: 36;
        
        keyNavigationWraps: true;
        orientation: ListView.Horizontal;
        delegate: listDelegate; 
        
        model: listModel;
    
        highlightFollowsCurrentItem: true
        highlight: itemHighlight;
        focus: true;
        
         onVisibleChanged: {
             icons.currentIndex = 0
        }
    }
    
    
    Component {
        id: listDelegate
        
        RowLayout {
                PlasmaCore.IconItem {  
                source: icon;
                Layout.leftMargin: (root.width/5 - width) / 2; Layout.rightMargin: (root.width/5 - width) / 2; Layout.bottomMargin: 6;
                MouseArea {
                    anchors.fill: parent;
                    onClicked: {
                        console.log("clicked " + index)
                        icons.currentIndex = index;
                        console.log("clicked " + icons.currentIndex)
                    }
                }
            }
        }
    }
    
    Component {
        id: itemHighlight;
        RowLayout{
            width: 20; height: 20;
            Rectangle{
                height: 4;
                anchors.left: parent.left; anchors.right: parent.right;
                anchors.bottom: parent.bottom;
                
                color: "lightblue"; 
            }
            
        }
    }
}