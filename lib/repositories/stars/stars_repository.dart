import 'package:drive/models/files_model.dart';
import 'package:drive/models/main.dart';

abstract class StarsRepository {
  Future<List<Node>> get();
  Future<void> star(Node node);
  Future<void> unstar(Node node);
}
