import 'package:flutter/cupertino.dart';

import '../utils/either.dart';

class FeedbackController with ChangeNotifier {
  FeedbackController();

  Either<String, String>? _feedbackResult;

  bool get hasFeedback => _feedbackResult != null;
  Either<String, String>? get feedback => _feedbackResult;

  /// Sets the [success] feedback and notifies the listener widgets.
  void setSuccessful(String successMsg) {
    _feedbackResult = Right(successMsg);
    notifyListeners();
  }

  /// Sets the [error] feedback and notifies the listener widgets.
  void setError(String errorMsg) {
    _feedbackResult = Left(errorMsg);
    notifyListeners();
  }

  /// Clears the feedback so the listeners do not have old feedbacks showing.
  void clearFeedback() {
    _feedbackResult = null;
  }
}