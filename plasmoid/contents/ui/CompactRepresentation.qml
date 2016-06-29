import QtQuick 2.4
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.3
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents

RowLayout {
    id: root
    anchors.left: parent.left; anchors.right: parent.right;
    
    Component.onCompleted: {
        /*
         * Inspect runnermodel properties and functions
        print("runnermodel: ");
        for (var k in runnermodel) {
            print(k , runnermodel[k])
        }*/
    }
    
    TextField {
        id: queryInput;
        Layout.fillWidth: true; Layout.minimumWidth: 100;
        
        placeholderText: i18n("Type to search")
        
        // Bind to main query property
        text: main.query;
        MouseArea {
            anchors.fill: parent
            onClicked: plasmoid.expanded = true;
        }
    }
    
    
    
    
    
}