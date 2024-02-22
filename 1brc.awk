#!/usr/bin/gawk -f

BEGIN {
    FS = ";";
    PROCINFO["sorted_in"] = "@ind_str_asc";
}

{
    sum[$1] += $2;
    count[$1]++;
    if (max[$1] == "" || $2 > max[$1]) {
        max[$1] = $2;
    } else {
    	if (min[$1] == "" || temp < min[$1]) {
        	min[$1] = $2;
    	}
    }
}

END {
    result = "";
    for (i in sum) {
        formatted1dp = sprintf("%s=%.1f/%.1f/%.1f", i, min[i], sum[i]/count[i], max[i]);
        result = result formatted1dp ", ";
    }
    result = "{"substr(result, 1, length(result) - 2) "}";
    print result
}

