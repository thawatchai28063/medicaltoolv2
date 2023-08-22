import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';

import 'package:intl/intl.dart';

double calculateDistance(double lat1, double lng1, double lat2, double lng2) {
  double distance = 0;

  var p = 0.017453292519943295;
  var c = cos;
  var a = 0.5 -
      c((lat2 - lat1) * p) / 2 +
      c(lat1 * p) * c(lat2 * p) * (1 - c((lng2 - lng1) * p)) / 2;
  distance = 12742 * asin(sqrt(a));

  return distance;
}

String ce2cbe(DateTime value) {
  int year = (value.year + 543);
  int month = value.month;
  int day = value.day;
  String sMonth;
  switch (month) {
    case 1:
      sMonth = 'ม.ค.';
      break;
    case 2:
      sMonth = 'ก.พ.';
      break;
    case 3:
      sMonth = 'มี.ค.';
      break;
    case 4:
      sMonth = 'เม.ย.';
      break;
    case 5:
      sMonth = 'พ.ค.';
      break;
    case 6:
      sMonth = 'มิ.ย.';
      break;
    case 7:
      sMonth = 'ก.ค.';
      break;
    case 8:
      sMonth = 'ส.ค.';
      break;
    case 9:
      sMonth = 'ก.ย.';
      break;
    case 10:
      sMonth = 'ต.ค.';
      break;
    case 11:
      sMonth = 'พ.ย.';
      break;
    case 12:
      sMonth = 'ธ.ค.';
      break;
    default:
      sMonth = '';
      break;
  }
  return '$day $sMonth $year';
}

String ce2dmy(DateTime value) {
  String year = (value.year + 543).toString();
  String month = value.month.toString();
  String day = value.day.toString();
  month = month.padLeft(2, '0');
  day = day.padLeft(2, '0');
  return day + month + year;
}

String ce2dmySlash(DateTime value) {
  String year = (value.year + 543).toString();
  String month = value.month.toString();
  String day = value.day.toString();
  month = month.padLeft(2, '0');
  day = day.padLeft(2, '0');
  return '$day/$month/$year';
}

String ce2ThaiDay(DateTime value) {
  int day = value.weekday;
  String thaiDay = '';
  switch (day) {
    case 1:
      thaiDay = 'วันจันทร์';
      break;
    case 2:
      thaiDay = 'วันอังคาร';
      break;
    case 3:
      thaiDay = 'วันพุธ';
      break;
    case 4:
      thaiDay = 'วันพฤหัสฯ';
      break;
    case 5:
      thaiDay = 'วันศุกร์';
      break;
    case 6:
      thaiDay = 'วันเสาร์';
      break;
    case 7:
      thaiDay = 'วันอาทิตยื';
      break;
  }
  return thaiDay;
}

String ce2time(DateTime value) {
  final components = value.toString().split(' ');
  final timeComponent = components[1].split('.');
  return timeComponent[0];
}

String ce2ymd(DateTime value) {
  String year = (value.year + 543).toString();
  String month = value.month.toString();
  String day = value.day.toString();
  month = month.padLeft(2, '0');
  day = day.padLeft(2, '0');
  return year + month + day;
}

String dmy2cbe(String value) {
  return ce2cbe(dmy2ce(value));
}

DateTime dmy2ce(String value) {
  String dmy = value.replaceAll('/', '');
  int day = int.parse(dmy.substring(0, 2));
  int month = int.parse(dmy.substring(2, 4));
  int year = int.parse(dmy.substring(4)) - 543;
  return DateTime(year, month, day);
}

String dmyToYmd(String value) {
  final components = value.split('/');
  return components[2] + components[1] + components[0];
}

bool isBeyondNow(String value) {
  final components = value.split('/');
  final now = DateTime.now();
  int day = int.parse(components[0]);
  int month = int.parse(components[1]);
  int year = int.parse(components[2]) - 543;
  final toDate = DateTime(year, month, day);
  return toDate.isAfter(now);
}

bool isTrueDate(String value) {
  final components = value.split("/");
  if (components.length == 3) {
    final day = int.tryParse(components[0]);
    final month = int.tryParse(components[1]);
    final year = int.tryParse(components[2])! - 543;

    // ignore: unnecessary_null_comparison
    if (day != null && month != null && year != null && year > 1800) {
      final date = DateTime(year, month, day);
      if (date.year == year && date.month == month && date.day == day) {
        return true;
      }
    }
  }
  return false;
}

String textToMd5(String input) {
  return md5.convert(utf8.encode(input)).toString();
}

String ymd2dmySlash(String value) {
  return '${value.substring(6)}/${value.substring(4, 6)}/${value.substring(0, 4)}';
}

DateTime ymd2ce(String value) {
  int year = int.parse(value.substring(0, 4)) - 543;
  int month = int.parse(value.substring(4, 6));
  int day = int.parse(value.substring(6, 8));
  return DateTime(year, month, day);
}

String formatDateTime(DateTime dateTime) {
  return DateFormat('HH:mm:ss').format(dateTime);
}

String formatFullDatetime(DateTime dateTime) {
  return DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);
}

DateTime stringToDateTime(String stringDate) {
  String sDate = stringDate.replaceAll('-', '');
  String sYear = sDate.substring(0, 4);
  if (sYear.substring(0, 2).compareTo('25') >= 0) {
    sYear = (int.parse(sYear) - 543).toString();
  }
  // print(sYear.substring(0, 2));
  String stringToConvert =
      '$sYear-${sDate.substring(4, 6)}-${sDate.substring(6, 8)}${sDate.substring(8)}';
  return DateTime.parse(stringToConvert);
}
