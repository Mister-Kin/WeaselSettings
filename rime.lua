--- date/time translator
function date_translator(input, seg)
    if (input == "date" or input == "now" or input == "rq" or input == "riqi" or input == "jjad") then
        --- Candidate(type, start, end, text, comment)
        yield(Candidate("date", seg.start, seg._end, os.date("%Y/%m/%d"), ""))
        yield(Candidate("date", seg.start, seg._end, os.date("%Y.%m.%d"), ""))
        yield(Candidate("date", seg.start, seg._end, os.date("%Y年%m月%d日"), ""))
        yield(Candidate("date", seg.start, seg._end, os.date("%Y-%m-%d"), ""))
        yield(Candidate("time", seg.start, seg._end, os.date("%Y/%m/%d %H:%M:%S"), ""))
        yield(Candidate("time", seg.start, seg._end, os.date("%Y%m%d_%H%M%S"), ""))
    end
    if (input == "time" or input == "now" or input == "sj" or input == "shijian" or input == "jfuj") then
        --- Candidate(type, start, end, text, comment)
        yield(Candidate("time", seg.start, seg._end, os.date("%H:%M:%S"), ""))
        yield(Candidate("time", seg.start, seg._end, os.date("%H:%M"), ""))
        yield(Candidate("time", seg.start, seg._end, os.date("%Y/%m/%d %H:%M:%S"), ""))
        yield(Candidate("time", seg.start, seg._end, os.date("%Y%m%d%H%M%S"), ""))
    end
    if (input == "week" or input == "xq" or input == "xqj" or input == "jamt") then
        if (os.date("%w") == "0") then
            weekstr = "日"
        end
        if (os.date("%w") == "1") then
            weekstr = "一"
        end
        if (os.date("%w") == "2") then
            weekstr = "二"
        end
        if (os.date("%w") == "3") then
            weekstr = "三"
        end
        if (os.date("%w") == "4") then
            weekstr = "四"
        end
        if (os.date("%w") == "5") then
            weekstr = "五"
        end
        if (os.date("%w") == "6") then
            weekstr = "六"
        end
        yield(Candidate("week", seg.start, seg._end, os.date("星期")..weekstr,""))
    end
end
