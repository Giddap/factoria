package org.giddap.prototype.factoria

class Listing {
    String streetAddress;
    String city;
    String state;
    String zipCode;
    static constraints = {
        streetAddress(blank: false)
        city(blank: false)
        state(blank: false, size: 2..2)
        zipCode(blank: false, size: 5..5, validator: { val, obj -> val?.isNumber() })
    }
}
