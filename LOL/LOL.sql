select count(*) from data_solo_rank;
select * from champion_name;
select * from champion_name_kr;

create or replace view cn
as
select cn_eg.championid cid,cn_eg.champion_name cn_eg,cn_kr.champion_name_kr cn_kr
from champion_name cn_eg join champion_name_kr cn_kr
on cn_eg.championid=cn_kr.championid
order by cn_eg.championid;

select * from cn;
select*from tab;

create synonym dsr for data_solo_rank;
select * from dsr;

ALTER TABLE data_solo_rank RENAME COLUMN CID TO CHAMPIONID;
ALTER VIEW RC RENAME COLUMN CHAMPION_NAME TO CN_EG;
ALTER VIEW RC RENAME COLUMN CHAMPION_NAME_KR TO CN_KR;

select dsr.gameid, cn.cn_kr, dsr.lane, dsr.damagetaken damage, dsr.damagedealt deal, dsr.win,dsr.kills, dsr.deaths,dsr.assists
from cn join data_solo_rank dsr
on cn.cid=dsr.cid
order by dsr.gameid;

--기본키 생성-->index생성-->검색속도
alter table champion_name_KR
add constraint pk_cnk_cid primary key(championid);
alter table champion_name
add constraint pk_cn_cid primary key(championid);
--dsr 기본키(조합키, 슈퍼키)생성
select * from dsr;
alter table data_solo_rank
add constraint pk_dsr_gid_pid primary key(gameid, participantid);
--외래키
alter table data_solo_rank
add constraint fk_cid foreign key(championid) REFERENCES champion_name_KR(championid);

--dsr, cn 조인 view 생성
create or replace view rc
as
select dsr.*,cn.cn_kr, cn.cn_eg
from dsr join cn
on dsr.championid = cn.cid;

select *from rc;
select count(*)/10||'게임' from rc;
select count(distinct gameid)||'게임' from rc;
--게임당 인원수
select gameid, count(*)||'명'
from rc
group by gameid;
--챔피언 개수(159개)
select count(*)||'개' from cn;
--모든 챔피언의 분당 골드량
create or replace view cpid_gold_mi
as
select rc.cn_kr, round(rc.gold/(rc.duration/60)) gold_mi
from rc
order by gold_mi desc;

select * from cpid_gold_mi;

--챔피언별 분당 골드량
create or replace view cpid_gold_mi
as
select rc.cn_kr, round(avg(rc.gold/(rc.duration/60))) gold_mi
from rc
group by rc.cn_kr
order by gold_mi desc;
select * from cpid_gold_mi;

select *
from CN left join cpid_gold_mi
on cpid_gold_mi.cn_kr = CN.cn_kr
order by CN.cid;

--분당 골드량 top-3챔피언
select * from cpid_gold_mi
where rownum<=3;
--lane별 뷰 생성
--view에 조인이 아닌 where, order by절은 꼭 필요한지 고려한다.
create or replace view top
as
select * from rc
where lane='Top';
select * from top;
drop view top;
--라인 종류
select distinct(lane) lane from rc;
--KDA: 챔피언별(kills+assists)/deaths 통계
--서브쿼리를 이용한 녹턴, 세트의 kda수치
select rc.cn_kr, round((sum(rc.kills)+sum(rc.assists))/sum(rc.deaths),2) as kda
from rc 
where gameid in(select gameid from top) --서브쿼리결과와 or 비교 때문에 오버헤드 크다
group by rc.cn_kr
having rc.cn_kr in('녹턴','세트')
order by rc.cn_kr
;
select rc.cn_kr, round((sum(rc.kills)+sum(rc.assists))/sum(rc.deaths),2) as kda
from rc 
where gameid in(select gameid from TOP) --서브쿼리결과와 or 비교 때문에 오버헤드 크다
group by rc.cn_kr;
--위 코드 튜닝
--top라인의 세트(875)와 녹턴(56)의 매치업 게임에서의 kda
select t1.cname as cname1, round((sum(t1.kills)+sum(t1.assists))/sum(t1.deaths),2) as kda1,
t2.cname as cname2, round((sum(t2.kills)+sum(t2.assists))/sum(t2.deaths),2) as kda2      
from (select rc.cn_kr cname, rc.* from rc where rc.championid=56) t1 join
    (select rc.cn_kr cname, rc.* from rc where rc.championid=875) t2
on t1.gameid=t2.gameid and t1.lane = t2.lane
where t1.lane='Top'
group by t1.cname, t2.cname;

--챔피언에게 가한 피해량(챔피언별 rc.demagedealt)의 평균
--세트(875)와 녹턴(56)
select t1.cname as cname1, round(avg(t1.damagedealt)) as dgd1, 
        t2.cname as cname2, round(avg(t2.damagedealt)) as dgd2
from(select gameid,lane,cn_kr as cname, damagedealt 
    from rc where championid=56) t1 join
    (select gameid,lane,cn_kr as cname, damagedealt 
    from rc where championid=875) t2
on t1.gameid = t2.gameid and t1.lane = t2.lane
where t1.lane='Top'
group by t1.cname, t2.cname;
--챔피언별 win(승률) 통계
--특정 포지션별 챔피언 승률(때로는 포지션 고려없이 승률을 구하기도 함)
--세트 녹턴
select t1.gameid, t1.lane, t1.cname1, t1.win as win1,
        t2.gameid, t2.lane, t2.cname2, t2.win as win2
from(select gameid,lane,cn_kr as cname1, win 
    from rc where championid=56) t1 join
    (select gameid,lane,cn_kr as cname2, win
    from rc where championid=875) t2
on t1.gameid = t2.gameid and t1.lane = t2.lane
where t1.lane='Top'
order by t1.win;

select count(*)/2 from rc rc1 join rc rc2 
on rc1.gameid = rc2.gameid
where rc1.side=rc2.side and rc1.win=rc2.win and rc1.lane = rc2.lane and rc1.cn_kr<>rc2.cn_kr;

select * from rc where gameid=5312967029 order by win;

-------------------------------------------------------------------------------------------
--위의 결과 레코드를 자바에서 전체레코드 수, 녹턴의 true개수, 세트의 true 개수 카운트에서 승률 구할 것.
--------------------------------------------------------------------------------------------
--각 챔피언별 승패 수
SELECT t2.lane,t2.cname name2, COUNT(*) AS CNT, T2.WIN win2, t1.cname name1
FROM (SELECT GAMEID,rc.cn_kr AS CNAME, WIN, LANE
        FROM RC) T1
INNER JOIN (SELECT GAMEID,rc.cn_kr AS CNAME, WIN, LANE
            FROM RC where championid=875) T2
ON T1.GAMEID = T2.GAMEID AND T1.LANE = T2.LANE
WHERE T1.LANE='Top' AND t1.cname<>t2.cname and t2.win = 'True'
GROUP BY t2.cname, T2.WIN, t2.lane, t1.cname
ORDER BY t1.cname;

--각 챔피언별 토탈 승부 수
SELECT t2.lane,t2.cname name2, COUNT(*) AS CNT, t1.cname name1
FROM (SELECT GAMEID,rc.cn_kr AS CNAME, WIN, LANE
        FROM RC) T1
INNER JOIN (SELECT GAMEID,rc.cn_kr AS CNAME, WIN, LANE
            FROM RC where championid=875) T2
ON T1.GAMEID = T2.GAMEID AND T1.LANE = T2.LANE
WHERE T1.LANE='Top' AND t1.cname<>t2.cname 
GROUP BY t2.cname, t2.lane, t1.cname
having count(*) >=10
ORDER BY t1.cname;


select * from cn;


select a1.lane, a1.name2 champ, a1.id2 c_id, a1.cnt win,a2.cnt match,round(a1.cnt/a2.cnt*100,2) as winrate, a1.name1 enemy, a1.id1 e_id
from
(SELECT t2.lane, t2.championid id2, t2.cname name2, COUNT(*) AS CNT, T2.WIN win2, t1.championid id1, t1.cname name1
FROM (SELECT GAMEID,rc.cn_kr AS CNAME, WIN, LANE, rc.championid
        FROM RC) T1 --상대 챔피언 아이디
INNER JOIN (SELECT GAMEID,rc.cn_kr AS CNAME, WIN, LANE, rc.championid
            FROM RC where championid=56) T2 --기준 챔피언 아이디
ON T1.GAMEID = T2.GAMEID AND T1.LANE = T2.LANE
WHERE T1.LANE='Top' AND t1.cname<>t2.cname and t2.win = 'True'
GROUP BY t2.cname, T2.WIN, t2.lane, t1.cname, t2.championid, t1.championid
ORDER BY t1.cname) a1 --서브쿼리 각 챔피언별 승리 수
join
(SELECT COUNT(*) AS CNT, t1.championid id,t1.cname name1
FROM (SELECT GAMEID,rc.cn_kr AS CNAME, WIN, LANE, rc.championid
        FROM RC ) T1 --상대 챔피언 아이디
INNER JOIN (SELECT GAMEID,rc.cn_kr AS CNAME, WIN, LANE, rc.championid
            FROM RC where championid=56) T2 --기준 챔피언 아이디
ON T1.GAMEID = T2.GAMEID AND T1.LANE = T2.LANE
WHERE T1.LANE='Top' AND t1.cname<>t2.cname
GROUP BY t2.cname, t2.lane, t1.cname, t1.championid
having count(*) >=15 --서브쿼리 각 챔피언별 토탈 승부 수 (토탈 승부 수가 10 이상인 것만)
ORDER BY t1.cname) a2
on a1.name1 = a2.name1
order by winrate desc; --name2 챔피언의 각 챔피언별 승률 구하기

SELECT a1.lane, a1.name2 champ, a1.id2 c_id, a1.cnt win, a2.cnt match, ROUND(a1.cnt/a2.cnt*100, 2) AS winrate, a1.name1 enemy, a1.cn_eg, a1.id1 e_id
FROM (
    SELECT t2.lane, t2.championid id2, t2.cname name2, COUNT(*) AS CNT, T2.WIN win2, t1.championid id1, t1.cname name1, t1.cn_eg
    FROM (
        SELECT GAMEID,rc.cn_kr AS CNAME,rc.cn_eg, WIN, LANE, rc.championid
        FROM RC
        WHERE LANE='Top' AND championid=56
    ) T2
    INNER JOIN (
        SELECT GAMEID,rc.cn_kr AS CNAME,rc.cn_eg, WIN, LANE, rc.championid
        FROM RC
        WHERE LANE='Top'
    ) T1 ON T1.GAMEID = T2.GAMEID AND T1.LANE = T2.LANE AND T1.cname <> T2.cname AND T2.win = 'True'
    GROUP BY t2.cname, T2.WIN, t2.lane, t1.cname, t2.championid, t1.championid, t1.cn_eg
) a1
JOIN (
    SELECT COUNT(*) AS CNT, t1.championid id, t1.cname name1
    FROM (
        SELECT GAMEID, rc.cn_kr AS CNAME, WIN, LANE, rc.championid
        FROM RC
        WHERE LANE='Top'
    ) T1
    INNER JOIN (
        SELECT GAMEID, rc.cn_kr AS CNAME, WIN, LANE, rc.championid
        FROM RC
        WHERE LANE='Top' AND championid=56
    ) T2 ON T1.GAMEID = T2.GAMEID AND T1.LANE = T2.LANE AND T1.cname <> T2.cname
    GROUP BY t2.cname, t2.lane, t1.cname, t1.championid
    HAVING COUNT(*) >= 15
) a2 ON a1.name1 = a2.name1
ORDER BY winrate DESC;

commit;
--특정 포지션에서 승률이 가장 좋은 챔피언 탑3
create or replace view total_winrate
as
select t1.lane, t1.rc_name1, t2.win as wins, t1.win as totalwin,
        round(t2.win/t1.win*100,2) as winrate
from(select lane,cn_kr as rc_name1, count(win) as win 
    from rc group by lane,cn_kr) t1 join
    (select lane,cn_kr as rc_name1, count(win) as win
    from rc where win='True' group by lane,cn_kr) t2
on t1.lane = t2.lane and t1.rc_name1=t2.rc_name1;

select * from rc;
select * from total_winrate order by totalwin desc;
where lane='Bot'
order by winrate desc;
--자바 sql
select rc_name1, winrate
from (select rc_name1, winrate
    from total_winrate where lane='Top'
    order by winrate desc)
    where rownum <=3;
    
----------------------------------------------------------------------------------------------------------
--라인별 챔피언 픽률
select * from toppick;
select * from midpick;
select * from botpick;
select * from junglepick;
select * from supportpick;

create or replace view toppick
as
select rc.cn_kr, round(count(rc.cn_kr)/100000*100,2) pickrate
from rc
where lane='Top'
group by rc.cn_kr
order by pickrate desc;

create or replace view midpick
as
select rc.cn_kr, round(count(rc.cn_kr)/100000*100,2) pickrate
from rc
where lane='Middle'
group by rc.cn_kr
order by pickrate desc;

create or replace view junglepick
as
select rc.cn_kr, round(count(rc.cn_kr)/100000*100,2) pickrate
from rc
where lane='Jungle'
group by rc.cn_kr
order by pickrate desc;

create or replace view botpick
as
select rc.cn_kr, round(count(rc.cn_kr)/100000*100,2) pickrate
from rc
where lane='Bot'
group by rc.cn_kr
order by pickrate desc;

create or replace view supportpick
as
select rc.cn_kr, round(count(rc.cn_kr)/100000*100,2) pickrate
from rc
where lane='Supporter'
group by rc.cn_kr
order by pickrate desc;

--라인별 챔피언 승률
select * from topwin;
select * from midwin;
select * from botwin;
select * from junglewin;
select * from supportwin;

create or replace view topwin
as
select lane, rc_name1, winrate from total_winrate where lane='Top' order by winrate desc;

create or replace view midwin
as
select lane, rc_name1, winrate from total_winrate where lane='Middle' order by winrate desc;

create or replace view botwin
as
select lane, rc_name1, winrate from total_winrate where lane='Bot' order by winrate desc;

create or replace view junglewin
as
select lane, rc_name1, winrate from total_winrate where lane='Jungle' order by winrate desc;

create or replace view supportwin
as
select lane, rc_name1, winrate from total_winrate where lane='Supporter' order by winrate desc;

--라인별 챔피언 kda
select * from topkda;
select * from MIDDLEkda;
select * from botkda;
select * from junglekda;
select * from SUPPORTERkda;

create or replace view topkda
as
select rc.cn_kr, round((sum(rc.kills)+sum(rc.assists))/sum(rc.deaths),2) as kda
from rc 
where lane='Top'
group by rc.cn_kr
order by kda desc;

create or replace view middlekda
as
select rc.cn_kr, round((sum(rc.kills)+sum(rc.assists))/sum(rc.deaths),2) as kda
from rc 
where lane='Middle'
group by rc.cn_kr
order by kda desc;

create or replace view botkda
as
select rc.cn_kr, round((sum(rc.kills)+sum(rc.assists))/sum(rc.deaths),2) as kda
from rc join (select rc.cn_kr, sum(rc.deaths) sd from rc where lane='Bot' group by rc.cn_kr order by sum(rc.deaths) desc) rc2
on rc.cn_kr= rc2.cn_kr
where lane='Bot' and rc2.sd>0
group by rc.cn_kr
order by kda desc;

create or replace view junglekda
as
select rc.cn_kr, round((sum(rc.kills)+sum(rc.assists))/sum(rc.deaths),2) as kda
from rc 
where lane='Jungle'
group by rc.cn_kr
order by kda desc;

create or replace view supporterkda
as
select rc.cn_kr, round((sum(rc.kills)+sum(rc.assists))/sum(rc.deaths),2) as kda
from rc 
where lane='Supporter'
group by rc.cn_kr
order by kda desc;

--라인별 챔피언 승률&픽률
select * from t_wp;
select * from m_wp;
select * from b_wp;
select * from j_wp;
select * from s_wp;

create or replace view t_wp
as
select cn.cid, cn.cn_eg, cn.cn_kr,twp.lane, twp.winrate, twp.pickrate from cn join
(select tw.lane, tw.rc_name1, tw.winrate, tp.pickrate
from topwin tw join toppick tp
on tp.cn_kr=tw.rc_name1
where pickrate>=0.5) twp
on cn.cn_kr = twp.rc_name1 ;

create or replace view m_wp
as
select cn.cid, cn.cn_eg, cn.cn_kr,mwp.lane, mwp.winrate, mwp.pickrate from cn join
(select mw.lane, mw.rc_name1, mw.winrate, mp.pickrate
from midwin mw join midpick mp
on mp.cn_kr=mw.rc_name1
where pickrate>=0.5) mwp
on cn.cn_kr = mwp.rc_name1 ;

create or replace view b_wp
as
select cn.cid, cn.cn_eg, cn.cn_kr,bwp.lane, bwp.winrate, bwp.pickrate from cn join
(select bw.lane, bw.rc_name1, bw.winrate, bp.pickrate
from botwin bw join botpick bp
on bp.cn_kr=bw.rc_name1
where pickrate>=0.5) bwp
on cn.cn_kr = bwp.rc_name1 ;

create or replace view j_wp
as
select cn.cid, cn.cn_eg, cn.cn_kr,jwp.lane, jwp.winrate, jwp.pickrate from cn join
(select jw.lane, jw.rc_name1, jw.winrate, jp.pickrate
from junglewin jw join junglepick jp
on jp.cn_kr=jw.rc_name1
where pickrate>=0.5) jwp
on cn.cn_kr = jwp.rc_name1 ;

create or replace view s_wp
as
select cn.cid, cn.cn_eg, cn.cn_kr,swp.lane, swp.winrate, swp.pickrate from cn join
(select sw.lane, sw.rc_name1, sw.winrate, sp.pickrate
from supportwin sw join supportpick sp
on sp.cn_kr=sw.rc_name1
where pickrate>=0.5) swp
on cn.cn_kr = swp.rc_name1 ;

--라인별 챔피언 승률&픽률&kda
select * from top_wpk;
select * from mIDDLE_wpk;
select * from bOT_wpk;
select * from jUNGLE_wpk;
select * from sUPPORTER_wpk;

create or replace view top_wpk
as
select t_wp.cid, t_wp.cn_eg, t_wp.cn_kr,t_wp.lane,t_wp.winrate,t_wp.pickrate, tk.kda
from t_wp join topkda tk
on t_wp.cn_kr =tk.cn_kr;

create or replace view middle_wpk
as
select m_wp.cid, m_wp.cn_eg, m_wp.cn_kr,m_wp.lane,m_wp.winrate,m_wp.pickrate, mk.kda
from m_wp join midDLEkda mk
on m_wp.cn_kr =mk.cn_kr;

create or replace view bot_wpk
as
select b_wp.cid, b_wp.cn_eg, b_wp.cn_kr,b_wp.lane,b_wp.winrate,b_wp.pickrate, bk.kda
from b_wp join botkda bk
on b_wp.cn_kr =bk.cn_kr;

create or replace view jungle_wpk
as
select j_wp.cid, j_wp.cn_eg, j_wp.cn_kr,j_wp.lane,j_wp.winrate,j_wp.pickrate, jk.kda
from j_wp join junglekda jk
on j_wp.cn_kr =jk.cn_kr;

create or replace view supporter_wpk
as
select s_wp.cid, s_wp.cn_eg, s_wp.cn_kr,s_wp.lane,s_wp.winrate,s_wp.pickrate, sk.kda
from s_wp join supportERkda sk
on s_wp.cn_kr =sk.cn_kr;



