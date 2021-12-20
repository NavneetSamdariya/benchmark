#!/bin/bash
command |& tee -a benchlog.txt
sysbench --test=cpu run
sysbench --test=memory run
sysbench --test=fileio --file-test-mode=seqwr run

snap install geekbench4 --edge
./geekbench4
sudo pacman -S git fakeroot patch
git clone https://aur.archlinux.org/phoronix-test-suite
cd phoronix-test-suite/
makepkg -s
ls *pkg.tar.*
phoronix-test-suite-10.2.2-1-any.pkg.tar.zst
sudo pacman -U --noconfirm phoronix-test-suite-10.2.2-1-any.pkg.tar.zst
pacman -S hardinfo
phoronix-test-suite install john-the-ripper
phoronix-test-suite run john-the-ripper
phoronx-test-suite install luxmark
phoronix-test-suite run luxmark
phoronix-test-suite install compile-firefox
phoronix-test-suite run compile-firefox
echo The Benchmark is Complete
