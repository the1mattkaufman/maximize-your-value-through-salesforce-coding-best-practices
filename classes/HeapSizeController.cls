public class HeapSizeController {
    public List<Account> initialAccountList {get;set;}
    public List<Account> accountList {get;set;}
    public Map<Id, Contact> contactMap {get;set;}
    public Map<Id, Account> accountMap {get;set;}
    
    public HeapSizeController(){
		initialAccountList = [
            SELECT Id, Name, CreatedById, CreatedBy.FirstName, CreatedBy.LastName, CreatedBy.Email,
            	CreatedBy.UserName, CreatedDate, LastModifiedById, LastModifiedBy.FirstName, LastModifiedBy.LastName,
            	LastModifiedBy.Email, LastModifiedDate, Owner.CreatedBy.FirstName,
            	IsDeleted, Fax, Phone, BillingStreet, BillingCity, BillingState, BillingPostalCode, BillingCountry,
            	ShippingStreet, ShippingCity, ShippingState, ShippingPostalCode, ShippingCountry,
            	AccountNumber, Site, Description, OwnerId, Owner.FirstName, Owner.lastName, Owner.ProfileId, Owner.Profile.Name,
            	AnnualRevenue, Website, Type, 
            	(
                	SELECT Id, FirstName, LastName, Account.Name, Account.Description, Account.Phone,
                    	Account.Fax, Account.BillingStreet, Account.BillingCity, Account.BillingState,
                    	CreatedBy.FirstName, CreatedBy.LastName, CreatedBy.Email,
                    	LastModifiedBy.FirstName, LastModifiedBy.LastName, LastModifiedBy.Email, 
                    	Owner.FirstName, Owner.LastName, Owner.Email
                    FROM Contacts
                )
            FROM Account
            ORDER BY Name
            LIMIT 1000
        ];
        accountList = new List<Account>();
        contactMap = new Map<Id,Contact>();
        accountMap = new Map<Id,Account>();
        for ( Account a : initialAccountList ){
            accountList.add(a.clone(false,true));
            accountMap.put(a.Id, a);
            for ( Contact c : a.Contacts ){
	            contactMap.put(c.Id,c);
            }
        }
    }
}