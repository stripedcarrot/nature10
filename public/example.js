function initialize() {
        // Create an array of styles.
        var styles = [
            {
                stylers: [
                    { hue: "#00ffe6" },
                    { saturation: -20 }
                ]
            },{
                featureType: "road",
                elementType: "geometry",
                stylers: [
                    { lightness: 100 },
                    { visibility: "simplified" }
                ]
            },{
                featureType: "road",
                elementType: "labels",
                stylers: [
                    { visibility: "off" }
                ]
            }
        ];

        // Create a new StyledMapType object, passing it the array of styles,
        // as well as the name to be displayed on the map type control.
        var styledMap = new google.maps.StyledMapType(styles,
                {name: "Cyan Map"});

        // Create a map object, and include the MapTypeId to add
        // to the map type control.
        var mapOptions = {
            zoom: 11,
            center: new google.maps.LatLng(55.6468, 37.581),
            mapTypeControlOptions: {
                mapTypeIds: [google.maps.MapTypeId.ROADMAP, google.maps.MapTypeId.HYBRID, 'map_style']
            }
        };
        var map = new google.maps.Map(document.getElementById('map-canvas'),
                mapOptions);

        //Associate the styled map with the MapTypeId and set it to display.
        map.mapTypes.set('map_style', styledMap);
        map.setMapTypeId('map_style');

    var positions = new Array(
        {title: "a", coordinates: new google.maps.LatLng(55.6468, 37.581), colors: "red"},
        {title: "w", coordinates: new google.maps.LatLng(55.6468, 37.591)},
        {title: "b", coordinates: new google.maps.LatLng(55.658, 37.581)}
    );

    for(var i in positions){
        var marker = new google.maps.Marker({
            position: positions[i].coordinates,
            map: map,
            title: positions[i].title
        });
    }











    }
    google.maps.event.addDomListener(window, 'load', initialize);