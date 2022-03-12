import 'package:drive/cubits/app_cubit.dart';
import 'package:drive/cubits/files_cubit.dart';
import 'package:drive/models/main.dart';
import 'package:drive/pages/main/home/home.dart';
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
    final _state = _cubit.state;

    return Scaffold(
      body: Column(children: [
        CustomAppBar(
          imageUrl: profile.avatar,
          size: profile.size,
        ),
        SizedBox(height: 4),
        Column(
          children: [
            Text(
              _state.parent.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            Row(
              children: [
                ...List.generate(
                  _state.parent.users.length,
                  (index) => const Padding(
                    padding: EdgeInsets.only(left: 4),
                    child: CircleAvatar(
                      maxRadius: 14,
                      backgroundImage:
                          NetworkImage("https://github.com/nabildroid.png"),
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
        ),
        SizedBox(height: 10),
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              children: [
                Container(
                  height: 25,
                  color: Colors.transparent,
                  child: Center(
                    child: Container(
                      width: 180,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                ),
                BlocBuilder<FilesCubit, FilesState>(
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
                    })
              ],
            ),
          ),
        )
      ]),
    );
  }
}
