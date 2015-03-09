#!/bin/bash

# Ingest.ctdmo-ghqr-sio_telemetered         /omc_data/whoi/OMC/GP02HYPM/D00002/node*p1_*.ctdmo.dat       GP02HYPM-RIS01-xx-CTDMOx000
# Ingest.ctdpf-ckl-wfp-sio-mule_telemetered /omc_data/whoi/OMC/GP02HYPM/D00002/node*p1_*.wc_wfp.dat      GP02HYPM-WFP02-04-CTDPFL000 
# Ingest.dosta-ln-wfp-sio-mule_telemetered  /omc_data/whoi/OMC/GP02HYPM/D00002/node*p1_*.we_wfp.dat      GP02HYPM-WFP02-03-DOSTAL000 not sure!!
# Ingest.flord-l-wfp-sio_telemetered        /omc_data/whoi/OMC/GP02HYPM/D00002/node*p1_*.we_wfp.dat      GP02HYPM-WFP02-01-FLORDL000 not sure!!
# Ingest.vel3d-l-wfp-sio_telemetered        /omc_data/whoi/OMC/GP02HYPM/D00002/node*p1_*.wa_wfp.dat      GP02HYPM-WFP02-05-VEL3DL000 not sure!!
# Ingest.wfp-eng-wfp-sio-mule_telemetered   /omc_data/whoi/OMC/GP02HYPM/D00002/node*p1_*.we_wfp.dat      GP02HYPM-WFP02-00-ENG000000 not sure!!
# Ingest.sio-eng-sio_telemetered            /omc_data/whoi/OMC/GP02HYPM/D00002/node*p1_*.status.dat      GP02HYPM-GP001-00-ENG000000

INGS=/home/developer/uframes/ooi/bin/ingestsender
INGESTLOG=/home/wdk/race/log/wfp-CP02PMCO-rcvr-command.log
INGESTLOGT=/home/wdk/race/log/wfp-CP02PMCO-rcvr-command.log-T
EDEXSRV=/home/developer/uframes/ooi/bin/edex-server
source $EDEXSRV

EDEXLOGDIR=/home/developer/uframes/ooi/uframe-1.0/edex/logs
EDEXLOGFILES=$(ls $EDEXLOGDIR/edex-ooi*.log)

date
echo "starting wfp-GP02HYPM-telemetered.sh"

#Files of the type:
DAT_CTD=/omc_data/whoi/OMC/GP02HYPM/D00002/*ctdmo*.dat    # changed!
DAT_WFP_WA_0=/omc_data/whoi/OMC/GP02HYPM/D00002/*.wa_wfp_1328320.dat
DAT_WFP_WA_1=/omc_data/whoi/OMC/GP02HYPM/D00002/*.wa_wfp_1328321.dat
DAT_WFP_WC_0=/omc_data/whoi/OMC/GP02HYPM/D00002/*.wc_wfp_1328320.dat
DAT_WFP_WC_1=/omc_data/whoi/OMC/GP02HYPM/D00002/*.wc_wfp_1328321.dat
DAT_WFP_WE_0=/omc_data/whoi/OMC/GP02HYPM/D00002/*.we_wfp_1328320.dat
DAT_WFP_WE_1=/omc_data/whoi/OMC/GP02HYPM/D00002/*.we_wfp_1328321.dat
DAT_STA=/omc_data/whoi/OMC/GP02HYPM/D00002/node*p1_*.status.dat

#Pick up the filesDAT_A_12936_files=$(find $DAT_A_12936 -print)
DAT_CTD_files=$(find $DAT_CTD -print)

DAT_WFP_WA_0_files=$(find $DAT_WFP_WA_0 -print)
DAT_WFP_WA_1_files=$(find $DAT_WFP_WA_1 -print)
DAT_WFP_WC_0_files=$(find $DAT_WFP_WC_0 -print)
DAT_WFP_WC_1_files=$(find $DAT_WFP_WC_1 -print)
DAT_WFP_WE_0_files=$(find $DAT_WFP_WE_0 -print)
DAT_WFP_WE_1_files=$(find $DAT_WFP_WE_1 -print)

DAT_STA_files=$(find $DAT_STA -print)



#Command generation:

# Ingest.ctdmo-ghqr-sio_telemetered         /omc_data/whoi/OMC/GP02HYPM/D00002/node*p1_*.ctdmo.dat       GP02HYPM-RIS01-xx-CTDMOx000
for files in $DAT_CTD_files
do
    if  grep --quiet $files $EDEXLOGFILES; then
        echo "move on" > /dev/null
    else
        ls -l $files
        echo $INGS Ingest.ctdmo-ghqr-sio_telemetered $files GP02HYPM-RIS01-xx-CTDMOx000 telemetered
             $INGS Ingest.ctdmo-ghqr-sio_telemetered $files GP02HYPM-RIS01-xx-CTDMOx000 telemetered
        sleep 3
    fi
done

# Ingest.vel3d-l-wfp-sio_telemetered        /omc_data/whoi/OMC/GP02HYPM/D00002/node*p1_*.wa_wfp.dat      GP02HYPM-WFP02-05-VEL3DL000 
for files in $DAT_WFP_WA_0_files
do
    if  grep --quiet $files $EDEXLOGFILES; then
        echo "move on" > /dev/null
    else
        ls -l $files
        echo $INGS Ingest.vel3d-l-wfp-sio_telemetered $files GP02HYPM-WFP02-05-VEL3DL000 telemetered
             $INGS Ingest.vel3d-l-wfp-sio_telemetered $files GP02HYPM-WFP02-05-VEL3DL000 telemetered
        sleep 3
    fi
done

# Ingest.vel3d-l-wfp-sio_telemetered        /omc_data/whoi/OMC/GP02HYPM/D00002/node*p1_*.wa_wfp.dat      GP02HYPM-WFP03-05-VEL3DL000 
for files in $DAT_WFP_WA_1_files
do
    if  grep --quiet $files $EDEXLOGFILES; then
        echo "move on" > /dev/null
    else
        ls -l $files
        echo $INGS Ingest.vel3d-l-wfp-sio_telemetered $files GP02HYPM-WFP03-05-VEL3DL000 telemetered
             $INGS Ingest.vel3d-l-wfp-sio_telemetered $files GP02HYPM-WFP03-05-VEL3DL000 telemetered
        sleep 3
    fi
done

# Ingest.ctdpf-ckl-wfp-sio-mule_telemetered /omc_data/whoi/OMC/GP02HYPM/D00002/node*p1_*.wc_wfp.dat      GP02HYPM-WFP02-04-CTDPFL000 not sure!!
for files in $DAT_WFP_WC_0_files
do
    if  grep --quiet $files $EDEXLOGFILES; then
        echo "move on" > /dev/null
    else
        ls -l $files
        echo $INGS Ingest.ctdpf-ckl-wfp-sio-mule_telemetered $files GP02HYPM-WFP02-04-CTDPFL000 telemetered
             $INGS Ingest.ctdpf-ckl-wfp-sio-mule_telemetered $files GP02HYPM-WFP02-04-CTDPFL000 telemetered
        sleep 3
    fi
done


# Ingest.ctdpf-ckl-wfp-sio-mule_telemetered /omc_data/whoi/OMC/GP02HYPM/D00002/node*p1_*.wc_wfp.dat      GP02HYPM-WFP03-04-CTDPFL000 not sure!!
for files in $DAT_WFP_WC_1_files
do
    if  grep --quiet $files $EDEXLOGFILES; then
        echo "move on" > /dev/null
    else
        ls -l $files
        echo $INGS Ingest.ctdpf-ckl-wfp-sio-mule_telemetered $files GP02HYPM-WFP03-04-CTDPFL000 telemetered
             $INGS Ingest.ctdpf-ckl-wfp-sio-mule_telemetered $files GP02HYPM-WFP03-04-CTDPFL000 telemetered
        sleep 3
    fi
done


# Ingest.dosta-ln-wfp-sio-mule_telemetered  /omc_data/whoi/OMC/GP02HYPM/D00002/node*p1_*.we_wfp.dat      GP02HYPM-WFP02-03-DOSTAL000 not sure!!
# Ingest.flord-l-wfp-sio_telemetered        /omc_data/whoi/OMC/GP02HYPM/D00002/node*p1_*.we_wfp.dat      GP02HYPM-WFP02-01-FLORDL000 not sure!!
# Ingest.wfp-eng-wfp-sio-mule_telemetered   /omc_data/whoi/OMC/GP02HYPM/D00002/node*p1_*.we_wfp.dat      GP02HYPM-WFP02-00-ENG000000 not sure!!
for files in $DAT_WFP_WE_0_files
do
    if  grep --quiet $files $EDEXLOGFILES; then
        echo "move on" > /dev/null
    else
        ls -l $files
        echo $INGS Ingest.dosta-ln-wfp-sio-mule_telemetered $files GP02HYPM-WFP02-03-DOSTAL000 telemetered
             $INGS Ingest.dosta-ln-wfp-sio-mule_telemetered $files GP02HYPM-WFP02-03-DOSTAL000 telemetered
        sleep 3
        echo $INGS Ingest.flord-l-wfp-sio_telemetered $files GP02HYPM-WFP02-01-FLORDL000 telemetered
             $INGS Ingest.flord-l-wfp-sio_telemetered $files GP02HYPM-WFP02-01-FLORDL000 telemetered
        sleep 3
        echo $INGS Ingest.wfp-eng-wfp-sio-mule_telemetered $files GP02HYPM-WFP02-00-ENG000000 telemetered
             $INGS Ingest.wfp-eng-wfp-sio-mule_telemetered $files GP02HYPM-WFP02-00-ENG000000 telemetered
        sleep 3

    fi
done

for files in $DAT_WFP_WE_1_files
do
    if  grep --quiet $files $EDEXLOGFILES; then
        echo "move on" > /dev/null
    else
        ls -l $files
        echo $INGS Ingest.dosta-ln-wfp-sio-mule_telemetered $files GP02HYPM-WFP03-03-DOSTAL000 telemetered
             $INGS Ingest.dosta-ln-wfp-sio-mule_telemetered $files GP02HYPM-WFP03-03-DOSTAL000 telemetered
        sleep 3
        echo $INGS Ingest.flord-l-wfp-sio_telemetered $files GP02HYPM-WFP03-01-FLORDL000 telemetered
             $INGS Ingest.flord-l-wfp-sio_telemetered $files GP02HYPM-WFP03-01-FLORDL000 telemetered
        sleep 3
        echo $INGS Ingest.wfp-eng-wfp-sio-mule_telemetered $files GP02HYPM-WFP03-00-ENG000000 telemetered
             $INGS Ingest.wfp-eng-wfp-sio-mule_telemetered $files GP02HYPM-WFP03-00-ENG000000 telemetered
        sleep 3

    fi
done




# Ingest.sio-eng-sio_telemetered            /omc_data/whoi/OMC/GP02HYPM/D00002/node*p1_*.status.dat      GP02HYPM-GP001-00-ENG000000
for files in $DAT_STA_files
do
    if  grep --quiet $files $EDEXLOGFILES; then
        echo "move on" > /dev/null
    else
        ls -l $files
        echo $INGS Ingest.sio-eng-sio_telemetered $files GP02HYPM-GP001-00-ENG000000 telemetered
             $INGS Ingest.sio-eng-sio_telemetered $files GP02HYPM-GP001-00-ENG000000 telemetered
        sleep 3
    fi
done

date
echo "ended wfp-GP02HYPM-tele.sh"













