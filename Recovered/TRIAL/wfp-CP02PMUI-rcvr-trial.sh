#!/bin/bash

# Ingest.wfp-eng-stc-imodem_recovered   /omc_data/CP02PMUI/R00002/dcl00/CWFP_sn12714-01/E*.DAT          CP02PMUI-WFP01-00-000000000
# Ingest.ctdpf-ckl-wfp_recovered        /omc_data/CP02PMUI/R00002/dcl00/CWFP_sn12714-01/C*.DAT          CP02PMUI-WFP01-03-CTDPFK000
# Ingest.dofst-k-wfp_recovered          /omc_data/CP02PMUI/R00002/dcl00/CWFP_sn12714-01/C*.DAT          CP02PMUI-WFP01-02-DOFSTK000
# Ingest.flort-kn-stc-imodem_recovered  /omc_data/CP02PMUI/R00002/dcl00/CWFP_sn12714-01/E*.DAT          CP02PMUI-WFP01-04-FLORTK000
# Ingest.parad-k-stc-imodem_recovered   /omc_data/CP02PMUI/R00002/dcl00/CWFP_sn12714-01/E*.DAT          CP02PMUI-WFP01-05-PARADK000
# Ingest.vel3d-k-wfp-stc_recovered      /omc_data/CP02PMUI/R00002/dcl00/CWFP_sn12714-01/A*.DAT          CP02PMUI-WFP01-01-VEL3DK000
# Ingest.adcps-jln-stc_recovered        /omc_data/CP02PMUI/R00002/dcl00/ADCP_sn20499/SN_20499_Recovered_Data_RDI_000.000 CP02PMUI-RII01-01-ADCPTG000
# Ingest.cg-stc-eng-stc_recovered       /omc_data/CP02PMUI/R00002/dcl00/cg_data/irid2shore/stc_status.*_*.txt  CP02PMUI-SBS01-00-000000000
# Ingest.mopak-o-dcl_recovered          /omc_data/CP02PMUI/R00002/dcl00/cg_data/3dmgx3/*_*.3dmgx3.log   CP02PMUI-SBS01-01-MOPAK0000
# Ingest.rte-o-dcl_recovered            /omc_data/CP02PMUI/R00002/dcl00/cg_data/rte/*.rte.log           CP02PMUI-SBS01-XX-RTEXX0000

INGS=/home/developer/uframes/ooi/bin/ingestsender
INGESTLOG=/home/wdk/race/log/wfp-CP02PMUI-rcvr-command.log
INGESTLOGT=/home/wdk/race/log/wfp-CP02PMUI-rcvr-command.log-T
EDEXSRV=/home/developer/uframes/ooi/bin/edex-server
source $EDEXSRV

EDEXLOGDIR=/home/developer/uframes/ooi/uframe-1.0/edex/logs
EDEXLOGFILES=$(ls $EDEXLOGDIR/edex-ooi*.log)

date 
echo "starting wfp-CP02PMUI-rcvr.sh" 

#files of the type
MCI_DAT_A=/omc_data/whoi/OMC/CP02PMUI/R00002/dcl00/CWFP_sn12714-01/A*.DAT 
MCI_DAT_C=/omc_data/whoi/OMC/CP02PMUI/R00002/dcl00/CWFP_sn12714-01/C*.DAT 
MCI_DAT_E=/omc_data/whoi/OMC/CP02PMUI/R00002/dcl00/CWFP_sn12714-01/E*.DAT 

MCI_00=/omc_data/whoi/OMC/CP02PMUI/R00002/dcl00/ADCP_sn20499/SN_20499_Recovered_Data_RDI_000.000
#MCI_3d=/omc_data/whoi/OMC/CP02PMUI/R00002/dcl00/cg_data/3dmgx3/*_*.3dmgx3.log   
#MCI_rte=/omc_data/whoi/OMC/CP02PMUI/R00002/dcl00/cg_data/rte/*.rte.log
#MCI_txt=/omc_data/whoi/OMC/CP02PMUI/R00002/dcl00/cg_data/irid2shore/stc_status.*_*.txt



MCI_DAT_A_files=$(find $MCI_DAT_A -print)
MCI_DAT_C_files=$(find $MCI_DAT_C -print)
MCI_DAT_E_files=$(find $MCI_DAT_E -print)

MCI_00_files=$(find $MCI_00 -print)
#MCI_3d_files=$(find $MCI_3d -print)
#MCI_rte_files=$(find $MCI_rte -print)
#MCI_txt_files=$(find $MCI_txt -print)



total=$(ls $MCI_DAT_A | wc -l)
echo $total
count=0
for f_A in $MCI_DAT_A_files
do
    if  grep --quiet $f_A $EDEXLOGFILES; then
        echo "move on" > /dev/null
    else
	ls -l $f_A
	echo $INGS Ingest.vel3d-k-wfp-stc_recovered $f_A CP02PMUI-WFP01-01-VEL3DK000 recovered 
	     $INGS Ingest.vel3d-k-wfp-stc_recovered $f_A CP02PMUI-WFP01-01-VEL3DK000 recovered
    fi
    count=$((count+1))
    echo $count
    if [ "$count" -gt " $(expr $total / 4)" ];then
        break
    fi

done

###########################################################################################################
total=$(ls $MCI_DAT_C | wc -l)
echo $total
count=0

for f_C in $MCI_DAT_C_files
do
    if  grep --quiet $f_C $EDEXLOGFILES; then
        echo "move on" > /dev/null
    else
	ls -l $f_C
	echo $INGS Ingest.ctdpf-ckl-wfp_recovered $f_C CP02PMUI-WFP01-03-CTDPFK000 recovered 
	     $INGS Ingest.ctdpf-ckl-wfp_recovered $f_C CP02PMUI-WFP01-03-CTDPFK000 recovered
	echo $INGS Ingest.dofst-k-wfp_recovered $f_C CP02PMUI-WFP01-02-DOFSTK000 recovered 
	     $INGS Ingest.dofst-k-wfp_recovered $f_C CP02PMUI-WFP01-02-DOFSTK000 recovered
    fi
     count=$((count+1))
    echo $count
    if [ "$count" -gt " $(expr $total / 4)" ];then
        break
    fi
done

############################################################################################################
total=$(ls $MCI_DAT_E | wc -l)
echo $total
count=0

for f_E in $MCI_DAT_E_files
do
    if  grep --quiet $f_E $EDEXLOGFILES; then
        echo "move on" > /dev/null
    else
	ls -l $f_E
	echo $INGS Ingest.wfp-eng-stc-imodem_recovered $f_E CP02PMUI-WFP01-00-STCENG000 recovered 
         $INGS Ingest.wfp-eng-stc-imodem_recovered $f_E CP02PMUI-WFP01-00-STCENG000 recovered
	echo $INGS Ingest.flort-kn-stc-imodem_recovered $f_E CP02PMUI-WFP01-04-FLORTK000 recovered 
	     $INGS Ingest.flort-kn-stc-imodem_recovered $f_E CP02PMUI-WFP01-04-FLORTK000 recovered
	echo $INGS Ingest.parad-k-stc-imodem_recovered $f_E CP02PMUI-WFP01-05-PARADK000 recovered 
	     $INGS Ingest.parad-k-stc-imodem_recovered $f_E CP02PMUI-WFP01-05-PARADK000 recovered 
    fi
    count=$((count+1))
    echo $count
    if [ "$count" -gt " $(expr $total / 4)" ];then
        break
    fi
done

##########################################################################################################
total=$(ls $MCI_00 | wc -l)
echo $total
count=0

for f_l in $MCI_00_files
do
    if  grep --quiet $f_l $EDEXLOGFILES; then
        echo "move on" > /dev/null
    else
	ls -l $f_l
	echo $INGS Ingest.adcps-jln-stc_recovered $f_l CP02PMUI-RII01-01-ADCPTG000 recovered 
	     $INGS Ingest.adcps-jln-stc_recovered $f_l CP02PMUI-RII01-01-ADCPTG000 recovered
    fi
     count=$((count+1))
    echo $count
    if [ "$count" -gt " $(expr $total / 4)" ];then
        break
    fi
done



#for f_l in $MCI_3d_files
#do
#    if  grep --quiet $f_l $EDEXLOGFILES; then
#        echo "move on" > /dev/null
#    else
#	ls -l $f_l
#	echo $INGS Ingest.mopak-o-dcl_recovered $f_l CP02PMUI-SBS01-01-MOPAK0000 recovered 
#	     $INGS Ingest.mopak-o-dcl_recovered $f_l CP02PMUI-SBS01-01-MOPAK0000 recovered
#    fi
#done
#
#
#for f_t in $MCI_txt_files
#do
#    if  grep --quiet $f_t $EDEXLOGFILES; then
#        echo "move on" > /dev/null
#    else
#	ls -l $f_t
#	echo $INGS Ingest.cg-stc-eng-stc_recovered $f_t CP02PMUI-SBS01-00-STCENG000 recovered 
#	     $INGS Ingest.cg-stc-eng-stc_recovered $f_t CP02PMUI-SBS01-00-STCENG000 recovered
#    fi
#done
#
#for f_t in $MCI_rte_files
#do
#    if  grep --quiet $f_t $EDEXLOGFILES; then
#        echo "move on" > /dev/null
#    else
#	ls -l $f_t
#	echo $INGS Ingest.rte-o-dcl_recovered $f_t CP02PMUI-SBS01-XX-RTEXX0000 recovered 
#	     $INGS Ingest.rte-o-dcl_recovered $f_t CP02PMUI-SBS01-XX-RTEXX0000 recovered
#    fi
#done

date 
echo "ended new-ingest-wfp-CP02PMUI.sh" 
