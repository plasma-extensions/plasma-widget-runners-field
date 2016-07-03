var historyArray = []
var historyModel;

function init(model) {
    print("Current history: " + plasmoid.configuration.history)
    print("Current history length: " + plasmoid.configuration.historyLength)
    historyModel = model;
}

function loadHistory() {
    print('Reading history from configuration')
    var historyArray = JSON.parse(plasmoid.configuration.history);    
}

function saveHistory() {
    print('Writing history to configuration')
    plasmoid.configuration.history = JSON.stringify(historyArray)
    print(plasmoid.configuration.history)
}


function getHistory(idx) {
    return historyArray[idx]
}

function register(query, tab, idx) {
    print("registering " + query)
    var newObject = { query: query, tab: tab, idx: idx }
    var oldIdx = -1;
    for (var i = 0; i < historyArray.length && oldIdx == -1; i ++) {
        if (historyArray[i].query == newObject.query &&
            historyArray[i].tab == newObject.tab &&
            historyArray[i].idx == newObject.idx)
            oldIdx = i;
    }
    
    if (oldIdx != -1) 
        historyArray.splice(oldIdx, 1);
    
    historyArray.push(newObject)
    if (historyArray.length > plasmoid.configuration.historyLength)
        historyArray.splice(0, 1);

      saveHistory();
}

function query(query) {
    // Clear current results
    historyModel.clear();
        
    for (var it in historyArray) {
        // if (query matches historyArray[i].query)
        var newObject = {
                label: historyArray[it].query,
                section: i18n("Recent"), 
                icon: "run"
        }
        historyModel.append(newObject);
    }
}