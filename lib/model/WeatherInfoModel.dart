import 'CurrentModel.dart';
import 'LocationModel.dart';

class WeatherInfoModel {
  LocationModel? location;
  CurrentModel? current;

  WeatherInfoModel({this.location, this.current});

  WeatherInfoModel.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? LocationModel.fromJson(json['location'])
        : null;
    current =
    json['current'] != null ? CurrentModel.fromJson(json['current']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    if (this.current != null) {
      data['current'] = this.current!.toJson();
    }
    return data;
  }
}