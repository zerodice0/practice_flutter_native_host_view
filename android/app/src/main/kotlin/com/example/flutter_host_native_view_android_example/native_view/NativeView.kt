package com.example.flutter_host_native_view_android_example.native_view


import android.content.Context
import android.graphics.Color
import android.view.View
import android.widget.TextView
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.platform.PlatformView

internal class NativeView(context: Context, id: Int, creationParams: Map<String?, Any?>?, binaryMessenger: BinaryMessenger) : PlatformView {
  private val textView: TextView = TextView(context)
  private val methodChannel: MethodChannel

  override fun getView(): View {
    return textView
  }

  override fun dispose() {}

  init {
    textView.apply {
      textSize = 36f
      setBackgroundColor(Color.rgb(255, 255, 255))
      setTextColor(Color.BLACK)
      text = "Load NativeView Success (id: $id)"
    }

    methodChannel = MethodChannel(binaryMessenger, "NativeView${id}").apply {
      setMethodCallHandler { call, result ->
        if (call.method == "setText") {
          textView.text = call.arguments.toString()
          result.success(null)
        }
      }
    }

  }
}