import time

import quandl 
import pandas

from pythonosc import udp_client
from pythonosc import osc_server

from pythonosc.dispatcher import Dispatcher
from typing import List, Any

dispatcher = Dispatcher()


def set_filter(address: str, *args: List[Any]) -> None:
    # We expect two float arguments
    if not len(args) == 2 or type(args[0]) is not float or type(args[1]) is not float:
        return

    # Check that address starts with filter
    if not address[:-1] == "/filter":  # Cut off the last character
        return

    value1 = args[0]
    value2 = args[1]
    filterno = address[-1]
    print(f"Setting filter {filterno} values: {value1}, {value2}")


dispatcher.map("/test", set_filter)  # Map wildcard address to set_filter function

#full_data = quandl.get("WIKI/AAPL", rows=10)
# checking that it worked !
#print(full_data)

full_data = pandas.read_csv("aapl.csv")

data_pct = full_data['Open'].pct_change()
print(data_pct.head())

full_data['pct'] = data_pct

print(full_data.head())

# assigner une note
server = osc_server.BlockingOSCUDPServer(("127.0.0.1", 5005), dispatcher)
client = udp_client.SimpleUDPClient("127.0.0.1",5005)

for index, row in full_data.iterrows():
    client.send_message("/test", row['Open'])
    server.handle_request()
    time.sleep(1)