import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:reset_api_dart/controller/home_controller.dart';
import 'package:shelf_router/shelf_router.dart' as shelf_router;
import 'package:shelf_static/shelf_static.dart' as shelf_static;

final homeController = HomeController();

Router routes() {
  final _router = shelf_router.Router();

  _router.get('/helloworld', homeController.helloWorldHandler);

  _router.get('/time', homeController.time);

  _router.get('/sum/<a|[0-9]+>/<b|[0-9]+>', homeController.sumHandler);

  return _router;
}

Handler staticHandler() {
  final _staticHandler =
      shelf_static.createStaticHandler('public', defaultDocument: 'index.html');

  return _staticHandler;
}
