class PromotionModel {
  const PromotionModel({
    required this.id,
    required this.bankId,
    required this.description,
    required this.earningAmount,
    required this.conditions,
    required this.status,
    required this.openingAccountInfoAvailable,
  });

  final int id;
  final int bankId;
  final String description;
  final int earningAmount;
  final String conditions;
  final bool status;
  final bool openingAccountInfoAvailable;

  PromotionModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        bankId = json['bank_id'],
        description = json['description'],
        earningAmount = json['earning_amount'],
        conditions = json['conditions'],
        status = json['status'],
        openingAccountInfoAvailable = json['opening_account_info_available'];
}
