import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';

import 'package:ffi/ffi.dart';


final DynamicLibrary nativeLifePeakLib = Platform.isAndroid
    ? DynamicLibrary.open('liblife_peak_lib.so')
    : DynamicLibrary.process();

// final bool Function() checkDevice = nativeLifePeakLib
//     .lookup<NativeFunction<Bool Function()>>('checkDevice')
//     .asFunction();
//
//
// extension Uint8ListBlobConversion on Uint8List {
//   /// Allocates a pointer filled with the Uint8List data.
//   Pointer<Uint8> allocatePointer() {
//     final blob = calloc<Uint8>(length);
//     final blobBytes = blob.asTypedList(length);
//     blobBytes.setAll(0, this);
//     return blob;
//   }
// }
//
// Uint8List? scanRecord =  Uint8List.fromList([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]);
//
// final scanRecordEx = scanRecord?.allocatePointer();
//
//
//
//

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
