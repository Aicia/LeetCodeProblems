select  a.Request_at as "Day", 
        Round( 
                1.0 * (sum(case when 
                                a.status 
                                    like 
                                    'cancelled%' 
                                    and 
                                    b.banned = 'No' 
                                    and c.banned = 'No' 
                                then 1 
                                else 0 
                            end)) 
                / (sum(case when 
                                b.banned = 'No' 
                                and 
                                c.banned = 'No' 
                            then 1 
                            else 0 
                            end) ), 
                2 
             ) as "Cancellation Rate" 
from trips as a
join users as b on a.client_id = b.users_id
join users as c on a.driver_id = c.users_id
group by a.request_at
having a.request_at between '2013-10-01' and '2013-10-03'
