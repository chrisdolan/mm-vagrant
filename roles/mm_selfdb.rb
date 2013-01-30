# -*- mode: ruby -*-
# vi: set ft=ruby :

name "mm_selfdb"
description "This will try to download the latest database backup and restore it to a local mysql server"
run_list "recipe[build-essential]", "recipe[mm::self_db]"
override_attributes "build_essential" => { "compiletime" => true }