public with sharing class WrappersAndMaps {

    /**
    * Messy 
    */
    public static void trackAccounts() {
        Map<Id, Integer> accountContactCountMap = new Map<Id,Integer>();
        Map<Id, Boolean> accountIsGoodMap = new Map<Id,Boolean>();
        Map<Id, Decimal> accountRevenueMap = new Map<Id,Boolean>();
        for ( Account a : [
            SELECT Id, AnnualRevenue,
            (
                SELECT Id
                FROM Contacts
            )
            FROM Account
        ]){
            accountContactCountMap.put(a.Id, a.Contacts.size());
            accountContactCountMap.put(a.Id, true);
            accountContactCountMap.put(a.Id, a.AnnualRevenue);
        }
    }



    /**
    * Clean 
    */
    public class AccountWrapper {
        public Integer contactCount;
        public Boolean isGood;
        public Decimal revenue;
    }

    public static void trackAccounts() {
        Map<Id, AccountWrapper> accountWrapperMap = new Map<Id,AccountWrapper>();
        for ( Account a : [
            SELECT Id, AnnualRevenue,
            (
                SELECT Id
                FROM Contacts
            )
            FROM Account
        ]){
            AccountWrapper w = new AccountWrapper();
            w.contactCount = a.Contacts.size();
            w.isGood = true;
            w.revenue = a.AnnualRevenue;
            accountWrapperMap.put( a.Id, w);
        }
    }







}
