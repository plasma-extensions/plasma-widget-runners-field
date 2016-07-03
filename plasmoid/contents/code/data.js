
var runnersSelection = [
    [""],
    ["services", "shell"],
    ["places","locations", "folder", "baloosearch"], 
    ["calculator", "unitconverter"],
    ["bookmarks", "webshortcuts"]
]

var runnersModels = [];
var currentRunner = null;

function setHistoryModel(model) {
    runnersModels[0] = model;
}

function initRunnerModels(parent, query) {
    for (var i = 1; i < 5; i++) {
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
    updateQuery("");
    currentRunner = runnersModels[modelIndex];
    listView.model =  currentRunner;
}

function updateQuery(query){
    if (currentRunner)
        currentRunner.query = query;
}

function triggerAction(idx) {
    currentRunner.run(idx);
}

