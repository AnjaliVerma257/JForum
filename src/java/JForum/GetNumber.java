package JForum;
public class GetNumber {
 
    String s;
    

    /**
     *
     * @param s
     */
    public GetNumber(String s)
    {
        this.s=s;
    }
   public String number()
   {
       
        int len=(s.length())-1;
        String no=s.substring(1,len);
        return no;
    }
public static void main(String args[])throws NumberFormatException
{
    
}
}
