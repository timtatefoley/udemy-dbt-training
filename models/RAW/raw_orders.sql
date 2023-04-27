{{
    config(
        materialized='table'
    )
}}


select * 
from raw.globalmart.FIXED_ORDERS