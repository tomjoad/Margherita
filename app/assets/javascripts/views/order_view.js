YUI().use('node', function(Y) {

    var address = Y.one('#address-field');
    var map = Y.one('#order-map');
    var showMaps = Y.one("#show-map");

    Y.on('load', function(e) {
        if (address) {
            address.hide();
        };
        if (map) {
            map.hide();
        };
    });

    var handleMap = function(e) {
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

    var handleAddress = function(e) {
        var value = this.get('selectedIndex');
        var address = Y.one('#address-field');
        if (value == 0) {
            address.hide();
        } else {
            address.show();
        };
    };

    if (Y.one('#new_order')) {
        Y.one('#show-map').on("click", handleMap);
        Y.one('#order_distance').on('change', handleAddress);
    };
});
