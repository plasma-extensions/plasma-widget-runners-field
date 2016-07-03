import QtQuick 2.5
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.4
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents

import "../code/data.js" as Data
import "../code/history.js" as History

Item {
    id: root
    width: 320; height: 348;
    
    property int negative_margin: -7
    anchors.topMargin: negative_margin 
    anchors.bottomMargin: negative_margin + 24

    anchors.leftMargin: negative_margin + 1
    anchors.rightMargin: negative_margin + 1
    
    Rectangle {
        id: header

        anchors.top: parent.top;
        anchors.left: parent.left; anchors.right: parent.right;
        
        color: "#3DAEE9"
        height: 40;
        
            Text {
                id: header_text
                //anchors.top: parent.top
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: 10 
                anchors.topMargin: 16; anchors.bottomMargin: 10;
                
                color: "white"
                text: i18n("KRunner"); 
                font.family: "Noto Sans"; font.pointSize: 12;
            }
    }
    
    onVisibleChanged: {
        if (root.visible) {
            Plasmoid.status = PlasmaCore.Types.ActiveStatus
            root.focus = true;
        
            queryInput.text = main.query;
        }
    }
    
    ListModel {
        id: history
        property var query: "";
            
        function run() {
        }
    
        function saveQuery() {
            History.register(history, query, sectionTabs.currentIndex,  resultsListView.currentIndex )
        }
        
        onQueryChanged: {History.query(query) } 
    }
    
    Component.onCompleted: {
        History.init(history);
        Data.setHistoryModel(history)
        
        Data.initRunnerModels(root, queryInput.text);
    }
    
    Keys.onPressed: {
        console.log(event.key + " pressed")
        if (event.key == Qt.Key_Escape) {
            plasmoid.expanded = false;
            queryInput.text = "";
        }
    }
    
    Keys.forwardTo: [sectionTabs, resultsListView, queryInput]
    focus: true
    
    TextInput {
        id: queryInput;
        onTextChanged: {
            main.query = queryInput.text;
            Data.updateQuery(queryInput.text);
        }
        
        // Hide text
        echoMode: TextInput.NoEcho;
    }
       
    SectionTabs {
        id: sectionTabs;
        width: root.width;
        
        anchors.top: header.bottom;
        anchors.left: parent.left; anchors.right: parent.right;
        
        onCurrentIndexChanged: {
            Data.changeListModel(resultsListView, sectionTabs.currentIndex)
            switch(sectionTabs.currentIndex) {
                case 0:
                    resultsListView.style = "historyResults";
                    break;
                case 1:
                    resultsListView.style = "applicationsResults";
                    break;
                default:
                    resultsListView.style = "otherResults";
            }
            
            Data.updateQuery(queryInput.text);
        }
    }


    ResultsListView {
        id: resultsListView;
        width: root.width
        height: 266;
        focus: true;
        
        anchors.top: sectionTabs.bottom;
        anchors.left: parent.left; anchors.right: parent.right;
        anchors.bottomMargin: 18;
        anchors.topMargin: 14;
        anchors.leftMargin: 18;
        anchors.rightMargin: 18;

        onItemTriggered: {
            if (sectionTabs.currentIndex == 0) {
                var history = History.getHistory(index);
                queryInput.text = history.query;
                sectionTabs.currentIndex = history.tab;
                resultsListView.currentIndex = history.idx;
            } else {
                if (queryInput.text) {
                    History.register(queryInput.text, sectionTabs.currentIndex, index)
                    Data.triggerAction(index)
                    queryInput.text = "";
                    plasmoid.expanded = false;
                }
            }
        }
    }
}