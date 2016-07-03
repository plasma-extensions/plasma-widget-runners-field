import QtQuick 2.5
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.3
import org.kde.plasma.core 2.0 as PlasmaCore

FocusScope {
    Keys.forwardTo: [icons]
    
    property alias currentIndex: icons.currentIndex;
    
    id: root
    width: 400; height: 38;
    
    
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
        
        height: 42;
        
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
    
    Rectangle {
        id: separatorLine
        anchors.top: icons.bottom;
        anchors.left: parent.left; anchors.right: parent.right;
        
        color: "gray"
        height: 1
    }
    
    
    Component {
        id: listDelegate
        
        Item {
            width: 66; height: 42;
            
            PlasmaCore.IconItem {  
                source: icon;   
                implicitHeight: 22; implicitWidth: 22;
                anchors.horizontalCenter: parent. horizontalCenter;
                anchors.verticalCenter: parent. verticalCenter;
            }
            
            MouseArea {
                anchors.fill: parent;
                hoverEnabled: true;
                onClicked: icons.currentIndex = index;
                onEntered: icons.currentIndex = index;
            }
        }
    }
    
    Component {
        id: itemHighlight;
        RowLayout{
            width: root.width/5; height: 20;
            Rectangle{
                height: 2;
                //anchors.left: parent.left; anchors.right: parent.right;
                Layout.fillWidth: true;
                anchors.bottom: parent.bottom;
                
                color: "lightblue"; 
            }
            
        }
    }
}