import 'trip.dart';

class Passenger {
  String _id;
  String _name;
  double _budget;
  Set<Trip> _trips = Set();

  Passenger(this._id, this._name, this._budget);

  Passenger.Full(this._id, this._name, this._budget, this._trips);

  void set id(String id) {
    this._id = id;
  }

  String get id {
    return _id;
  }

  void set name(String name) {
    this._name = name;
  }

  String get name {
    return _name;
  }

  void set budget(double budget) {
    this._budget = budget;
  }

  double get budget {
    return _budget;
  }

  void set trips(Set<Trip> trips) {
    this._trips = trips;
  }

  Set<Trip> get trips {
    return _trips;
  }
}
