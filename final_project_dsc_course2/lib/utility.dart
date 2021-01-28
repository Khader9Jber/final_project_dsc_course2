import 'dart:io';
import './trip.dart';
import './passenger.dart';

List<Passenger> allPassengers = List<Passenger>();
List<Trip> allTrips = List<Trip>();

void readFileByLinesPass() {
  File file = File('./passengers_data.txt');
  List<String> lines = file.readAsLinesSync();
  for (int i = 0; i < lines.length; i += 3) {
    String id = lines[i]; //0
    String name = lines[i + 1]; //1
    double budget = double.parse(lines[i + 2]); //2
    addPass(id: id, name: name, budget: budget);
    //Passenger p = Passenger(id, name, budget);
    //allPassengers.add(p);
  }
}

void readFileByLinesTrip() {
  File file = File(
      './trips_data.txt'); //C:\\Users\\VS Code\\Final_Project\\trips_data.txt'
  List<String> lines = file.readAsLinesSync();
  for (int i = 0; i < lines.length; i += 5) {
    String id = lines[i];
    String location = lines[i + 1];
    DateTime date = DateTime.parse(lines[i + 2]);
    double price = double.parse(lines[i + 3]);
    int maxNumOfTravelers = int.parse(lines[i + 4]);
    addTrip(
        id: id,
        location: location,
        passLimit: maxNumOfTravelers,
        price: price,
        date: date);
    // Trip t = Trip(id, location, maxNumOfTravelers, price, date);
    // allTrips.add(t);
  }
}

void addTrip({id, location, passLimit, price, date}) {
  Trip t = Trip(id, location, passLimit, price, date);
  allTrips.add(t);
  print("The Trip to ${location} added successfully ^_^");
}

void addPass({id, name, budget}) {
  Passenger p = Passenger(id, name, budget);
  allPassengers.add(p);
  print("The Passenger ${name} added successfully ^_^");
}

void editTrip({id, newId, newLocation, newPassLimit, newPrice, newDate}) {
  int neededIndex = allTrips.indexWhere((trip) => trip.id == id);
  if (neededIndex != null) {
    allTrips[neededIndex].id = newId;
    allTrips[neededIndex].location = newLocation;
    allTrips[neededIndex].maxNumOfTravelers = newPassLimit;
    allTrips[neededIndex].prince = newPrice;
    allTrips[neededIndex].date = newDate;
    print("The Trip that has ID ${id} updated successfully ^_^");
  } else {
    print("There is no Trip has this ID!");
  }
}

void editPass({id, newId, name, budget}) {
  int neededIndex = allPassengers.indexWhere((pass) => pass.id == id);
  if (neededIndex != null) {
    allPassengers[neededIndex].id = newId;
    allPassengers[neededIndex].name = name;
    allPassengers[neededIndex].budget = budget;
    print("The Trip that has ID ${id} updated successfully ^_^");
  } else {
    print("There is no Passenger has this ID!");
  }
}

void deleteTrip(String id) {
  int neededIndex = allTrips.indexWhere((trip) => trip.id == id);
  if (neededIndex != null) {
    allTrips.removeAt(neededIndex);
    print("The Trip that has ID ${id} deleted successfully ^_^");
  } else {
    print("There is no Trip has this ID!");
  }
}

void deletePassenger(String id) {
  int neededIndex = allPassengers.indexWhere((pass) => pass.id == id);
  if (neededIndex != null) {
    allPassengers.removeAt(neededIndex);
    print("The Passenger that has ID ${id} deleted successfully ^_^");
  } else {
    print("There is no Passenger has this ID!");
  }
}

void showTrip(Trip trip) {
  print(
      "Trip Info: ID ${trip.id}, Location ${trip.location}, Free Chairs ${trip.maxNumOfTravelers - trip.numOfTravelers}, Price ${trip.prince}, Date ${trip.date.toString()}");
}

void viewTrips() {
  if (allTrips.length > 0) {
    print("****** ALL TRIPS INFO ******");
    allTrips.forEach((trip) {
      showTrip(trip);
    });
  } else {
    print("There is no Added Trips Yet");
  }
}

void showPass(Passenger pass) {
  print("Pass Info: ID ${pass.id}, Name ${pass.name}, Budget ${pass.budget},");
}

void viewPassengers() {
  if (allPassengers.isEmpty) {
    print("There is no Added Passengers Yet");
  } else {
    print("****** ALL PASSENGERS INFO ******");
    allPassengers.forEach((pass) {
      showPass(pass);
    });
  }
}

void viewTripsFOR({passId}) {
  Passenger neededPass = allPassengers.firstWhere((pass) => pass.id == passId);
  if (neededPass != null) {
    neededPass.trips.forEach((trip) {
      showTrip(trip);
    });
  } else {
    print("There is no Passenger has this ID!");
  }
}

void viewPassengersIn({tripId}) {
  Trip neededTrip = allTrips.firstWhere((trip) => trip.id == tripId);
  if (neededTrip != null) {
    neededTrip.passengers.forEach((pass) {
      showPass(pass);
    });
  } else {
    print("There is no Trip has this ID!");
  }
}

void viewLastestTrips() {
  print("This Set Of Trips Sorted By Date:");
  allTrips.sort((t1, t2) => t1.date.compareTo(t2.date));
  allTrips.forEach((trip) {
    showTrip(trip);
  });
}

void searchTrip(double price) {
  Trip trip = allTrips.firstWhere((trip) => trip.prince == price);
  if (trip != null) {
    print("Details of Trip You Need It..");
    showTrip(trip);
  } else {
    print("There is no Trip has this Price!");
  }
}

void applyDiscount() {
  allTrips.forEach((trip) {
    if (trip.prince > 10000) trip.prince = trip.prince - (trip.prince * 0.2);
  });
  print("Done.");
}

void reserveTrip(passId, tripId) {
  Trip neededTrip = allTrips.firstWhere((trip) => trip.id == tripId);
  Passenger neededPass = allPassengers.firstWhere((pass) => pass.id == passId);
  if (neededPass != null) {
    if (neededPass != null) {
      if (neededPass.budget >= neededTrip.prince) {
        if (neededTrip.numOfTravelers < neededTrip.maxNumOfTravelers) {
          neededPass.trips.add(neededTrip);
          neededTrip.passengers.add(neededPass);
          neededTrip.numOfTravelers++;
          neededPass.budget -= neededTrip.prince;
          print(
              "The Trip wich has ID ${tripId} Reserved successfully To the Traveler who has ID ${passId} ^_^");
        } else {
          print("There is no Free Chairs in this Trip");
        }
      } else {
        print("You dont have enough Money");
      }
    } else {
      print("There is no Trip has this ID!");
      return;
    }
  } else {
    print("There is no Passenger has this ID!");
    return;
  }
}
