import QtQuick 2.4
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.3
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents

TextField {
    id: queryInput;
    anchors.left: parent.left; anchors.right: parent.right;
       
     Layout.fillWidth: true; Layout.minimumWidth: 160;
     
     placeholderText: i18n("Type to search")
     
     // Bind to main query property
     text: main.query;
     font.family: "Noto Sans"; font.pointSize: 10;

    PlasmaCore.IconItem {
        source: "search"
        implicitHeight: 22; implicitWidth: 22;
        anchors.right: queryInput.right;
        anchors.verticalCenter: queryInput.verticalCenter;
        anchors.rightMargin: 4;
    }
    
    MouseArea {
        anchors.fill: parent
        onClicked: plasmoid.expanded = true; 
    }
}