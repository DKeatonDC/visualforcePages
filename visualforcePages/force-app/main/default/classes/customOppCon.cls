public with sharing class customOppCon {
    public ApexPages.StandardSetController oppCon {
        get{
            /* Having {Get; Set;} is required
for any field that will be governed by the controller.
This is also the case for controllers made with LWC in
mind.*/
        
            if (oppCon == null)
/*the page won't load if the value of oppCon is null.
Every controller has to find a way to deal with this */            
            {List<Opportunity> oppColl =
[SELECT Name, OrderNumber__c, Amount, CloseDate FROM 
Opportunity WHERE StageName = 'Closed Won']; /*create a 
list using a SOQL query or some other method*/
oppCon = new ApexPages.StandardSetController(oppColl); 
/*assign that list to the controller*/
            }
            return oppCon;
/* return is important.  You always need a return unless 
its a void method*/
        }
        set; 
    } 
    public list<Opportunity> getOpportunities(){
        return (List<Opportunity>) oppCon.getRecords();
    }
/*This code block is weird because we won't directly
reference getOpportunities() anywhere.  getRecords()
is a method of a standardsetcontroller.  That lets
us use it, even though we never directly declared
that anywhere either*/
}