<%--
  Created by IntelliJ IDEA.
  User: peng
  Date: 2/8/14
  Time: 7:51 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Factoria - Listing</title>
</head>

<body>
<section>
    <div class="container">
        <div class="row">
            <header class="page-header">
                <h3>Listing <small class="lead">Listing List</small></h3>
            </header>

            <div class="span3">
                <g:link class="btn btn-block btn-link" action="create">
                    Create New Listing
                </g:link>
                <div class="well">

                    <table class="table table-bordered table-striped">
                        <caption>
                            Listing
                        </caption>
                        <thead>
                        <tr>
                            <th>State</th>
                            <th>City</th>
                            <th>Street</th>
                            <th>Zip Code</th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${listings}" var="listing" status="i">
                            <tr>
                                <td>${listing.state}</td>
                                <td>${listing.city}</td>
                                <td>${listing.streetAddress}</td>
                                <td>${listing.zipCode}</td>
                            </tr>
                        </g:each>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>
<g:javascript>
    $('ul.nav > li > a').click(function (e) {
        if ($(this).attr('id') == "view-all") {
            $('div[id*="Listing-"]').fadeIn('fast');
        } else {
            var aRef = $(this);
            var tablesToHide = $('div[id*="Listing-"]:visible').length > 1
                    ? $('div[id*="Listing-"]:visible') : $($('.nav > li[class="active"] > a').attr('href'));

            tablesToHide.hide();
            $(aRef.attr('href')).fadeIn('fast');
        }
        $('.nav > li[class="active"]').removeClass('active');
        $(this).parent().addClass('active');
    });
</g:javascript>
</body>
</html>