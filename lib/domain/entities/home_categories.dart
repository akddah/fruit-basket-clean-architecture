import 'package:equatable/equatable.dart';

class HomeCategories extends Equatable {
  final int id;
  final String media;
  final String name;

  const HomeCategories({required this.id, required this.media, required this.name});

  @override
  List<Object?> get props => [id, media, name];
}
