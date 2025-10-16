import 'package:flutter/material.dart';
import 'package:carbon_flutter/carbon_flutter.dart';

class DataTableExample extends StatelessWidget {
  const DataTableExample({super.key});

  final _columns = const [
    CDataColumn(label: 'Name', key: 'name'),
    CDataColumn(label: 'ID', key: 'id'),
    CDataColumn(label: 'Status', key: 'status'),
  ];

  final _rows = const [
    {'name': 'Yusef', 'id': 101, 'status': 'Active'},
    {'name': 'Alice', 'id': 102, 'status': 'Inactive'},
    {'name': 'Bob', 'id': 103, 'status': 'Active'},
    {'name': 'Charlie', 'id': 104, 'status': 'Pending'},
  ];

  @override
  Widget build(BuildContext context) {
    return CCard(
      child: CDataTable(columns: _columns, rows: _rows),
    );
  }
}
