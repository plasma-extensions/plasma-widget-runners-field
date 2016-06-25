import QtQuick 2.5
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.4
import org.kde.plasma.core 2.0 as PlasmaCore

import org.kde.runnermodel 2.0

ScrollView {
    // Disable horizontal scroll
    //horizontalScrollBarPolicy: Qt.ScrollBarAlwaysOff;
    id: root
    property var query: "";
    property var runners: [""];
    
    // width: 180; height: 200
    Keys.forwardTo: [listView]
    
    
    Component {
        id: contactDelegate
        Item {
            height: 40
            anchors.left: parent.left; anchors.right: parent.right;
            Column {
                Text { text: '<b>Name:</b> ' + name }
                Text { text: '<b>Number:</b> ' + number }
            }
        }
    }
    
    Component {
        id: resultDelegate
        Item {
            height: 36
            anchors.left: parent.left; anchors.right: parent.right;
            RowLayout  {
                spacing: 20;
                //anchors.fill: parent
                PlasmaCore.IconItem {
                    Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter;
                    source: icon;
                    
                }
                Text {
                    text: label;
                    Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter;
                }
            }
        }
    }

    ListView {
        id: listView
        anchors.fill: parent
        displayMarginBeginning: 0;
        model: RunnerModel { query: root.query; }
        
        delegate: resultDelegate
        highlight: Rectangle { color: "lightsteelblue";}
        focus: true
    }
}
/*
ListView {
    id: listView
       
    delegate: GridLayout {
        columns: 2
        Layout.fillWidth: true;
        PlasmaCore.IconItem { Layout.column: 1; source: icon;}
        Text {Layout.column: 2;  text: label;}
        
        MouseArea {
            anchors.fill: parent;
            onClicked: runnermodel.run(index);
        }
    }
    
    highlightFollowsCurrentItem: true
    highlight: Rectangle {
        //width: 20; height: 20;
        color: "lightblue"; 
        
    }
            
        
        
    section.property: "runnerName"
    section.criteria: ViewSection.FullString
    section.delegate: Rectangle {
            //width: container.width
            height: childrenRect.height
            color: "lightsteelblue"

            Text {
                text: section
                font.pixelSize: 14
            }
        }
}*/