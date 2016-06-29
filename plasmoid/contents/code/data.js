var runnersSelection = [
    ["recentdocuments"],
    ["services", "shell"],
    ["places","locations", "folder", "baloosearch"], 
    ["calculator", "unitconverter"],
    ["bookmarks", "webshortcuts"]
]

var runnersModels = [];
var currentRunner = null;

function initRunnerModels(parent, query) {
    for (var i = 0; i < 5; i++) {
        var newRunner = Qt.createQmlObject(
                    'import org.kde.runnermodel 2.0; RunnerModel {}',
                    parent)
        
        newRunner.query = query;
        print(runnersSelection[i])
        newRunner.runners = runnersSelection[i];
        runnersModels[i] = newRunner;
    }
}

function changeListModel(listView, modelIndex) {
    currentRunner = runnersModels[modelIndex]; 
    updateQuery("");
    listView.model =  currentRunner;
}

function updateQuery(query){
    currentRunner.query = query;
}

function triggerAction(idx) {
    currentRunner.run(idx);
}

