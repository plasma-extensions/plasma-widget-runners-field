import QtQuick 2.5
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.4
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents

Item {
    id: root
    width: 400; height: 200;
    
    onVisibleChanged: {
        if (root.visible) {
            Plasmoid.status = PlasmaCore.Types.ActiveStatus
            root.focus = true;
        
            queryInput.text = main.query;
        }
    }
    
    
    Keys.onPressed: {
        console.log(event.key + " pressed")
        if (event.key == Qt.Key_Escape) {
            plasmoid.expanded = false;
        }
    }
    

    TextInput {
        id: queryInput;
        anchors.bottom: root.bottom;
        anchors.right: root.right;
        text: main.query;
        onTextChanged: {
            main.query = queryInput.text;
        }
    }
    
    Keys.forwardTo: [sectionTabs, applicationsListView, queryInput]
    focus: true

    
    /*
    Keys.onLeftPressed: {
        console.log(" left pressed")
        icons.currentIndex = icons.currentIndex - 1 > 0 ? icons.currentIndex - 1 : 0;
    }
    
    Keys.onRightPressed: {
        console.log(" right pressed")
        icons.currentIndex = icons.currentIndex + 1 < icons.model.count ? icons.currentIndex + 1 : 0;
    }*/

    
    SectionTabs {
        id: sectionTabs;
        width: root.width;
        
        anchors.top: parent.top;
        anchors.left: parent.left; anchors.right: parent.right;
    }

    ApplicationsListView {
        id: applicationsListView;
        width: root.width
        
        query: queryInput.text;
        focus: true;
        
        anchors.top: sectionTabs.bottom;
        anchors.left: parent.left; anchors.right: parent.right;
    }
}