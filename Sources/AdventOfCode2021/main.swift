/*
func getPuzzleData(url: String) -> String {
    let urlString = URL(string: url)

    do {
        let puzzleData = try String(contentsOf: urlString) //, encoding: .ascii)
        return puzzleData
    } catch let error {
        print("Error: \(error)")
    }
}
*/
func dayOne() {
    /*
    Part 1
    --- Day 1: Sonar Sweep ---
    As the submarine drops below the surface of the ocean, it automatically performs a sonar sweep of the nearby sea floor. On a small screen, the sonar
    sweep report (your puzzle input) appears: each line is a measurement of the sea floor depth as the sweep looks further and further away from the submarine.

    For example, suppose you had the following report:

    199
    200
    208
    210
    200
    207
    240
    269
    260
    263

    This report indicates that, scanning outward from the submarine, the sonar sweep found depths of 199, 200, 208, 210, and so on.

    The first order of business is to figure out how quickly the depth increases, just so you know what you're dealing with - you never know if the keys will
    get carried into deeper water by an ocean current or a fish or something.

    To do this, count the number of times a depth measurement increases from the previous measurement. (There is no measurement before the first measurement.)
    In the example above, the changes are as follows:

    199 (N/A - no previous measurement)
    200 (increased)
    208 (increased)
    210 (increased)
    200 (decreased)
    207 (increased)
    240 (increased)
    269 (increased)
    260 (decreased)
    263 (increased)

    In this example, there are 7 measurements that are larger than the previous measurement.

    How many measurements are larger than the previous measurement?
    */
    let dataUrl = "https://adventofcode.com/2021/day/1/input"
    let data = [176,184,188,142,151,156,157,167,166,178,182,191,190,191,192,196,197,201,204,207,212,213,231,232,234,232,239,268,279,280,282,278,283,284,283,296,302,320,321,332,334,332,335,340,347,348,352,342,334,333,332,357,365,366,386,394,391,387,388,389,391,394,381,392,394,397,407,428,441,444,447,448,449,450,449,453,467,476,472,486,512,517,519,530,533,537,538,552,554,550,575,583,585,597,598,600,601,602,606,607,609,611,603,604,597,598,599,606,612,615,626,621,623,624,627,630,642,641,644,642,645,648,640,636,640,660,669,676,688,689,712,716,711,715,698,705,729,730,731,714,720,710,723,727,730,738,739,743,753,755,763,765,761,758,759,780,803,788,789,810,827,837,849,843,853,852,853,865,866,876,878,871,874,878,884,888,892,887,893,894,905,906,887,912,905,898,901,879,882,897,920,918,911,916,922,931,933,931,936,943,945,955,956,951,957,953,960,965,973,994,1012,1016,1022,1025,1028,1031,1032,1037,1038,1031,1035,1053,1057,1074,1075,1081,1080,1060,1063,1053,1055,1053,1062,1063,1060,1062,1065,1066,1063,1064,1074,1073,1081,1095,1089,1106,1111,1097,1098,1101,1107,1111,1113,1125,1118,1133,1142,1141,1144,1145,1153,1165,1167,1174,1178,1158,1165,1174,1175,1191,1194,1192,1189,1190,1193,1194,1196,1214,1238,1246,1272,1273,1287,1288,1296,1298,1299,1315,1320,1324,1326,1341,1342,1341,1368,1375,1386,1387,1388,1399,1397,1398,1408,1407,1409,1410,1422,1419,1423,1419,1415,1416,1446,1468,1479,1484,1488,1489,1491,1495,1504,1505,1504,1520,1540,1547,1541,1548,1539,1541,1548,1544,1545,1547,1532,1552,1566,1570,1571,1569,1571,1572,1543,1544,1546,1547,1576,1574,1592,1597,1600,1608,1609,1623,1631,1647,1640,1657,1660,1677,1674,1669,1670,1654,1667,1680,1696,1698,1699,1700,1706,1696,1697,1699,1698,1699,1711,1715,1689,1690,1701,1705,1739,1741,1745,1737,1729,1749,1751,1758,1759,1756,1758,1772,1773,1783,1807,1806,1813,1827,1831,1832,1835,1840,1857,1866,1872,1875,1874,1879,1890,1883,1905,1908,1922,1946,1936,1939,1941,1945,1950,1951,1956,1950,1951,1952,1957,1958,1969,1972,2004,2013,2026,2028,2034,2043,2048,2064,2074,2068,2081,2063,2064,2065,2069,2047,2046,2033,2035,2034,2035,2037,2038,2033,2038,2039,2046,2047,2048,2043,2083,2086,2093,2107,2108,2091,2105,2113,2109,2106,2116,2119,2126,2127,2132,2135,2147,2148,2143,2150,2151,2153,2166,2171,2173,2175,2178,2180,2192,2227,2231,2253,2255,2256,2257,2258,2259,2269,2277,2279,2282,2308,2309,2333,2340,2346,2354,2355,2371,2372,2375,2393,2394,2400,2404,2400,2402,2393,2388,2403,2402,2422,2424,2417,2416,2421,2422,2431,2428,2409,2405,2415,2411,2413,2415,2419,2423,2431,2432,2450,2460,2466,2458,2461,2462,2463,2471,2476,2489,2490,2491,2492,2490,2491,2495,2511,2514,2516,2514,2516,2519,2525,2527,2501,2503,2506,2513,2537,2543,2547,2554,2570,2580,2601,2611,2609,2611,2617,2620,2623,2615,2619,2633,2648,2649,2662,2670,2671,2675,2707,2708,2717,2718,2719,2739,2742,2737,2738,2739,2759,2771,2783,2784,2800,2805,2820,2815,2836,2837,2839,2867,2869,2868,2874,2881,2883,2909,2903,2904,2909,2912,2914,2920,2921,2923,2928,2929,2930,2909,2915,2927,2928,2930,2923,2921,2918,2911,2915,2920,2929,2930,2940,2942,2951,2969,2980,2985,2989,2983,2986,2994,3002,3017,3027,3042,3048,3050,3048,3049,3073,3080,3082,3071,3094,3124,3132,3133,3137,3138,3142,3161,3176,3188,3185,3189,3193,3194,3195,3196,3200,3211,3212,3215,3223,3224,3230,3234,3227,3231,3218,3213,3218,3239,3225,3216,3224,3226,3229,3230,3231,3212,3225,3234,3237,3236,3237,3243,3252,3257,3261,3260,3263,3265,3266,3272,3279,3280,3285,3284,3290,3291,3290,3307,3312,3342,3344,3343,3344,3343,3342,3343,3340,3344,3348,3349,3337,3346,3357,3361,3369,3370,3383,3375,3371,3375,3397,3401,3407,3408,3409,3391,3394,3393,3396,3399,3404,3407,3409,3411,3412,3415,3433,3437,3449,3446,3447,3448,3444,3445,3441,3456,3479,3488,3487,3491,3496,3485,3498,3500,3533,3537,3544,3545,3544,3553,3559,3567,3590,3577,3586,3584,3594,3595,3594,3603,3617,3619,3624,3652,3627,3622,3647,3648,3650,3667,3668,3664,3672,3678,3688,3689,3696,3704,3690,3691,3692,3683,3685,3684,3689,3693,3694,3693,3696,3704,3717,3722,3718,3690,3691,3687,3688,3685,3687,3688,3701,3698,3699,3700,3702,3708,3704,3711,3714,3719,3730,3731,3730,3751,3757,3760,3766,3767,3764,3761,3742,3771,3789,3810,3807,3787,3792,3791,3792,3797,3802,3801,3809,3817,3850,3851,3853,3860,3861,3866,3862,3853,3857,3861,3868,3869,3870,3879,3893,3894,3903,3912,3944,3955,3956,3960,3986,3969,3970,3974,3976,4006,4008,4013,4038,4043,4056,4071,4076,4097,4098,4099,4109,4111,4112,4118,4126,4128,4129,4125,4124,4126,4127,4130,4150,4153,4168,4187,4186,4171,4166,4172,4182,4201,4226,4227,4251,4250,4263,4294,4317,4318,4332,4330,4308,4309,4310,4313,4329,4331,4349,4350,4348,4345,4347,4342,4340,4342,4359,4371,4387,4412,4411,4412,4415,4422,4423,4427,4455,4456,4460,4471,4485,4491,4492,4491,4492,4521,4527,4532,4539,4552,4537,4551,4562,4566,4581,4588,4590,4591,4590,4595,4596,4597,4598,4618,4617,4618,4621,4622,4628,4632,4628,4644,4629,4643,4635,4639,4640,4645,4647,4639,4641,4642,4645,4657,4645,4650,4655,4671,4674,4675,4670,4671,4702,4715,4714,4722,4723,4727,4737,4733,4761,4762,4763,4766,4772,4773,4774,4775,4778,4779,4786,4787,4788,4792,4796,4797,4795,4796,4816,4807,4839,4841,4842,4843,4860,4862,4839,4842,4843,4844,4846,4848,4846,4844,4847,4849,4855,4859,4852,4855,4864,4865,4889,4892,4891,4893,4890,4891,4892,4914,4913,4912,4915,4918,4920,4924,4927,4922,4914,4913,4912,4920,4913,4915,4917,4919,4922,4930,4924,4918,4930,4937,4932,4933,4938,4942,4943,4944,4945,4962,4965,4967,4948,4937,4938,4943,4950,4934,4945,4946,4962,4964,4977,4988,5005,5025,5024,5049,5055,5060,5050,5051,5049,5050,5049,5053,5063,5086,5121,5138,5150,5155,5154,5165,5176,5154,5155,5163,5154,5190,5193,5192,5194,5192,5194,5203,5219,5223,5237,5250,5251,5250,5254,5257,5242,5245,5244,5250,5253,5262,5251,5276,5277,5273,5275,5274,5283,5290,5303,5309,5315,5317,5321,5318,5325,5324,5325,5332,5353,5355,5331,5332,5351,5374,5377,5379,5370,5383,5377,5381,5388,5389,5424,5425,5431,5432,5433,5400,5411,5415,5428,5429,5416,5419,5446,5455,5462,5463,5466,5479,5480,5489,5490,5491,5495,5516,5506,5507,5508,5511,5509,5522,5521,5525,5533,5556,5558,5555,5559,5561,5552,5553,5565,5566,5579,5584,5585,5582,5583,5595,5596,5618,5620,5621,5622,5631,5633,5634,5635,5637,5638,5637,5638,5647,5646,5684,5683,5685,5687,5690,5697,5691,5692,5689,5692,5695,5705,5707,5729,5730,5717,5726,5727,5734,5730,5737,5735,5736,5755,5752,5764,5762,5761,5765,5774,5775,5776,5753,5754,5763,5769,5768,5773,5772,5779,5776,5793,5802,5815,5819,5816,5811,5812,5814,5812,5815,5813,5827,5800,5802,5801,5802,5805,5809,5817,5826,5832,5833,5836,5838,5840,5853,5859,5870,5873,5879,5891,5898,5907,5902,5905,5910,5914,5918,5913,5914,5913,5914,5935,5954,5963,5964,5973,5977,5978,5988,5980,5981,5984,5986,5985,5987,5995,6002,6003,6001,6007,6009,6012,6019,6022,6023,6022,6023,6024,6025,6027,6028,6030,6032,6050,6041,6042,6041,6043,6044,6079,6086,6077,6088,6098,6100,6101,6103,6105,6106,6114,6118,6119,6121,6130,6138,6139,6135,6146,6147,6150,6162,6163,6180,6188,6190,6196,6192,6195,6205,6203,6204,6206,6207,6203,6204,6205,6211,6210,6214,6230,6233,6234,6248,6239,6249,6263,6265,6273,6275,6274,6278,6272,6286,6288,6292,6271,6276,6285,6286,6287,6291,6300,6307,6312,6313,6314,6316,6317,6331,6332,6334,6332,6331,6344,6339,6350,6354,6356,6358,6361,6370,6374,6377,6363,6364,6367,6360,6356,6358,6361,6362,6364,6386,6393,6415,6419,6421,6418,6424,6426,6433,6442,6444,6436,6440,6442,6441,6444,6450,6432,6451,6467,6472,6476,6469,6470,6468,6480,6503,6505,6506,6493,6495,6496,6504,6509,6500,6491,6503,6524,6542,6556,6557,6566,6577,6573,6579,6586,6587,6595,6606,6612,6615,6633,6635,6636,6634,6624,6626,6627,6641,6644,6654,6657,6656,6655,6658,6660,6665,6664,6665,6685,6676,6677,6679,6682,6712,6717,6724,6733,6735,6742,6747,6771,6772,6788,6802,6814,6815,6814,6820,6819,6823,6822,6826,6835,6840,6842,6847,6843,6823,6829,6824,6823,6825,6826,6825,6829,6830,6831,6847,6876,6878,6879,6880,6881,6888,6909,6912,6913,6911,6920,6923,6927,6941,6951,6946,6948,6954,6957,6956,6958,6964,6966,6971,6972,6985,6987,6988,6989,6997,6998,6986,6988,6987,6994,7000,7004,7009,7020,7025,7035,7045,7047,7062,7065,7066,7052,7053,7052,7046,7050,7053,7054,7057,7047,7050,7036,7043,7034,7016,7040,7039,7040,7042,7029,7037,7052,7056,7057,7058,7062,7063,7051,7053,7056,7057,7058,7059,7061,7082,7081,7089,7090,7086,7090,7094,7095,7100,7101,7076,7079,7085,7089,7093,7109,7110,7104,7093,7100,7111,7109,7104,7116,7117,7115,7111,7124,7125,7124,7125,7120,7118,7119,7112,7114,7115,7141,7140,7141,7168,7158,7189,7195,7196,7193,7221,7225,7227,7228,7229,7239,7242,7243,7252,7260,7276,7278,7277,7295,7298,7313,7296,7297,7319,7342,7343,7347,7359,7343,7344,7348,7361,7365,7366,7368,7377,7378,7375,7376,7368,7388,7385,7400,7401,7402,7404,7413,7411,7414,7415,7417,7422,7421,7419,7428,7437,7436,7437,7440,7442,7440,7442,7463,7478,7488,7506,7510,7518,7531,7537,7534,7533,7523,7522,7538,7528,7530,7533,7535,7530,7546,7547,7548,7545,7546,7541,7553,7554,7555,7556,7564,7568,7589,7590,7609,7619,7624,7627,7629,7630,7651,7664,7658,7656,7667,7670,7678,7682,7683,7694,7695,7696,7704,7706,7716,7723,7722,7725,7730,7728,7729,7723,7738,7717,7711,7727,7705,7716,7713,7703,7710,7712,7713,7714,7715,7718,7721,7735,7739,7722,7726,7727,7737,7743,7744,7724,7723,7724,7726,7754,7760,7758,7769,7768,7769,7775,7776,7777,7785,7822,7823,7822,7824,7826,7849,7854,7860,7836,7839,7838,7839,7859,7861,7862,7863,7873,7863,7885,7887,7889,7882,7881,7882,7883,7888,7890,7902,7907,7908,7942,7947,7946,7948,7949,7952,7953,7952,7954,7937,7933,7928,7932,7933,7938,7939,7941,7943,7944,7946,7940,7941,7940,7935,7938,7939,7938,7965,7986,8006,7999,8000,8016,8027,8026,8027,8030,8031,8032,8033,8035,8036,8038,8041,8054,8059,8060,8055,8053,8058,8067,8071,8081,8082,8083,8099,8121,8102,8101,8093,8106,8113,8114,8117,8121,8146,8158,8144,8146,8150,8173,8199,8198,8202,8207,8196,8200,8202,8219,8225,8238,8241,8242,8276,8283,8285,8290,8291,8292,8293,8294,8297,8298,8310,8311,8315,8317,8321,8304,8303,8304,8299,8306,8317,8320,8341] //getPuzzleData(url: dataUrl)
    var increasedCount = 0

    for i in 1...data.count-1 {
        if data[i] > data[i-1] {
            increasedCount += 1
        }
    }
    print("Step 1 count: \(increasedCount)")

    /*
    --- Part Two ---

    Considering every single measurement isn't as useful as you expected: there's just too much noise in the data.

    Instead, consider sums of a three-measurement sliding window. Again considering the above example:

    199  A      
    200  A B    
    208  A B C  
    210    B C D
    200  E   C D
    207  E F   D
    240  E F G  
    269    F G H
    260      G H
    263        H

    Start by comparing the first and second three-measurement windows. The measurements in the first window are marked A (199, 200, 208);
    their sum is 199 + 200 + 208 = 607. The second window is marked B (200, 208, 210); its sum is 618. The sum of measurements in the second
    window is larger than the sum of the first, so this first comparison increased.

    Your goal now is to count the number of times the sum of measurements in this sliding window increases from the previous sum.
    So, compare A with B, then compare B with C, then C with D, and so on. Stop when there aren't enough measurements left to create
    a new three-measurement sum.

    In the above example, the sum of each three-measurement window is as follows:

    A: 607 (N/A - no previous sum)
    B: 618 (increased)
    C: 618 (no change)
    D: 617 (decreased)
    E: 647 (increased)
    F: 716 (increased)
    G: 769 (increased)
    H: 792 (increased)

    In this example, there are 5 sums that are larger than the previous sum.

    Consider sums of a three-measurement sliding window. How many sums are larger than the previous sum?
    */
    increasedCount = 0

    for i in 1...data.count-1-2 {
        let previousSum = data[i-1] + data[i] + data[i+1] 
        let currentSum = data[i] + data[i+1] + data[i+2] 
        if currentSum > previousSum {
            increasedCount += 1
        }
    }
    print("Step 2 count: \(increasedCount)")

}

func dayTwo() {
    /*
    --- Day 2: Dive! ---
    Now, you need to figure out how to pilot this thing.

    It seems like the submarine can take a series of commands like forward 1, down 2, or up 3:

        forward X increases the horizontal position by X units.
        down X increases the depth by X units.
        up X decreases the depth by X units.

    Note that since you're on a submarine, down and up affect your depth, and so they have the opposite result of what you might expect.

    The submarine seems to already have a planned course (your puzzle input). You should probably figure out where it's going. For example:

    forward 5
    down 5
    forward 8
    up 3
    down 8
    forward 2

    Your horizontal position and depth both start at 0. The steps above would then modify them as follows:

        forward 5 adds 5 to your horizontal position, a total of 5.
        down 5 adds 5 to your depth, resulting in a value of 5.
        forward 8 adds 8 to your horizontal position, a total of 13.
        up 3 decreases your depth by 3, resulting in a value of 2.
        down 8 adds 8 to your depth, resulting in a value of 10.
        forward 2 adds 2 to your horizontal position, a total of 15.

    After following these instructions, you would have a horizontal position of 15 and a depth of 10. (Multiplying these together produces 150.)

    Calculate the horizontal position and depth you would have after following the planned course. What do you get if you multiply your final
    horizontal position by your final depth?
    */
    let course = ["forward 4","down 9","forward 2","forward 2","down 7","up 2","down 9","up 8","down 7","down 9","forward 4","up 6","down 2","down 5","down 1","down 5","forward 2","up 4","forward 2","forward 3","up 2","forward 6","up 8","forward 8","down 8","up 8","down 7","down 2","down 9","forward 2","forward 9","down 4","forward 8","up 6","down 3","up 9","forward 1","forward 6","up 3","forward 8","up 9","forward 1","down 9","down 3","down 7","up 2","up 7","down 5","forward 3","down 1","up 6","down 2","forward 4","down 6","down 8","forward 2","down 5","forward 6","down 5","down 7","forward 8","forward 2","down 9","up 4","forward 6","forward 4","up 6","down 9","down 7","down 9","forward 9","forward 8","down 7","up 7","forward 9","forward 8","up 1","up 4","down 3","forward 6","up 6","down 2","up 3","down 6","down 5","forward 8","forward 3","forward 8","down 4","down 4","down 5","forward 6","down 5","forward 6","down 2","down 5","up 4","down 8","up 5","forward 5","forward 6","down 9","up 5","down 2","forward 5","down 7","up 7","down 9","forward 2","down 3","down 3","forward 8","up 5","up 1","forward 1","forward 3","down 5","forward 8","forward 7","forward 8","down 5","down 8","up 2","forward 8","forward 8","down 7","forward 1","forward 7","down 6","up 4","forward 7","forward 7","down 3","up 7","forward 2","down 7","down 4","forward 5","down 8","forward 9","down 7","forward 5","up 6","up 6","down 8","down 3","forward 5","forward 3","down 8","up 7","forward 8","up 6","down 2","forward 4","up 3","up 3","down 9","down 9","up 1","up 7","forward 2","down 1","forward 9","up 7","up 6","down 2","down 3","forward 4","down 3","down 3","down 1","forward 4","forward 8","forward 6","forward 3","up 4","up 5","up 4","forward 1","up 3","down 9","up 6","forward 2","down 5","down 1","forward 8","forward 2","down 6","up 5","up 3","forward 7","forward 2","forward 7","up 9","forward 3","up 9","forward 1","down 9","forward 9","down 3","down 3","down 2","forward 9","forward 2","up 3","forward 3","down 7","down 3","forward 2","forward 1","forward 6","up 9","forward 4","down 9","down 8","up 3","up 5","forward 8","down 9","forward 5","forward 4","down 5","up 4","forward 7","forward 3","down 9","forward 7","down 2","down 7","forward 3","up 3","forward 7","down 9","down 4","down 8","forward 8","down 6","forward 9","forward 4","up 9","down 9","down 6","up 7","up 2","forward 2","forward 7","down 7","forward 9","down 6","down 2","forward 4","forward 8","down 4","forward 4","forward 4","forward 6","up 6","down 9","down 3","down 7","up 2","up 2","forward 4","down 4","forward 6","down 2","down 2","forward 1","down 1","forward 7","up 5","forward 9","forward 8","down 4","forward 8","down 5","up 4","down 8","forward 4","forward 7","down 9","down 3","forward 6","down 6","forward 6","down 9","down 6","forward 5","forward 5","up 9","down 9","down 9","down 1","down 5","forward 5","down 7","forward 3","down 6","forward 5","forward 8","down 6","forward 7","down 5","forward 4","down 4","down 9","forward 3","down 9","down 9","down 1","up 7","forward 4","up 1","up 1","forward 1","down 9","up 8","down 8","down 3","down 7","forward 4","down 5","down 5","forward 7","forward 7","forward 6","up 2","down 4","forward 8","forward 3","forward 3","forward 2","forward 4","up 9","up 1","forward 2","forward 2","forward 6","down 9","up 8","forward 4","forward 5","forward 4","down 4","down 8","forward 6","down 8","forward 9","forward 8","down 1","down 2","forward 2","up 4","up 7","forward 5","down 7","down 5","down 3","up 7","down 4","forward 8","up 8","down 1","down 2","up 6","up 8","forward 9","down 5","down 2","forward 5","forward 4","up 6","forward 7","down 3","up 5","up 9","forward 5","forward 1","down 6","down 7","forward 9","down 8","down 2","forward 9","forward 2","down 3","forward 9","down 3","down 9","up 3","forward 7","up 2","up 5","forward 3","down 9","up 1","down 2","down 4","down 6","forward 5","forward 5","up 7","up 3","down 1","down 1","up 8","down 4","forward 1","down 4","down 5","down 9","forward 7","up 2","up 1","down 7","forward 9","forward 9","forward 8","forward 9","down 5","forward 9","forward 9","up 9","down 7","down 8","forward 2","forward 9","down 1","forward 3","forward 8","up 4","down 4","forward 4","forward 3","down 7","down 3","forward 6","forward 9","forward 1","down 2","up 3","down 9","forward 5","forward 6","forward 8","up 2","up 1","down 3","up 4","forward 1","up 9","forward 4","down 1","up 2","down 8","down 9","forward 3","down 2","up 5","forward 2","down 6","down 5","down 8","down 3","down 7","down 2","forward 8","down 9","up 7","down 7","down 7","down 7","forward 4","forward 1","forward 9","up 9","forward 5","forward 8","forward 7","forward 7","down 1","forward 3","down 7","forward 2","forward 4","up 7","forward 1","down 5","forward 5","forward 1","down 8","forward 7","forward 2","up 3","down 1","up 7","down 1","down 2","forward 9","forward 6","forward 3","forward 2","down 4","forward 7","forward 7","forward 5","forward 7","forward 2","down 9","down 8","forward 8","forward 9","down 3","up 7","up 1","down 4","forward 2","forward 7","forward 3","forward 9","up 2","down 3","forward 4","down 8","down 6","down 4","down 6","down 7","forward 9","down 9","forward 8","down 1","down 1","forward 1","forward 1","down 7","down 3","down 3","forward 2","down 7","forward 8","up 7","down 5","forward 7","forward 9","down 2","forward 9","forward 3","forward 9","forward 9","down 3","forward 1","forward 7","up 8","forward 7","forward 4","forward 5","forward 6","down 4","up 3","down 5","up 8","up 5","up 6","forward 1","down 1","up 8","down 8","down 5","forward 8","up 9","down 8","forward 2","up 6","forward 3","down 3","down 8","down 4","forward 6","forward 2","down 9","up 9","down 2","down 9","up 1","down 6","up 2","down 9","forward 8","forward 3","forward 6","down 6","up 9","up 8","forward 4","down 2","forward 5","up 4","up 4","down 5","down 9","forward 3","down 1","forward 1","forward 6","forward 2","down 7","forward 7","up 5","forward 2","down 8","forward 5","down 1","down 7","forward 7","down 4","forward 7","forward 2","down 6","forward 9","forward 4","up 3","forward 8","forward 2","up 6","up 3","forward 9","forward 4","down 2","forward 6","down 1","forward 5","down 2","up 1","down 1","forward 2","forward 4","down 7","up 6","forward 4","forward 7","up 8","forward 3","down 8","forward 7","down 2","down 5","forward 3","forward 7","down 5","forward 2","forward 8","up 6","forward 8","down 7","up 3","down 2","forward 2","down 8","down 2","up 5","up 1","forward 6","down 1","forward 2","down 1","forward 6","forward 9","down 9","down 8","down 3","forward 5","forward 3","down 3","down 1","forward 4","forward 8","forward 2","down 7","forward 9","forward 4","down 4","forward 6","down 4","forward 8","down 8","down 2","up 7","down 9","down 5","up 4","down 3","up 5","forward 8","down 4","down 6","forward 1","up 2","down 6","forward 4","down 8","forward 1","up 7","forward 6","up 2","forward 1","down 8","down 2","forward 3","down 3","down 2","up 9","down 3","down 4","down 3","forward 9","down 6","forward 8","forward 8","down 1","forward 8","down 5","up 9","up 5","up 5","forward 5","forward 4","down 7","down 6","forward 9","up 4","forward 7","up 5","forward 7","down 5","down 3","forward 5","down 8","up 3","forward 4","up 2","down 1","down 6","down 6","up 3","forward 5","forward 8","down 2","forward 6","down 5","down 4","forward 9","down 6","forward 6","up 5","forward 4","forward 5","forward 1","up 6","up 2","down 8","up 4","up 2","down 3","forward 4","down 5","forward 8","up 5","forward 6","forward 9","down 6","down 3","up 3","down 2","up 9","forward 5","up 5","forward 3","forward 2","down 5","up 2","down 5","forward 8","forward 2","down 1","up 2","down 6","up 8","down 3","down 2","forward 2","down 1","forward 8","forward 2","up 6","forward 6","up 3","up 8","up 2","up 4","down 7","forward 6","down 3","down 2","forward 5","down 7","down 6","forward 1","down 4","forward 4","up 1","down 3","up 3","down 4","forward 1","down 2","forward 6","down 7","forward 3","forward 1","forward 5","down 7","down 9","forward 7","forward 2","forward 7","forward 8","down 1","down 1","up 6","forward 2","up 7","down 9","up 4","up 9","forward 9","forward 6","down 3","down 9","forward 1","forward 1","up 8","forward 6","forward 1","forward 9","down 2","down 1","forward 2","forward 9","down 9","down 6","forward 5","down 6","forward 4","down 3","forward 1","down 4","up 5","forward 6","forward 3","down 2","up 3","down 9","down 2","forward 1","down 4","up 2","down 6","forward 6","forward 7","forward 3","forward 9","up 7","up 2","forward 2","up 2","forward 1","up 2","forward 8","forward 5","down 6","up 7","down 4","down 1","up 8","forward 1","down 3","up 8","forward 8","down 6","down 1","down 6","forward 1","forward 7","up 3","forward 6","forward 1","up 3","down 5","down 1","forward 5","down 5","up 7","up 3","down 6","forward 6","up 7","forward 5","forward 2","forward 1","down 8","forward 3","down 3","forward 5","down 4","up 4","down 8","down 7","down 7","up 9","up 2","down 4","down 1","down 4","forward 9","up 8","up 4","down 2","forward 8","forward 1","down 2","up 5","down 3","down 8","down 8","down 6","down 5","forward 7","down 3","forward 5","down 6","down 9","down 2","forward 8","down 4","up 2","forward 4","down 8","down 5","down 4","forward 2","up 3","forward 4","up 3","down 8","down 2","up 8","forward 4","forward 6","down 3","forward 9","forward 6","forward 8","forward 5","forward 1","forward 5","down 3","up 2","forward 4","down 4","down 3","forward 1","forward 3","forward 7","forward 9","down 2","up 4","down 3","up 8","forward 9","down 5","up 9","down 1","up 4","forward 7","forward 2","forward 4","up 8","down 4","down 1","forward 8","down 4","down 7","up 1","down 3","down 2","forward 5","up 6","down 7","forward 2"]

    var depth = 0
    var hPos = 0
    for input in course {
        let values = input.split(separator: " ", maxSplits: 1, omittingEmptySubsequences: true)
        let direction = values[0]
        let distance = Int(values[1]) ?? 0

        switch direction {
            case "forward":
                hPos += distance
            case "down":
                depth += distance
            case "up":
                depth -= distance
            default:
                print("You should not see this! Check your code.")
        }
        print("direction: \(direction), distance: \(distance)")        
    }

    print("multiplied: \(hPos * depth)")
    /*
    --- Part Two ---

    Based on your calculations, the planned course doesn't seem to make any sense. You find the submarine manual and discover that the process is actually
    slightly more complicated.

    In addition to horizontal position and depth, you'll also need to track a third value, aim, which also starts at 0. The commands also mean
    something entirely different than you first thought:

        down X increases your aim by X units.
        up X decreases your aim by X units.
        forward X does two things:
            It increases your horizontal position by X units.
            It increases your depth by your aim multiplied by X.

    Again note that since you're on a submarine, down and up do the opposite of what you might expect: "down" means aiming in the positive direction.

    Now, the above example does something different:

        forward 5 adds 5 to your horizontal position, a total of 5. Because your aim is 0, your depth does not change.
        down 5 adds 5 to your aim, resulting in a value of 5.
        forward 8 adds 8 to your horizontal position, a total of 13. Because your aim is 5, your depth increases by 8*5=40.
        up 3 decreases your aim by 3, resulting in a value of 2.
        down 8 adds 8 to your aim, resulting in a value of 10.
        forward 2 adds 2 to your horizontal position, a total of 15. Because your aim is 10, your depth increases by 2*10=20 to a total of 60.

    After following these new instructions, you would have a horizontal position of 15 and a depth of 60. (Multiplying these produces 900.)

    Using this new interpretation of the commands, calculate the horizontal position and depth you would have after following the planned course. What do you get if you multiply your final horizontal position by your final depth?
    */
    depth = 0
    hPos = 0
    var aim = 0

    for input in course {
        let values = input.split(separator: " ", maxSplits: 1, omittingEmptySubsequences: true)
        let direction = values[0]
        let distance = Int(values[1]) ?? 0

        switch direction {
            case "forward":
                hPos += distance
                depth += aim * distance
            case "down":
                aim += distance
            case "up":
                aim -= distance
            default:
                print("You should not see this! Check your code.")
        }
        print("direction: \(direction), distance: \(distance)")        
    }

    print("multiplied: \(hPos * depth)")

}

//dayOne()
dayTwo()
