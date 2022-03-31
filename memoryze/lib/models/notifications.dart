
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

Future<void> createNotification(String title, String description) async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
        id:  createUniqueId(),
        channelKey: 'basic_channel',
        title: title,
        body: description,
        notificationLayout: NotificationLayout.BigText
    ),
  );
}

Future<void> createScheduledNotification(Appointment appointment) async {
  await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: createUniqueId(),
        channelKey: 'scheduled_channel',
        title: appointment.subject,
        body: appointment.notes,
        notificationLayout: NotificationLayout.Default,
      ),
      actionButtons: [
        NotificationActionButton(
          key: 'MARK_DONE',
          label: 'Mark done',
        ),
      ],

      schedule: NotificationCalendar(
        repeats: false,
        hour: appointment.endTime.hour,
        weekday: appointment.endTime.weekday,
        minute: appointment.endTime.minute,
        month: appointment.endTime.month,
        year: appointment.endTime.year,
      )
  );
}

int createUniqueId() {
  return DateTime.now().millisecondsSinceEpoch.remainder(100000);
}