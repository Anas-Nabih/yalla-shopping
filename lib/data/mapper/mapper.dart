import 'package:yalla_shopping/common_utils/res/constatnts.dart';
import 'package:yalla_shopping/data/responses/base_response.dart';
import 'package:yalla_shopping/domain/models/onboarding_model.dart';
import 'package:yalla_shopping/app/extention.dart';

extension CustomResponseMapper on CustomerResponse? {
  Customer toDomain() {
    return Customer(
        email: this?.email.orEmpty() ?? Const.EMPTY,
        name: this?.name.orEmpty() ?? Const.EMPTY,
        phone: this?.phone.orEmpty() ?? Const.EMPTY,
        id: this?.id.orEmpty() ?? Const.EMPTY,
        role: this?.role.orEmpty() ?? Const.EMPTY,
        numOfNotifications: this?.numOfNotifications.orZero() ?? Const.ZERO);
  }
}


extension AuthenticationResponseMapper on AuthenticationResponse?{
  Authentication toDomain(){
    return Authentication(customer: this?.customer.toDomain());
  }
}
