YUI().use('node', function(Y) {
//    Y.delegate('click', function(e) {
//        var buttonID = e.currentTarget.get('id');
//        node = Y.one('#order-map');
//  });
    var button = Y.one('#show-map');

    var showMap = function(e) {
        e.preventDefault();
        var map = Y.one('#order-map');
        console.log(map.style)
        if (map.getStyle('display') == 'none') {
            map.show();
            this.setHTML('Ukryj mapę');
        } else {
            map.hide();
            this.setHTML('Pokaż mapę');
        }

    };

    // var debug = function(e) {
    //     var map = Y.one('#order-map');
    //     console.log(map.getStyle('display'));
    // };

    var hideMap = function(e) {
        Y.one('#order-map').hide();
    };

    Y.one('#show-map').on("click", showMap);
    Y.on("load", hideMap);
});
