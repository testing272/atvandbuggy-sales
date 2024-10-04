class ReferralModel {
  final String profilePicture;
  final String name;
  final String email;
  final int referralCount;
  final double totalSales;
  final String uid;
  List<ReferralModel>? network;

  ReferralModel(
      {required this.email,
      required this.totalSales,
      required this.name,
      required this.referralCount,
      required this.profilePicture,
      required this.uid,
      this.network});

  // Factory constructor to convert Firestore data to ReferralModel
  factory ReferralModel.fromFirebase(Map<String, dynamic> data, uid) {
    return ReferralModel(
      email: data['email'] ?? '',
      totalSales: (data['total_sale'] ?? 0).toDouble(),
      name: data['name'] ?? '',
      referralCount: data['referral_network'] ?? 0,
      profilePicture: data['profile_url'] ?? '',
      uid: uid,
    );
  }
}
