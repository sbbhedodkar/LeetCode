SELECT
    player_id,
    device_id
FROM
    (
        SELECT
            player_id,
            device_id,
            dense_rank() OVER (
                PARTITION BY player_id
                order by
                    event_date asc
            ) as rank_device
        FROM
            Activity
    ) AS denserank_device
where
    rank_device = 1