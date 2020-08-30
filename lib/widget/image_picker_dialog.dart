import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../utils/colors.dart';
import '../utils/dimens.dart';
import '../utils/permissions_handler.dart';
import '../utils/strings.dart';
import '../utils/text_styles.dart';

class ImagePickerDialog extends StatefulWidget {
  static String imagePath = "imagePath";
  final bool isCancel;
  final Color cancelColor;
  final bool outsideDismiss;

  const ImagePickerDialog({
    Key key,
    this.isCancel = true,
    this.cancelColor,
    this.outsideDismiss = true,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ImagePickerDialogState();
  }
}

class _ImagePickerDialogState extends State<ImagePickerDialog> {
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {widget.outsideDismiss ? _dismissDialog() : null},
      child: Material(
        type: MaterialType.transparency,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Center(
            child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Wrap(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            alignment: Alignment.center,
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: spacingLarge),
                                  child: Text(
                                    labelChooseImage,
                                    style: textStylePoppinsSemiBold(
                                        color: Colors.blue,
                                        fontSize: fontMedium2),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Divider(
                                  height: 1,
                                  color: colorGrey,
                                ),
                                SizedBox(
                                  height: spacingMedium,
                                ),
                                Container(
                                  width: double.infinity,
                                  child: FlatButton(
                                    onPressed: _askCameraPermission,
                                    child: Text(labelCamera,
                                        style: textStylePoppinsSemiBold(
                                            color: colorBlack)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: spacingTiny,
                                      horizontal: spacingXXLarge),
                                  child: Divider(
                                    height: 1,
                                    color: colorGrey,
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  child: FlatButton(
                                    onPressed: _askGalleryPermission,
                                    child: Text(labelGallery,
                                        style: textStylePoppinsSemiBold(
                                            color: colorBlack)),
                                  ),
                                ),
                                SizedBox(
                                  height: spacingMedium,
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }

  Future _getImage(ImageSource source) async {
    var image = await _picker.getImage(source: source, imageQuality: 10);
    Navigator.of(context).pop({ImagePickerDialog.imagePath: image?.path});
  }

  _askCameraPermission() {
    PermissionUtils.requestPermission([Permission.camera], context,
        permissionGrant: () {
      _getImage(ImageSource.camera);
    }, permissionDenied: () {});
  }

  _askGalleryPermission() {
    PermissionUtils.requestPermission(
        Platform.isAndroid ? [Permission.storage] : [Permission.photos],
        context, permissionGrant: () {
      _getImage(ImageSource.gallery);
    }, permissionDenied: () {});
  }

  _dismissDialog() {
    Navigator.of(context).pop({ImagePickerDialog.imagePath: ""});
  }
}

Future<dynamic> showImagePicker(BuildContext context) => showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return ImagePickerDialog(
          isCancel: true,
          outsideDismiss: true,
        );
      },
    );
