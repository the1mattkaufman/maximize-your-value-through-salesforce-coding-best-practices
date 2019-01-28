public with sharing class TooManyRetrievesController {

    static final String MYNAME = 'Matt Kaufman';
    
    @auraEnabled
    public static String getFirstName(){
        return [
            SELECT Id, FirstName
            FROM Contact
            WHERE Name = :MYNAME
            LIMIT 1
        ].FirstName;
    }
    
    @auraEnabled
    public static String getLastName(){
        return [
            SELECT Id, LastName
            FROM Contact
            WHERE Name = :MYNAME
            LIMIT 1
        ].LastName;
    }

    @auraEnabled
    public static String getEmail(){
        return [
            SELECT Id, Email
            FROM Contact
            WHERE Name = :MYNAME
            LIMIT 1
        ].Email;
    }


}