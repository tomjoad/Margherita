YUI().use('node', function(Y) {

    var showMaps = Y.one("#show-map");

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

    // if only one option then address field always hidden
    var handleAddress = function(e) {
        var value = this.get('selectedIndex');
        var address = Y.one('#address-field');
        if (value == 0) {
            address.hide();
        } else {
            address.show();
        };
    };

    // checking for element existence
    if (Y.one('#new_order')) {
        Y.one('#show-map').on("click", handleMap);
        Y.one('#order_distance').on('change', handleAddress);
    };

});
