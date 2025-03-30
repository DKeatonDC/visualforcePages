public class ContactsListWithController {
    private String sortOrder = 'LastName';/* We are declaring this string because it will be used in the query */
    Public Integer numValue {get; set;} /* Get Set makes the variable accessible to the VF Page*/
    Public ContactsListWithController(){
        numValue = 1;
    }/*This is how I created a default value.  I am calling the class inside itself. That way it fires as soon as I
      visualforce invokes it.  Numbers start off null, so if I didn't do this, it would "throw" a null exception*/
    public List<Contact> getContacts(){
        List<Contact> results = Database.query(
        'Select Id, FirstName, LastName, Title, Email '+
            'FROM Contact '+
           'ORDER BY ' + sortOrder + ' ASC ' +
            'LIMIT ' + numValue
            );
    return results;}  /*the query will change based on the current value of sortOrder and numValue*/
    
}