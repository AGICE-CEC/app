import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class EmbededMap extends StatefulWidget {
  final String? room;

  const EmbededMap({super.key, this.room});

  @override
  State<EmbededMap> createState() => _EmbededMapState();
}

class _EmbededMapState extends State<EmbededMap> {
  // Mapa de niveles y localizaciones a sus respectivos URLs
  final Map<String, String> roomUrls = {
    'CIT - Plaza Dra. Isabel Gutiérrez de Bosch.png':
        'https://app.mappedin.com/map/66b14e6126fe2b000a5045d0?embedded=true&floor=m_04ddd3f2bc46225d&location=s_6d7c401af6887089',
    'Plaza Paiz Riera.png':
        'https://app.mappedin.com/map/66b14e6126fe2b000a5045d0?embedded=true&floor=m_04ddd3f2bc46225d&location=s_1806094cec884bec',
    'Cafetería.png':
        'https://app.mappedin.com/map/66b14e6126fe2b000a5045d0?embedded=true&floor=m_04ddd3f2bc46225d&location=s_341897174272b541',
    'CIT - 727.png':
        'https://app.mappedin.com/map/66b14e6126fe2b000a5045d0?embedded=true&floor=m_e0ea228765fb86c2&location=s_338fc9e8f0f2b41a',
    'I - 100.png':
        'https://app.mappedin.com/map/66b14e6126fe2b000a5045d0?embedded=true&floor=m_04ddd3f2bc46225d&location=s_0fe313ef6dd17ca7',
    'F - 101.png':
        'https://app.mappedin.com/map/66b14e6126fe2b000a5045d0?embedded=true&floor=m_04ddd3f2bc46225d&location=s_19e743deddb07272',
    'CIT - Plaza.png':
        'https://app.mappedin.com/map/66b14e6126fe2b000a5045d0?embedded=true&floor=m_04ddd3f2bc46225d&location=s_6d7c401af6887089',
    'CIT - 705.png':
        'https://app.mappedin.com/map/66b14e6126fe2b000a5045d0?embedded=true&floor=m_e0ea228765fb86c2&location=s_cc37751ef53238a6',
  };

  @override
  Widget build(BuildContext context) {
    // Construir la URL según el room
    String url = roomUrls[widget.room ?? ''] ??
        'https://app.mappedin.com/map/66b14e6126fe2b000a5045d0?embedded=true&location=default-location';

    return WebViewX(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      initialContent: url,
      initialSourceType: SourceType.url,
    );
  }
}
