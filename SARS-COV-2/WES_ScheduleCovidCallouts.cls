public class WES_ScheduleCovidCallouts implements Schedulable{
    
    public void execute(SchedulableContext scContext){
        //Call Covid-19 API
        WES_CovidCallouts.makeCountriesCallout();
    }

}

/*
APEX Script To Schedule Class For Every 5 Miniutes
---------------------------------------------------
String sch1 = '0 0 * * * ?';
WES_ScheduleCovidCallouts sqrb1 = new WES_ScheduleCovidCallouts();
system.schedule('Every Hour plus 0 min', sch1, sqrb1); 
String sch2 = '0 5 * * * ?';
WES_ScheduleCovidCallouts sqrb2 = new WES_ScheduleCovidCallouts();
system.schedule('Every Hour plus 5 min', sch2, sqrb2); 
String sch3 = '0 10 * * * ?';
WES_ScheduleCovidCallouts sqrb3 = new WES_ScheduleCovidCallouts();
system.schedule('Every Hour plus 10 min', sch3, sqrb3); 
String sch4 = '0 15 * * * ?';
WES_ScheduleCovidCallouts sqrb4 = new WES_ScheduleCovidCallouts();
system.schedule('Every Hour plus 15 min', sch4, sqrb4); 
String sch5 = '0 20 * * * ?';
WES_ScheduleCovidCallouts sqrb5 = new WES_ScheduleCovidCallouts();
system.schedule('Every Hour plus 20 min', sch5, sqrb5);
String sch6 = '0 25 * * * ?';
WES_ScheduleCovidCallouts sqrb6 = new WES_ScheduleCovidCallouts();
system.schedule('Every Hour plus 25 min', sch6, sqrb6);
String sch7 = '0 30 * * * ?';
WES_ScheduleCovidCallouts sqrb7 = new WES_ScheduleCovidCallouts();
system.schedule('Every Hour plus 30 min', sch7, sqrb7);
String sch8 = '0 35 * * * ?';
WES_ScheduleCovidCallouts sqrb8 = new WES_ScheduleCovidCallouts();
system.schedule('Every Hour plus 35 min', sch8, sqrb8);
String sch9 = '0 40 * * * ?';
WES_ScheduleCovidCallouts sqrb9 = new WES_ScheduleCovidCallouts();
system.schedule('Every Hour plus 40 min', sch9, sqrb9);
String sch10 = '0 45 * * * ?';
WES_ScheduleCovidCallouts sqrb10 = new WES_ScheduleCovidCallouts();
system.schedule('Every Hour plus 45 min', sch10, sqrb10);
String sch11 = '0 50 * * * ?';
WES_ScheduleCovidCallouts sqrb11 = new WES_ScheduleCovidCallouts();
system.schedule('Every Hour plus 50 min', sch11, sqrb11);
String sch12 = '0 55 * * * ?';
WES_ScheduleCovidCallouts sqrb12 = new WES_ScheduleCovidCallouts();
system.schedule('Every Hour plus 55 min', sch12, sqrb12);

*/
