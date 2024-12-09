%dw 2.0
import fail from dw::Runtime
/*
 * 	Notes: With DW 2.3 there is a function dw::core::Strings::withMaxSize that does the same.
 * 
 * 	Short description:
 * 	Takes an string as input and crops it to maxLength in size.
 * 
 * 	Long description:
 * 	Checks that the string length is no larger than the specified maxLength. 
 *  If the string’s length is larger than the maxLength, the function cuts characters from left to right, 
 *  until the string length meets the length limit.
 *  Note that if maxLength is 0, the function returns an empty string. If the message is null, the output is always null.
 * 
 * 	Parameters:
 * 	- message: the message to crop
 * 	- maxLength: the length the message should be at most after the function was called.
 * 
 * 	Returns:
 * 	The cropped message
 * 
 * 	Throws:
 * 	- MAX_LENGTH_IS_NEGATIVE as EXPRESSION when maxLength is a negative Number
 * 
 * 	Examples:
 * 		- 	Example 1: 
 * 		  	Input: message := null, maxLength := 1
 * 		  	Output: null
 * 		- 	Example 2:
 * 			Input: message := "", maxLength := 1
 * 			Output: ""
 * 		-	Example 3:
 * 			Input: message := "Hello World!", maxLength := -1
 * 			Throws: EXPRESSION with "MAX_LENGTH_IS_NEGATIVE" as message
 * 		- 	Example 4:
 * 			Input: message := "Hello World!", maxLength := 0
 * 			Output: ""
 * 		-   Example 5:
 * 			Input: message := "Hello World!", maxLength := 5
 * 			Output: "Hello"
 * 		-	Example 6:
 * 			Input: message := "Hello World!", maxLength := 100
 * 			Output: "Hello World!"
 */
fun withMaxSize(message : Null, maxLength : Number) : Null = null
fun withMaxSize(message : String, maxLength : Number) : String =
	if(maxLength < 0)(
		fail("MAX_LENGTH_IS_NEGATIVE")
	)else if(maxLength == 0)(
		""
	)else if(maxLength > sizeOf(message))(
		message
	)else(
		message[0 to (maxLength -1)]
	)
