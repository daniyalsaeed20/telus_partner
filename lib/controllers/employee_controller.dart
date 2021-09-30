import 'package:get/get.dart';
import 'package:telus_partner_non_responsive/controllers/db_controller.dart';
import 'package:telus_partner_non_responsive/controllers/user_data_controller.dart';
import 'package:telus_partner_non_responsive/models/user_data_model.dart';

class EmployeeController extends GetxController {
  /* -------------------------------------------------------------------------- */
  /*                                  Variables                                 */
  /* -------------------------------------------------------------------------- */

  static int selectedTab = 0;

  /* -------------------------------------------------------------------------- */
  /*                                    lIST                                    */
  /* -------------------------------------------------------------------------- */

  /* -------------------------------------------------------------------------- */
  /*                                  Functions                                 */
  /* -------------------------------------------------------------------------- */

  saveEmployee() {
    UserDataController userDataController = Get.put(UserDataController());
    userDataController.getDateTime();
    DbController dbController = Get.put(DbController());
    UserDataModel userModel = UserDataModel(
      email: UserDataController.emailController.text,
      firstName: UserDataController.firstNameController.text,
      isAllowed: true,
      lastName: UserDataController.lastNameController.text,
      leadIds: 0,
      dateAdded: userDataController.date,
      organization: userDataController.userDataModel.organization,
      password: UserDataController.passwordController.text,
      type: "Employee",
    );
    dbController.addEmployee(userModel);
  }
}
