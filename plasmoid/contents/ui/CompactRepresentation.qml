import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.3
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents

RowLayout {
    anchors.left: parent.left; anchors.right: parent.right;

    Component.onCompleted: {
        /*
         * Inspect runnermodel properties and functions
        print("runnermodel: ");
        for (var k in runnermodel) {
            print(k , runnermodel[k])
        }*/
    }
    
    PlasmaCore.IconItem {
        id: appletIcon
        source: plasmoid.icon
        Layout.fillHeight: true;
        MouseArea {
        }
    }
    
    TextField {
        id: queryInput;
        Layout.fillWidth: true; Layout.minimumWidth: 100;
        
        placeholderText: i18n("Type to search")
        
        focus: true
        Keys.onPressed: {
            if (event.key == Qt.Key_Escape) {
                queryInput.text = "";
                runnermodel.query = "";
                
                plasmoid.expanded = false;
            }
            
        }
        onEditingFinished: runnermodel.query = queryInput.text;
        onAccepted: { 
            print('Doing it!');
             plasmoid.expanded = true;
             queryInput.focus = true;
             
        }
    }
    
}