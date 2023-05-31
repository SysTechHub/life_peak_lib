part of 'device_bloc.dart';

abstract class DeviceState extends Equatable {
  const DeviceState();
}

class DeviceInitial extends DeviceState {
  @override
  List<Object> get props => [];
}

class DeviceLoading extends DeviceState {
  @override
  List<Object> get props => [];
}

class DeviceLoaded extends DeviceState {
  final BluetoothDevice device;

  const DeviceLoaded({required this.device});
  @override
  List<Object> get props => [device];
}

class DeviceFailure extends DeviceState {
  final String message;

  const DeviceFailure({required this.message});
  @override
  List<Object> get props => [message];
}
