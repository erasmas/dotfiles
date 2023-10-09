function songwhip
    # https://songwhip.com/faq#does-songwhip-have-an-api
    set response (curl --silent --show-error --request POST --data "{\"url\":\"$argv[1]\"}" https://songwhip.com/)

    if test $status -ne 0
        echo "Error: Failed to retrieve song URL."
        return 1
    end

    set song_url (echo $response | jq -r '.url')
    echo "$song_url"
    echo -n $song_url | pbcopy
end
