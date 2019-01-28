public without sharing class TooManyStrings {

    static final String workingHere = 'Status update email for employees working here';
    static final String notWorkingHere = 'Status update email for employees not working here';
    static Map<String,EmailTemplate> EMAIL_TEMPLATES = new Map<String,EmailTemplate>();
    static EmailTemplate templateId_HERE;
    static EmailTemplate templateId_NOTHERE;
    static {
        for ( EmailTemplate et : [
            SELECT Id, Name, DeveloperName
            FROM EmailTemplate
            WHERE Name = :workingHere or Name = :notWorkingHere
            OR DeveloperName in ('Status_update_email','Status_update_email_not_here')
        ]){
            EMAIL_TEMPLATES.put( et.DeveloperName, et );
            EMAIL_TEMPLATES.put( et.Name, et );
            if (et.DeveloperName =='Status_update_email'){
                templateId_HERE=et;
            }
            else if (et.DeveloperName =='Status_update_email_not_here'){
                templateId_NOTHERE=et;
            }
        }
    }

    private List<Employees__c> EmployeeRecs_new;
    private List<Employees__c> EmployeeRecs_old;
    public Map<Id, Employees__c> oldEmpsMap;
    public Map<Id, Employees__c> newEmpsMap;
    public Map<Id, String> appEmailMap;
    public Map<Id, String> bouncedEmailMap;

    public EmployeeHelper(List<Employees__c> EmployeeRecs_new, List<Employees__c> EmployeeRecs_old){
        this.EmployeeRecs_new = EmployeeRecs_new;
        this.EmployeeRecs_old = EmployeeRecs_old;
        newEmpsMap = new Map<Id, Employees__c>();
        oldEmpsMap = new Map<Id, Employees__c>();
        for(Employees__c app:EmployeeRecs_new){
            newEmpsMap.put(app.Id, app);
        }
        if (EmployeeRecs_old != null){
            for(Employees__c app:EmployeeRecs_old){
                oldEmpsMap.put(app.Id, app);
            }
        }
        appEmailMap = new Map<Id, String>();
        bouncedEmailMap = new Map<Id, String>();
        for(Employees__c app:EmployeeRecs_new){
            System.debug('DLS App ids added to emailMap: '+ app.id);
            appEmailMap.put(app.id,'');
            bouncedEmailMap.put(app.id,'');
        }
        List<Id> tempEmps = new List<id>();
        tempEmps.addAll(appEmailMap.keyset());
        System.debug('DLS tempEmps collection is: '+ tempEmps);
        for(Employees__c app:[
            SELECT employee__r.email, employee__r.paperless_email_only__c, employee__r.EmailBouncedDate, employee__r.IsEmailBounced, id
            FROM Employees__c
            WHERE id
            IN :tempEmps
        ]){
            if((!app.employee__r.IsEmailBounced) && (app.employee__r.paperless_email_only__c)){
                appEmailMap.put(app.id,app.employee__r.email);
                System.debug('DLS Email being added to map: '+ app.id);
            }else if(app.employee__r.IsEmailBounced && app.employee__r.paperless_email_only__c){
                bouncedEmailMap.put(app.id, app.employee__r.Email);
            }
        }
    }

}