import 'dart:io';
import './trip.dart';

import './utility.dart';

void main() {
  readFileByLinesPass();
  print("\n+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+\n");
  readFileByLinesTrip();
  print("\n+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+\n");
  viewTrips();
  print("\n+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+\n");
  viewPassengers();
  print("\n+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+\n");
  while (true) {
    print("------------------------");
    print("01- Add Trip.");
    print("02- Add Passenger.");
    print("03- Edit Trip.");
    print("04- Edit Passenger.");
    print("05- Delete Trip.");
    print("06- Delete Passenger.");
    print("07- View Trips.");
    print("08- View Passengers.");
    print("09- View Trips for specific Passenger.");
    print("10- View Passengers in specific Trip.");
    print("11- View Latest Trips.");
    print("12- Search In Trips By Price.");
    print("13- Apply Discount.");
    print("14- Reserve.");
    print("15- Exit.");
    print("------------------------");
    print(">> Enter Your Choice:");

    int ch = int.parse(stdin.readLineSync());
    switch (ch) {
      case 1:
        {
          print("Enter Trip Info To Adding:");
          print("ID:");
          String id = stdin.readLineSync();
          print("Location:");
          String loc = stdin.readLineSync();
          print("Date:");
          DateTime date = DateTime.parse(stdin.readLineSync());
          print("Price:");
          double price = double.parse(stdin.readLineSync());
          print("Passengers Limit:");
          int passLimit = int.parse(stdin.readLineSync());
          addTrip(
              id: id,
              location: loc,
              date: date,
              price: price,
              passLimit: passLimit);
        }
        break;

      case 2:
        {
          print("Enter Passenger Info To Adding:");
          print("ID:");
          String id = stdin.readLineSync();
          print("Name:");
          String name = stdin.readLineSync();
          print("Budget:");
          double budget = double.parse(stdin.readLineSync());
          addPass(id: id, name: name, budget: budget);
        }
        break;
      case 3:
        {
          print("Enter Trip Info To Editting:");
          print("ID:");
          String id = stdin.readLineSync();
          print("New ID:");
          String newId = stdin.readLineSync();
          print("Location:");
          String loc = stdin.readLineSync();
          print("Date:");
          DateTime date = DateTime.parse(stdin.readLineSync());
          print("Price:");
          double price = double.parse(stdin.readLineSync());
          print("Passengers Limit:");
          int passLimit = int.parse(stdin.readLineSync());
          editTrip(
              id: id,
              newId: newId,
              newLocation: loc,
              newDate: date,
              newPrice: price,
              newPassLimit: passLimit);
        }
        break;
      case 4:
        {
          print("Enter Passenger Info To Editting:");
          print("ID:");
          String id = stdin.readLineSync();
          print("New ID:");
          String newId = stdin.readLineSync();
          print("Name:");
          String name = stdin.readLineSync();
          print("Budget:");
          double budget = double.parse(stdin.readLineSync());
          editPass(id: id, newId: newId, name: name, budget: budget);
        }
        break;
      case 5:
        {
          print("Enter Trip ID to deleting:");
          String id = stdin.readLineSync();
          deleteTrip(id);
        }
        break;
      case 6:
        {
          print("Enter Passenger ID to deleting:");
          String id = stdin.readLineSync();
          deletePassenger(id);
        }
        break;
      case 7:
        {
          viewTrips();
        }
        break;
      case 8:
        {
          viewPassengers();
        }
        break;
      case 9:
        {
          print("Enter Passenger ID:");
          String passId = stdin.readLineSync();
          viewTripsFOR(passId: passId);
        }
        break;
      case 10:
        {
          print("Enter Trip ID:");
          String tripId = stdin.readLineSync();
          viewPassengersIn(tripId: tripId);
        }
        break;
      case 11:
        {
          viewLastestTrips();
        }
        break;
      case 12:
        {
          print("Enter Price:");
          double price = double.parse(stdin.readLineSync());
          searchTrip(price);
        }
        break;
      case 13:
        {
          applyDiscount();
        }
        break;
      case 14:
        {
          print("Enter Passenger ID");
          String passId = stdin.readLineSync();
          print("Enter Trip ID");
          String tripId = stdin.readLineSync();
          reserveTrip(passId, tripId);
        }
        break;
      case 15:
        {
          exit(0);
        }
        break;
      default:
        {
          print("Invalid Choice!!");
        }
        break;
    }
  }
}
