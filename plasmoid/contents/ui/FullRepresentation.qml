import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.3
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents

Item {
    width: 400; height: 200;
    
    ListView {
        anchors.fill: parent;
        
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
    }
}