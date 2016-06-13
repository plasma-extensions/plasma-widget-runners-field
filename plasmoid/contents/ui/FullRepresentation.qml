import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.4
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents

FocusScope {
    width: 400; height: 200;
    
    RowLayout {
        id: icons
        anchors.left: parent.left;
        anchors.right: parent.right;
        anchors.top: parent.top;
        
        PlasmaCore.IconItem { source: "document-open-recent"}
        PlasmaCore.IconItem { source: "system-run"}
        PlasmaCore.IconItem { source: "folder"}
        PlasmaCore.IconItem { source: "accessories-calculator"}
        PlasmaCore.IconItem { source: "favorites"}
        
        /*
        focus: true
        */
    }
    
    HightLightLine {
        id: hightLightLine
        anchors.left: parent.left;
        anchors.right: parent.right;
        anchors.top: icons.bottom;
        
        steps: 5;
    }
    
    ApplicationsListView {
        anchors.left: parent.left;
        anchors.right: parent.right;
        anchors.top: hightLightLine.bottom; anchors.bottom: parent.bottom;
        
        Keys.onPressed: {
            console.log("key pressed" + event.key);
            if (event.key == Qt.Key_Left)
                hightLightLine.selected = hightLightLine.selected > 0 ? hightLightLine.selected - 1 : 0;
            if (event.key == Qt.Key_Right)
                hightLightLine.selected = hightLightLine.selected < hightLightLine.steps ? hightLightLine.selected + 1 : hightLightLine.steps;
        }
    }

}