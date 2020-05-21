# from https://osc4py3.readthedocs.io/en/latest/userdoc.html#what-is-osc4py3	

# Import needed modules from osc4py3
from osc4py3.as_eventloop import *
from osc4py3 import oscbuildparse

import time

# Start the system.
osc_startup()

# Make client channels to send packets.
osc_udp_client("127.0.0.1", 5005, "tester")

# Build a simple message and send it.
msg = oscbuildparse.OSCMessage("/test/me", ",sif", ["text", 672, 8.871])
osc_send(msg, "tester")

# Build a message with autodetection of data types, and send it.
msg = oscbuildparse.OSCMessage("/test/me", None, ["text", 672, 8.871])
osc_send(msg, "tester")
osc_process()

time.sleep(10)
# Buils a complete bundle, and postpone its executions by 10 sec.
exectime = time.time() + 10   # execute in 10 seconds
msg1 = oscbuildparse.OSCMessage("/sound/levels", None, [1, 5, 3])
msg2 = oscbuildparse.OSCMessage("/sound/bits", None, [32])
msg3 = oscbuildparse.OSCMessage("/sound/freq", None, [42000])
bun = oscbuildparse.OSCBundle(oscbuildparse.unixtime2timetag(exectime),
                    [msg1, msg2, msg3])
osc_send(bun, "tester")

# Properly close the system.
osc_terminate()
