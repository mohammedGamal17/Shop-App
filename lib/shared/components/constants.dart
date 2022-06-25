import '../../main.dart';

const baseUrl = 'https://student.valuxapps.com/api/';

Map<String, dynamic> headers = {
  'Content-Type': 'application/json',
};

//token is in login.dart
String? token = sharedPreferences.getString('token');

//onBoarding is in PageViewScreen.dart
bool? onBoarding = sharedPreferences.getBool('onBoarding');

//fakeId is in FirstScreen.dart
int? fakeId = sharedPreferences.getInt('fakeId');
