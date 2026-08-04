Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010048.outbound.protection.outlook.com [52.101.228.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2B3383300
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 00:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785804229; cv=fail; b=GQoSKBF0g5uRrr/Oi3s1bbR1IvVsXod3epCkssUYRi0lwbVMasdMofmfJEIzXyWeVc56CjcTaa8Kb4ueWQNe1Qfw+1ToRsMT8vN6dzTZs8mCUqqBcb+5FAfH1UVOEROKX529GOPdnbbl1Ip83Sy+85tnAAFlKec1xFLYfHvbP3o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785804229; c=relaxed/simple;
	bh=fz3N6AUuqgWsB+M3FX5i6DfmhJim281ohqv5Dhv+crU=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=jhcvShFannXWViYc1Lh5MwfKsPH8hXzjg3Ms6aKRTO9NCX7g2aAB41kAL7OBkG4xBIfItCan2vueFs9UPhaoC7GgQ5gIjDSWnbENxJfMA3zK53Te0QULECoZVR88vPmuxAICg4VVZjHc5XRkNhRu/2aVhbKTg0ztM8qnzi+9oFg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=enkBt/oV; arc=fail smtp.client-ip=52.101.228.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="enkBt/oV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tJ8Rq1pvDBNzRUiiT/58u3wFlK1eqNRHT3A60Kex8Kju0eJiITqWlxiGb6PRFcQ/E6reVXHRHj7hrv9ZztnPYmB0Ow5YJ4ijZhfJspZm2k6zuVWKs1vufo1oUIS+vsfoYjP4P3ij+acoTcIW/b9QYxk2ImxX/NJuuQ0nbpkUiujt2NlebQwZ17kWJCBR1MoQxSAznE7JBbRJmQ4wmOJJfx+iRwNZpBq7APHv2lCywjNxcLQbA1ax22i8VW2C31duv2+54Ritd97HerGdmmI3YW6btnqRYkbsyaW60S+V8E0SQgFZ/9UlhVNQHYQ3svL6xcu9BImpLW46KU65oJyvEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gSNytrmSyh2FuLO0qgMa7BACoJZUx+Hz1flcAfBNpaA=;
 b=IN7zPRyyryYDiLhRw6xW2TFDDTInUvspS/cFY3hEGnJH0WjsGe9CNAiKbIMCcwQjRs5QAZEdkLNa6V6pcPqIFPPdCDbt9E2C9BNR/m9dwgVql1Y9BepMDVy02OGd3POLUxFWdsK3XhwU8EbsVnLPI3FwMU2HyyqUlkVt2SDGfBGb2Y5cy0Blm4RKv+Scu6jlF0cD94Zvuw7UUB8BzEhVU2xK7cm0pMik0fjDpAmrv78LsKM+16uzTvUonXiO59E+o1/xVfsBrRs0xR2yeAIv3a7aqRzOZmes4Jhhh3TRRsyiUM9mj08uZcFhEjzclcdVzHXBpZrhwL+fsSbmEjWfjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gSNytrmSyh2FuLO0qgMa7BACoJZUx+Hz1flcAfBNpaA=;
 b=enkBt/oVN/aE8OZu+FyOeO7uk2GsikdsilIgJgC+gozXjdYS2LmZrLjC6yv9ewbvCAhExLmM/wWCsXR09wtClWfM1H+leAB3PAb/RmJ6CcZ43DdqduTaYHBOXecU75NB5XM3CyIc7C+QF51MFhhw5WXLmwFV1kJdc+sgkxKRUaU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB18293.jpnprd01.prod.outlook.com (2603:1096:405:3ef::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 00:43:46 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 00:43:45 +0000
Message-ID: <87tspavhoe.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Peter Rosin <peda@lysator.liu.se>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 38/44] ASoC: codecs: tfa9879: use .auto_selectable_formats
In-Reply-To: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
References: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 4 Aug 2026 00:43:45 +0000
X-ClientProxiedBy: TYCP286CA0051.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::14) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB18293:EE_
X-MS-Office365-Filtering-Correlation-Id: 751e3f98-a8de-4d39-9d51-08def1c170de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|376014|1800799024|366016|38350700014|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	SilIYTEr2gHEEsjQ4y4rW9OXNcYysLuasdCUBT/VxPnu3a9CMRx4MDDE6ZCBkiLfb7d3Pvvj3Go2lZsPRXDC4RcBF+YQaTAyoBthgYqfoljL5336aMccuF7yq6G6Bf4JvvS6buLLGvgPwYu2L4yZwQhAaz1/SIUg1GTHGSh5su7zfOwcmgfFZB5XAy2icJ2uGa8cqfXlRLgJIIPW9iSoD5DvsaQz+U0v8USH1gULMR/krivbrKTMJB2WuGBU84/GpUx9STL9kOkAlA/jLOtzMTKWFyICMD3emT8btTvswTOURBa56nRdfvy+qf1Qiis7172hLggYvee3DyETK6gGPRfLkdxtsUuHcghpdzdEW/oze4Cm3u9RfoN/ua/iePGATPLki7705jreibOdkRwVhq8txP88UqfW1Ma3FvOA74zQ0/8CM7X2g+WykHgePrA6JvoXz+H8caQXhQjcwUcKeoZg2FWn6oGAk7ig4Vm7h2kCsHo/m44LwSZEKcG0zIaq31tieC51cpFkmh6rKWitU8oUEv8CyzLIs+DiV1Q1V9TzJOD5Q1tvvAYRuAj0ssl2fooR7ZVM+q3dr8AXwxvsp/nrrj4poRLhkMF6xVrcw2Q5FUhkd82yCamiPAlu9Uk/3IRgIfFEIfomGhhH2SEXUgXau0tz/PqnYnRJIsIaZWhnJ04rKGd8UYCOXyA8sZQcXgQzKiNbqy9zh0bjAf1ng22561XMjtuHrd6eXp/u+rM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(376014)(1800799024)(366016)(38350700014)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JJf1i+b/ia9OFqgLB1gVWAw/tlLPs5bKlhf1HolaITXFYN7LXLPVFrT32q0p?=
 =?us-ascii?Q?EUbbPq/jiVUNCNSt8Sqc65fsEfymr7h/Q8w2qLFHfST0t4oVYEA6k9ZGkPoN?=
 =?us-ascii?Q?egIFzPKB9TyNRxDmVWaAoUybmjsbKHeM8Iu9xV1QDPUmGSYrdA9Nt3Z7Xbhj?=
 =?us-ascii?Q?xOl9BPdlRMPNI9nHls3FWT6XZ7Vm0elyzXt5kef/ZEy+tcIXAekdIVRjsSGx?=
 =?us-ascii?Q?htdlpfwrtmFOKxCUqNbRZQY7c3tWr5uXqD5+4XcQr14zB9/hoMH5DQxFblPu?=
 =?us-ascii?Q?Ne7nAlY+BvFQ5k86Am5mOaCOvg1oMCxcFm1fvKm6irirq9Nnp7Fcf/zI3Pry?=
 =?us-ascii?Q?PHxBWq2oSUuS4DUFKK0goO0+NallkUkvR5K77V8gdKAveznG0gD0H8Mt1C/b?=
 =?us-ascii?Q?azYu0S4NZWfcOK75En9lB+F6Dxtah40/bm7hVvP0O3TbiU/rqGZ4aoHWGUeS?=
 =?us-ascii?Q?P9R0eRLtrFkhC+AzI4tCwFZRcxcal5kf02kXrBbyi/5z+G67lKshefXM8mYz?=
 =?us-ascii?Q?h93IY9pEPsrH2x2HqLzILwNnBehDBygVTQehtH0mjj7jYNMYTK2B42HLQbGw?=
 =?us-ascii?Q?lmWHknf1IFGD3r3byduEz+iAeiU9XvkKmU4gW8wHHBdNAx2dNRPmuZMCp0B+?=
 =?us-ascii?Q?bDCv/yRKi1X+cNYhaQ6ZcUploryEuxadU2ZM4bSpz8hjvY0Lt2yCrnRS7YH/?=
 =?us-ascii?Q?CgnY/NLNJB6ZGS5OS6uQ+y/gbm+ui9B4t6AnQieGpLhESea5r004kFQJnPAn?=
 =?us-ascii?Q?YzBGytxIkePgpacwrRInZClvX/DX2afikcUJREJeYzYBiNQGckFrfT3G3z6Y?=
 =?us-ascii?Q?pabgou+CFkeHTUdc7tJJnJslPBxWiperceNeh67SQN95T2UYKVONiHZXiqAG?=
 =?us-ascii?Q?iZ2VDuGVZFd5DKHpRZJE3cNu7fe+ll7gCwdvmb13FBD0bLIKSHFcyk53Smid?=
 =?us-ascii?Q?TaMFfb4INuSAHqHglIQb2oJw5HFtIHi9+0IMhDV+7mDGLab2OcqcbRGcLlUa?=
 =?us-ascii?Q?UHrn8/yoM+4eWdRx0WGGZc53jmufbmNfq2eervWe1wKd55RKlFFoSXqbLODL?=
 =?us-ascii?Q?xhWjgSLkD5NCa4iv4k2fgcZ1rVFTpQYtBnRRn6ZY86JWvjBt7liixN0Gzl6+?=
 =?us-ascii?Q?3uRa/M7aLxH3KWf5iDA0KHSV8QH4sJpTtZL2JoOcahO1X7r+/dYEhjSL8QfM?=
 =?us-ascii?Q?PK7T3sVnMteo2hCmOJ4bv3xj9t9AKoFUwel/rud+mBlEmr7r+aiyjWn9zIiz?=
 =?us-ascii?Q?PqjymDCFov/RyNkbDFu0AAKbskoUcqxa++bJgrP2OLDs2vKl/ekopltJ/tAE?=
 =?us-ascii?Q?gfTcvLBQRQ2HBL/YER+bpSqHeXSt9rtKa3vDZ/jpoSmeXCYnOVaFn4PqEfw7?=
 =?us-ascii?Q?BxFqzVMAclLVX96lim8a9RJsfQZF8A6ju+xyjMvQ10k/oR34P0ImKTU2QqJ/?=
 =?us-ascii?Q?o5zX6tCEtRmPzd1jPPQIp6dcvtyeeL3tGxUcgqcYv8dTS3KdhNVlxBP371w4?=
 =?us-ascii?Q?Z7lRIBAnX04HGvVC04bLNf7+4pVzrk2OeLyxarM41tP9Bi++OyEUHUoeAekq?=
 =?us-ascii?Q?bu5mqAaMgScOsGQIq7MdmDxqLIv7Dwmtt2YVCKbhBe0zznMo0ihotJZJgLcG?=
 =?us-ascii?Q?zXQYt7CvzTl0A4307DVbcCiLuJx2lHA5PFfZ2Ld7+bdKibeJ7WaHq8RzSrnm?=
 =?us-ascii?Q?uNDixtpNncUjTlRhQBfvYPZrpNlI6gtlBqI3xHpez+gTAHC5Rbmvyym+0JFm?=
 =?us-ascii?Q?OxrQFrfzj3ikSdRgvTrGG4HUYI6PldJEN+BKglGfqOTmB7Tc5KYo?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 751e3f98-a8de-4d39-9d51-08def1c170de
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 00:43:45.9212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zcPe6QVntKU3j7VzwspTKu8tcpfT7upbnclwd9ToJVAk2u4O8XsZevCwf54KuymbSwoeeZ1s/qHxSHjZ1ql62ipjUupUeZyiwg1smZcGwEfgq5iiqrO1PYBLf9W23pVd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB18293

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/tfa9879.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/codecs/tfa9879.c b/sound/soc/codecs/tfa9879.c
index f30479f1f53b0..5191037317687 100644
--- a/sound/soc/codecs/tfa9879.c
+++ b/sound/soc/codecs/tfa9879.c
@@ -248,10 +248,19 @@ static const struct regmap_config tfa9879_regmap = {
 	.cache_type = REGCACHE_RBTREE,
 };
 
+static const u64 tfa9879_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops tfa9879_dai_ops = {
 	.hw_params = tfa9879_hw_params,
 	.mute_stream = tfa9879_mute_stream,
 	.set_fmt = tfa9879_set_fmt,
+	.auto_selectable_formats	= &tfa9879_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
-- 
2.53.0

