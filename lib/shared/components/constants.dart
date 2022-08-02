import '../../main.dart';

const BASEURL = 'https://student.valuxapps.com/api/';

Map<String, dynamic> HEADERS = {
  'Content-Type': 'application/json',
};

//token is in login.dart
String? TOKEN = sharedPreferences.getString('token');

//onBoarding is in PageViewScreen.dart
bool? BOARDING = sharedPreferences.getBool('onBoarding');

//fakeId is in FirstScreen.dart
int? FAKEID = sharedPreferences.getInt('fakeId');
