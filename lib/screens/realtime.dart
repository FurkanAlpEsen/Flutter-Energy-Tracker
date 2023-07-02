import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../models/employee.dart';

class RealTimePage extends StatefulWidget {
  const RealTimePage({super.key});

  @override
  State<RealTimePage> createState() => _RealTimePageState();
}

class _RealTimePageState extends State<RealTimePage> {
  List<Employee> employees = <Employee>[];
  late EmployeeDataSource employeeDataSource;

  @override
  void initState() {
    super.initState();
    employees = getEmployeeData();
    employeeDataSource = EmployeeDataSource(employeeData: employees);
  }

  @override
  Widget build(BuildContext context) {
    return SfDataGrid(
      columnSizer: ColumnSizer(),
      source: employeeDataSource,
      columnWidthMode: ColumnWidthMode.auto,
      columns: <GridColumn>[
        GridColumn(
          width: 150,
           allowSorting: true,
            columnName: 'id',
            label: Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: const Text('ID',))),
        GridColumn(
          width: 150,
           allowSorting: true,
            columnName: 'isim',
            label: Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: const Text('İsim'))),
        GridColumn(
          width: 150,
           allowSorting: true,
            columnName: 'görev',
            label: Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: const Text('Görev',
                    overflow: TextOverflow.ellipsis))),
        GridColumn(
          width: 150,
          allowSorting: true,
            columnName: 'giriş saati',
            label: Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: const Text('Giriş Saati'))),
      ],
        selectionMode: SelectionMode.single,
      navigationMode: GridNavigationMode.cell,
    );
  }

  List<Employee> getEmployeeData() {
    return [
      Employee(10001, 'Hasan', 'Şef', '12:00'),
      Employee(10002, 'Nil', 'Proje Yöneticisi', '10:30'),
      Employee(10003, 'Alara', 'Konrol Şefi', '10:00'),
      Employee(10004, 'Murat', 'İşçi', '08:00'),
      Employee(10005, 'Ali', 'İşçi', '08:00'),
      Employee(10006, 'Keskin', 'İletim Takipçisi', '07:30'),
      Employee(10007, 'Beyza', 'İşçi', '08:00'),
      Employee(10008, 'Celal', 'Kontrol Şefi', '06:45'),
      Employee(10009, 'Sefa', 'Yetkili', '13:45'),
      Employee(10010, 'Sezgin', 'Denetleyici', '15:45')
    ];
  }
}

class EmployeeDataSource extends DataGridSource {
  /// Creates the employee data source class with required details.
  EmployeeDataSource({required List<Employee> employeeData}) {
    _employeeData = employeeData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'id', value: e.id),
              DataGridCell<String>(columnName: 'name', value: e.name),
              DataGridCell<String>(
                  columnName: 'designation', value: e.designation),
              DataGridCell<String>(columnName: 'salary', value: e.hour),
            ]))
        .toList();
  }

  List<DataGridRow> _employeeData = [];

  @override
  List<DataGridRow> get rows => _employeeData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: Text(e.value.toString()),
      );
    }).toList());
  }
}
