import org.giddap.prototype.factoria.Listing
import org.giddap.prototype.factoria.security.SecRole
import org.giddap.prototype.factoria.security.SecUser
import org.giddap.prototype.factoria.security.SecUserSecRole

class BootStrap {

    def init = { servletContext ->

        //Configure Security Roles
        def userRole = SecRole.findByAuthority('ROLE_USER') ?: new SecRole(authority: 'ROLE_USER').save(failOnError: true)
        def adminRole = SecRole.findByAuthority('ROLE_ADMIN') ?: new SecRole(authority: 'ROLE_ADMIN').save(failOnError: true)

        //add an admin and default user
        def adminUser = SecUser.findByUsername('admin') ?: new SecUser(
                username: 'admin',
                password: 'admin',
                enabled: true).save(failOnError: true)

        def basicUser = SecUser.findByUsername('guest') ?: new SecUser(
                username: 'guest',
                password: 'guest',                          //pw encoded by security plugin
                enabled: true).save(failOnError: true)

        if (!adminUser.authorities.contains(adminRole)) {
            SecUserSecRole.create adminUser, adminRole
        }
        if (!basicUser.authorities.contains(userRole)) {
            SecUserSecRole.create basicUser, userRole
        }


        //Add mock data if none exists
        if (!Listing.count()) {

            def listing01 =
                    new Listing(state: "NY", city: "Windsor", streetAddress: "117 W 2nd St", zipCode: "13865")
            listing01.save(failOnError: true)

            def listing02 =
                new Listing(state: "TX", city: "Alberta", streetAddress: "117 W 2nd St", zipCode: "55555")
            listing02.save(failOnError: true)

            def listing03 =
                new Listing(state: "PA", city: "Scranton", streetAddress: "71 Kind Ave Apt 3", zipCode: "44567")
            listing03.save(failOnError: true)

            def listing04 =
                new Listing(state: "ME", city: "Ladly", streetAddress: "117 W 2nd St", zipCode: "55533")
            listing04.save(failOnError: true)

            def listing05 =
                new Listing(state: "KY", city: "Korba", streetAddress: "3 Apple St", zipCode: "40351")
            listing05.save(failOnError: true)
        }
    }
    def destroy = {
    }
}
