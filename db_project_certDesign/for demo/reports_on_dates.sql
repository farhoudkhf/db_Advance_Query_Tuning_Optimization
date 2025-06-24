-- Report - number of certificates completed by month, ordered by year_month
select
  to_char(DATE_TRUNC('month', completed_date), 'yy-mm') as year_month,
  count(*) as number_of_cert_per_month
from certificate.certificates
group by rollup (DATE_TRUNC('month', completed_date))
order by year_month;

-- Report by year
select
  to_char(DATE_TRUNC('year', completed_date), 'yyyy') as year,
  count(*) as number_of_cert_per_month
from certificate.certificates
group by rollup (DATE_TRUNC('year', completed_date))
order by year;


-- Report by quarter
select
  to_char(DATE_TRUNC('quarter', completed_date), 'yyyy-mm') as quarter,
  count(*) as number_of_cert_per_month
from certificate.certificates
group by rollup (DATE_TRUNC('quarter', completed_date))
order by quarter;