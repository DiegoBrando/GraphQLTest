String closestdeals='''{
  location(id:"{{id}}"){
    address
    phone
    details
    reviews{
      user{
        username
        profilepicture
      }
      stars
      comment
    }
   
  }
}''';

String closestlocations='''query { closestlocations(latitude:{{latitude}}, longitude:{{longitude}},x:5,offset:0,transform:2163){
locationname
  locationid
  geoid
  latitude
  longitude
  featuredimage{
    url
  }
  featureddeal{
    dealtitle
    description
    date
  }
  restofdeal{
    dealtitle
    description
    date
  }
  distance
  
}
}''';
