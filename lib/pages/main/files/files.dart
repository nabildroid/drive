import 'package:drive/cubits/app_cubit.dart';
import 'package:drive/cubits/files_cubit.dart';
import 'package:drive/models/main.dart';
import 'package:drive/pages/main/home/widgets/custom_appbar.dart';
import 'package:drive/pages/main/home/widgets/folder_tree_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilesPageArguments {
  final Folder? firstPath;
  FilesPageArguments(this.firstPath);
}

class FilePage extends StatefulWidget implements FilesPageArguments {
  @override
  final Folder firstPath;

  const FilePage(this.firstPath, {Key? key}) : super(key: key);

  @override
  State<FilePage> createState() => _FilePageState();

  static route(BuildContext ctx, Folder folder) {
    Navigator.of(ctx).pushNamed(
      "/files",
      arguments: FilesPageArguments(folder),
    );
  }
}

class _FilePageState extends State<FilePage> {
  @override
  void initState() {
    final _cubit = BlocProvider.of<FilesCubit>(context);

    _cubit.setParent(widget.firstPath);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appState = BlocProvider.of<AppCubit>(context).state;
    final profile = appState.profile!;

    final _cubit = BlocProvider.of<FilesCubit>(context);

    return Scaffold(
      body: Column(children: [
        CustomAppBar(
          imageUrl: profile.avatar,
          size: profile.size,
        ),
        SizedBox(height: 4),
        BlocBuilder<FilesCubit, FilesState>(
            bloc: _cubit,
            builder: (context, state) {
              return Column(
                children: [
                  Text(
                    state.parent.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Row(
                    children: [
                      ...List.generate(
                        state.parent.users.length,
                        (index) => const Padding(
                          padding: EdgeInsets.only(left: 4),
                          child: CircleAvatar(
                            maxRadius: 14,
                            backgroundImage: NetworkImage(
                                "https://github.com/nabildroid.png"),
                          ),
                        ),
                      ),
                      Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: Text("add"),
                      )
                    ],
                  ),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
              );
            }),
        SizedBox(height: 10),
        Expanded(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: BlocBuilder<FilesCubit, FilesState>(
                bloc: _cubit,
                builder: (ctx, state) {
                  if (state.parentFolder == null) {
                    return Center(child: CircularProgressIndicator());
                  }

                  return FolderTreeBottomSheet(
                    state.parentFolder!,
                    onClick: (item) {
                      if (item is Folder) {
                        _cubit.setParent(item);
                      }
                    },
                  );
                }),
          ),
        )
      ]),
    );
  }
}
