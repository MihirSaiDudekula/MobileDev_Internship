// 3.	Create a class to represent city which contains a list of places to see.
// • Provide methods to create the object with just the city name or with city name and places (stored as list)
// • Provide methods to add a place of visit, to remove place of visit, to display all places of visit

class City {
  String cityName;
  List<String> placesToSee = [];

  City(this.cityName, [List<String> places]) {
    if (places != null) {
      placesToSee.addAll(places);
    }
  }

  void addPlace(String place) {
    placesToSee.add(place);
  }

  void removePlace(String place) {
    placesToSee.remove(place);
  }

  void displayPlaces() {
    print('Places to see in $cityName:');
    placesToSee.forEach((place) {
      print('- $place');
    });
  }
}

void main() {
  City paris = City('Paris', ['Eiffel Tower', 'Louvre Museum', 'Notre-Dame Cathedral']);
  paris.addPlace('Seine River Cruise');
  paris.removePlace('Louvre Museum');
  paris.displayPlaces();
}
