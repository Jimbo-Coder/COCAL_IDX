# COCAL_IDX
A cleaned up COCAL reader for the CarpetX EinsteinToolkit

1. Use the thornlist asterx_subcycle.th to checkout the ETK + CarpetX (subcycle) + cocal_IDX, 
> ./GetComponents --root {dir} asterx_subcycle.th 

2. Obtain a 1 Layer EoS RNS from https://uofi.box.com/s/gbamn61wxuhh5iw6dxte1m1bzrgtl0al , both IDs that have K123.6 in the title should be 1 Layer. Pick between CF or WL.

3. Configure simfactory mdb files, machine.ini, .cfg, .run, .sub, sets output location. Lastly 
> ./simfactory/bin/sim setup-silent.
I use in my .bashrc " alias sim="./simfactory/bin/sim" " . 

4. GPU configurating

5. Compile with 
> ./simfactory/bin/sim {config name} --thornlist ../asterx_subcycle.th

6. Submit jobs with 
> ./simfactory/bin/sim create-submit {simname} --config {config name} --parfile {parfilepath} --queue {queue} --procs {procs} --num-threads {threads} --walltime {walltime}

7. Ensure that the parameters
cocal_IDX::coc2cac_rnstype
cocal_IDX::coc2cac_dir_path_ID
are set correctly in the .parfile, point to respective ID and have the correct type.