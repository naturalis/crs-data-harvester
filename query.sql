SPOOL result.csv

set colsep ,
SET TRIMS ON FEEDBACK OFF ECHO OFF
set pagesize 0 embedded on
set trimspool on
set trimout on
set linesize 400
SET NEWPAGE NONE
set underline off
	
SELECT s.registrationnumber, s.INST_COLL_SUBCOLL, s.transferreason, s.PRESERVEDPART, db.ICOONURL, db.URL, det.FULLSCIENTIFICNAME, det.genus, det.epithet
FROM   NCRS_SPECIMEN s
INNER JOIN NCRS_DATAGROUP dg ON dg.SPECIMENID = s.ID
inner join FRM_XMLBESCHRIJVINGEN x on  s.XMLBESCHRIJVINGID = x.ID
left join frm_containerrelaties cr on x.containerid = cr.containedbyid
left join frm_containers c on cr.containerid = c.id 
left join FRM_DIGITALEBESTANDEN db on c.digitaalbestandid = db.id
left join NCRS_DETERMINATION det on dg.id = det.DATAGROUP
where  s.registrationnumber IN  ( 'RGM.150773','RGM.150775','RGM.150776','RGM.150777','RGM.150779','RGM.150780','RGM.150781','RGM.150782' )
and det.preferred = 1
order by s.INST_COLL_SUBCOLL, s.registrationnumber ASC;

SPOOL OFF 
exit
