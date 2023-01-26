import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:try_one/cubits/weather_cubit/weather_cubit.dart';
import 'package:try_one/models/Weather_Model.dart';
import 'package:try_one/providers/weather_provider.dart';
import 'package:try_one/services/weather_service.dart';

class SearchPage extends StatelessWidget {
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a city'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onSubmitted: (data) async {
              cityName = data;

              BlocProvider.of<WeatherCubit>(context)
                  .getWeather(cityName: cityName!);
              BlocProvider.of<WeatherCubit>(context).cityName = cityName;
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 40, horizontal: 16),
              label: Text('search'),
              suffixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
              hintText: 'Enter a City',
            ),
          ),
        ),
      ),
    );
  }
}



// WeatherService service = WeatherService();

//               WeatherModel? weather =
//                   await service.getWeather(cityName: cityName!);
//               Provider.of<WeatherProvider>(context, listen: false).weatherData =
//                   weather;
//               Provider.of<WeatherProvider>(context, listen: false).cityName =
//                   cityName;
//               Navigator.pop(context);
