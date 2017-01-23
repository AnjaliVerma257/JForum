package JForum;

import java.util.Date;

public class FindDays{
   public int numberOfDays(String fromDate,String toDate)
   {    
       java.util.Calendar cal1 = new java.util.GregorianCalendar();
       java.util.Calendar cal2 = new java.util.GregorianCalendar();

       //split year, month and days from the date using StringBuffer.
       String sBuffer = fromDate;
       String yearFrom = sBuffer.substring(6);
       String monFrom = sBuffer.substring(0,2);
       String ddFrom = sBuffer.substring(3,5);
       int intYearFrom = Integer.parseInt(yearFrom);
       int intMonFrom = Integer.parseInt(monFrom);
       int intDdFrom = Integer.parseInt(ddFrom);

       // set the fromDate in java.util.Calendar
       cal1.set(intYearFrom, intMonFrom, intDdFrom);

       //split year, month and days from the date using StringBuffer.
       String sBuffer1 = toDate;
       int len=sBuffer1.length();
       String yearTo = sBuffer1.substring(6);
       String monTo = sBuffer1.substring(0,2);
       String ddTo = sBuffer1.substring(3,5);
       int intYearTo = toInt(yearTo);
       int intMonTo = toInt(monTo);
       int intDdTo = toInt(ddTo);

       // set the toDate in java.util.Calendar
       cal2.set(intYearTo, intMonTo, intDdTo);

       //call method daysBetween to get the number of days between two dates
       int days = daysBetween(cal1.getTime(),cal2.getTime());
       return days;
   }
public static int toInt(String str) {
    int answer = 0, factor = 1;
    for (int i = str.length()-1; i >= 0; i--) {
        answer += (str.charAt(i) - '0') * factor;
        factor *= 10;
    }
    return answer;
}
   //This method is called by the above method numberOfDays
   public int daysBetween(Date d1, Date d2)
   {
      return (int)( (d2.getTime() - d1.getTime()) / (1000 * 60 * 60 * 24));
   }
   public static void main(String args[]){
      FindDays obj= new FindDays();
      int num= obj.numberOfDays("01-01-1970", "07-25-1992");
      System.out.println("Number of days between mentioned dates are: "+num);
   }
}