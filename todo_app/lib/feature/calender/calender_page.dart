import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';

class CalenderPage extends StatefulWidget {
  final List<Map<String, dynamic>> allTasks;

  const CalenderPage({super.key, required this.allTasks});

  @override
  State<CalenderPage> createState() => _CalenderPageState();
}

class _CalenderPageState extends State<CalenderPage> {
  DateTime selectedDate = DateTime.now();
  bool showCompleted = false;

  void _toggleTaskComplete(Map<String, dynamic> task) {
    setState(() {
      task['completed'] = !(task['completed'] ?? false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final tasksForView = widget.allTasks.where((task) {
      DateTime taskDate = task['date'];
      bool sameDate = taskDate.year == selectedDate.year &&
          taskDate.month == selectedDate.month &&
          taskDate.day == selectedDate.day;
      bool statusMatch = showCompleted ? (task['completed'] ?? false) : !(task['completed'] ?? false);
      return sameDate && statusMatch;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            'assets/nav/mk.svg',
            width: 24.w,
            height: 24.h,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 24.r,
              child: Image.asset(
                'assets/logo/daily.png',
                height: 44.h,
                width: 44.w,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: EasyDateTimeLine(
              initialDate: selectedDate,
              onDateChange: (date) {
                setState(() {
                  selectedDate = date;
                });
              },
              activeColor: Colors.deepPurple,
              dayProps: const EasyDayProps(
                height: 70,
                width: 60,
                dayStructure: DayStructure.dayStrDayNum,
              ),
              headerProps: const EasyHeaderProps(
                showHeader: false,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        showCompleted = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          showCompleted ? Colors.grey : Colors.deepPurple,
                    ),
                    child: const Text('Today'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        showCompleted = true;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          showCompleted ? Colors.deepPurple : Colors.grey,
                    ),
                    child: const Text('Completed'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: tasksForView.isEmpty
                ? const Center(
                    child: Text(
                      'No tasks for this day.',
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    itemCount: tasksForView.length,
                    itemBuilder: (context, index) {
                      final task = tasksForView[index];
                      return Card(
                        color: Colors.grey[900],
                        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        child: ListTile(
                          leading: IconButton(
                            icon: Icon(
                              task['completed'] ?? false
                                  ? Icons.check_circle
                                  : Icons.radio_button_unchecked,
                              color: task['completed'] ?? false
                                  ? Colors.deepPurple
                                  : Colors.grey,
                            ),
                            onPressed: () => _toggleTaskComplete(task),
                          ),
                          title: Text(
                            task['title'],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                task['time'],
                                style: const TextStyle(color: Colors.grey),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: task['tagColor'],
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      task['tags'],
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[800],
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Row(
                                      children: [
                                        const Icon(Icons.flag, size: 12, color: Colors.white),
                                        const SizedBox(width: 4),
                                        Text(
                                          '${task['count']}',
                                          style: const TextStyle(
                                              color: Colors.white, fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
