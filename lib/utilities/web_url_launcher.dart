import 'package:url_launcher/url_launcher.dart';

Future<void> launchWebUrl(String url) async {
  final parsedURL = Uri.parse(url);
  if (!await launchUrl(parsedURL)) {
    throw Exception("Unable to launch URL $parsedURL");
  }
}