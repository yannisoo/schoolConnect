import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_app/config/router/app_router.dart';
import 'package:school_app/data/features/lessons/lessons_provider.dart';
import 'package:school_app/data/features/teachers/teachers_provider.dart';
import 'package:school_app/data/models/teachers/teacher.dart';
import 'package:school_app/utils/modals.dart';

class LessonCreatePage extends ConsumerWidget {
  const LessonCreatePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createController = ref.read(lessonCreateProvider);
    final startTime = ref.watch(startTimeProvider);
    final endTime = ref.watch(endTimeProvider);
    final dateTime = ref.watch(dateTimeProvider);
    final teacherList = ref.watch(teacherListProvider);
    final currentTeacher = ref.watch(currentTeacherProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Lesson'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
        children: [
          TextFormField(
            controller: ref.watch(subjectProvider),
            decoration: const InputDecoration(labelText: 'Subject'),
          ),
          ElevatedButton(
            onPressed: () => createController.selectDate(context),
            child: Text('Day: ${dateTime.day}/${dateTime.month}'),
          ),
          ElevatedButton(
            onPressed: () => createController.selectStartTime(context),
            child: Text('Start Time: ${startTime.hour}:${startTime.minute}'),
          ),
          ElevatedButton(
            onPressed: () => createController.selectEndTime(context),
            child: Text('End Time: ${endTime.hour}:${endTime.minute}'),
          ),
          teacherList.when(
            data: (loadedTeacherList) => DropdownButton<Teacher>(
              value: currentTeacher,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (Teacher? value) {},
              items: loadedTeacherList
                  .map<DropdownMenuItem<Teacher>>((Teacher value) {
                return DropdownMenuItem<Teacher>(
                  value: value,
                  child: Text(value.name),
                );
              }).toList(),
            ),
            error: (e, s) => const Text('Error'),
            loading: CircularProgressIndicator.new,
          ),
          ElevatedButton(
            onPressed: () async {
              try {
                await createController.createLesson();
                await AutoRouter.of(context)
                    .replaceAll([const HomePageRoute()]);
              } catch (e) {
                errorModal(
                  context,
                  message: 'Error creating lesson: ${e.toString()}',
                );
              }
            },
            child: const Text('Créer'),
          ),
        ],
      ),
    );
  }
}
