public class CovidCountry {

	public class CountryInfo {
		public Integer x_id {get;set;}
		public String iso2 {get;set;} 
		public String iso3 {get;set;} 
		public Integer lat {get;set;} 
		public Integer long_Z {get;set;}
		public String flag {get;set;} 

		public CountryInfo(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == '_id') {
							x_id = parser.getIntegerValue();
						} else if (text == 'iso2') {
							iso2 = parser.getText();
						} else if (text == 'iso3') {
							iso3 = parser.getText();
						} else if (text == 'lat') {
							lat = parser.getIntegerValue();
						} else if (text == 'long') {
							long_Z = parser.getIntegerValue();
						} else if (text == 'flag') {
							flag = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'CountryInfo consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public Long updated {get;set;} 
	public String country {get;set;} 
	public CountryInfo countryInfo {get;set;} 
	public Integer cases {get;set;} 
	public Integer todayCases {get;set;} 
	public Integer deaths {get;set;} 
	public Integer todayDeaths {get;set;} 
	public Integer recovered {get;set;} 
	public Integer active {get;set;} 
	public Integer critical {get;set;} 
	public Integer casesPerOneMillion {get;set;} 
	public Integer deathsPerOneMillion {get;set;} 
	public Integer tests {get;set;} 
	public Integer testsPerOneMillion {get;set;} 
	public Integer population {get;set;} 
	public String continent {get;set;} 
	public Double activePerOneMillion {get;set;} 
	public Double recoveredPerOneMillion {get;set;} 
	public Double criticalPerOneMillion {get;set;} 

	public CovidCountry(JSONParser parser) {
		while (parser.nextToken() != System.JSONToken.END_OBJECT) {
			if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
				String text = parser.getText();
				if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
					if (text == 'updated') {
						updated = parser.getLongValue();
					} else if (text == 'country') {
						country = parser.getText();
					} else if (text == 'countryInfo') {
						countryInfo = new CountryInfo(parser);
					} else if (text == 'cases') {
						cases = parser.getIntegerValue();
					} else if (text == 'todayCases') {
						todayCases = parser.getIntegerValue();
					} else if (text == 'deaths') {
						deaths = parser.getIntegerValue();
					} else if (text == 'todayDeaths') {
						todayDeaths = parser.getIntegerValue();
					} else if (text == 'recovered') {
						recovered = parser.getIntegerValue();
					} else if (text == 'active') {
						active = parser.getIntegerValue();
					} else if (text == 'critical') {
						critical = parser.getIntegerValue();
					} else if (text == 'casesPerOneMillion') {
						casesPerOneMillion = parser.getIntegerValue();
					} else if (text == 'deathsPerOneMillion') {
						deathsPerOneMillion = parser.getIntegerValue();
					} else if (text == 'tests') {
						tests = parser.getIntegerValue();
					} else if (text == 'testsPerOneMillion') {
						testsPerOneMillion = parser.getIntegerValue();
					} else if (text == 'population') {
						population = parser.getIntegerValue();
					} else if (text == 'continent') {
						continent = parser.getText();
					} else if (text == 'activePerOneMillion') {
						activePerOneMillion = parser.getDoubleValue();
					} else if (text == 'recoveredPerOneMillion') {
						recoveredPerOneMillion = parser.getDoubleValue();
					} else if (text == 'criticalPerOneMillion') {
						criticalPerOneMillion = parser.getDoubleValue();
					} else {
						System.debug(LoggingLevel.WARN, 'CovidCountry consuming unrecognized property: '+text);
						consumeObject(parser);
					}
				}
			}
		}
	}	
	
	public static List<CovidCountry> parse(String json) {
		System.JSONParser parser = System.JSON.createParser(json);
		return arrayOfCovidCountry(parser);
	}
	
	public static void consumeObject(System.JSONParser parser) {
		Integer depth = 0;
		do {
			System.JSONToken curr = parser.getCurrentToken();
			if (curr == System.JSONToken.START_OBJECT || 
				curr == System.JSONToken.START_ARRAY) {
				depth++;
			} else if (curr == System.JSONToken.END_OBJECT ||
				curr == System.JSONToken.END_ARRAY) {
				depth--;
			}
		} while (depth > 0 && parser.nextToken() != null);
	}
	
    private static List<CovidCountry> arrayOfCovidCountry(System.JSONParser p) {
        List<CovidCountry> res = new List<CovidCountry>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new CovidCountry(p));
        }
        return res;
    }

}