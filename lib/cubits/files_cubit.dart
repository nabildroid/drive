import 'package:bloc/bloc.dart';
import 'package:drive/cubits/app_cubit.dart';
import 'package:drive/models/main.dart';
import 'package:drive/repositories/files/files_repository.dart';
import 'package:equatable/equatable.dart';

class FilesState extends Equatable {
  final bool isLoading;
  final Folder _parent;
  final Folder? parentFolder;

  Node get parent => _parent;

  const FilesState._(
    this._parent, {
    required this.isLoading,
    required this.parentFolder,
  });

  const FilesState.init(this._parent)
      : isLoading = true,
        parentFolder = null;

  FilesState copyWith({
    bool? isLoading,
    Folder? parentFolder,
  }) {
    return FilesState._(
      _parent,
      isLoading: isLoading ?? this.isLoading,
      parentFolder: parentFolder ?? this.parentFolder,
    );
  }

  FilesState setFolder(Folder parent) {
    if (parent.id != _parent.id) {
      return FilesState._(
        parent,
        isLoading: isLoading,
        parentFolder: parentFolder,
      );
    } else {
      return this;
    }
  }

  @override
  List<Object?> get props => [isLoading, parent, parentFolder];
}

class FilesCubit extends Cubit<FilesState> {
  final AppCubit _app;
  final FilesRepository _repo;

  FilesCubit(this._app, this._repo)
      : super(
          FilesState.init(_app.state.rootFolder!),
        );

  void setParent(Folder parent) {
    print("setting the parent");
    emit(state.setFolder(parent));
  }

  @override
  void onChange(Change<FilesState> change) async {
    print("change");
    if (change.currentState.parent != change.nextState.parent) {
      emit(state.copyWith(isLoading: true));

      final folder = await _repo.fromPath(state.parent.id);

      emit(state.copyWith(isLoading: false, parentFolder: folder));
    }
    super.onChange(change);
  }
}
