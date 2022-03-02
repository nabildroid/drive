import 'package:drive/models/main.dart';

abstract class SyncedFolderRepository {
  Future<List<SyncFolder>> get();
  Future<SyncFolder> create(SyncFolder syncFolder);
  Future<SyncFolder> update(SyncFolder syncFolder);
  Future<void> delete(SyncFolder syncFolder);
}
