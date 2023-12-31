public class NewsletterPref {

    public Account account { get; private set; }
    public NewsletterPref() {
        Id id = ApexPages.currentPage().getParameters().get('id');
        account = (id == null) ? new Account() :
            [SELECT Name, Phone, Newsletter__c,Industry FROM Account WHERE Id = :id];
}
    public PageReference save() {
        try {
            upsert(account);
        } catch(System.DMLException e) {
            ApexPages.addMessages(e);
            return null;
        }
        //  After successful Save, navigate to the default view page
        PageReference redirectSuccess = new ApexPages.StandardController(Account).view();
        return (redirectSuccess);
}
 }