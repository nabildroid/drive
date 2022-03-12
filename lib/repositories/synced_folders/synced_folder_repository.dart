import 'package:drive/models/main.dart';
import 'package:drive/models/syncing_model.dart';

abstract class SyncedFolderRepository {
  Future<List<SyncFolder>> get();
  Future<SyncFolder> create(SyncFolder syncFolder);
  Future<SyncFolder> updateConfiguration(SyncFolder syncFolder);
  Future<void> delete(SyncFolder syncFolder);

  Future<OutSyncFolderState> isOutOfSync(SyncFolder syncFolder);
  Future<void> doSync(SyncFolder syncFolder);

  Future<SyncFolder> pause(SyncFolder syncFolder);
  Future<SyncFolder> resume(SyncFolder syncFolder);
}
