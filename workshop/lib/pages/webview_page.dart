import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewPage extends StatefulWidget {
  const WebviewPage({Key? key}) : super(key: key);

  @override
  State<WebviewPage> createState() => _WebviewPageState();
}

class _WebviewPageState extends State<WebviewPage> {
  String url = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Webview")),
      body: Column(
        children: [
          Text(url),
          Expanded(
            child: Platform.isAndroid || Platform.isIOS
                ? WebView(
                    javascriptMode: JavascriptMode.unrestricted,
                    initialUrl: "https://www.ici.curitiba.org.br/",
                    onPageStarted: (newUrl) {
                      setState(() {
                        url = newUrl;
                      });
                    },
                  )
                : const Text("Plataforma não suporta webview"),
          )
        ],
      ),
    );
  }
}
