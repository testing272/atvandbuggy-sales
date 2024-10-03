class ReferralModel {
  final String profilePicture;
  final String name;
  final String email;
  final int referralCount;
  final List<ReferralModel>? network;
  final double totalSales;

  ReferralModel({
    required this.email,
    required this.totalSales,
    required this.name,
    required this.network,
    required this.referralCount,
    required this.profilePicture,
  });

  // Factory constructor to convert Firestore data to ReferralModel
  factory ReferralModel.fromFirebase(Map<String, dynamic> data,
      {List<ReferralModel>? network = const []}) {
    return ReferralModel(
      email: data['email'] ?? '',
      totalSales: (data['total_sale'] ?? 0).toDouble(),
      name: data['name'] ?? '',
      network: network, // Default empty network list
      referralCount: data['referral_network'] ?? 0,
      profilePicture: data['profile_url'] ?? '',
    );
  }
}
