%dw 2.0
/*
 *  Notes: You don't have to DataWeave a error to an object that looks exactly like the ones in the examples input.
 *  You can just use the Mule Errors that have been thrown.
 * 
 * 	Short description:
 * 	Takes an mule error and checks if the messageToCompare is in the error's message.
 * 
 * 	Long description:
 *  Checks that the mule errors message starts with the messageToCompare.
 *  It is useful if you use fail or failIf from dw::Runtime.
 *  If the error doesn't start with the messageToCompare, the message of the error or the error itself is null, 
 * 	false will be given back. If the errors message starts with messageToCompare, true will be given back.
 *	Note that false will be given back when you give null as a messageToCompare, even if the errors message is null as well.
 * 
 * 	Parameters:
 * 	- errorObject: the error that has been thrown
 * 	- messageToCompare: the errors message should start with this messageToCompare
 * 
 * 	Returns:
 * 	- true, if the errors message and the messageToCompare are not null and the errors message starts with messageToCompare.
 *  - false otherwise.
 * 
 * 	Examples:
 * 		- 	Example 1: 
 * 		  	Input: errorObject := null, messageToCompare := null
 * 		  	Output: false
 * 		- 	Example 2:
 * 			Input: errorObject := null, messageToCompare := "TOO_LONG_DIDNT_READ_ERROR"
 * 			Output: false
 * 		-	Example 3:
 * 			Input: errorObject := {}, messageToCompare := "TOO_LONG_DIDNT_READ_ERROR"
 * 			Output: false
 * 		- 	Example 4:
 * 			Input: errorObject := {exception : {}}, messageToCompare := "TOO_LONG_DIDNT_READ_ERROR"
 * 			Output: false
 * 		-   Example 5:
 * 			Input: errorObject := {exception : {cause : {}}}, messageToCompare := "TOO_LONG_DIDNT_READ_ERROR"
 * 			Output: false
 * 		-	Example 6:
 * 			Input: errorObject := {exception : {cause : {message : null}}}, messageToCompare := "TOO_LONG_DIDNT_READ_ERROR"
 * 			Output: false
 * 		-	Example 7:
 * 			Input: errorObject := {exception : {cause : {message : "SomeMessage"}}}, messageToCompare := "TOO_LONG_DIDNT_READ_ERROR"
 * 			Output: false
 * 		-	Example 8:
 * 			Input: errorObject := {exception : {cause : {message : "TOO_LONG_DIDNT_READ_ERROR"}}}, messageToCompare := "TOO_LONG_DIDNT_READ_ERROR"
 * 			Output: true
 * 		-	Example 9:
 * 			Input: errorObject := {exception : {cause : {message : "TOO_LONG_DIDNT_READ_ERROR some information after"}}}, messageToCompare := "TOO_LONG_DIDNT_READ_ERROR"
 * 			Output: true
 * 		-	Example 10:
 * 			Input: errorObject := {exception : {cause : {message : "Some information before TOO_LONG_DIDNT_READ_ERROR"}}}, messageToCompare := "TOO_LONG_DIDNT_READ_ERROR"
 * 			Output: false
 * 		-	Example 11:
 * 			Input: errorObject := {exception : {cause : {message : "TOO_LONG_DIDNT_READ_ERROR"}}}, messageToCompare := ""
 * 			Output: true
 * 		-	Example 12:
 * 			Input: errorObject := {exception : {cause : {message : "TOO_LONG_DIDNT_READ_ERROR"}}}, messageToCompare := null
 * 			Output: false
 */
fun errorMessageStartsWith(errorObject : Null, messageToCompare : Null) : Boolean = false
fun errorMessageStartsWith(errorObject : Null, messageToCompare : String) : Boolean = false
fun errorMessageStartsWith(errorObject : Object, messageToCompare : Null) : Boolean = false
fun errorMessageStartsWith(errorObject : Object, messageToCompare : String) : Boolean = 
if(errorObject.exception.cause.message == null) false else errorObject.exception.cause.message as String startsWith messageToCompare