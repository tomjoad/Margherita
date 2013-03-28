YUI().use('node', function(Y) {
//    Y.delegate('click', function(e) {
//        var buttonID = e.currentTarget.get('id');
//        node = Y.one('#order-map');
//  });
    var button = Y.one('#show-map');

    var showMap = function(e) {
        e.preventDefault();
        Y.one('#order-map').show();
    };

    var hideMap = function(e) {
        Y.one('#order-map').hide();
    };

    Y.one('#show-map').on("click", showMap);
    Y.on("load", hideMap);
});
