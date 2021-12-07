import 'dart:io';
import 'router.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

Future main() async {
  final ip = InternetAddress.anyIPv4;
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final app = routes();
  final handler = staticHandler();

  final cascade = Cascade().add(handler).add(app);

  final server = await shelf_io.serve(
    logRequests().addHandler(cascade.handler),
    ip,
    port,
  );

  print('Serving at http://${server.address.host}:${server.port}');
}
