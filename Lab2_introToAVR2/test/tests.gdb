# Test file for Lab2_introToAVR2


# commands.gdb provides the following functions for ease:
#   test "<message>"
#       Where <message> is the message to print. Must call this at the beginning of every test
#       Example: test "PINA: 0x00 => expect PORTC: 0x01"
#   checkResult
#       Verify if the test passed or failed. Prints "passed." or "failed." accordingly, 
#       Must call this at the end of every test.
#   expectPORTx <val>
#       With x as the port (A,B,C,D)
#       The value the port is epected to have. If not it will print the erroneous actual value
#   setPINx <val>
#       With x as the port or pin (A,B,C,D)
#       The value to set the pin to (can be decimal or hexidecimal
#       Example: setPINA 0x01
#   printPORTx f OR printPINx f 
#       With x as the port or pin (A,B,C,D)
#       With f as a format option which can be: [d] decimal, [x] hexadecmial (default), [t] binary 
#       Example: printPORTC d
#   printDDRx
#       With x as the DDR (A,B,C,D)
#       Example: printDDRB

echo ======================================================\n
echo Running all tests..."\n\n

# Exercise 1 test:
#test "PINA: 0x02 => PORTB: 0x01"
#setPINA 0x02
#continue 2
#expectPORTB 0x01
#checkResult

#test "PINA: 0x01 => PORTB: 0x00"
#setPINA 0x01
#continue 2
#expectPORTB 0x00
#checkResult

#test "PINA: 0x00 => PORTB: 0x00"
#setPINA 0x00
#continue 2
#expectPORTB 0x00
#checkResult

#test "PINA: 0x03 => PORTB: 0x00"
#setPINA 0x03
#continue 2
#expectPORTB 0x00
#checkResult

# Exercise 2 test:
#test "PINA: 0x01 => PORTC: 0x01"
#setPINA 0x01
#continue 2
#expectPORTC 0x01
#checkResult

#test "PINA: 0x02 => PORTC: 0x01"
#setPINA 0x02
#continue 2
#expectPORTC 0x01
#checkResult

#test "PINA: 0x04 => PORTC: 0x01"
#setPINA 0x04
#continue 2
#expectPORTC 0x01
#checkResult

#test "PINA: 0x08 => PORTC: 0x01"
#setPINA 0x08
#continue 2
#expectPORTC 0x01
#checkResult

#test "PINA: 0x03 => PORTC: 0x02"
#setPINA 0x03
#continue 2
#expectPORTC 0x02
#checkResult

#test "PINA: 0x06 => PORTC: 0x02"
#setPINA 0x06
#continue 2
#expectPORTC 0x02
#checkResult

#test "PINA: 0x07 => PORTC: 0x03"
#setPINA 0x07
#continue 2
#expectPORTC 0x03
#checkResult

#test "PINA: 0x0F => PORTC: 0x04"
#setPINA 0x0F
#continue 2
#expectPORTC 0x84
#checkResult

#test "PINA: 0x00 => PORTC: 0x00"
#setPINA 0x00
#continue 2
#expectPORTC 0x00
#checkResult

#Exercise 3 test:
test "PINA: 0x00, PINB = 0x00, PINC = 0x00 => PORTD = 0x00"
setPINA 0x00
setPINB 0x00
setPINC 0x00
continue 2
expectPORTD 0x00
checkResult
#140 does not set the flag
test "PINA: 0x8C, PINB = 0x00, PINC = 0x00 => PORTD = 0x02"
setPINA 0x8C
setPINB 0x00
setPINC 0x00
continue 2
expectPORTD 0x02
checkResult

test "PINA: 0x46, PINB = 0x46, PINC = 0x00 => PORTD = 0x00"
setPINA 0x46
setPINB 0x46
setPINC 0x00
continue 2
expectPORTD 0x00
checkResult
#sum = 142
test "PINA: 0x46, PINB = 0x23, PINC = 0x25 => PORTD = 0x01"
setPINA 0x46
setPINB 0x23
setPINC 0x25
continue 2
expectPORTD 0x01
checkResult
#sum = 137
test "PINA: 0x46, PINB = 0x23, PINC = 0x20 => PORTD = 0x00"
setPINA 0x46
setPINB 0x23
setPINC 0x20
continue 2
expectPORTD 0x00
checkResult

test "PINA: 0xFF, PINB = 0x00, PINC = 0x00 => PORTD = 0x03"
setPINA 0xFF
setPINB 0x00
setPINC 0x00
continue 2
expectPORTD 0x03
checkResult

test "PINA: 0xFF, PINB = 0xFF, PINC = 0xFF => PORTD = 0x01"
setPINA 0xFF
setPINB 0xFF
setPINC 0xFF
continue 2
expectPORTD 0x01
checkResult

#sum = 100
test "PINA: 0x20, PINB = 0x48, PINC = 0x1C => PORTD = 0x00"
setPINA 0x20
setPINB 0x48
setPINC 0x1C
continue 2
expectPORTD 0x00
checkResult
#sum = 170
test "PINA: 0x32, PINB = 0x32, PINC = 0x46 => PORTD = 0x01"
setPINA 0x32
setPINB 0x32
setPINC 0x46
continue 2
expectPORTD 0x01
checkResult

test "PINA: 0x50, PINB = 0x00, PINC = 0x00 => PORTD = 0x02"
setPINA 0x51
setPINB 0x00
setPINC 0x00
continue 2
expectPORTD 0x02
checkResult

# Report on how many tests passed/tests ran
set $passed=$tests-$failed
eval "shell echo Passed %d/%d tests.\n",$passed,$tests
echo ======================================================\n
