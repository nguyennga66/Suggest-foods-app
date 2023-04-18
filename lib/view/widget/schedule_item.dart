import 'package:flutter/material.dart';
import 'package:suggest_food_app/view/screens/edit_schedule_screen.dart';

class ScheduleItem extends StatefulWidget {
  String? id;
  bool isChoose;
  String? name;
  DateTime? applyDate;
  ScheduleItem(
      {super.key, this.id, required this.isChoose, this.name, this.applyDate});

  @override
  State<ScheduleItem> createState() => _ScheduleItemState();
}

class _ScheduleItemState extends State<ScheduleItem> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: widget.isChoose,
      onChanged: (value) => setState(() {
        widget.isChoose = !widget.isChoose;
      }),
      activeColor: Theme.of(context).primaryColor,
      checkColor: Theme.of(context).accentColor,
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(
        widget.name!,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 18,
        ),
      ),
      subtitle: Text(widget.applyDate.toString()),
      contentPadding: const EdgeInsets.all(0),
      tristate: true,
      secondary: Container(
        width: 96,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              padding: EdgeInsets.all(0),
              style: IconButton.styleFrom(
                padding: EdgeInsets.all(0),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(EditScheduleScreen.routeName,
                    arguments: widget.id);
              },
              icon: Icon(
                Icons.edit,
                color: Theme.of(context).primaryColor,
              ),
            ),
            IconButton(
              padding: EdgeInsets.all(0),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => SimpleDialog(
                    title: Text("Delete"),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    children: [
                      const Text('Are you sure you want to delete schedules?'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('No'),
                          ),
                          TextButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Delete successful!',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              );
                              Navigator.of(context).pop();
                            },
                            child: Text('Yes'),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
