import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:manan_mobile/models/user_model.dart';

class FireStoreMethods {
  final FirebaseFirestore root = FirebaseFirestore.instance;

  Future<dynamic> addUserToFireStore({UserModel user,
      String username, String address, int phoneNumber}) {
    UserModel userModel = UserModel(
      userId: user.getUserId,
      userEmail: user.getUserEmail,
      userName: username ?? "Name",
      userProfilePicture: user.getUserProfilePic ?? "hello",
      userAddress: address ?? "address",
      userPhoneNumber: phoneNumber ?? 9999999999,
    );
    return root
        .collection("user")
        .doc(user.getUserId)
        .set(userModel.toMap(userModel));
  }
}
