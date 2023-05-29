import 'dart:ffi';
import 'dart:io';

import 'generated_bindings.dart';


final DynamicLibrary nativeLifePeakLib = Platform.isAndroid
    ? DynamicLibrary.open('liblife_peak_lib.so')
    : DynamicLibrary.process();

typedef TestStructFunction = Pointer<TestStruct> Function();
typedef TestStructFunctionDart = Pointer<TestStruct> Function();

final processTestStruct = nativeLifePeakLib
    .lookupFunction<TestStructFunction, TestStructFunctionDart>('processTestStruct');

final processTestArray = nativeLifePeakLib
    .lookupFunction<TestStructFunction, TestStructFunctionDart>('processTestArray');

// void main() {
//   print('processTestStruct= ${nativeLifePeakLib.providesSymbol('processTestStruct')}');
// }
