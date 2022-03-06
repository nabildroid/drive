import 'package:bloc/bloc.dart';
import 'package:drive/cubits/app_cubit.dart';
import 'package:drive/repositories/files/files_repository.dart';
import 'package:equatable/equatable.dart';

class FilesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class FilesCubit extends Cubit<FilesState> {
  final AppCubit _app;
  final FilesRepository _repo;

  FilesCubit(this._app, this._repo) : super(FilesState());
}
