import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import '../Model/Helper/helper.dart';
import '../Model/model.dart';

// class WeatherProvider extends ChangeNotifier {
//   SearchLocation searchLocation = SearchLocation(
//     Location: "London",
//     locationController: TextEditingController(),
//   );
//
//   searchWeather(String location) {
//     searchLocation.Location = location;
//     notifyListeners();
//   }
//
//   Future<Product?>? myData(String location) async {
//     searchLocation.product =
//         (await APIHelper.apiHelper.fetchWeatherDetails(location)) as Product?;
//     return searchLocation.product;
//   }
// }

class ConnectionProvider extends ChangeNotifier {
  Connectivity connectivity = Connectivity();

  ConnectionModel connectivityModel =
      ConnectionModel(connectivityStatus: "waiting");

  void checkInternetConnectivity() {
    connectivityModel.connectivityStream = connectivity.onConnectivityChanged
        .listen((ConnectivityResult connectivityResult) {
      if (connectivityResult == ConnectivityResult.wifi) {
        connectivityModel.connectivityStatus = "WiFi";
        notifyListeners();
      } else if (connectivityResult == ConnectivityResult.mobile) {
        connectivityModel.connectivityStatus = "MobileData";
        notifyListeners();
      } else {
        connectivityModel.connectivityStatus = "waiting";
        notifyListeners();
      }
    });
  }
}

class ThemeProvider extends ChangeNotifier {
  bool isdark = true;
  void Themechanger() {
    isdark = !isdark;
    notifyListeners();
  }
}

class PlatformProvider extends ChangeNotifier {
  bool isIos = false;
  void changePlatform(bool n) {
    isIos = n;
    notifyListeners();
  }
}

class ItemIncrement extends ChangeNotifier {
  int number = 1;
  void increment() {
    number++;
    notifyListeners();
  }

  void decrement() {
    if (number > 1) {
      number--;
    }
    notifyListeners();
  }
}
