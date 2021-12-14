import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_explore/future_provider/fake_weather_client.dart';

final fakeWeatherClientProvider = Provider((ref) => FakeWeatherClient());

final fakeWeatherResponseProvider = FutureProvider.family<int, String>((ref, cityName) async {
  final weatherClient = ref.read(fakeWeatherClientProvider);
  return weatherClient.get(cityName);
});

final fakeWeatherResponseAutoDisposeProvider = FutureProvider.autoDispose.family<int, String>((ref, cityName) async {
  final weatherClient = ref.read(fakeWeatherClientProvider);
  return weatherClient.get(cityName);
});