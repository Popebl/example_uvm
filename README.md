
## Introduce

Thanks to Wuzhangquan (https://github.com/emwzq) for providing the basic source code of Volume 1 of 'UVM Practical Guide' by Zhang Qiang. In order to successfully compile on Synopsys VCS and view waveforms using Verdi, I made some modifications. To efficiently submit changes, I forked this repository.

## compile command
```bash
vcs -sverilog +incdir+$VCS_HOME/etc/uvm-1.2 +define+UVM_NO_DPI +vcs+dumvars -f filelist.f -full64 -debug_all -timescale=1ns/1ps -P $VERDI_HOME/share/PLI/VCS/LINUX64/novas.tab $VERDI_HOME/share/PLI/VCS/LINUX64/pli.a
```

## run command 
```bash
./simv +fsdb+autoflush
```

## view waveform by verdi
```bash
verdi -f filelist.f -ssf wave.fsdb
```