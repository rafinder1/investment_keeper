import 'package:intl/intl.dart';

class BanksModel {
  const BanksModel({
    required this.id,
    required this.name,
    required this.endPromotion,
    required this.noAccountSince,
  });

  final int id;
  final String name;
  final DateTime endPromotion;
  final DateTime noAccountSince;

  BanksModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        endPromotion = DateTime.parse(json['end_promotion']),
        noAccountSince = DateTime.parse(json['no_account_since']);

  String getFormattedEndPromotion([String format = 'dd/MM/yyyy']) {
    return DateFormat(format).format(endPromotion);
  }

  String getFormattedNoAccountSince([String format = 'dd/MM/yyyy']) {
    return DateFormat(format).format(noAccountSince);
  }
}
