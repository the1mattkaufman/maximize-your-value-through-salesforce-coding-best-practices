public class AccountController {
    public List<Account> accountList {get;set;}
    
    public AccountController(){
		accountList = [
            SELECT Id, Name, CreatedById, CreatedDate, LastModifiedById, LastModifiedDate,
            	IsDeleted, Phone, BillingStreet, BillingCity, BillingState, BillingPostalCode, BillingCountry,
            	ShippingStreet, ShippingCity, ShippingState, ShippingPostalCode, ShippingCountry,
            	AccountNumber, Site
            FROM Account
            ORDER BY Name
        ];
    }
}