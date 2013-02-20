package hivekeeper

class Inspection {
	String hiveActivity
	String weather
	String site
	String siteState
	String siteCity
	
	Date dateCreated
	Date lastUpdated

    static constraints = {
		site(nullable: false, blank: false)
		hiveActivity(inList: ['High', 'Medium', 'Low', 'N/A'])
		weather(inList: ['Sunny', 'Cloudy', 'Rainy', 'Overcast'])
    }
}