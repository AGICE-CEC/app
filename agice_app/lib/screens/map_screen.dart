import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class MapScreen extends StatefulWidget {
  final String? location;
  final bool? showMessage;

  const MapScreen({super.key, this.location, this.showMessage = false});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    String url =
        'https://app.mappedin.com/map/66b14e6126fe2b000a5045d0?embedded=true&location=${widget.location}';

    return SafeArea(
      child: Stack(
        children: [
          WebViewX(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            initialContent: url,
            initialSourceType: SourceType.url,
            onPageStarted: (url) {
              setState(() {
                isLoading = true;
              });
            },
            onPageFinished: (url) {
              setState(() {
                isLoading = false;
              });
            },
          ),
          if (isLoading)
            const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 10),
                  Text(
                    'Cargando mapa...',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ],
              ),
            ),
          if (widget.showMessage == true)
            Positioned(
              top: 60,
              left: 14,
              child: Text(
                'Utiliza dos dedos para navegar',
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
            ),
        ],
      ),
    );
  }
}
