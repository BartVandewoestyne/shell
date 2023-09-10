#! /bin/bash

# Update g95
wget -O - http://www.g95.org/g95-x86-linux.tgz | tar xvfz -
rm -rf ~bartv/lib/g95-install/
mv g95-install/ ~bartv/lib/

# Update gfortran
wget -O - http://quatramaran.ens.fr/~coudert/gfortran/gfortran-linux.tar.gz | tar xfz -
rm -rf ~bartv/lib/gfortran/irun/
mv irun/ ~bartv/lib/gfortran/

# Re-install F
wget -O - ftp://ftp.swcp.com/pub/walt/F/f_linux_031017.tar.gz | tar xfz -
cp F_031017/bin/* ~/bin/bin.linux/
cp -d -p F_031017/lib/* ~/lib/F/
cp F_031017/doc/*.1 ~/man/man1
