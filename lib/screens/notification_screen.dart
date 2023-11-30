import 'package:flutter/material.dart';
import 'package:morshed_mock_app/models/notification_model.dart';

class NotificationScreen extends StatelessWidget {
   NotificationScreen({super.key});

  final List<ExamNotification> notifications = [
     ExamNotification(
       className: 'Biology',
       classAvatar: 'https://via.placeholder.com/150',
       textBody: 'Biology midterm approaching. Prepare thoroughly!',
       createdAt: DateTime.now().add(const Duration(days: 10)),
     ),
     ExamNotification(
       className: 'Chemistry',
       classAvatar: 'https://via.placeholder.com/150',
       textBody: 'Chemistry final exam is coming up. Revise well!',
       createdAt: DateTime.now().add(const Duration(days: 20)),
     ),
     ExamNotification(
       className: 'Mathematics',
       classAvatar: 'https://via.placeholder.com/150',
       textBody: 'Mathematics test next week. Practice problems!',
       createdAt: DateTime.now().add(const Duration(days: 7)),
     ),
     ExamNotification(
       className: 'History',
       classAvatar: 'https://via.placeholder.com/150',
       textBody: 'History quiz on Monday. Review the key events!',
       createdAt: DateTime.now().add(const Duration(days: 3)),
     ),
     ExamNotification(
       className: 'English',
       classAvatar: 'https://via.placeholder.com/150',
       textBody: 'English literature assignment due soon. Finish writing!',
       createdAt: DateTime.now().add(const Duration(days: 5)),
     ),
     ExamNotification(
       className: 'Computer Science',
       classAvatar: 'https://via.placeholder.com/150',
       textBody: 'Computer Science project deadline extended. Keep coding!',
       createdAt: DateTime.now().add(const Duration(days: 12)),
     ),
     ExamNotification(
       className: 'Geography',
       classAvatar: 'https://via.placeholder.com/150',
       textBody: 'Geography field trip scheduled. Prepare necessary materials!',
       createdAt: DateTime.now().add(const Duration(days: 18)),
     ),
     ExamNotification(
       className: 'Art',
       classAvatar: 'https://via.placeholder.com/150',
       textBody: 'Art exhibition next month. Create your masterpiece!',
       createdAt: DateTime.now().add(const Duration(days: 25)),
     ),
     ExamNotification(
       className: 'Physical Education',
       classAvatar: 'https://via.placeholder.com/150',
       textBody: 'Physical Education fitness test coming soon. Train hard!',
       createdAt: DateTime.now().add(const Duration(days: 9)),
     ),
     ExamNotification(
       className: 'Music',
       classAvatar: 'https://via.placeholder.com/150',
       textBody: 'Music composition deadline approaching. Compose your music!',
       createdAt: DateTime.now().add(const Duration(days: 15)),
     ),
     ExamNotification(
       className: 'Economics',
       classAvatar: 'https://via.placeholder.com/150',
       textBody: 'Economics group project due date set. Collaborate effectively!',
       createdAt: DateTime.now().add(const Duration(days: 22)),
     ),
     ExamNotification(
       className: 'Psychology',
       classAvatar: 'https://via.placeholder.com/150',
       textBody: 'Psychology experiment in progress. Gather data!',
       createdAt: DateTime.now().add(const Duration(days: 8)),
     ),
     ExamNotification(
       className: 'Sociology',
       classAvatar: 'https://via.placeholder.com/150',
       textBody: 'Sociology debate next Thursday. Prepare your arguments!',
       createdAt: DateTime.now().add(const Duration(days: 6)),
     ),
     ExamNotification(
       className: 'Language Studies',
       classAvatar: 'https://via.placeholder.com/150',
       textBody: 'Language Studies presentation due soon. Practice pronunciation!',
       createdAt: DateTime.now().add(const Duration(days: 13)),
     ),
     ExamNotification(
       className: 'Business Studies',
       classAvatar: 'https://via.placeholder.com/150',
       textBody: 'Business Studies case study analysis required. Analyze thoroughly!',
       createdAt: DateTime.now().add(const Duration(days: 16)),
     ),
     ExamNotification(
       className: 'Political Science',
       classAvatar: 'https://via.placeholder.com/150',
       textBody: 'Political Science mock election preparation ongoing. Campaign!',
       createdAt: DateTime.now().add(const Duration(days: 11)),
     ),
     ExamNotification(
       className: 'Health Education',
       classAvatar: 'https://via.placeholder.com/150',
       textBody: 'Health Education seminar next week. Attend and take notes!',
       createdAt: DateTime.now().add(const Duration(days: 4)),
     ),
     ExamNotification(
       className: 'Drama',
       classAvatar: 'https://via.placeholder.com/150',
       textBody: 'Drama rehearsal schedule released. Rehearse your lines!',
       createdAt: DateTime.now().add(const Duration(days: 19)),
     ),
     ExamNotification(
       className: 'Astronomy',
       classAvatar: 'https://via.placeholder.com/150',
       textBody: 'Astronomy stargazing event planned. Observe celestial objects!',
       createdAt: DateTime.now().add(const Duration(days: 21)),
     ),
     ExamNotification(
       className: 'Physical Science',
       classAvatar: 'https://via.placeholder.com/150',
       textBody: 'Physical Science lab report due. Conduct experiments!',
       createdAt: DateTime.now().add(const Duration(days: 17)),
     ),
   ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exam Reminders'),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(notifications[index].classAvatar),
              ),
              title: Text(notifications[index].className),
              subtitle: Text(notifications[index].textBody),
              trailing: Text(
                _formatDate(notifications[index].createdAt),
                style: const TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          );
        },
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month}-${date.day}';
  }
}