public class WES_ScheduleCovidCallouts implements Schedulable{
    
    public void execute(SchedulableContext scContext){
        //Call Covid-19 API
        WES_CovidCallouts.makeCountriesCallout();
    }

}