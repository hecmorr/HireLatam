import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/feature/weather_by_geolocation/bloc/weather_bloc.dart';
import 'package:weather_app/feature/weather_by_geolocation/presentation/widgets/weather_icon.dart';

class HomeView extends StatefulWidget {
  // final _locationController = TextEditingController();
  // final _weatherBloc = WeatherBloc(weatherRepository: WeatherRepository());
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

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
                          weatherIcon(state.weather.weatherConditionCode!),
                          const TextField(
                            decoration: InputDecoration(
                                hintText: 'Enter the name of the city',
                                hintStyle: TextStyle(color: Colors.grey)),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            width: 200,
                            height: 50,
                            child: ElevatedButton(
                                onPressed: () {},
                                child: const Text('Get Weather')),
                          ),
                          const SizedBox(height: 20),
                          Center(
                            child: Text(
                              '${state.weather.temperature!.celsius?.round()}°C',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 55,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              state.weather.weatherMain!,
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
                              DateFormat('EEEE dd -')
                                  .add_jm()
                                  .format(state.weather.date!),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          const SizedBox(height: 80),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     Row(
                          //       children: [
                          //         Image.asset(
                          //           'assets/11.png',
                          //           scale: 8,
                          //         ),
                          //         const SizedBox(height: 5),
                          //         Column(
                          //           crossAxisAlignment:
                          //               CrossAxisAlignment.start,
                          //           children: [
                          //             Text(
                          //               'Sunrise',
                          //               style: TextStyle(
                          //                 color: Colors.white,
                          //                 fontSize: 17,
                          //               ),
                          //             ),
                          //             const SizedBox(height: 3),
                          //             Text(
                          //               'local time',
                          //               style: TextStyle(
                          //                 color: Colors.white,
                          //                 fontWeight: FontWeight.bold,
                          //                 fontSize: 17,
                          //               ),
                          //             ),
                          //           ],
                          //         )
                          //       ],
                          //     ),
                          //   ],
                          // )
                        ],
                      ),
                    );
                  } else if (state is WeatherLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
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

class WeatherState {}

Widget shadowColor({
  required double coor1,
  required double coor2,
  required double height,
  required double width,
  required BoxDecoration boxDecoration,
}) {
  return Align(
      alignment: AlignmentDirectional(coor1, coor2),
      child:
          Container(height: height, width: width, decoration: boxDecoration));
}
