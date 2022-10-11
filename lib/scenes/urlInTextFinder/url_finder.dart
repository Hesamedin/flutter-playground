import 'package:custom_rich_text/custom_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playgound/widgets/screenContainer/app_scaffold.dart';
import 'package:url_launcher/url_launcher.dart';

class URLFinder extends StatelessWidget {
  const URLFinder({Key? key}) : super(key: key);

  static String get path => '/URLFinder';
  final String sampleText = 'This is a sample url https://www.atco.com. This is a sample phone number 780-1234567 or '
      '(780) 123-4567 or +1 780-1234567 or 1-780-123-4567. This is a sample email address: adam.smith@atco.com.';

  Future<void> _launchUri(Uri uri) async {
    if (!await launchUrl(uri)) {
      throw 'Could not launch $uri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      screenName: 'URL Finder in Text',
      child: CustomRichText(
        text: sampleText,
        caseSensitive: false,
        onWebLinkTap: (url) => _launchUri(Uri.parse(url)),
        onPhoneTap: (phoneNumber) => _launchUri(
          Uri(
            scheme: 'tel',
            path: phoneNumber.replaceAll(' ', '').replaceAll('-', ''),
          ),
        ),
        onEmailTap: (email) => _launchUri(
          Uri(
            scheme: 'mailto',
            path: email,
          ),
        ),
      ),
    );
  }
}
