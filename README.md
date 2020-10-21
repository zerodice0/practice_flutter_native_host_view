# flutter_host_native_view_android_example
[Hosting native Android and iOS views in your Flutter app with Platform Views](https://flutter.dev/docs/development/platform-integration/platform-views) 요 페이지를 참고해서 만든 예제입니다. Flutter에서 Android에서 구현된 UI를 Hybrid Composition으로 가져올 때, 각각의 UI를 그리면서 ID를 생성하는데요. 이 ID를 이용해서 메소드 채널을 생성하게되면 한 화면에 두 개의 Text를 띄워도 각 UI별로 메소드를 호출할 수 있습니다. 애석하게도 이건 안드로이드 쪽의 구현사항인 것 같아, 안드로이드 쪽만 구현을 완료했습니다.

