class UserModel{
  String userId;
  String userName;
  String userEmail;
  String userProfilePicture;
  String userAddress;
  int userPhoneNumber;
  
  UserModel({
    this.userEmail,
    this.userId,
    this.userName,
    this.userProfilePicture,
    this.userAddress,
    this.userPhoneNumber
  });

  String get getUserId => this.userId;
  String get getUserEmail => this.userEmail;
  String get getUserName => this.userName;
  String get getUserAddress => this.userAddress;
  int get getUserPhoneNumber => this.userPhoneNumber;
  String get getUserProfilePic => this.userProfilePicture;

  Map toMap(UserModel userModel){
    var data = Map<String, dynamic>();
    data['name'] = userModel.userName;
    data['uid'] = userModel.userId;
    data['email'] = userModel.userEmail;
    data['profile_picture'] = userModel.userProfilePicture;
    data['phone_number'] = userModel.userPhoneNumber;
    data['address'] = userModel.userAddress;
    return data;
  }

  UserModel fromMap(Map map){
    this.userId = map['uid'];
    this.userEmail = map['email'];
    this.userName = map['name'];
    this.userProfilePicture = map['profile_picture'];
    this.userAddress = map['address'];
    this.userPhoneNumber = map['phone_number'];
  }

}