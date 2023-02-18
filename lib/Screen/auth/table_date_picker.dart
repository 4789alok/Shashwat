import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class TableDatePicker extends StatefulWidget {
  final TextEditingController dateController;
  const TableDatePicker({super.key, required this.dateController});

  @override
  State<TableDatePicker> createState() => _TableDatePickerState();
}

class _TableDatePickerState extends State<TableDatePicker> {
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 400,
        child: TableCalendar(
          startingDayOfWeek: StartingDayOfWeek.sunday,
          firstDay: DateTime.utc(2010, 10, 20),
          lastDay: DateTime.utc(2040, 10, 20),
          focusedDay: selectedDay,
          headerVisible: true,
          daysOfWeekVisible: true,
          onDaySelected: (DateTime selectDay, DateTime focusDay) {
            setState(() {
              selectedDay = selectDay;
              focusedDay = focusDay;
              print(selectDay);
              widget.dateController.text =
                  DateFormat(('MM/dd/yyyy')).format(selectedDay);
              Navigator.of(context).pop();
            });
          },
          calendarFormat: format,
          onFormatChanged: (CalendarFormat _format) {
            setState(() {
              format = _format;
            });
          },
          selectedDayPredicate: (DateTime date) {
            return isSameDay(selectedDay, date);
          },
          sixWeekMonthsEnforced: true,
          shouldFillViewport: false,
          headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              titleTextStyle: TextStyle(
                  fontSize: 20,
                  color: Color(0xFFff8000),
                  fontWeight: FontWeight.w800)),
          calendarStyle: const CalendarStyle(
              selectedTextStyle: TextStyle(color: Colors.white),
              todayDecoration: BoxDecoration(
                  color: Color(0xFFff8000), shape: BoxShape.circle),
              isTodayHighlighted: true,
              selectedDecoration: BoxDecoration(
                  color: Color(0xFF033d73), shape: BoxShape.circle),
              outsideDaysVisible: true,
              todayTextStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
