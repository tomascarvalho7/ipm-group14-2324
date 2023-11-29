import '../../../providers/feedback_controller.dart';

bool verifyUsername(FeedbackController controller, String name) {
  if (name.isEmpty) controller.setError("Username field is empty! Please write a valid username to register.");
  else return true;

  return false;
}

bool verifyEmail(FeedbackController controller, String email, bool login) {
  String operation = login ? "login" : "register";
  if (email.isEmpty) controller.setError("Email field is empty! Please write a valid email to $operation.");
  else if (!email.contains('@')) controller.setError("Invalid email! Please write a valid email to $operation.");
  else return true;

  return false;
}

bool verifyPassword(FeedbackController controller, String password, bool login) {
  String operation = login ? "login" : "register";
  if (password.isEmpty) controller.setError("Password field is empty! Please write a valid password to $operation.");
  else if (password.length < 6) controller.setError("Password field is too short! Please write a password with at least 7 characters.");
  else return true;

  return false;
}