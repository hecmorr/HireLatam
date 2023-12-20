import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/presentation/widgets/widgets.dart';
import 'package:weather_app/services/services.dart';
import '../../weather_bloc_geo/bloc/weather_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final locationController = TextEditingController();
    final double height = MediaQuery.sizeOf(context).height;
    final double width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
        child: SizedBox(
          height: height,
          child: Stack(
            children: [
              shadowColor(
                coor1: 3,
                coor2: -0.3,
                height: 300,
                width: 300,
                boxDecoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.blue[900]),
              ),
              shadowColor(
                coor1: -3,
                coor2: -0.3,
                height: 300,
                width: 300,
                boxDecoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.blue[900]),
              ),
              shadowColor(
                coor1: 0,
                coor2: -1.2,
                height: 300,
                width: 300,
                boxDecoration: const BoxDecoration(
                    shape: BoxShape.rectangle, color: Colors.deepPurple),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 100.0,
                  sigmaY: 100.0,
                ),
                child: Container(
                  decoration: const BoxDecoration(color: Colors.transparent),
                ),
              ),
              BlocBuilder<WeatherBloc, WeatherBlocState>(
                builder: (context, state) {
                  if (state is WeatherSuccess) {
                    return SizedBox(
                      width: width,
                      height: height,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '📍 ${state.weather.areaName}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 25),
                          ),
                          const SizedBox(height: 8),
                          weatherIcon(state.weather.weatherConditionCode),
                          TextField(
                            style: const TextStyle(
                                color: Colors.white, fontSize: 25),
                            controller: locationController,
                            decoration: const InputDecoration(
                              hintText: 'Enter the name of the city',
                              hintStyle: TextStyle(color: Colors.grey),
                              focusColor: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            width: 200,
                            height: 50,
                            child: ElevatedButton(
                                onPressed: () {
                                  context.read<WeatherBloc>().add(
                                      WeatherCityNameFetched(
                                          cityName: locationController.text));
                                },
                                child: const Text('Get Weather')),
                          ),
                          const SizedBox(height: 20),
                          Center(
                            child: Text(
                              '${state.weather.temperature.round()}°C',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 55,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              state.weather.weatherMain,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Center(
                            child: Text(
                              getTime(state.weather.timezone),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          const SizedBox(height: 80),
                        ],
                      ),
                    );
                  } else if (state is WeatherLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is WeatherNotFound) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AlertDialog(
                          content: const Text(
                              'Pleae provide a valid name for the city'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/');
                                },
                                child: const Text('Close'))
                          ],
                        ),
                      ],
                    );
                  } else {
                    return const Text('Something went wrong');
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
