YUI().use('node', function(Y) {

    var showMaps = Y.one("#show-map");

    var showMap = function(e) {
        e.preventDefault();
        var map = Y.one('#order-map');
        if (map.getStyle('display') == 'none') {
            map.show();
            this.setHTML('Ukryj mapę');
        } else {
            map.hide();
            this.setHTML('Pokaż mapę');
        }
    };

    // checking for element existence
    if (showMaps) {
        Y.one('#show-map').on("click", showMap);
    };
});
