-- models/time_spine.sql
with date_spine as (
    select
        date_day
    from
        table(generator(
            rowcount => 365 * 5  -- generates ~5 years of dates
        )) as gen
    join (
        select
            dateadd(day, row_number() over (), date('2025-07-07')) as date_day
    ) as dates
    on true
)

select *
from date_spine
where date_day <= current_date
