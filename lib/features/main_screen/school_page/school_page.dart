import 'package:tam_app/global_imports.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class School extends StatefulWidget {
  const School({super.key});

  @override
  State<School> createState() => _SchoolState();
}

class _SchoolState extends State<School> {
  late InAppWebViewController controller;
  String url = 'https://docs.google.com/forms/d/e/1FAIpQLSfAHVJicMArSZ5DLDMtyYxFqMPWvLdGKKtYNtPwsa2Zhi7pRw/viewform';
  double progress = 0;
  bool loadingBarVisiability = true;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: InAppWebView(
                initialUrlRequest: URLRequest(
                  url: Uri.parse(url),
                ),
                onWebViewCreated: (webViewController) =>
                    controller = webViewController,
                onLoadStart: (controller, url) {
                  setState(() {
                    this.url = url.toString();
                  });
                },
                onLoadStop: (controller, url) {
                  setState(() {
                    this.url = url.toString();
                  });
                },
                onProgressChanged: (controller, progress) {
                  setState(() {
                    this.progress = progress / 100;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
