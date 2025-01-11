import 'package:startupkit/utils/images_path.dart';

class UserModel {
  String name;
  String profileImage;
  String address;
  bool isPremium;
  UserModel({
    required this.name,
    required this.isPremium,
    required this.profileImage,
    required this.address,
  });
}

UserModel currentUser = UserModel(
    name: 'Sumit ,Chavan',
    isPremium: true,
    profileImage: ImagesPath.kUserProfile,
    address: ' Pune,  Ambegoun bk ');
