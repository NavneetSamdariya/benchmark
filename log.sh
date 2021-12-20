#!/bin/bash
command |& tee -a benchlog.txt
sysbench --test=cpu run
sysbench --test=memory run
sysbench --test=fileio --file-test-mode=seqwr run

./geekbench4
pacman -S hardinfo
phoronix-test-suite install john-the-ripper
phoronix-test-suite run john-the-ripper
phoronx-test-suite install luxmark
phoronix-test-suite run luxmark
phoronix-test-suite install compile-firefox
phoronix-test-suite run compile-firefox
echo The Benchmark is Complete
