import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class EmbededMap extends StatefulWidget {
  final String? room; 

  const EmbededMap({super.key, this.room});

  @override
  State<EmbededMap> createState() => _EmbededMapState();
}

class _EmbededMapState extends State<EmbededMap> {
  // Mapa de niveles a sus respectivos IDs en Mappedin
  final Map<int, String> levelIds = {
    1: 'm_9a516837299d1a53',
    2: 'm_04ddd3f2bc46225d',
    3: 'm_c00cc058f72140a2',
    4: 'm_daff1f8e21e67379',
    5: 'm_f37d09ea658a097c',
    6: 'm_7e544483c06b56b4',
    7: 'm_e0ea228765fb86c2',
  };

  @override
  Widget build(BuildContext context) {
    // Construir la URL base
    String url = 'https://app.mappedin.com/map/66b14e6126fe2b000a5045d0?embedded=true&location=default-location';
    
    int level = 1;
    if (widget.room != null)
    {
      level = (widget.room != null && widget.room!.startsWith("CIT - "))
      ? (int.tryParse(widget.room!.split("CIT - ")[1][0]) != null 
          ? int.parse(widget.room!.split("CIT - ")[1][0]) 
          : 1) 
      : 1;

    }

    String levelId = levelIds[level] ?? 'm_9a516837299d1a53';
    url += '&floor=$levelId';


    return Column(
      children: [
        Text('Generated URL: ${level}'), // Mostrar la URL en la UI
        Expanded(
          child: WebViewX(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            initialContent: url,
            initialSourceType: SourceType.url,
          ),
        ),
      ],
    );

    return WebViewX(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      initialContent: url,
      initialSourceType: SourceType.url,
    );
  }
}