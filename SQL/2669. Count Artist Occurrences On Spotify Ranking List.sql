SELECT
    artist,
    count(1) AS occurrences
FROM
    Spotify
GROUP BY
    artist
ORDER BY
    occurrences DESC,
    artist;