public class Covid19APIWS {
	@AuraEnabled 
    public static string getcalloutResponse(String country){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://corona.lmao.ninja/v2/countries/'+country);
        request.setMethod('GET');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setHeader('Authorization', 'Bearer');
        return (http.send(request)).getBody();
    }
    @AuraEnabled 
    public static string getCountryName(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://corona.lmao.ninja/v2/countries');
        request.setMethod('GET');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setHeader('Authorization', 'Bearer');
        HttpResponse response = http.send(request);
        system.debug('response'+response.getBody());
        return response.getBody();
    }
}
