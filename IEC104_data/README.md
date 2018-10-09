# t104.* files 

This folder contains the following: 

* `t104.spicy` file is the file describing the grammar of the IEC-104 protocol.

* `t104.evt` file defines events, i.e., indicates when to create an event. E.g., one can define an event upon parsing an I frame type, or more detailed, one can define an even upon parsing the function (Type ID) `C_IC_NA`.

* `t104*.bro` file defines how to handle each event defined in `t104.evt`. For example, file `t104_typeid_count.bro` increases some counter upon every Type ID that is parsed and prints out the total number at the end of parsing the file. 

For better understanding of the relations between the Spicy grammar, the event file and the bro file, I highly recommend to [see this video](https://youtu.be/3sQ6thi_BR0).