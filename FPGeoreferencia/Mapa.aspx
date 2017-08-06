<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Mapa.aspx.cs" Inherits="FPGeoreferencia.Mapa" %>

<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <title>Simple Polylines</title>
    <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 100%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
    </style>
  </head>
  <body>
    
    <div id="map"></div>
     <script>

        function initMap() {

            //var uluru = { lat: -25.363, lng: 131.044 };
            //var map = new google.maps.Map(document.getElementById('map'), {
            //    zoom: 4,
            //    center: uluru
            //});
            var contentString = '<div id="content">' +
                '<div id="siteNotice">' +
                '</div>' +
                '<h1 id="firstHeading" class="firstHeading">Uluru</h1>' +
                '<div id="bodyContent">' +
                '<p><b>Uluru</b>, also referred to as <b>Ayers Rock</b>, is a large ' +
                'sandstone rock formation in the southern part of the ' +
                'Northern Territory, central Australia. It lies 335&#160;km (208&#160;mi) ' +
                'south west of the nearest large town, Alice Springs; 450&#160;km ' +
                '(280&#160;mi) by road. Kata Tjuta and Uluru are the two major ' +
                'features of the Uluru - Kata Tjuta National Park. Uluru is ' +
                'sacred to the Pitjantjatjara and Yankunytjatjara, the ' +
                'Aboriginal people of the area. It has many springs, waterholes, ' +
                'rock caves and ancient paintings. Uluru is listed as a World ' +
                'Heritage Site.</p>' +
                '<p>Attribution: Uluru, <a href="https://en.wikipedia.org/w/index.php?title=Uluru&oldid=297882194">' +
                'https://en.wikipedia.org/w/index.php?title=Uluru</a> ' +
                '(last visited June 22, 2009).</p>' +
                '</div>' +
                '</div>';

            //var latLng = new google.maps.LatLng(-43.01684722222222, -73.35018888888888);
            var latLng = new google.maps.LatLng(-41.62469676922591, -73.07761511720167);
          
            var infowindow = new google.maps.InfoWindow({
                content: contentString,
                maxWidth: 200,
                position: latLng
            });

            var map = new google.maps.Map(document.getElementById('map'), {
                zoom: 12,
                center: latLng,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            });

            //var flightPlanCoordinates = [
            //    { lat: -43.01684722222222, lng: -73.35018888888888 },
            //    { lat: -43.018122222222225, lng: -73.3431611111111 },
            //    { lat: -43.020941666666666, lng: -73.34418055555555 },
            //    { lat: -43.019666666666666, lng: -73.35120833333333 },
            //    { lat: -43.01684722222222, lng: -73.35018888888888 }
            //];

            var flightPlanCoordinates = [
              { lat: -41.623823557868384, lng: -73.07764106327146 },
              { lat: -41.62389127372958, lng: -73.07146925888553 },
              { lat: -41.62459344114229, lng: -73.07144832811727 },
              { lat: -41.62469676922591, lng: -73.07761511720167 },
              { lat: -41.623823557868384, lng: -73.07764106327146 }
            ];

            //var flightPath = new google.maps.Polyline({
            //    path: flightPlanCoordinates,
            //    geodesic: true,
            //    strokeColor: '#FF0000',
            //    strokeOpacity: 1.0,
            //    strokeWeight: 2
            //});

            var bermudaTriangle = new google.maps.Polygon({
                paths: flightPlanCoordinates,
                strokeColor: '#FF0000',
                strokeOpacity: 0.8,
                strokeWeight: 2,
                fillColor: '#FF0000',
                fillOpacity: 0.35
            });

            //bermudaTriangle.addListener('click', function () {
            //    infowindow.open(map, bermudaTriangle);
            
            //});

            //var marker = new google.maps.Marker({
            //    position: latLng,
            //    map: map,
            //    title: 'Hello World!'
            //});

            bermudaTriangle.setMap(map);
        }
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAOD-mkWwXKxVxiZr4wPFyYDnEijtcwN4w&callback=initMap">
    </script>
 
  </body>
</html>
