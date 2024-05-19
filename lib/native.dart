import 'dart:ffi' as ffi;
import 'dart:ffi';
import 'dart:io';

// Open the dynamic library
final dylib = ffi.DynamicLibrary.open(_getLibraryPath());

String _getLibraryPath() {
  if (Platform.isAndroid) {
    return 'liblow_android.so';
  } else if (Platform.isLinux) {
    return 'liblow_linux.so';
  } else if (Platform.isWindows) {
    return 'liblow_windows.dll';
  } else if (Platform.isMacOS) {
    return 'liblow_macos.dylib';
  } else if (Platform.isIOS) {
    return 'liblow_ios.dylib';
  } else {
    throw Exception('Platform not supported.');
  }
}

// ##############################################################
// ##############################################################

// Lookup the C function                                                 // C function name
final helloFromC = dylib.lookupFunction<ffi.Int Function(), int Function()>('hello_from_c');

// ##############################################################
// ##############################################################
