public class WES_CovidCallouts {

 @future(callout=true)
 public static void makeCountriesCallout() {
  //Call Covid-19 API
  Http http = new Http();
  HttpRequest request = new HttpRequest();

  request.setEndpoint('https://corona.lmao.ninja/v2/countries/');
  request.setMethod('GET');
  HttpResponse response = http.send(request);

  List < Covid_Country__c > upsertCountries = new List < Covid_Country__c > ();
  List < CovidCountry > countryResults = CovidCountry.parse(response.getBody());
  //List<CovidCountry> countryResults = (List<CovidCountry>)JSON.deserializeStrict(response.getBody(), List<CovidCountry>.class);
  //Deserialize The JSON Response in to List of Objects
  //List<object> countryResults = (List<object>)JSON.deserializeUntyped(response.getBody());

  List < Covid_Country__c > existingCountries = new List < Covid_Country__c > ([SELECT Id, Name FROM Covid_Country__c ORDER BY Name ASC]);
  Map < String, Covid_Country__c > countryByNameMap = new Map < String, Covid_Country__c > ();

  //Search for existing Country in Salesforce for Name[Country Name] Match
  for (Covid_Country__c exCountry: existingCountries) {
   countryByNameMap.put(exCountry.Name, exCountry);
  }

  //Loops over the country Results From API
  for (CovidCountry countryObj: countryResults) {
   //Map<String, Object> country = (Map<String, Object>)countryObj;
   //Covid_Country__c countryList = countryByNameMap.get((String)country.get('country'));
   System.debug(countryObj.country);

   Covid_Country__c countryList = countryByNameMap.get(countryObj.country);

   if (countryList == null) {
    countryList = new Covid_Country__c();
   }

   countryList.Name = countryObj.country;
   countryList.Active__c = countryObj.active;
   countryList.Active_Per_One_Million__c = countryObj.activePerOneMillion;
   countryList.Cases_Per_One_Million__c = countryObj.casesPerOneMillion;
   countryList.Continent__c = countryObj.continent;
   countryList.Critical__c = countryObj.critical;
   countryList.Critical_Cases_Per_One_Million__c = countryObj.criticalPerOneMillion;
   countryList.Death__c = countryObj.deaths;
   countryList.Deaths_Per_One_Million__c = countryObj.deathsPerOneMillion;
   countryList.Recovered__c = countryObj.recovered;
   countryList.Recovered_Per_One_Million__c = countryObj.recoveredPerOneMillion;
   countryList.Tests_Per_One_Million__c = countryObj.testsPerOneMillion;
   countryList.Today_Cases__c = countryObj.todayCases;
   countryList.Today_Death__c = countryObj.todayDeaths;
   countryList.Total_Population__c = countryObj.population;
   countryList.Total_Cases__c = countryObj.cases;
   countryList.Total_Tests__c = countryObj.tests;
   upsertCountries.add(countryList);
  }

  upsert upsertCountries;

 }

}