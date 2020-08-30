import '../../../utils/images.dart';

class Cities {
  String cityName;
  String cityImage;

  Cities(this.cityName, this.cityImage);

  static List<Cities> getCityList() {
    List<Cities> cityList = [];
    cityList.add(Cities("Ahmedabad", icCity1));
    cityList.add(Cities("Mumbai", icCity2));
    cityList.add(Cities("Kolkata", icCity3));
    cityList.add(Cities("Hyderabad", icCity4));
    cityList.add(Cities("Bengaluru", icCity5));
    return cityList;
  }
}
