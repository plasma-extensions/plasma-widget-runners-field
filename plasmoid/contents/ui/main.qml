import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.3
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents

import org.kde.runnermodel 2.0

Item {
    id: main
      
    property string displayName: i18n("KRunner");
    property alias query: runnermodel.query;
    
    RunnerModel {
        id: runnermodel;
        query: main.query;
        
        Component.onCompleted: {
            print("Runners: ")
            print(runnermodel.runners)
        }
    }
    

    Plasmoid.toolTipMainText: displayName;
    Plasmoid.toolTipSubText: i18n("Type what you are looking for");
    
    Plasmoid.fullRepresentation:  FullRepresentation {}
    Plasmoid.compactRepresentation: CompactRepresentation {}

    Plasmoid.preferredRepresentation: Plasmoid.compactRepresentation; 
}
