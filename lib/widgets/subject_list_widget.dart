import 'package:flutter/material.dart';
import 'package:morshed_mock_app/colors.dart';
import 'package:morshed_mock_app/models/subject_model.dart';
import 'package:morshed_mock_app/widgets/circular_progress_indicator.dart';

class SubjectListWidget extends StatelessWidget {
   SubjectListWidget({super.key});

  final List<SubjectModel> subjects = [
    SubjectModel(name: 'Computer Science', imageUrl: 'https://via.placeholder.com/150', progress: 0.1),
    SubjectModel(name: 'Physics', imageUrl: 'https://via.placeholder.com/150', progress: 0.2),
    SubjectModel(name: 'Science', imageUrl: 'https://via.placeholder.com/150', progress: 0.3),
    SubjectModel(name: 'Chemistry', imageUrl: 'https://via.placeholder.com/150', progress: 0.4),
    SubjectModel(name: 'Math', imageUrl: 'https://via.placeholder.com/150', progress: 0.5),
    SubjectModel(name: 'English', imageUrl: 'https://via.placeholder.com/150', progress: 0.6),
    SubjectModel(name: 'Geography', imageUrl: 'https://via.placeholder.com/150', progress: 0.7),
    SubjectModel(name: 'Art', imageUrl: 'https://via.placeholder.com/150', progress: 0.7),
    SubjectModel(name: 'History', imageUrl: 'https://via.placeholder.com/150', progress: 0.8),
    SubjectModel(name: 'Biology', imageUrl: 'https://via.placeholder.com/150', progress: 0.9),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: subjects.length,
      itemBuilder: (context, index) {
        return Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.network(
                  subjects[index].imageUrl,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Text(subjects[index].name ,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),),

            const Spacer(),

            CircularPercentIndicator(
              radius: 45,
              lineWidth: 5.0,
              percent: subjects[index].progress ,
              progressColor : getColorFromPercentage(subjects[index].progress),
              backgroundColor: Colors.grey.shade200,
              center:  Text(
                '${(subjects[index].progress * 100).toStringAsFixed(0)}%',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(width: 16),


          ],
        );
      },
    );
  }

   Color getColorFromPercentage(double percentage) {
     if (percentage < 0.5) {
       return const Color(0xffEF4444);
     } else if (percentage >= 0.5 && percentage < 0.7) {
       return const Color(0xffFB923C);
     } else {
       return const Color(0xff22C55E);
     }
   }
}
