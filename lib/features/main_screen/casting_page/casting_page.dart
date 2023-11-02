import 'package:tam_app/global_imports.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class Casting extends StatefulWidget {
  const Casting({super.key});

  @override
  State<Casting> createState() => _CastingState();
}

class _CastingState extends State<Casting> {
  late InAppWebViewController controller;
  String url = 'https://docs.google.com/forms/d/e/1FAIpQLSfAHVJicMArSZ5DLDMtyYxFqMPWvLdGKKtYNtPwsa2Zhi7pRw/viewform';
  double progress = 0;
  bool loadingBarVisiability = true;

  @override
  Widget build(BuildContext context) {
    // if (progress == 1) {
    //   setState(() {
    //     loadingBarVisiability = false;
    //   });
    // }
    
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Visibility(
            //   visible: loadingBarVisiability,
            //   child: Container(
            //     padding: const EdgeInsets.all(8),
            //     child: progress < 1.0
            //         ? LinearProgressIndicator(
            //             value: progress,
            //           )
            //         : Container(),
            //   ),
            // ),
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
