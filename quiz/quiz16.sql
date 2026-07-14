select * from panmae;
select * from product;
select * from gift;



select 
    to_char(to_date(pm.p_date,'YYYYMMDD'),'yyyy-mm-dd') 판매일자,
    pm.p_code 상품코드,
    pd.p_name 상품명,
    to_char(pd.p_price,'fm999,999,999') 상품가,
    pm.p_qty 구매수량,
    to_char(pm.p_total,'fm999,999,999') 총금액,
    to_char((pm.p_total*100),'fm999,999,999') 적립포인트,
    --to_char((pm.p_total*200),'fm999,999,999') 새해2배적립포인트,
--    to_char(
--    case substr(pm.p_date,-4,4)
--        when '0101' then pm.p_total*200
--        else pm.p_total *100
--    end,'fm999,999,999') 새해2배적립포인트1,
--    case 
--        when substr(pm.p_date,-4,4 ) = '0101' then  pm.p_total*200
--        else pm.p_total *100
--    end 새해2배적립포인트2,
    to_char(decode(substr(pm.p_date,-4,4 ),'0101',pm.p_total*200,pm.p_total * 100),'fm999,999,999') 새해2배적립포인트3,
    gf.gname 사은품명,
    to_char(gf.g_start,'fm999,999,999') 포인트START,
    to_char(gf.g_end,'fm999,999,999') 포인트END
from panmae pm, product pd, gift gf
where pm.p_code = pd.p_code
--and  case 
--        when substr(pm.p_date,-4,4 ) = '0101' then  pm.p_total*200
--        else pm.p_total *100
--    end between gf.g_start and gf.g_end
and decode(substr(pm.p_date,-4,4 ),'0101',pm.p_total*200,pm.p_total * 100) between gf.g_start and gf.g_end
order by pm.p_date
;