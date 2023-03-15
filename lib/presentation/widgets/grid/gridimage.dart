import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_support/file_support.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_dialogs/material_dialogs.dart';

class GridImage extends StatefulWidget {
  final BuildContext context;
  final Function(List<File> files) onchange;

  final String? title;

  bool compressImage;

  String? placeholderImage;
  List<File>? images;

  String? bottomsheetTitle;

  bool onlyCamera;

  GridImage(
      {Key? key,
      required this.context,
      required this.onchange,
      this.onlyCamera = false,
      this.title,
      this.bottomsheetTitle = null,
      this.compressImage = false,
      this.images,
      this.placeholderImage = ""})
      : super(key: key);

  @override
  _GridImageState createState() => _GridImageState();
}

class _GridImageState extends State<GridImage> {
  List<File> images = [];

  @override
  void initState() {
    super.initState();
    if (widget.images != null) {
      images.clear();
      images.addAll(widget.images!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final imageGrabber = GestureDetector(
      onTap: () {
        pickImage(widget.context);
      },
      child: Container(
        width: 56.w,
        height: 56.h,
        //color: Colors.red,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: widget.placeholderImage!.isEmpty
                  ? CachedNetworkImage(
                      imageUrl:
                          "https://raw.githubusercontent.com/parmeetmaster/image_grid/master/assets/camera_group.png",
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      widget.placeholderImage!,
                      fit: BoxFit.cover,
                    ),
            )
          ],
        ),
      ),
    );

    return Container(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        widget.title != null
            ? Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "${widget.title}",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ))
            : const SizedBox(),
        GridView(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
          children: [
            ...images.map(
              (file) => _getImageContiner(images.indexOf(file), file),
            ),
            imageGrabber
          ],
        ),
      ],
    ));
  }

  _getImageContiner(index, File file) {
    return Container(
      width: 56.w,
      height: 56.h,
      //color: Colors.red,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: FileImage(
                        file,
                      )),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
              )),
          Positioned(
              top: 00,
              right: 00,
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      images.removeAt(index);
                      widget.onchange(images);
                    });
                  },
                  child: Padding(
                      padding: const EdgeInsets.only(top: 2.0, right: 4),
                      child: Icon(
                        Icons.remove_circle_outlined,
                        size: 20.sp,
                        color: Colors.red,
                      ))))
        ],
      ),
    );
  }

  void pickImage(
    context,
  ) async {
    PickedFile? res;
    Dialogs.bottomMaterialDialog(
        title: widget.bottomsheetTitle == null
            ? 'Choose Camera or gallery'
            : widget.bottomsheetTitle,
        context: context,
        actions: widget.onlyCamera == false
            ? [
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green)),
                  onPressed: () async {
                    Navigator.pop(context);

                    res = (await ImagePicker.platform
                        .pickImage(source: ImageSource.camera))!;
                    updateImages(res);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                      ),
                      Text(
                        "Camera",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red)),
                  onPressed: () async {
                    Navigator.pop(context);
                    res = (await ImagePicker.platform
                        .pickImage(source: ImageSource.gallery))!;
                    updateImages(res);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.camera,
                        color: Colors.white,
                      ),
                      Text(
                        "Gallery",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ]
            : [
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green)),
                  onPressed: () async {
                    Navigator.pop(context);
                    res = (await ImagePicker.platform
                        .pickImage(source: ImageSource.camera))!;
                    updateImages(res);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                      ),
                      Text(
                        "Camera",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ]);
  }

  void updateImages(PickedFile? res) {
    if (res == null) {
      print("Response is null");
    } else {
      print(res.path);

      setState(() {
        images.add(File(res.path));
        if (widget.compressImage == true) {
          compressImage(images);
        } else {
          widget.onchange(images);
        }
      });
    }
  }

  void compressImage(List<File> files) async {
    try {
      List<File>? tempimages = [];
      await Future.forEach(files, (e) async {
        print(e);
        File? file = await FileSupport().compressImage(e as File);
        tempimages.add(file!);
      });
      this.images.clear();
      "${tempimages.length} are compress".toString();
      this.images.addAll(tempimages);
      widget.onchange(images);
    } catch (e) {}
  }
}
