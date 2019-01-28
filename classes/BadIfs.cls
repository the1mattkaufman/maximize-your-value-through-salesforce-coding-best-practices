public without sharing class BadIfs {

    /**
    * Messy 
    */
    public static void beforeInsert(List<Account> newList){
        for ( Integer i=0;i<newList.size();i++ ){
            if ( 
                newList[i].Type == 'Customer' || 
                newList[i].Status == 'New' 
            ){
                if ( newList[i].ParentAccountId == null ){
                    if ( newList[i].AnnualRevenue > 10000 || newList[i].Rating == 'Hot' ){
                        newList[i].Description = 'Looks Good';
                    }
                }
            }
        }
    }

    public static void beforeUpdate(List<Account> newList, List<Account> oldList){
        for ( Integer i=0;i<newList.size();i++ ){
            if ( 
                newList[i].Type == 'Customer' || 
                newList[i].Status == 'New' 
            ){
                if ( newList[i].ParentAccountId == null ){
                    if ( newList[i].AnnualRevenue > 10000 || newList[i].Rating == 'Hot' ){
                        newList[i].Description = 'Looks Good';
                    }
                }
            }
        }
    }

    /**
    * Clean
    */
    static final String LOOKSGOOD_STRING = 'Looks Good';
    static final String CUSTOMER_STRING = 'Customer';
    static final String NEW_STRING = 'New';
    static final String HOT_STRING = 'Hot';
    static final Integer MINIMUM_ANNUAL_REVENUE_INTEGER = 10000;

    public static void beforeInsert(List<Account> newList){
        for ( Integer i=0;i<newList.size();i++ ){
            handleBefore(newList[i]);
        }
    }

    public static void handleBefore(Account a){
        if ( needsLooksGoodDescription(a) ){
            a.Description = LOOKSGOOD_STRING;
        }
    }

    public static Boolean needsLooksGoodDescription(Account a){
        return (
            (a.Type == CUSTOMER_STRING || a.Status == 'New' )
            && ( a.ParentAccountId == null )
            && ( a.AnnualRevenue > MINIMUM_ANNUAL_REVENUE_INTEGER || a.Rating == 'Hot' )
            && a.Description != LOOKSGOOD_STRING
        );
    }

}
