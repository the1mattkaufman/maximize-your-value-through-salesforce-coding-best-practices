public with sharing class RepetitiveCode {

    /**
    * Messy 
    */
    public static void createErrorDoc(Id targetId){
        System.debug('DLS--The email failed to send');
        Doc__c newDoc = new Doc__c();
        newDoc.Employees__c = targetId;
        newDoc.Action__c = 'Email failed';
        newDoc.Status__c='Completed';
        newDoc.Name='Invalid Email Status';
        newDoc.Action_Date__c = DateTime.now();
        newDoc.notes__c = 'Letter sent after Employee changed due to invalid email';
        newDoc.ErrorDocType__c='FieldUpdateEmailFailure';
        System.debug('DLS--Doc created: '+ newDoc);
        insert newDoc;
    }

    public static void createLetterDoc(Id targetId){
        System.debug('DLS--The employee requested mail, or does not have an email address');
        Doc__c newDoc = new Doc__c();
        newDoc.Employees__c = targetId;
        newDoc.Action__c = 'Employee Letter';
        newDoc.Status__c='Completed';
        newDoc.Name='Letter sent after Employee change';
        newDoc.Action_Date__c = DateTime.now();
        newDoc.notes__c = 'Status letter/email sent to applicant after Employee change';
        newDoc.ErrorDocType__c='FieldUpdateEmailFailure';
        System.debug('DLS--Doc created: '+ newDoc);
        insert newDoc;
    }

    /**
    * Clean 
    */
    public static Doc__c createDoc(Id targetId, String name, String action, String note, String type){
        Doc__c newDoc = new Doc__c();
        newDoc.Employees__c = targetId;
        newDoc.Action__c = action;
        newDoc.Status__c = 'Completed';
        newDoc.Name = name;
        newDoc.Action_Date__c = DateTime.now();
        newDoc.notes__c = notes;
        newDoc.ErrorDocType__c = type;
        return newDoc;
    }



}
