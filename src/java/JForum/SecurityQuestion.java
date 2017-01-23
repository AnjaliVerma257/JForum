package JForum;
public class SecurityQuestion {
String que_part=null;
public SecurityQuestion(String s)
{
    que_part=s;
}

    /**
     *
     * @param s
     * @return
     */
    public String question(String s)
{
    String ans=null;
    switch (s) {
        case "pets_name":
            ans="What is your first pet's name?";
            break;
        case "mothers_maiden_name":
            ans="What is your mother's maiden name?";
            break;
        case "first_school":
            ans="What is the name of your first school?";
            break;
        case "favorite_place":
            ans="What is your favorite place?";
            break;
        default:
            break;
    }
    return ans;
}
public static void main(String args[])
{
}
}
