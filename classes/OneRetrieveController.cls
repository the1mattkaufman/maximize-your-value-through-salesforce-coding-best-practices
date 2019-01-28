public class OneRetrieveController {

    static final String MYNAME = 'Matt Kaufman';
    
    @auraEnabled
    public static Contact getMe(){
        return [
            SELECT Id, FirstName, LastName, Email
            FROM Contact
            WHERE Name = :MYNAME
            LIMIT 1
        ];
    }
    
}