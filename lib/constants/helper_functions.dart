import 'package:form_field_validator/form_field_validator.dart';

final passwordValidator = MultiValidator([
  RequiredValidator(errorText: 'password is required'),
  // MinLengthValidator(6,
  //     errorText: 'password must be at least 6 characters long'),
  // MaxLengthValidator(30, errorText: 'password must be at most 30 character'),
  // // PatternValidator(r'(?=.*?[#?!@$%^&*-])',
  // //     errorText: 'passwords must have at least one special character'),
  // // PatternValidator(r'^(?=.*?[A-Z])',
  // //     errorText: 'passwords must have at least one UPPER character'),
  // // PatternValidator(r'^(?=.*?[a-z])',
  // //     errorText: 'passwords must have at least one lower character'),
  // PatternValidator(r'^(?=.*?[0-9])',
  //     errorText: 'passwords must have at least one Numeric character'),
  // // PatternValidator(
  // //     r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
  // //     errorText:
  // //         'passwords must have at least one upper letter, one lower letter, one number, and one special character'),
]);

final confirmPasswordValidator = MultiValidator([
  RequiredValidator(errorText: 'password is required'),
]);

final emailValidator = MultiValidator([
  RequiredValidator(errorText: 'email is required'),
  // EmailValidator(errorText: 'enter a valid email'),
  // PatternValidator(
  //     r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$",
  //     errorText: 'enter a valid email')
]);

final firstNameValidator = MultiValidator([
  RequiredValidator(errorText: 'first name is required'),
  // MinLengthValidator(1,
  //     errorText: 'first name must be at least 1 characters long'),
  // MaxLengthValidator(30,
  //     errorText: 'first name must not be more than 30 characters'),
  // PatternValidator(r"^([A-Z][A-Za-z.'\-]+)$",
  //     errorText: 'Capitalise first letter or remove spaces')
]);

final lastNameValidator = MultiValidator([
  RequiredValidator(errorText: 'last name is required'),
  // MinLengthValidator(1,
  //     errorText: 'last name must be at least 1 characters long'),
  // MaxLengthValidator(30,
  //     errorText: 'last name must not be more than 30 characters'),
  // PatternValidator(r"^([A-Z][A-Za-z.'\-]+)$",
  //     errorText: 'Capitalise first letter or remove spaces')
]);

final organizationValidator = MultiValidator([
  RequiredValidator(errorText: 'Organization name is required'),
  // MinLengthValidator(1,
  //     errorText: 'Organization name must be at least 1 characters long'),
  // MaxLengthValidator(30,
  //     errorText: 'Organization name must not be more than 30 characters'),
]);
final userTypeValidator = MultiValidator([
  RequiredValidator(errorText: 'user type is required'),
  // MinLengthValidator(1,
  //     errorText: 'user type must be at least 1 characters long'),
  // MaxLengthValidator(30,
  //     errorText: 'user type must not be more than 30 characters'),
]);

final phoneNumberValidator = MultiValidator([
  RequiredValidator(errorText: 'phone number is required'),
  // MinLengthValidator(10, errorText: 'enter a valid phone number.'),
]);

final additionalInfoValidator = MultiValidator([
  MinLengthValidator(0, errorText: 'enter info.'),
]);

final fieldValidator = MultiValidator([
  RequiredValidator(errorText: 'field is required'),
]);
