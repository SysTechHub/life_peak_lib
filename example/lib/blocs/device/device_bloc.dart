import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

part 'device_event.dart';
part 'device_state.dart';

class DeviceBloc extends Bloc<DeviceEvent, DeviceState> {
  DeviceBloc() : super(DeviceInitial()) {
    on<DeviceRequested>(_onDeviceRequested);
    on<DeviceRefreshRequested>(_onDeviceRefreshRequested);
  }

  void _onDeviceRequested(DeviceRequested event, Emitter<DeviceState> emit) async {
    emit(DeviceLoading());
    try {
      emit(DeviceLoaded(device: event.device));
    } catch (error, stackTrace) {
      debugPrintStack(
        label: error.toString(),
        stackTrace: stackTrace,
      );
      emit(DeviceFailure(message: error.toString()));
    }
  }

  void _onDeviceRefreshRequested(DeviceRefreshRequested event, Emitter<DeviceState> emit) async {
    emit(DeviceLoading());
    try {
      emit(DeviceLoaded(device: event.device));
    } catch (error, stackTrace) {
      debugPrintStack(
        label: error.toString(),
        stackTrace: stackTrace,
      );
      emit(DeviceFailure(message: error.toString()));
    }
  }
}
