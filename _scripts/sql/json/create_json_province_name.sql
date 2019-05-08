select
    row_to_json(t)
from (
    select name from rt_province where code = '124700000'
    ) t;
