import 'dart:io';

import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';

import '../../ui/drawer/drawer_screen.dart';
import '../../ui/home/model/cities.dart';
import '../../ui/home/model/news.dart';
import '../../utils/colors.dart';
import '../../utils/common_methods.dart';
import '../../utils/date_utils.dart';
import '../../utils/dimens.dart';
import '../../utils/images.dart';
import '../../utils/strings.dart';
import '../../utils/text_styles.dart';
import '../../widget/button_painter.dart';
import '../../widget/edittext_painter.dart';
import '../../widget/image_picker_dialog.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  final GlobalKey<ExpandableBottomSheetState> _bottomBarKey = new GlobalKey();
  final TextEditingController _controller = TextEditingController();
  final FocusNode _nameFocusNode = FocusNode();

  String _name = "";
  String _date = "";

  bool _isBottomBarOpen = false;
  int _selectedIndex = 0;

  bool _isSwitched = false;

  List<News> _newsList = News.getNewsList();
  List<Cities> _cityList = Cities.getCityList();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          key: _drawerKey,
          resizeToAvoidBottomPadding: false,
          backgroundColor: Colors.white,
          drawer: SideDrawer(
            isSwitched: _isSwitched,
            onChange: _changeName,
          ),
          appBar: _createAppBar(),
          body: _mainScreenLayout(),
        ));
  }

  _createAppBar() => AppBar(
        elevation: 0,
        title: Text(
          _selectedIndex == 0 ? labelNews : labelWeather,
          style:
              textStylePoppinsBold(color: Colors.white, fontSize: fontLarge1),
        ),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.person_outline))
        ],
        centerTitle: true,
      );

  _mainScreenLayout() => ExpandableBottomSheet(
        key: _bottomBarKey,
        onIsContractedCallback: () {
          setState(() {
            _isBottomBarOpen = false;
          });
        },
        onIsExtendedCallback: () {
          setState(() {
            _isBottomBarOpen = true;
          });
        },
        background: _getBackgroundLayout(),
        persistentHeader: Container(
          height: Platform.isIOS ? 70 : 45,
          color: Colors.white,
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              Align(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 2,
                  color: Colors.blue,
                ),
                alignment: Alignment.center,
              ),
              Align(
                child: FloatingActionButton(
                  mini: true,
                  elevation: 0,
                  child: Icon(Icons.add),
                  onPressed: () {
                    if (_isBottomBarOpen) {
                      _bottomBarKey.currentState.contract();
                    } else {
                      _bottomBarKey.currentState.expand();
                    }
                  },
                ),
                alignment: Alignment.center,
              ),
            ],
          ),
        ),
        expandableContent: Container(
          height: Platform.isIOS ? 100 : 80,
          color: Colors.white,
          alignment: Alignment.center,
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            iconSize: 20,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            onTap: _handleBottomItemClick,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  title: Text(labelShowNew),
                  icon: ImageIcon(
                    AssetImage(icNews),
                    size: 35,
                  )),
              BottomNavigationBarItem(
                  title: Text(labelShowWeather),
                  icon: ImageIcon(
                    AssetImage(icWeather),
                    size: 35,
                  ))
            ],
          ),
        ),
      );

  _getBackgroundLayout() => Container(
        padding: EdgeInsets.only(top: spacingXLarge),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Container(
                    padding: EdgeInsets.only(
                        top: spacingSmall,
                        left: spacingMedium,
                        right: spacingMedium),
                    child: Text(
                      labelHello + (_isSwitched ? labelName1 : labelName2),
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: textStylePoppinsSemiBold(
                          color: colorBlack, fontSize: fontLarge2),
                    )),
              ),
              if (_date != "")
                Center(
                  child: Container(
                      padding: EdgeInsets.only(
                        left: spacingMedium,
                        right: spacingMedium,
                        top: spacingTiny,
                      ),
                      child: Text(
                        labelLastUpdatePic(_name, _date),
                        textAlign: TextAlign.center,
                        style: textStylePoppinsLight(color: colorBlack2),
                      )),
                ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: spacingLarge, top: spacingLarge),
                child: Text(
                  _selectedIndex == 0 ? labelTodayNews : labelTodayWeather,
                  textAlign: TextAlign.start,
                  style: textStylePoppinsMedium(color: colorBlack),
                ),
              ),
              _createListLayout(),
              SizedBox(height: spacingSmall),
              Container(
                  padding: EdgeInsets.all(spacingLarge),
                  child: Row(
                    children: <Widget>[
                      Container(
                        color: Colors.blue,
                        width: 3,
                        height: 50,
                      ),
                      SizedBox(
                        width: spacingTiny,
                      ),
                      _createNameFiled(),
                    ],
                  )),
              SizedBox(height: spacingMedium),
              CustomPaint(
                painter: ButtonPainter(),
                child: InkWell(
                  onTap: _uploadPhoto,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: spacingXXLarge, vertical: spacingMedium),
                    child: Text(
                      labelUploadPic,
                      style: textStylePoppinsMedium(color: colorBlack),
                    ),
                  ),
                ),
              )
            ]),
      );

  _createNameFiled() => Expanded(
        child: CustomPaint(
          painter: EditTextPainter(),
          child: TextFormField(
              textInputAction: TextInputAction.done,
              controller: _controller,
              cursorColor: colorBlack,
              focusNode: _nameFocusNode,
              decoration: InputDecoration(
                  fillColor: Colors.transparent,
                  filled: true,
                  contentPadding: EdgeInsets.only(
                      left: spacingLarge,
                      right: spacingMedium,
                      top: 0,
                      bottom: 0),
                  labelText: hintFirstName,
                  hintStyle: textStylePoppinsMedium(color: Colors.black),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelStyle:
                      textStylePoppinsMedium(fontSize: 13, color: Colors.black),
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.person_outline,
                    color: Colors.blue,
                  ))),
        ),
      );

  _createListLayout() => Container(
        height: 120,
        margin: EdgeInsets.only(left: spacingSmall, top: spacingSmall),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:
                _selectedIndex == 0 ? _newsList.length : _cityList.length,
            itemBuilder: (BuildContext ctxt, int index) {
              return InkWell(
                onTap: () {
                  if (_selectedIndex == 0) launchURL(_newsList[index].newsUrl);
                },
                child: Container(
                    padding: EdgeInsets.all(spacingMedium),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        _selectedIndex == 0
                            ? _newsList[index].newsHeadLine
                            : _cityList[index].cityName,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: textStylePoppinsLight(
                            fontSize: 14, color: Colors.white),
                      ),
                    ),
                    margin: EdgeInsets.only(right: spacingSmall),
                    width: MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(_selectedIndex == 0
                              ? _newsList[index].newsImage
                              : _cityList[index].cityImage),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
              );
            }),
      );

  _changeName(value) {
    setState(() {
      _isSwitched = value;
    });
  }

  _handleBottomItemClick(int index) {
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  _uploadPhoto() async {
    var result = await showImagePicker(context);
    FocusScope.of(context).unfocus();
    if (result != null &&
        result[ImagePickerDialog.imagePath] != null &&
        result[ImagePickerDialog.imagePath].toString().isNotEmpty) {
      setState(() {
        _date = getCurrentDateString(dateFormat2) +
            " at " +
            getCurrentDateString(timeFormat1);
        _name = _controller?.text ?? "";
        FocusScope.of(context).unfocus();
      });
    }
  }
}
