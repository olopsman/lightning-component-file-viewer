public without sharing class FilesViewerController {
	@AuraEnabled // used as  file viewer
	public static List<ContentVersion> getFilesByRecordId(String recordId) {
		List<ContentVersion> cv = new List<ContentVersion>();
        //query the content and get the string and filename
        List<ContentDocumentLink> cdList = [SELECT Id,ContentDocumentId FROM ContentDocumentLink WHERE LinkedEntityId = :recordId];
        Set<Id> cdSet = new Set<Id>();
        for(ContentDocumentLink cdl :cdList) {
            cdSet.add(cdl.ContentDocumentId);
        }	
   		if(!cdSet.isEmpty()) {
             cv = [Select Id, ContentDocumentId, Title from ContentVersion where ContentDocumentId in: cdSet];
        
        }	
		return cv;		
	}	
}