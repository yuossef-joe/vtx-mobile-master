import 'package:applocation/app/constants.dart';
import 'package:applocation/app/constants/functions.dart';

import '../../domain/model/models.dart';
import '../response/responses/user_responses.dart';

extension UserResponseMapper on UserResponse? {
  User toDomain() {
    return User(
      this?.id ?? Constants.zero,
      this?.name ?? Constants.empty,
      this?.email ?? Constants.empty,
      this?.prefix ?? Constants.empty,
      this?.phone ?? Constants.empty,
      this?.emailVerifiedAt ?? Constants.empty,
      this?.roles ?? [],
      isValidUrl(this?.avatar) ? this?.avatar?? Constants.empty: Constants.baseUrlImages+(this?.avatar?? Constants.empty),
      this?.active ?? Constants.zero,
    );
  }
}

extension UserDataResponseMapper on UserDataResponse? {
  UserNested toDomain() {
    return UserNested(
        this?.user.toDomain(),
    ) ;
  }
}

extension UserApiResponseMapper on UserApiResponse? {
  UserApi toDomain() {
    return UserApi(
      this?.data.toDomain(),
    );
  }
}
