# Digital-Design-3
7 SEGMENT DISPLAY 

# Aim

The rightmost digit should display the hexadecimal value representing the rightmost 4 switches. The digit to its left should display the hexadecimal representation of the leftmost 4 switches. The remaining two digits should display the hexadecimal representation of the sum of the numbers on switches 0-3 and 4-7.

# Ports in the module


The interface of this module contains the following ports: The gclk port is the global clock input (50MHz). The rst is the global reset signal. The an_sel(3 downto 0) is the output signal which selects which seven segment display anode line to be active: an_sel(3) selects AN3, an_sel(2) selects AN2, etc. The switches(7 downto 0) is the input port for the 8 slide switches. The segments(6 downto 0) is the output port for the 7 segment control signals.

# 7-segment display

Each one of the seven LEDs in the display is given a positional segment with one of its connection pins being brought straight out of the rectangular plastic package. These individually LED pins are labelled from a through to g representing each individual LED. The other LED pins are connected together and wired to form a common pin.
So by forward biasing the appropriate pins of the LED segments in a particular order, some segments will be light and others will be dark allowing the desired character pattern of the number to be generated on the display. This then allows us to display each of the ten decimal digits 0 through to 9 on the same 7-segment display.
The displays common pin is generally used to identify which type of 7- segment display it is. As each LED has two connecting pins, one called the “Anode” and the other called the “Cathode”, there are therefore two types of LED 7-segment display called: Common Cathode (CC) and Common Anode (CA).

# Sequential design block

We implement a 15 bit counter and circuit clock divider. As long as we keep off the rst signal, the counter increments at each positive cycle of the input clock, which in our case is 50MHz. The counter then goes to zero as soon as rst is asserted.

