import 'package:equatable/equatable.dart';

class HomeSlider extends Equatable {
  final int id;
  final String? media;

  const HomeSlider({required this.id, required this.media});

  @override
  List<Object?> get props => [id, media];
}
