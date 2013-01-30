#MakeMusic Vagrant

This project provides a vagrant environment for working on the  MakeMusic project, available at https://github.com/alarner/makemusic .  It does NOT, however, actually check out that code.  The idea is that you will check the code out with your own github account so that you can commit with your username.

##Setup

1. Install [vagrant](http://www.vagrantup.com/) and [Virtualbox](https://www.virtualbox.org/).
2. Clone this here repo wherever you like
3. ```cd site``` and clone [the MakingMusic repo](https://github.com/alarner/makemusic) into ```.```  Your base directory should have a path such as 'site/app/webroot'.  (ie, not 'site/makemusic/app/webroot') 
4. ```cd .. && vagrant up```  Vagrant will download a base centos install (~300Mb) and then configure the site.  The centos download will only happen the very first time you use vagrant.
5. Edit your /etc/hosts file and add a line:

```127.0.0.1 dev.match.makemusicny.com```


##Dev

Your dev instance should now be available at http://dev.match.makemusicny.com:8080/ .  You can edit the files in site/ with the text editor of your choice.

The mysql instance is available at 127:0:0:1:33306, and you can authenticate with 'root:s00per' or 'matchusermaker:buildM@dison!'.

##Teardown

When you're done, you can shut down the VM in a number of ways.  ```vagrant halt``` will shut down the VM without deleting anything, allowing you to ```vagrant up``` and pick up where you left off.  ```vagrant destroy``` will delete the VM from your workstation.  (This shouldn't delete anything under site/.)


Feel free to get ahold of me at mike.schuette (shift-2) gmail.com.