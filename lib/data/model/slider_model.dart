import '../../domain/entities/home_slider.dart';

class HomeSliderModel extends HomeSlider {
  const HomeSliderModel({required super.id, required super.media});
  factory HomeSliderModel.fromJson(Map<String, dynamic> json) => HomeSliderModel(id: json["id"], media: json["media"]);
}
