import 'package:common_utils/common_utils.dart';

class DateTimeUtils {
  //根据给定的日期返回【xx年xx月xx日 xx时xx分】格式的日期
  static String formatTimeForStr({String time}) {
    String temp = DateUtil.getDateStrByMs(int.parse(time), format: DateFormat.YEAR_MONTH_DAY_HOUR_MINUTE);
    return DateUtil.formatZHDateTime(temp, DateFormat.YEAR_MONTH_DAY_HOUR_MINUTE, ":");
  }

  //根据给定的日期返回【xx月xx日】格式的日期
  static String getDayFromStr({String timeInMillSecondStr}) {
    String monthDay = DateUtil.getDateStrByMs(int.parse(timeInMillSecondStr), format: DateFormat.YEAR_MONTH_DAY_HOUR_MINUTE);
    return "${DateUtil.formatZHDateTime(monthDay, DateFormat.ZH_MONTH_DAY, null).replaceAll(" ", "")}";
  }

  //日期格式[xx月xx日 星期x]
  static String today() {
    String monthDay = DateUtil.getDateStrByMs(DateUtil.getNowDateMs(), format: DateFormat.YEAR_MONTH_DAY_HOUR_MINUTE);
    String weekDay = DateUtil.getWeekDay(DateTime.now());
    return "${DateUtil.formatZHDateTime(monthDay, DateFormat.ZH_MONTH_DAY, null).replaceAll(" ", "")} ${zhWeek(weekDay)}";
  }

  static int todayInMillSeconds() {
    return DateUtil.getNowDateMs();
  }

  static String nextOneDay() {
    int nextOneDayInMillSeconds = DateUtil.getNowDateMs() + 24 * 60 * 60 * 1000;
    String monthDay = DateUtil.getDateStrByMs(nextOneDayInMillSeconds, format: DateFormat.YEAR_MONTH_DAY_HOUR_MINUTE);
    String weekDay = DateUtil.getWeekDay(DateTime.fromMillisecondsSinceEpoch(nextOneDayInMillSeconds));
    return "${DateUtil.formatZHDateTime(monthDay, DateFormat.ZH_MONTH_DAY, null).replaceAll(" ", "")} ${zhWeek(weekDay)}";
  }

  static int nextOneDayInMillSeconds() {
    return DateUtil.getNowDateMs() + 24 * 60 * 60 * 1000;
  }

  static String nextTwoDay() {
    int nextTwoDayInMillSeconds = DateUtil.getNowDateMs() + 24 * 60 * 60 * 1000 * 2;
    String monthDay = DateUtil.getDateStrByMs(nextTwoDayInMillSeconds, format: DateFormat.YEAR_MONTH_DAY_HOUR_MINUTE);
    String weekDay = DateUtil.getWeekDay(DateTime.fromMillisecondsSinceEpoch(nextTwoDayInMillSeconds));
    return "${DateUtil.formatZHDateTime(monthDay, DateFormat.ZH_MONTH_DAY, null).replaceAll(" ", "")} ${zhWeek(weekDay)}";
  }

  static int nextTwoDayOneDayInMillSeconds() {
    return DateUtil.getNowDateMs() + 24 * 60 * 60 * 1000 * 2;
  }

  static String zhWeek(String enWeeDay) {
    String name = "";
    switch (enWeeDay) {
      case "Monday":
        name = "星期一";
        break;
      case "Tuesday":
        name = "星期二";
        break;
      case "Wednesday":
        name = "星期三";
        break;
      case "Thursday":
        name = "星期四";
        break;
      case "Friday":
        name = "星期五";
        break;
      case "Saturday":
        name = "星期六";
        break;
      case "Sunday":
        name = "星期日";
        break;
    }
    return name;
  }
}
