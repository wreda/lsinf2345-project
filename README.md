# LSINF2345 Project

##Overview
In this project, you will be utilizing [Riak](http://docs.basho.com/riak/latest/) - a distributed key-value store - in combination with [Erlang](http://www.erlang.org/doc.html) in order to implement your distributed chatting application - StartApp. This repository comprises reference material/code to enable you to setup your environment.

##Riak
Riak is a distributed database designed to deliver maximum data availability by distributing data across multiple servers. Your application should leverage Riak in order to implement the required functionality. To get familiarized with Riak and how to use it to create nodes and setup clusters, you can reference the [official docs]((http://docs.basho.com/riak/latest/).

##Setting up your Environment
###Vagrant & Puppet
To begin working on this project, you’ll need to setup your work environment. We’ve provided a way for you to automatically spin-up a VM that comes with Riak and Erlang installed. To do this, you’ll be using two different VM provisioning tools - namely Vagrant & Puppet. In this github page you’ll find a manual - "vm-setup-guide.docx" - on how to use those tools as well as the scripts required to spin-up your VM.
###Alternatives
While these tools are simple enough to use if you just follow the guide, there are alternative ways to setup your work enviroment that don't require using them:

* Option A: Download a ready-made VM that's already configured with Erlang+Riak via this [link](https://drive.google.com/file/d/0B2DYZ0rziCtjUmdkYnFBcWgxMTg)
  * Default user:pass --> vagrant:vagrant
* Option B: Setup Riak yourself (reference: [installation guide](http://docs.basho.com/riak/latest/ops/building/installing/) )

##Using Riak

If you opt to spin-up the VM yourself, or use Option A, you can access Riak through the "~/riak-multi-node/" directory in your VM. In this folder, you'll also find that we've provided some high-level scripts to ease setting up Riak clusters. You can use the "riak-multi-node.sh" script file to create Riak nodes, and perform different operations on them. To see the available operations, simply run "riak-multi.sh" with no args or view the readme for these scripts [here](https://github.com/ksauzz/riak-multi-node). Note, however, that using these script files is entirely optional and you can opt to use Riak directly (you’ll find its binary situated in the "~/risk-multi-node/riak-2.1.0" directory).

In both cases, it's generally advisable to familiarize yourself with the process of setting up clusters from the official [cluster setup](http://docs.basho.com/riak/latest/ops/running/cluster-admin/) docs.