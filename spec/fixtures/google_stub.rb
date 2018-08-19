ZERO_RESULTS_RESPONSE =
  '{
   "results" : [],
   "status" : "ZERO_RESULTS"
   }'.freeze

VALID_RESPONSE =
  '{
     "results" : [
        {
           "address_components" : [
              {
                 "long_name" : "43-45",
                 "short_name" : "43-45",
                 "types" : [ "street_number" ]
              },
              {
                 "long_name" : "Friedrichstraße",
                 "short_name" : "Friedrichstraße",
                 "types" : [ "route" ]
              },
              {
                 "long_name" : "Bezirk Friedrichshain-Kreuzberg",
                 "short_name" : "Bezirk Friedrichshain-Kreuzberg",
                 "types" : [ "political", "sublocality", "sublocality_level_1" ]
              },
              {
                 "long_name" : "Berlin",
                 "short_name" : "Berlin",
                 "types" : [ "locality", "political" ]
              },
              {
                 "long_name" : "Berlin",
                 "short_name" : "Berlin",
                 "types" : [ "administrative_area_level_1", "political" ]
              },
              {
                 "long_name" : "Germany",
                 "short_name" : "DE",
                 "types" : [ "country", "political" ]
              },
              {
                 "long_name" : "10117",
                 "short_name" : "10117",
                 "types" : [ "postal_code" ]
              }
           ],
           "formatted_address" : "Friedrichstraße 43-45, 10117 Berlin, Germany",
           "geometry" : {
              "location" : {
                 "lat" : 52.5074434,
                 "lng" : 13.3903913
              },
              "location_type" : "ROOFTOP",
              "viewport" : {
                 "northeast" : {
                    "lat" : 52.50893713029151,
                    "lng" : 13.3917244802915
                 },
                 "southwest" : {
                    "lat" : 52.50623916970851,
                    "lng" : 13.3890265197085
                 }
              }
           },
           "partial_match" : true,
           "place_id" : "ChIJzdgmXNFRqEcRyIl9R0IApSM",
           "plus_code" : {
              "compound_code" : "G94R+X5 Berlin, Germany",
              "global_code" : "9F4MG94R+X5"
           },
           "types" : [ "establishment", "point_of_interest" ]
        }
     ],
     "status" : "OK"
  }'.freeze
