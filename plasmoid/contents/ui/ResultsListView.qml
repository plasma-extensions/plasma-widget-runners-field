import QtQuick 2.5
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.4
import org.kde.plasma.core 2.0 as PlasmaCore

import org.kde.runnermodel 2.0

import "../code/data.js" as Data

ScrollView {
    id: root
    
    property alias model: listView.model;
    property alias currentIndex: listView.currentIndex;
    property alias style: listView.state;
    
    
    signal itemTriggered(var index)
    
    Keys.forwardTo: [listView]
    Component {
        id: textDelegate
        Item {
            height: 18
            anchors.left: parent.left; anchors.right: parent.right;
            RowLayout  {
                spacing: 32;
                Layout.fillWidth: true;
                Text {
                    text: label;
                    Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter;
                }
            }
            MouseArea {
                anchors.fill: parent;
                hoverEnabled: true;
                onClicked: itemTriggered(index);
                onEntered: listView.currentIndex = index;
            }
        }
    }
    
    Component {
        id: simpleDelegate
        Item {
            height: 28
            anchors.left: parent.left; anchors.right: parent.right;
            RowLayout  {
                spacing: 4;
                //anchors.fill: parent
                PlasmaCore.IconItem {
                    source: icon;
                    implicitHeight: 28; implicitWidth: 28;
                    Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter;
                }
                Text {
                    text: label;
                    Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter;
                    Layout.fillWidth: true;
                }
            }
            
            MouseArea {
                anchors.fill: parent;
                hoverEnabled: true;
                onClicked: itemTriggered(index);
                onEntered: listView.currentIndex = index;
            }
        }
    }
    
    Component {
        id: fancyDelegate
        Item {
            height: 64
            anchors.left: parent.left; anchors.right: parent.right;
            RowLayout  {
                spacing: 32;
                //anchors.fill: parent
                PlasmaCore.IconItem {
                    source: icon;
                    implicitHeight: 64; implicitWidth: 64;
                    Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter;
                }
                Text {
                    text: label;
                    Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter;
                    Layout.fillWidth: true;
                }
            }
            MouseArea {
                anchors.fill: parent;
                hoverEnabled: true;
                onClicked: itemTriggered(index);
                onEntered: listView.currentIndex = index;
            }
        }
    }
    
    Component {
        id: sectionDelegate
        Rectangle {
            height: childrenRect.height
            color: "lightsteelblue"
            Layout.bottomMargin: 6;

            Text {
                text: i18n("Showing %1 results for %2:").arg(section.toLowerCase()).arg(listView.model.query)
                font.pixelSize: 14
                Layout.fillWidth: true;
            }
        }
    }

    Component {
        id: historyHeader;
        Text {
            text: i18n("You recently searched for:")
            Layout.fillWidth: true;
            font.pixelSize: 14
            
        }
    }
    ListView {
        id: listView
        anchors.fill: parent
        
        spacing: 18;
        
        highlight: Rectangle { color: "lightsteelblue";}
        focus: true
        
        section.property: "runnerName"
        section.criteria: ViewSection.FullString
        section.delegate: sectionDelegate;
        
        Keys.onPressed: {
            if (event.key == Qt.Key_Enter || event.key == Qt.Key_Return)
                itemTriggered(listView.currentIndex)
        }
        
        states: [
            State {
                name: "historyResults"
                PropertyChanges { 
                    target: listView;
                    delegate: textDelegate;
                    section.delegate: null;
                    spacing: 8;
                    header: historyHeader;
                }
            },
            State {
                name: "applicationsResults"
                PropertyChanges {
                    target: listView;
                    delegate: fancyDelegate;
                    section.delegate: sectionDelegate;
                    spacing: 18;
                    header: null;
                }
            },
            State {
                name: "otherResults"
                PropertyChanges {
                    target: listView;
                    delegate: simpleDelegate;
                    section.delegate:
                    sectionDelegate; spacing: 8;
                    header: null;
                    
                }
            }
        ]

    }
}