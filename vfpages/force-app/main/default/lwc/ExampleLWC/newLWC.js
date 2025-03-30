import { LightningElement, wire } from 'lwc';
import getContacts from '@salesforce/apex/ContactController.getContactList';

const COLS = [
    { label: 'First Name', fieldName: 'FirstName' },
    { label: 'Last Name', fieldName: 'LastName' },
    { label: 'Title', fieldName: 'Title' },
    { label: 'Phone', fieldName: 'Phone', type: 'phone' },
    { label: 'Email', fieldName: 'Email', type: 'email' },

];



/*the colums for the table are here*/
export default class NewLWC extends LightningElement {
    numvalue=5;
    columns = COLS;
/*handlechange(event) {
    this.numvalue = event.target.value;} */



    @wire(getContacts, { numVal: '$numvalue' })
    contacts;
    
/*the @wire decorator lets SF know the contacts 
in the table are coming from getContacts.  Contacts
will be used in the html*/

handlechange(event) {
    const numvalue = event.target.value;
    this.numvalue = numvalue;
console.log(this.numvalue);}
}