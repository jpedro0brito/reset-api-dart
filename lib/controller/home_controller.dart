import 'dart:convert';
import 'package:shelf/shelf.dart';

class HomeController {
  Response time(Request request) =>
      Response.ok(DateTime.now().toUtc().toIso8601String());

  Response helloWorldHandler(Request request) => Response.ok('Hello, World!');

  Response sumHandler(request, String a, String b) {
    final aNum = int.parse(a);
    final bNum = int.parse(b);
    return Response.ok(
      const JsonEncoder.withIndent(' ')
          .convert({'a': aNum, 'b': bNum, 'sum': aNum + bNum}),
      headers: {
        'content-type': 'application/json',
        'Cache-Control': 'public, max-age=604800',
      },
    );
  }
}
