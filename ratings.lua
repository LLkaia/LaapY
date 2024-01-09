function round(num, numDecimalPlaces)
    local mult = 10^(numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end


function calcAvg(data)
    local ratingsCount = data:len()
    local ratingsSum = 0

    if ratingsCount > 0 then
        for i=0,ratingsCount-1,1 do
            rating = data:get(i)
            ratingsSum = ratingsSum + rating:get("rating")
        end
    else
        return 0
    end

    return round(ratingsSum / ratingsCount, 1)
end


function swapResponse()
    local r = response.load()
    local responseData = r:data()
    local ratings = responseData:get('rating')

    avgRating = calcAvg(ratings)

    responseData:set("rating", avgRating)
end