import QtQuick 2.5
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.4
import org.kde.plasma.core 2.0 as PlasmaCore

import org.kde.runnermodel 2.0

ScrollView {
    id: root
    
    property alias model: listView.model;
    
    Keys.forwardTo: [listView]
       
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
    
    Component {
        id: sectionDelegate
        Rectangle {
            //width: container.width
            height: childrenRect.height
            color: "lightsteelblue"

            Text {
                text: section
                font.pixelSize: 14
            }
        }
    }

    ListView {
        id: listView
        anchors.fill: parent
        displayMarginBeginning: 0;
        
        delegate: resultDelegate
        highlight: Rectangle { color: "lightsteelblue";}
        focus: true
        
        section.property: "runnerName"
        section.criteria: ViewSection.FullString
        section.delegate: sectionDelegate;
    }
}