from osc4py3.as_eventloop import *
from osc4py3 import oscbuildparse

# Start the system.
osc_startup()

# Make client channels to send packets.
osc_udp_client("127.0.0.1", 5000, "tester")

for i in range(100000):
    msg = oscbuildparse.OSCMessage("/test/me", ",sif", ["text", 672, 
    8.871])
    osc_send(msg, "tester")
    osc_process()