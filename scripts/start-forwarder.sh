#!/bin/bash

# activate forwarder with empty args (these may need to be tweaked later)
echo "{}" | ndndpdk-ctrl --gqlserver http://127.0.0.1:3030/ activate-forwarder

# activate ethernet port for ndn-dpdk
ndndpdk-ctrl create-eth-port --netif enp6s0 --xdp --mtu 1500