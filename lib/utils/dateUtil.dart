class DateUtil {

  static String getFormattedDate(DateTime date){
    var day = date.day;
    var month = date.month;
    var year = date.year;
    var hour = date.hour;
    var minute = date.minute;
    return "$day / $month / $year , $hour:$minute";
  }
}