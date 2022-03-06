import 'package:drive/models/main.dart';
import 'package:drive/repositories/files/files_repository.dart';
import 'package:drive/repositories/synced_folders/synced_folder_repository.dart';
import 'package:drive/repositories/users/users_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppState extends Equatable {
  final Profile? profile;

  final List<Node> rootNodes;
  final List<File> recentFiles;
  final List<SyncFolder> syncedFoldes;

  const AppState._({
    required this.profile,
    required this.rootNodes,
    required this.recentFiles,
    required this.syncedFoldes,
  });

  const AppState.init()
      : profile = null,
        rootNodes = const [],
        recentFiles = const [],
        syncedFoldes = const [];

  AppState copyWith({
    Profile? profile,
    List<Node>? rootNodes,
    List<File>? recentFiles,
    List<SyncFolder>? syncedFoldes,
  }) {
    return AppState._(
      profile: profile ?? this.profile,
      rootNodes: rootNodes ?? this.rootNodes,
      recentFiles: recentFiles ?? this.recentFiles,
      syncedFoldes: syncedFoldes ?? this.syncedFoldes,
    );
  }

  @override
  List<Object?> get props => [profile];
}

class AppCubit extends Cubit<AppState> {
  final ProfileRepository _repository;
  final SyncedFolderRepository _syncedFolderRepository;
  final FilesRepository _filesRepository;

  AppCubit(
    AuthUser user,
    this._repository,
    this._syncedFolderRepository,
    this._filesRepository,
  ) : super(const AppState.init()) {
    _repository.getProfile(user.id).listen(
          (value) => emit(
            state.copyWith(profile: value),
          ),
        );
  }
}
