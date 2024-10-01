class UserDataModel {
  final String? profileUrl;
  String? name;
  final String? email;
  final double? withDrawableBalance;
  final int? referralNetwork;
  final double? mySale;
  final double? referralSale;
  final double? totalSale;
  final String? referredById;

  UserDataModel(
      {required this.referredById,
      required this.email,
      required this.name,
      required this.mySale,
      required this.profileUrl,
      required this.referralNetwork,
      required this.referralSale,
      required this.totalSale,
      required this.withDrawableBalance});

  factory UserDataModel.fromMap(Map data) {
    return UserDataModel(
        referredById: data['referred_by_id'],
        email: data['email'],
        name: data['name'],
        mySale: data['my_sale'].toDouble(),
        profileUrl: data['profile_url'],
        referralNetwork: data['referral_network'],
        referralSale: data['referral_sale'].toDouble(),
        totalSale: data['total_sale'].toDouble(),
        withDrawableBalance: data['with_drawable_balance'].toDouble());
  }
}
