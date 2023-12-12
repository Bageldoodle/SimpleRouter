# 8x8 packet router switcher
## For a graduate SCU logic design using HDL class
- ingress.v -> input module to parse incoming serial data for destination address and payload information
- selector.v -> takes in payload and address data from the corresponding ingress and sends it to 1 of 8 destination FIFOs
- fifo3.v -> 8 input FIFO module, takes in 32-bit data and stores it until necessary. 
- rf32.v -> register files used in FIFO
- egress.v -> output data module, takes in 32-bit data payload from FIFO and outputs it serially at the correct destination address
- router.v -> overarching top-level module used to wire everything together. 
