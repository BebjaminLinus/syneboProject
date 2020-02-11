import { LightningElement, track } from 'lwc';
import searchAccount from '@salesforce/apex/SearchController.searchAccount';
const columnList = [
    {label: 'Name', fieldName: 'Name'},
    {label: 'Information', fieldName: 'Information'}
];

export default class SearchComponent extends LightningElement {
    @track accountList;
    @track columnList = columnList;
    @track noRecordsFound = true;
     findAccountResult(event) {
        const accName = event.target.value;
        if(accName) {
            searchAccount ( {accName}) 
            .then(result => {
                this.accountList = result;
                this.noRecordsFound = false;
            })
        } else {
            this.accountList = undefined;
            this.noRecordsFound = true;
        }
    }
}