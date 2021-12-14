class FakeWeatherClient {
  Future<int> get(String cityName) async {
    await Future.delayed(Duration(seconds: 3));
    return cityName == 'Dhaka' ? 18 : 21;
  }
}