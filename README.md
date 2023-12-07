# NDN-DPDK on FABRIC testbed notebooks

These Jupyter notebooks by @sjzhu and @MichaelRoss2023 were created for a final project for the ASU course CSE 534, Advanced Computer Networks.

You can upload them to the [FABRIC testbed](https://jupyter.fabric-testbed.net) and run them there, as they rely on that framework to function. In addition, upload the `scripts/` directory contained in this repository, as it contains necessary setup scripts for the notebooks running NDN. (You may also simply clone the repository into your JupyterHub storage.)

The ndn-poc notebook requires that your FABRIC project have access to `Component.SmartNIC` permissions in order to run, but no other special permissions are required to run these notebooks (aside from access to FABRIC in general).

## The notebooks

There are three notebooks in this repository. One of them is a smaller proof-of-concept notebook, while the other two run different file transfer methods over the same network topology.

### ndn-poc
The ndn-poc notebook creates a simple 3 node network, one consumer, one router and one producer. Each node is provisioned with a ConnectX-6 SmartNIC and is set up with a simple layer 3 network. The producer node is then provisioned with an NVME drive to host files from. Then, [NDN-DPDK](https://github.com/usnistgov/ndn-dpdk) is installed onto these nodes and set up so that the producer makes files available to a local NDN network.

This notebook installs NDN-DPDK with two configurations (in sequence). The first configuration configures NDN with PCI drivers for DPDK, whereas the second configures NDN with XDP drivers. This is done in order to be able to compare the performance between the two drivers. Before switching which driver is installed, a reboot of the nodes is required. If you are running all the cells in the notebook, it will handle it for you.

### IPExperiment
The IPExperiment notebook creates a complex topology of 10 nodes, illustrated by the following diagram:
![Complex Topology](https://github.com/sjzhu/CSE534/blob/main/complex.png?raw=true)

Once the network for these nodes is set up, file transfer tests are run between the various consumers and producers to file transfer speeds in FABRIC. The purpose of these tests is to compare to the NDN tests done in the PoC and in the later NDN Experiment.

### NDNExperiment
The NDNExperiment notebook runs on the same topology as the IPExperiment notebook. Instead of creating an IP based network on top of it, it installs NDN-DPDK similarly to the PoC notebook, albeit using the less performant BasicNIC network cards. It uses the XDP drivers as those are straightforward to install on the BasicNICs, and then allows the user to perform the same tests as the IPExperiment notebook. Instructions for how to do so are included in the notebook itself.

## Thanks

Thanks to Professor Violet Syrotiuk for teaching an awesome class for Fall 2023!

Thanks to the NDN-DPDK repo for being very well documented and having many tutorials to follow!