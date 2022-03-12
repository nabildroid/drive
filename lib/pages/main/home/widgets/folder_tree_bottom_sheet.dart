import 'dart:math';

import 'package:drive/models/main.dart';
import 'package:drive/pages/main/files/files.dart';
import 'package:flutter/material.dart';

class FolderTreeBottomSheet extends StatefulWidget {
  final Folder folder;
  final bool expandable;
  final Function(Node node)? onClick;
  final Function()? onExpanded;

  const FolderTreeBottomSheet(
    this.folder, {
    Key? key,
    this.expandable = false,
    this.onClick,
    this.onExpanded,
  }) : super(key: key);

  @override
  State<FolderTreeBottomSheet> createState() => _FolderTreeBottomSheetState();
}

class _FolderTreeBottomSheetState extends State<FolderTreeBottomSheet> {
  late double factor;

  @override
  void initState() {
    factor = widget.expandable ? .5 : 1;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final childs = widget.folder.childs;
    return FractionallySizedBox(
      alignment: Alignment.bottomCenter,
      heightFactor: factor,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        padding: const EdgeInsets.all(8).copyWith(top: 0),
        child: Column(
          children: [
            GestureDetector(
              onVerticalDragUpdate: ((details) {
                if (widget.expandable) {
                  setState(() {
                    factor += details.delta.dy;
                    factor = max(1, min(1, factor));
                    if (factor == 1) {
                      if (widget.onExpanded != null) {
                        widget.onExpanded!();
                      }
                    }
                  });
                }
              }),
              child: Container(
                width: double.infinity,
                height: 30,
                color: Colors.transparent,
                child: Align(
                  alignment: Alignment(0, -.5),
                  child: Container(
                    width: 180,
                    height: 3,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(bottom: 50),
                itemCount: childs.length,
                itemBuilder: (ctx, i) => ListTile(
                  onTap: widget.onClick != null
                      ? () => widget.onClick!(childs[i])
                      : null,
                  dense: true,
                  leading: childs[i] is Folder
                      ? Icon(Icons.folder)
                      : Icon(Icons.image),
                  title: Text(
                    childs[i].name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      height: 2,
                    ),
                  ),
                  subtitle: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        childs[i].users.isEmpty ? Icons.lock : Icons.person,
                        size: 12,
                        color: Colors.black45,
                      ),
                      Text(
                        childs[i].history[0].lastEdit.toString(),
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
