package sqlparser;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

public class CQLDataType {

	public static class DataTypeNotFound extends RuntimeException {
		public DataTypeNotFound(String msg) {
	        super(msg);
	    }
	}
	
	
    private static final Map<String, String> cqlDataTypeMap;
    static {
        Map<String, String> aMap = new HashMap<String, String>();;
        aMap.put("", "ascii");
        aMap.put("", "bigint");
        aMap.put("", "blob");
        aMap.put("bit", "boolean");
        aMap.put("", "counter");
        aMap.put("date", "date");
        aMap.put("decimal", "decimal");
        aMap.put("money", "decimal");
        aMap.put("", "double");
        aMap.put("", "float");
        aMap.put("", "frozen");
        aMap.put("", "inet");
        aMap.put("int", "int");
        aMap.put("", "list");
        aMap.put("", "map");
        aMap.put("", "set");
        aMap.put("", "smallint");
        aMap.put("string", "text");
        aMap.put("time", "time");
        aMap.put("datetime", "timestamp");
        aMap.put("", "timeuuid");
        aMap.put("", "tinyint");
        aMap.put("", "tuple");
        aMap.put("", "uuid");
        aMap.put("", "varchar");
        aMap.put("", "varint");
        cqlDataTypeMap = Collections.unmodifiableMap(aMap);
    }
    
    
    public static String getCQLDataType (String type) {
    	if (cqlDataTypeMap.containsKey(type)) {
    		return cqlDataTypeMap.get(type);
    	} else {
    		throw new DataTypeNotFound("Data type " + type + " not found in cqlDataTypeMap");
    	}
    }
}
