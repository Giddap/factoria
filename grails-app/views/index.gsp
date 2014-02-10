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

    <style type="text/css">
    html { height: 100% }
    body { height: 100%; margin: 0; padding: 0 }
    #map-canvas { height: 100% }
    </style>

    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCYKffzXaGNP_FroszjIBrkhWjl_s8vgYA&sensor=true" type="text/javascript"></script>

    <script type="text/javascript">
        function initialize() {
            var mapOptions = {
                center: new google.maps.LatLng(47.576087, -122.165110),
                zoom: 8
            };
            var map = new google.maps.Map(document.getElementById("map-canvas"),
                    mapOptions);
        }
        google.maps.event.addDomListener(window, 'load', initialize);
    </script>

</head>

<body>

<div id="map-canvas"/>

</body>
</html>