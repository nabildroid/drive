abstract class StorageRepository {
  Future<Uri> download();
  Future<Uri> upload();
}
