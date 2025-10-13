import 'package:flutter/material.dart';
import 'package:carbon_flutter/carbon_flutter.dart';

/// A data model for a column in a [CDataTable].
class CDataColumn {
  const CDataColumn({required this.label, required this.key});
  final String label;
  final String key; // Corresponds to a key in the row data map
}

/// A Carbon Design System compliant Data Table.
///
/// This is a foundational implementation with client-side sorting.
class CDataTable extends StatefulWidget {
  const CDataTable({super.key, required this.columns, required this.rows});

  final List<CDataColumn> columns;
  final List<Map<String, dynamic>> rows;

  @override
  State<CDataTable> createState() => _CDataTableState();
}

class _CDataTableState extends State<CDataTable> {
  late List<Map<String, dynamic>> _sortedRows;
  int _sortColumnIndex = 0;
  bool _sortAscending = true;

  @override
  void initState() {
    super.initState();
    _sortedRows = List.from(widget.rows);
  }

  void _sort(int columnIndex, bool ascending) {
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
      final key = widget.columns[columnIndex].key;
      _sortedRows.sort((a, b) {
        final aValue = a[key];
        final bValue = b[key];
        if (aValue is Comparable) {
          return ascending
              ? aValue.compareTo(bValue)
              : bValue.compareTo(aValue);
        }
        return 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        sortColumnIndex: _sortColumnIndex,
        sortAscending: _sortAscending,
        headingRowColor: WidgetStateProperty.all(CColors.backgroundComponent),
        columns: widget.columns.map((col) {
          return DataColumn(
            label: Text(col.label, style: CTypography.label01),
            onSort: (index, ascending) => _sort(index, ascending),
          );
        }).toList(),
        rows: _sortedRows.map((row) {
          return DataRow(
            cells: widget.columns.map((col) {
              return DataCell(row[col.key]);
            }).toList(),
          );
        }).toList(),
      ),
    );
  }
}
