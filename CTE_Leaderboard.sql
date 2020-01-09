with SCTE (HId,CId,MScore) as (
SELECT HACKER_ID,challenge_id,Max(score) FROM SUBMISSIONS 
GROUP by HACKER_ID, challenge_id
having Max(score)>0 )
select scte.HId,h.name,SUM(scte.MScore) from SCTE join
hackers h on scte.HId=h.hacker_id
group by scte.Hid,h.Name
order by 3 desc, 1 asc