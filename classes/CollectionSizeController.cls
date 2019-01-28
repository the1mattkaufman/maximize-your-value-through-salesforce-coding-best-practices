public class CollectionSizeController {
    public List<Account> accountList {get;set;}
    
    public CollectionSizeController(){
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