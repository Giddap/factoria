package org.giddap.prototype.factoria

class ListingController {

    def scaffold = Listing

    def index = {
        def listings = Listing.list([sort:"zipCode", order:"asc"])

        return [listings: listings]
    }
}
