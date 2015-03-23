#!/bin/bash
# Ingest.adcps-jln-sio_telemetered       /omc_data/whoi/OMC/GP03FLMB/D00002/node*p1_*.adcps.dat     GP03FLMB-RIS02-01-ADCPSL000

# Ingest.ctdmo-ghqr-sio_telemetered      /omc_data/whoi/OMC/GP03FLMB/D00002/node*p1_*.ctdmo.dat     GP03FLMB-RIS02-03-CTDMOG000  ?????????
# Ingest.ctdmo-ghqr-sio_telemetered      /omc_data/whoi/OMC/GP03FLMB/D00002/node*p1_*.ctdmo.dat     GP03FLMB-RIS02-04-CTDMOG000
# Ingest.ctdmo-ghqr-sio_telemetered      /omc_data/whoi/OMC/GP03FLMB/D00002/node*p1_*.ctdmo.dat     GP03FLMB-RIS02-05-CTDMOG000
# Ingest.ctdmo-ghqr-sio_telemetered      /omc_data/whoi/OMC/GP03FLMB/D00002/node*p1_*.ctdmo.dat     GP03FLMB-RIS02-06-CTDMOG000
# Ingest.ctdmo-ghqr-sio_telemetered      /omc_data/whoi/OMC/GP03FLMB/D00002/node*p1_*.ctdmo.dat     GP03FLMB-RIS02-07-CTDMOG000
# Ingest.ctdmo-ghqr-sio_telemetered      /omc_data/whoi/OMC/GP03FLMB/D00002/node*p1_*.ctdmo.dat     GP03FLMB-RIS02-08-CTDMOG000
# Ingest.ctdmo-ghqr-sio_telemetered      /omc_data/whoi/OMC/GP03FLMB/D00002/node*p1_*.ctdmo.dat     GP03FLMB-RIS02-09-CTDMOG000
# Ingest.ctdmo-ghqr-sio_telemetered      /omc_data/whoi/OMC/GP03FLMB/D00002/node*p1_*.ctdmo.dat     GP03FLMB-RIS02-10-CTDMOG000
# Ingest.ctdmo-ghqr-sio_telemetered      /omc_data/whoi/OMC/GP03FLMB/D00002/node*p1_*.ctdmo.dat     GP03FLMB-RIS02-11-CTDMOG000
# Ingest.ctdmo-ghqr-sio_telemetered      /omc_data/whoi/OMC/GP03FLMB/D00002/node*p1_*.ctdmo.dat     GP03FLMB-RIS02-12-CTDMOH000
# Ingest.ctdmo-ghqr-sio_telemetered      /omc_data/whoi/OMC/GP03FLMB/D00002/node*p1_*.ctdmo.dat     GP03FLMB-RIS02-13-CTDMOHO00
# Ingest.ctdmo-ghqr-sio_telemetered      /omc_data/whoi/OMC/GP03FLMB/D00002/node*p1_*.ctdmo.dat     GP03FLMB-RIS02-14-CTDMOH000


# Ingest.dosta-abcdjm-sio_telemetered      /omc_data/whoi/OMC/GP03FLMB/D00002/node*p1_*.dosta.dat     GP03FLMB-RIS01-03-DOSTAD000
# Ingest.flort-dj-sio_telemetered        /omc_data/whoi/OMC/GP03FLMB/D00002/node*p1_*.flort.dat     GP03FLMB-RIS01-01-FLORTD000
# Ingest.phsen-abcdef-sio_telemetered    /omc_data/whoi/OMC/GP03FLMB/D00002/node*p1_*.phsen.dat     GP03FLMB-RIS01-02-PHSENE000
# Ingest.sio-eng-sio_telemetered         /omc_data/whoi/OMC/GP03FLMB/D00002/node*p1_*.status.dat    GP03FLMB-FM001-00-ENG000000

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
DAT_ADC=/omc_data/whoi/OMC/GP03FLMB/D00002/*adcps*.dat
DAT_CTD=/omc_data/whoi/OMC/GP03FLMB/D00002/*ctdmo*.dat
DAT_DOS=/omc_data/whoi/OMC/GP03FLMB/D00002/*dosta*.dat
DAT_FLO=/omc_data/whoi/OMC/GP03FLMB/D00002/*flort*.dat
DAT_PHS=/omc_data/whoi/OMC/GP03FLMB/D00002/*phsen*.dat
DAT_STA=/omc_data/whoi/OMC/GP03FLMB/D00002/*status_1*.dat



#Pick up the files:
DAT_ADC_files=$(find $DAT_ADC -print)
DAT_CTD_files=$(find $DAT_CTD -print)
DAT_DOS_files=$(find $DAT_DOS -print)
DAT_FLO_files=$(find $DAT_FLO -print)
DAT_PHS_files=$(find $DAT_PHS -print)
DAT_STA_files=$(find $DAT_STA -print)


#Command generation:

# Ingest.adcps-jln-sio_telemetered       /omc_data/whoi/OMC/GP03FLMB/D00002/node*p1_*.adcps.dat     GP03FLMB-RIS02-01-ADCPSL000
for files in $DAT_ADC_files
do
    if  grep --quiet $files $EDEXLOGFILES; then
        echo "move on" > /dev/null
    else
        ls -l $files
        echo $INGS Ingest.adcps-jln-sio_telemetered $files GP03FLMB-RIS02-01-ADCPSL000 telemetered
             $INGS Ingest.adcps-jln-sio_telemetered $files GP03FLMB-RIS02-01-ADCPSL000 telemetered
        sleep 3
    fi
done

#**************************************** no info yet for ctd *******************************************
# Ingest.ctdmo-ghqr-sio_telemetered      /omc_data/whoi/OMC/GP03FLMA/D00002/node*p1_*.ctdmo.dat     GP03FLMA-xxxxx-03-CTDMOx000
for files in $DAT_DOS_files
do
    if  grep --quiet $files $EDEXLOGFILES; then
        echo "move on" > /dev/null
    else
        ls -l $files
        echo $INGS Ingest.ctdmo-ghqr-sio_telemetered $files GP03FLMB-xxxxx-03-CTDMOx000 telemetered
             $INGS Ingest.ctdmo-ghqr-sio_telemetered $files GP03FLMB-xxxxx-03-CTDMOx000 telemetered
        sleep 3
    fi
done

#*******************************************************************************************************

# Ingest.ctdmo-ghqr-sio_telemetered      /omc_data/whoi/OMC/GP03FLMB/D00002/node*p1_*.dosta.dat     GP03FLMB-RIS01-03-DOSTAD000
for files in $DAT_DOS_files
do
    if  grep --quiet $files $EDEXLOGFILES; then
        echo "move on" > /dev/null
    else
        ls -l $files
        echo $INGS Ingest.ctdmo-ghqr-sio_telemetered $files GP03FLMB-RIS01-03-DOSTAD000 telemetered
             $INGS Ingest.ctdmo-ghqr-sio_telemetered $files GP03FLMB-RIS01-03-DOSTAD000 telemetered
        sleep 3
    fi
done


# Ingest.flort-dj-sio_telemetered        /omc_data/whoi/OMC/GP03FLMB/D00002/node*p1_*.flort.dat     GP03FLMB-RIS01-01-FLORTD000
for files in $DAT_FLO_files
do
    if  grep --quiet $files $EDEXLOGFILES; then
        echo "move on" > /dev/null
    else
        ls -l $files
        echo $INGS Ingest.flort-dj-sio_telemetered $files GP03FLMB-RIS01-01-FLORTD000 telemetered
             $INGS Ingest.flort-dj-sio_telemetered $files GP03FLMB-RIS01-01-FLORTD000 telemetered
        sleep 3
    fi
done

# Ingest.phsen-abcdef-sio_telemetered    /omc_data/whoi/OMC/GP03FLMB/D00002/node*p1_*.phsen.dat     GP03FLMB-RIS01-02-PHSENE000
for files in $DAT_PHS_files
do
    if  grep --quiet $files $EDEXLOGFILES; then
        echo "move on" > /dev/null
    else
        ls -l $files
        echo $INGS Ingest.phsen-abcdef-sio_telemetered $files GP03FLMB-RIS01-02-PHSENE000 telemetered
             $INGS Ingest.phsen-abcdef-sio_telemetered $files GP03FLMB-RIS01-02-PHSENE000 telemetered
        sleep 3
    fi
done

# Ingest.sio-eng-sio_telemetered         /omc_data/whoi/OMC/GP03FLMB/D00002/node*p1_*.status.dat    GP03FLMB-FM001-00-ENG000000
for files in $DAT_STA_files
do
    if  grep --quiet $files $EDEXLOGFILES; then
        echo "move on" > /dev/null
    else
        ls -l $files
        echo $INGS Ingest.sio-eng-sio_telemetered $files GP03FLMB-FM001-00-ENG000000 telemetered
             $INGS Ingest.sio-eng-sio_telemetered $files GP03FLMB-FM001-00-ENG000000 telemetered
        sleep 3
    fi
done

date

echo "finished GP03FLMB.sh"











