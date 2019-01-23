OpenSUSE nvidia-prime like package
==================================

Assumptions
-----------

* You are running OpenSUSE Tumbleweed
* You don't have bumblebee installed
* You installed nvidia drivers using http://opensuse-community.org/nvidia.ymp

Installation/usage
------------------

1. Run "prime-select nvidia" log out and login again, hopefully you are
   using nvidia GPU. To switch back to intel GPU run "prime-select intel"
   Remember to run as root.
2. To check which GPU you're currently using run "prime-select query".

Contact
-------

* Bo Simonsen <bo@geekworld.dk>
* Michal Srb <msrb@suse.com>

