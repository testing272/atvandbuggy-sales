import 'package:atvandbuggy_sales_app/app/component/sale_component.dart';
import 'package:atvandbuggy_sales_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../controller/sale_controller.dart';

class SaleSection extends StatefulWidget {
  const SaleSection({super.key});

  @override
  State<SaleSection> createState() => _SaleSectionState();
}

class _SaleSectionState extends State<SaleSection> {
  DateTimeRange? selectedDateRange;
  final DateTime currentDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    DateTime lastMonthStart =
        DateTime(currentDate.year, currentDate.month - 1, 1);
    selectedDateRange = DateTimeRange(start: lastMonthStart, end: currentDate);
    Provider.of<SaleController>(context, listen: false)
        .fetchSalesData(selectedDateRange!);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppTheme>(builder: (context, theme, child) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          InkWell(
            onTap: () async {
              DateTimeRange? picked = await showDateRangePicker(
                context: context,
                firstDate: DateTime(2020), // Set to the earliest allowed date
                lastDate: DateTime(currentDate.year, currentDate.month,
                    currentDate.day), // Limit future dates
                initialDateRange: selectedDateRange,
                builder: (context, child) {
                  return Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: ColorScheme.light(
                        primary: theme.primaryColor,
                      ),
                    ),
                    child: child!,
                  );
                },
              );
              if (picked != null) {
                setState(() {
                  selectedDateRange = picked;
                  Provider.of<SaleController>(context, listen: false)
                      .fetchSalesData(selectedDateRange!);
                });
              }
            },
            child: Text(
              selectedDateRange != null
                  ? '${DateFormat.yMMM().format(selectedDateRange!.start)} - ${DateFormat.yMMM().format(selectedDateRange!.end)}'
                  : 'Select Date Range',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp,
                  decoration: TextDecoration.underline,
                  color: Color(0xff622E9D)),
            ),
          ),
          5.verticalSpace,
          SaleComponent(),
        ],
      );
    });
  }
}
