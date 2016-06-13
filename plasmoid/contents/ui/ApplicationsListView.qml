import QtQuick 2.5
import QtQuick.Layouts 1.1
import org.kde.plasma.core 2.0 as PlasmaCore

ListView {
    id: listView
       
    model: runnermodel
    delegate: GridLayout {
        columns: 2
        PlasmaCore.IconItem { Layout.column: 1; source: icon;}
        Text {Layout.column: 2;  text: label;}
        
        MouseArea {
            anchors.fill: parent;
            onClicked: runnermodel.run(index);
        }
    }
    
    section.property: "runnerName"
    section.criteria: ViewSection.FullString
    section.delegate: Rectangle {
            width: container.width
            height: childrenRect.height
            color: "lightsteelblue"

            Text {
                text: section
                font.pixelSize: 14
            }
        }
}