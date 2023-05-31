import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:life_peak_lib/life_peak_lib.dart';

import 'blocs/device/device_bloc.dart';
import 'screens/find_device_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FlutterBluePlus flutterBlue = FlutterBluePlus.instance;


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DeviceBloc(),
        ),
      ],
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'LifePeak BLE ',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          IconButton(
            onPressed: () async {
              //  Navigate to a new screen...
              final device = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const FindDeviceScreen();
                }),
              );
               // When the Bluetooth LE browser returns the PineTime Bluetooth Device...
              if (device != null) {
                BlocProvider.of<DeviceBloc>(context).add(DeviceRequested(device: device));
              }
            },
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: BlocBuilder<DeviceBloc, DeviceState>(
        builder: (context, state) {
          if (state is DeviceLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is DeviceLoaded) {
            final device = state.device;
            return Center(
              child: Text(device.name),
            );
          }
          return  Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: Center(
              child: Text(
                'Still waiting while you will go to search some BLE device)',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          );
        },
      ),
    );
  }
}
