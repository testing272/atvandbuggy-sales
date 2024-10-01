class ReferralModel {
  final String profilePicture;
  final String name;
  final String email;
  final int referralCount;
  final List<ReferralModel> network;

  ReferralModel(
      {required this.email,
      required this.name,
      required this.network,
      required this.referralCount,
      required this.profilePicture});
}
