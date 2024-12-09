%dw 2.0
/*
 * 	Notes: You don't have to DataWeave a error to an object that looks exactly like the ones in the examples input.
 *  You can just use the Mule Errors that have been thrown.
 * 
 * 	Description:
 *  Takes an mule error and checks if the messageToCompare is in the error's message.
 * 
 * 	Link: 
 *  dataweaves::faizsiegeln::ErrorUtils::errorMessageStartsWith
 */
fun errorMessageStartsWith(errorObject : Object | Null,  messageToCompare: String | Null) : Boolean | Null = 
dataweaves::faizsiegeln::ErrorUtils::errorMessageStartsWith(errorObject, messageToCompare)

/*
 *  Notes: 
 *  With DW 2.3 there is a function dw::core::Strings::withMaxSize that does the same.
 * 
 * 	Description: 
 *  Takes an string as input and crops it to maxLength in size.
 * 
 *  Link: 
 *  dataweaves::faizsiegeln::StringUtils::withMaxSize
 */
fun withMaxSize(message : String | Null, maxLength : Number) : String | Null = 
dataweaves::faizsiegeln::StringUtils::withMaxSize(message, maxLength)