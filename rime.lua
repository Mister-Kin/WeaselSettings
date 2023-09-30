--- date/time translator
function date_translator(input, seg)
    -- TODO：待实现农历和英文时间格式
    if (input == "date" or input == "rq" or input == "riqi" or input == "jjad") then
        --- Candidate(type, start, end, text, comment)
        yield(Candidate("date", seg.start, seg._end, os.date("%Y-%m-%d"), ""))
        yield(Candidate("date", seg.start, seg._end, os.date("%Y.%m.%d"), ""))
        yield(Candidate("date", seg.start, seg._end, os.date("%Y_%m_%d"), ""))
        yield(Candidate("date", seg.start, seg._end, os.date("%Y年%m月%d日"), ""))
        yield(Candidate("date", seg.start, seg._end, os.date("%m/%d/%Y"), ""))
        yield(Candidate("date", seg.start, seg._end, os.date("%Y/%m/%d"), ""))
    end
    if (input == "time" or input == "now" or input == "sj" or input == "shijian" or input == "jfuj") then
        --- Candidate(type, start, end, text, comment)
        yield(Candidate("time", seg.start, seg._end, os.date("%Y-%m-%d %H:%M:%S"), ""))
        yield(Candidate("time", seg.start, seg._end, os.date("%Y-%m-%dT%H:%M:%S%z"), "时区尾缀"))
        yield(Candidate("time", seg.start, seg._end, os.date("%Y-%m-%d %H:%M:%S%z"), "时区尾缀"))
        yield(Candidate("time", seg.start, seg._end, os.date("%Y_%m_%d_%H_%M_%S"), ""))
        yield(Candidate("time", seg.start, seg._end, os.date("%Y年%m月%d日%H时%M分%S秒"), ""))
        yield(Candidate("time", seg.start, seg._end, os.date("%Y/%m/%d %H:%M:%S"), ""))
        yield(Candidate("date", seg.start, seg._end, os.date("%Y%m%d_%H%M%S"), ""))
        yield(Candidate("time", seg.start, seg._end, os.date("%H:%M:%S"), ""))
        yield(Candidate("time", seg.start, seg._end, os.date("%H_%M_%S"), ""))
        yield(Candidate("time", seg.start, seg._end, os.date("%H:%M"), ""))
        yield(Candidate("time", seg.start, seg._end, os.date("%H_%M"), ""))
        yield(Candidate("time", seg.start, seg._end, os.date("%Y%m%d%H%M%S"), ""))
    end
    if (input == "week" or input == "xq" or input == "xingqi" or input == "xqj" or input == "xingqiji" or input == "zj" or
        input == "zhouji" or input == "yr" or input == "yaori" or input == "jamt") then
        local weekstr = ""
        local yrstr = ""
        if (os.date("%w") == "0") then
            weekstr = "日"
            yrstr = "日"
        end
        if (os.date("%w") == "1") then
            weekstr = "一"
            yrstr = "月"
        end
        if (os.date("%w") == "2") then
            weekstr = "二"
            yrstr = "火"
        end
        if (os.date("%w") == "3") then
            weekstr = "三"
            yrstr = "水"
        end
        if (os.date("%w") == "4") then
            weekstr = "四"
            yrstr = "木"
        end
        if (os.date("%w") == "5") then
            weekstr = "五"
            yrstr = "金"
        end
        if (os.date("%w") == "6") then
            weekstr = "六"
            yrstr = "土"
        end
        yield(Candidate("week", seg.start, seg._end, os.date("星期") .. weekstr, ""))
        yield(Candidate("week", seg.start, seg._end, yrstr .. os.date("曜日"), ""))
    end
end
