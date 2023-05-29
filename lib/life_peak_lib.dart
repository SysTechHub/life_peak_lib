import 'dart:ffi';
import 'dart:io';


final DynamicLibrary nativeLifePeakLib = Platform.isAndroid
    ? DynamicLibrary.open('liblife_peak_lib.so')
    : DynamicLibrary.process();

final int Function(int x, int y) sum = nativeLifePeakLib
    .lookup<NativeFunction<Int32 Function(Int32, Int32)>>('sum')
    .asFunction();

// typedef TestStructFunction = Pointer<TestStruct> Function();
// typedef TestStructFunctionDart = Pointer<TestStruct> Function();
//
// final processTestStruct = nativeLifePeakLib
//     .lookupFunction<TestStructFunction, TestStructFunctionDart>('processTestStruct');
//
// final processTestArray = nativeLifePeakLib
//     .lookupFunction<TestStructFunction, TestStructFunctionDart>('processTestArray');

// void main() {
//   print('processTestStruct= ${nativeLifePeakLib.providesSymbol('processTestStruct')}');
// }
