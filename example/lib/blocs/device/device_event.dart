part of 'device_bloc.dart';

abstract class DeviceEvent extends Equatable {
  const DeviceEvent();
}

class DeviceRequested extends DeviceEvent {
  final BluetoothDevice device;

  const DeviceRequested({required this.device});
  @override
  List<Object?> get props => [device];
}

class DeviceRefreshRequested extends DeviceEvent {
  final BluetoothDevice device;

  const DeviceRefreshRequested({required this.device});

  @override
  List<Object?> get props => [device];
}
