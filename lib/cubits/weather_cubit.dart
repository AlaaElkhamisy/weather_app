import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/weather_cubit/weather_state.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherService) : super(Weather_Initial());
  WeatherService weatherService;
  WeatherModel? weatherModel;
  void getWeather({required String cityName}) async {
    emit(Weather_Loading());
    try {
      weatherModel = await weatherService.getWeather(cityName: cityName);
      emit(Weather_Success());
    } on Exception catch (e) {
      emit(Weather_Error());
    }
  }
}