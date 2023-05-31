import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class FindDeviceScreen extends StatelessWidget {
  const FindDeviceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Find Device',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () => FlutterBluePlus.instance
            .startScan(timeout: const Duration(seconds: 4)),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              StreamBuilder<List<BluetoothDevice>>(
                stream: Stream.periodic(const Duration(seconds: 2))
                    .asyncMap((_) => FlutterBluePlus.instance.connectedDevices),
                initialData: const [],
                builder: (c, snapshot) {
                  return Column(
                    children: snapshot.data!
                        .map((device) => ListTile(
                              title: Text(device.name),
                              subtitle: Text(device.id.toString()),
                              trailing: StreamBuilder<BluetoothDeviceState>(
                                stream: device.state,
                                initialData: BluetoothDeviceState.disconnected,
                                builder: (c, snapshot) {
                                  if (snapshot.data ==
                                      BluetoothDeviceState.connected) {
                                    return TextButton(
                                      child: const Text('OPEN'),
                                      //  When pressed, return the BluetoothDevice
                                      onPressed: () =>
                                          Navigator.pop(context, device),
                                    );
                                  }
                                  return Text(snapshot.data.toString());
                                },
                              ),
                            ))
                        .toList(),
                  );
                },
              ),
              StreamBuilder<List<ScanResult>>(
                stream: FlutterBluePlus.instance.scanResults,
                initialData: const [],
                builder: (c, snapshot) {
                  if (snapshot.data!.isEmpty) {
                    return const Padding(
                      padding: EdgeInsets.only(
                        top: 40,
                      ),
                      child: Center(
                        child: Text('No devices'),
                      ),
                    );
                  }
                  return Column(
                    children: snapshot.data!.map((r) => _ScanResult(result: r)).toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: const Fab(),
    );
  }
}

class _ScanResult extends StatelessWidget {
  const _ScanResult({
    super.key,
    required this.result,
  });

  final ScanResult result;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(result.device.id.toString()),
      subtitle: Text(result.advertisementData.toString()),
      onTap: () {
        debugPrint('>>> result.advertisementData= ${result.advertisementData}');
        //  When pressed, return the BluetoothDevice
        Navigator.pop(context, result.device);
      },
    );
  }
}

class Fab extends StatelessWidget {
  const Fab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: FlutterBluePlus.instance.isScanning,
      initialData: false,
      builder: (c, snapshot) {
        if (snapshot.data!) {
          return FloatingActionButton(
            child: Icon(Icons.stop),
            onPressed: () => FlutterBluePlus.instance.stopScan(),
            backgroundColor: Colors.red,
          );
        } else {
          return FloatingActionButton(
            backgroundColor: Colors.black,
              child: const Icon(Icons.search, color: Colors.white),
              onPressed: () => FlutterBluePlus.instance
                  .startScan(timeout: Duration(seconds: 4)));
        }
      },
    );
  }
}
