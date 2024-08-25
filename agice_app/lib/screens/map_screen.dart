import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class MapScreen extends StatefulWidget {
  final String? location;

  const MapScreen({super.key, this.location});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    String url =
        'https://app.mappedin.com/map/66b14e6126fe2b000a5045d0?embedded=true&location=${widget.location}';

    return WebViewX(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      initialContent: url,
      initialSourceType: SourceType.url,
    );
  }
}
