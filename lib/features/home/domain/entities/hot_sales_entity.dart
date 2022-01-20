import 'package:equatable/equatable.dart';

class HotSalesEntity extends Equatable {

  final int id;
  final bool isNew;
  final String title;
  final String subtitle;
  final String picture;
  final bool isBuy;

  HotSalesEntity(
      {required this.id, required this.isNew, required this.title, required this.subtitle, required this.picture, required this.isBuy,});

  @override
  List<Object?> get props => [id, isNew, title, subtitle, picture, isBuy];


}


