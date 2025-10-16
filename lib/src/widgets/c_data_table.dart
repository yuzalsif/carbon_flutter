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
  const CDataTable({
    super.key,
    required this.columns,
    required this.rows,
    this.minWidth,
    this.dataRowHeight = 52.0,
  });

  final List<CDataColumn> columns;
  final List<Map<String, dynamic>> rows;
  final double? minWidth;
  final double dataRowHeight;

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
  void didUpdateWidget(CDataTable oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.rows != oldWidget.rows) {
      setState(() {
        _sortedRows = List.from(widget.rows);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final headerColor = isDark
        ? CColors.backgroundSubtleInverse
        : CColors.backgroundSubtle;

    final rowColor = isDark
        ? CColors.backgroundInverse
        : CColors.backgroundComponent;
    final dividerColor = isDark ? CColors.borderInverse : CColors.borderSubtle;

    return Theme(
      data: Theme.of(context).copyWith(
        dividerTheme: DividerThemeData(
          color: dividerColor,
          space: 1,
          thickness: 1,
        ),
      ),
      child: Material(
        color: rowColor,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: widget.minWidth ?? 0.0),
            child: DataTable(
              sortColumnIndex: _sortColumnIndex,
              sortAscending: _sortAscending,

              headingRowColor: WidgetStateProperty.all(headerColor),
              dataRowMaxHeight: widget.dataRowHeight,
              dataRowMinHeight: widget.dataRowHeight,

              dataRowColor: WidgetStateProperty.resolveWith<Color?>((
                Set<WidgetState> states,
              ) {
                if (states.contains(WidgetState.hovered)) {
                  return Theme.of(context).hoverColor;
                }
                return null; // Use default color for other states
              }),

              columns: widget.columns.map((col) {
                return DataColumn(
                  label: Text(
                    col.label,
                    style: CTypography.label01.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onSort: (index, ascending) => _sort(index, ascending),
                );
              }).toList(),

              rows: _sortedRows.map((row) {
                return DataRow(
                  cells: widget.columns.map((col) {
                    final cellContent = row[col.key];
                    final Widget cellWidget = cellContent is Widget
                        ? cellContent
                        : Text(
                            cellContent?.toString() ?? '',
                            style: CTypography.bodyCompact01,
                          );

                    return DataCell(
                      Align(alignment: Alignment.centerLeft, child: cellWidget),
                    );
                  }).toList(),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
