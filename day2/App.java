package com.zirous.oaam.configurableaction;

import java.util.Date;
import java.util.Map;

import com.bharosa.vcrypt.tracker.dynamicactions.data.DynamicActionParamInfo;
import com.bharosa.vcrypt.tracker.dynamicactions.intf.DynamicAction;
import com.bharosa.vcrypt.tracker.intf.VCryptRulesResult;

/**
 * Hello world!
 * 
 */
public class App implements DynamicAction {

	public boolean execute(String requestId, Date requestTime,
			Map ruleContextMap, VCryptRulesResult rulesResult,
			Map actionParamValueMap, Map actionContextMap) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	public DynamicActionParamInfo[] getParameters() {
		DynamicActionParamInfo params[] = new DynamicActionParamInfo[1];
		params[0] = new DynamicActionParamInfo();
		params[0].setParamName("API Key");
		params[0].setPromptLabel("Key: ");
		params[0].setNotes("Some great API Key");
		params[0].setDescription("A services API key");
		params[0].setValueType(com.bharosa.common.util.UserDefEnum.getElementValue("", "string"));
		params[0].setDefaultValue("");
		return params;
	}
}
