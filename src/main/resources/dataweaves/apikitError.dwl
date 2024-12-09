%dw 2.0
// This is the shared DWL file dataweaves/apikitError.dwl
// DON'T TOUCH IT, BECAUSE IT IS SHARED AMONG ALL ERROR-MESSAGES. JUST INCLUDE IT ONLY.
/**
 * HOW TO USE:
 * Include this script within a transformator (error-message-transformator), where you like to construct the error message.
 * If you want to use the params, just create a variable errorParams and fill that before calling the error-message-transformator.
 */
output application/json
---
{
	"error": {
		"datetime": now(),
		"code" : error.errorType.namespace as String ++ ":" ++ error.errorType.identifier as String,
		"messagestub": error.description as String,
		"params": vars.errorParams default []
	}
}