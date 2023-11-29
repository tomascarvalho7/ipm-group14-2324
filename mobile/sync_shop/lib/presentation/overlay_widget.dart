import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sync_shop/presentation/utils/custom_notification.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../providers/feedback_controller.dart';

/// This widget sits on top of all the others via go_router's Shell Route.
///
/// It's used to present information that needs to be shown all over the application's
/// screens like feedback notifications as well as their sounds.
class OverlayWidget extends StatefulWidget {
  final Widget child;

  const OverlayWidget({Key? key, required this.child}) : super(key: key);

  @override
  OverlayWidgetState createState() => OverlayWidgetState();
}

class OverlayWidgetState extends State<OverlayWidget> {

  @override
  Widget build(BuildContext context) =>
      Consumer<FeedbackController>(
          builder: (_, feedbackController, __)  {
            if (feedbackController.hasFeedback) {
              WidgetsBinding.instance.addPostFrameCallback(
                      (_) => displayNotification(context, feedbackController)
              );
            }
            return widget.child;
          }
      );

  void displayNotification(
      BuildContext context,
      FeedbackController feedbackController,
      ) {
    final feedback = feedbackController.feedback; // read feedback
    if (feedback == null) return; // do nothing if null

    showTopSnackBar(
      Overlay.of(context),
      CustomNotification(
        title: feedback.isRight ? "Success" : "Error",
        message: feedback.isRight ? feedback.right : feedback.left,
        success: feedback.isRight,
      ),
    );
    feedbackController.clearFeedback(); // clear feedback
  }
}