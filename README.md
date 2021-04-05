# Digital-Design-3
7 SEGMENT DISPLAY 

# Aim

The 7-segment display has 4 digits. The 2 leftmost digits are to be used to display, in hexadecimal, the binary values of the left-most 4 switches and rightmost 4- switches. I can easily say that the maximum value the switches can reach is 1111 which in decimal is 15 or in hexadecimal F. Therefore, I can say that the value of the digit is never going to be over 1 hexadecimal digit. The sum, on the other way as also seen from the maximum values of the two binary strings I am interested it might have 1 or 2 digits depending on the values. As soon as the sum goes over 15, it must be represented in two digits space and that is the reason why there are needed two digits spaces for the sum.

# Ports in the module


The interface of this module contains the following ports: The gclk port is the global clock input (50MHz). The rst is the global reset signal. The an_sel(3 downto 0) is the output signal which selects which seven segment display anode line to be active: an_sel(3) selects AN3, an_sel(2) selects AN2, etc. The switches(7 downto 0) is the input port for the 8 slide switches. The segments(6 downto 0) is the output port for the 7 segment control signals.

# 7-segment display

Each one of the seven LEDs in the display is given a positional segment with one of its connection pins being brought straight out of the rectangular plastic package. These individually LED pins are labelled from a through to g representing each individual LED. The other LED pins are connected together and wired to form a common pin.
So by forward biasing the appropriate pins of the LED segments in a particular order, some segments will be light and others will be dark allowing the desired character pattern of the number to be generated on the display. This then allows us to display each of the ten decimal digits 0 through to 9 on the same 7-segment display.
The displays common pin is generally used to identify which type of 7- segment display it is. As each LED has two connecting pins, one called the “Anode” and the other called the “Cathode”, there are therefore two types of LED 7-segment display called: Common Cathode (CC) and Common Anode (CA).

# Sequential design block

We implement a 15 bit counter and circuit clock divider. As long as we keep off the rst signal, the counter increments at each positive cycle of the input clock, which in our case is 50MHz. The counter then goes to zero as soon as rst is asserted.

# Images after completion 



![IMG_5995](https://user-images.githubusercontent.com/36340648/112401779-89251e80-8d0b-11eb-92c7-72abaa6f74a4.jpg)


![IMG_5996](https://user-images.githubusercontent.com/36340648/112401804-993cfe00-8d0b-11eb-8fb1-39eeebeafb5c.jpg)
