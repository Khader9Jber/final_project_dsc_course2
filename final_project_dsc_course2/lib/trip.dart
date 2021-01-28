import 'passenger.dart';

class Trip {
  String _id;
  String _location;
  int _maxNumOfTravelers;
  int _numOfTravelers = 0;
  double _price;
  DateTime _date;
  Set<Passenger> _passengers = Set();

  Trip(this._id, this._location, this._maxNumOfTravelers, this._price,
      this._date);
  // Trip(this._id, this._location, this._maxNumOfTravelers, this._numOfTravelers,
  //     this._price, this._date);

  Trip.Full(this._id, this._location, this._maxNumOfTravelers,
      this._numOfTravelers, this._price, this._date, this._passengers);

  void set id(String id) {
    this._id = id;
  }

  String get id {
    return _id;
  }

  void set location(String location) {
    this._location = location;
  }

  String get location {
    return _location;
  }

  void set maxNumOfTravelers(int numOfTravelers) {
    this._maxNumOfTravelers = numOfTravelers;
  }

  int get maxNumOfTravelers {
    return _maxNumOfTravelers;
  }

  void set numOfTravelers(int numOfTravelers) {
    this._numOfTravelers = numOfTravelers;
  }

  int get numOfTravelers {
    return _numOfTravelers;
  }

  void set prince(double prince) {
    this._price = prince;
  }

  double get prince {
    return _price;
  }

  void set date(DateTime date) {
    this._date = date;
  }

  DateTime get date {
    return _date;
  }

  void set passengers(Set<Passenger> passengers) {
    this._passengers = passengers;
  }

  Set<Passenger> get passengers {
    return _passengers;
  }
}
