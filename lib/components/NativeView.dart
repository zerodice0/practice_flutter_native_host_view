import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class NativeCall {
  MethodChannel channel;

  void setText(String text) {
    this.channel?.invokeMethod("setText", text);
  }
}

class NativeView extends StatelessWidget {
  final String viewType =
      "com.example.flutter_host_native_view_android_example/native_view";
  final NativeCall natvie = NativeCall();

  Widget build(BuildContext context) {
    // This is used in the platform side to register the view.
    // Pass parameters to the platform side.
    final Map<String, dynamic> creationParams = <String, dynamic>{};

    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return PlatformViewLink(
          viewType: this.viewType,
          surfaceFactory:
              (BuildContext context, PlatformViewController controller) {
            return AndroidViewSurface(
              controller: controller,
              gestureRecognizers: const <
                  Factory<OneSequenceGestureRecognizer>>{},
              hitTestBehavior: PlatformViewHitTestBehavior.opaque,
            );
          },
          onCreatePlatformView: (PlatformViewCreationParams params) {
            this.natvie.channel = new MethodChannel("NativeView${params.id}");

            return PlatformViewsService.initSurfaceAndroidView(
              id: params.id,
              viewType: this.viewType,
              layoutDirection: TextDirection.ltr,
              creationParams: creationParams,
              creationParamsCodec: StandardMessageCodec(),
            )
              ..addOnPlatformViewCreatedListener(params.onPlatformViewCreated)
              ..create();
          },
        );
        break;
      case TargetPlatform.iOS:
        break;
      default:
        break;
    }

    return Text("Not Supported Platform.");
  }
}
