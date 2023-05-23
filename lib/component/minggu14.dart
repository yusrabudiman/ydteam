import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class minggu14 extends StatefulWidget {
  const minggu14({Key? key});

  @override
  State<minggu14> createState() => _minggu14State();
}

class _minggu14State extends State<minggu14> {
  DateTimeRange? _dateRange;
  TextEditingController? _time;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pertemuan 14'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              // Date Range Picker
              Row(
                children: [
                  const Text('Tanggal: '),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      onTap: () async {
                        final initialDateRange = _dateRange ??
                            DateTimeRange(
                              start: DateTime.now(),
                              end: DateTime.now().add(const Duration(days: 7)),
                            );

                        final selectedDateRange = await showDateRangePicker(
                          context: context,
                          firstDate: DateTime(1990),
                          lastDate: DateTime(2250),
                          initialDateRange: initialDateRange,
                        );

                        if (selectedDateRange != null) {
                          setState(() {
                            _dateRange = selectedDateRange;
                          });
                        }
                      },
                      decoration: const InputDecoration(
                        labelText: 'Pilih Tanggal',
                        suffixIcon: Icon(Icons.date_range),
                      ),
                      readOnly: true,
                      controller: TextEditingController(
                        text: _dateRange != null
                            ? '${_dateRange!.start} - ${_dateRange!.end}'
                            : '',
                      ),
                    ),
                  ),
                ],
              ),
              if (_dateRange != null)
                Column(
                  children: _buildDateList(_dateRange!),
                ),
              const Divider(),

              // Time picker
              Row(
                children: [
                  const Text('Jam: '),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      enabled: false,
                      controller: _time,
                      decoration: const InputDecoration(labelText: 'Jam'),
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      final selectedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );

                      if (selectedTime != null) {
                        setState(() {
                          _time = TextEditingController(
                              text: selectedTime.format(context));
                        });
                      }
                    },
                    icon: const Icon(Icons.timer),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildDateList(DateTimeRange dateRange) {
    final startDate = dateRange.start;
    final endDate = dateRange.end;

    final dateList = <Widget>[];
    DateTime currentDate = startDate;

    while (currentDate.isBefore(endDate)) {
      dateList.add(
        ListTile(
          title: const Text('Tanggal Terpilih'),
          subtitle: Text(currentDate.toString()),
        ),
      );

      currentDate = currentDate.add(const Duration(days: 1));
    }

    return dateList;
  }
}
