package com.example.flutter_host_native_view_android_example

import com.example.flutter_host_native_view_android_example.native_view.NativeViewFactory
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity: FlutterActivity() {
  override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
    super.configureFlutterEngine(flutterEngine)
    val message = flutterEngine.dartExecutor.binaryMessenger;

    flutterEngine.platformViewsController.registry.apply {
      registerViewFactory("com.example.flutter_host_native_view_android_example/native_view", NativeViewFactory(message))
    }
  }
}
