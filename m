Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010066.outbound.protection.outlook.com [52.101.228.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4128837F30D
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 00:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785804255; cv=fail; b=kIwIOTcHtOqnPOph/ys2pkVos0krtsiMYO+Y2/83s7ihZ+YRIq/ibLxpG3f5y5E8wN7k1MjnDXgLEuGhysmv8ikSLuObRmvMRHXqOQ4+NJOVqU06kuVP+KZsCmyt8Grb6blE996Wkr3w99R/qzm4QUtFahaSKp3t3HIA2Y6z+9c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785804255; c=relaxed/simple;
	bh=yTwrJ9S4OyyY8bcqYhrrmq2sQNFU+ob/JSF8wcyMkCE=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=TfK8dWU01AytuDW3L48+9sCJR/UoBCtyQhEKS0JpoCRiHY1BzANAA4g7OvTBiqOrWjwAsWPd8ptqXA1iHACMXs1QnSsDWUIiH5oyIQl+E8VpMEFgiGLZwQVzD2EWcdpyXAK4M5SsXtaKLZvBIxBLp7auEdl0eXS7w5ES5vvuXZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=XNhlqdq+; arc=fail smtp.client-ip=52.101.228.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="XNhlqdq+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ss3wxUUilyWiMm/SxUjLvNQm2OTeI43d/s5RmghwB2cUoxkuYaiAMMrltYp7nhVxWOn71rkiBMd0KO5QUf3WX+Gzv1XUXp5e2NDv4Ew0HAccoLIJdg7yOxSN42Hy2IJxNFsaKmANbkrRdVorp0VQW093DzGio2UuZDt+VTF+d+Rg1I7OxYgHVH2zqnwVgtAoecwMruqv6lCP9nGkTQ6bmSz+bDgNyioPT41oQxjaJnsrGR892yb6GnE+bBLBXd/ibTWXfak2LJsyXNtft/7Oar+bkuzk8nWM+zGKCt18mEs7IPDe1wanik7OprJFoeB1vcNHqqFETPEXKcqhG8qprg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HjAvBXOB8Qdz/x3JSu035C/4eli+gMh3J7xwwymKvEE=;
 b=PqplM7/gEhV3FdPziTsN/1mYpBd/4jpOwMwMZN1Yr00MI2oaYm/52+ArJ1EdILNpoyCaQg9m9Za9UpahZkhPY+9R0PO/0FR6ndCECq/svhht70MlOEEUTla9eGSf6ifty6dHJv/gMz4RZ/F7O/g+qC0PyZ1o/4KFgQ7XwFAWnYD3reNw6TbYCQOx4vgzoIdtNl25tVZbng0ycUTHLLcF6lQgg6219gaqVEZI79vMmRqOI1QHI2VilfwUT+ua6Q6fh7KokxWk8eXSggQ1uqLqwev4tjKakqMJQBZtZEuokv8I4II8jKqNA8WEF5SkVKuI1B5yhVEQk7vfsTNTA4VMCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HjAvBXOB8Qdz/x3JSu035C/4eli+gMh3J7xwwymKvEE=;
 b=XNhlqdq+HnB0kn2IoBp3I/pJr/nVeY1mvywEFwt5QFYUUHGg1iEmcBRfACOvMmcRCmCB2IypUhYWvf1pjBgVHZJq40aYysDM2sc+OEUV7eBfUBOM4+bk4pT9uwlalFi1b/A3t+nj/f1O6MbgxuhksZ4GSOGjnwJkbHCCKzveIHM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB18293.jpnprd01.prod.outlook.com (2603:1096:405:3ef::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 00:44:10 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 00:44:10 +0000
Message-ID: <87mrv2vhnq.wl-kuninori.morimoto.gx@renesas.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>, Jaroslav Kysela
 <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, =?ISO-8859-1?Q?=22Uw?=
 =?ISO-8859-1?Q?e_Kleine-K=F6nig_=28The_Capable_Hub=29=22?=
 <u.kleine-koenig@baylibre.com>
Cc: linux-sound@vger.kernel.org,
 "Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= (The Capable Hub)" <u.kleine-koenig@baylibre.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 43/44] ASoC: codecs: wm*: use .auto_selectable_formats
In-Reply-To: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
References: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 4 Aug 2026 00:44:09 +0000
X-ClientProxiedBy: TY4P301CA0108.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37b::11) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB18293:EE_
X-MS-Office365-Filtering-Correlation-Id: 76b34d58-e2fe-4b85-a195-08def1c17f4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|376014|1800799024|366016|38350700014|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	236OrksAF3qimgTGQcO0puj6A27Q/TuO7ANv+c0OPgal447peS73ekc2gpbcOxlZ0JYjKasMq6rP3B5bsoyAYws+U/3Kp63gaFbxyuoIvvt9fyiGj94Eo8jtGOuikejNPD5vHea1Kg6v5UAmfLbVwTS/rnI0Rsgd01xIGEb1DQJ7MYPRu0ezIQ1EDVf0D0y34/35bhPfu9uaISqGXi1CR3rGeHnCi8RaGq21vx6wycWPzIHX7gVnfwhbJxj4RHSz+eGvDtKNykCB99TYEiuSsxF+gY7tcPWyhwz79VAubpz7+wHJLNB8I3tv8NALKEiW6jpdX9Piukg7MB5ZQ0SySNT0tFHv1JJ2rSz3cShIKnof3mTR3qB0f79d+fHF1EnEgO4n67SxRrxzc43J/90PnQOPOTlZGzI3hwPKI4cMFOOnLKBTfdAGAithFv/rSbPryHRJsLRfhbrKKZkwcSm3TKy09WZ0OBvP42p0jr6wqnOJnKYqt9oaKMmKIweh5JrcTWWSikq33x5HNev9r6ynOytit0DFboHlzc1WGK8HpomvC43/MGHelPShwUHLGPIOPoTRQzPxQYAwcJavIBo6EsMUrlujkDz6KqvdJhW1dufWoaNtcqKdxT9L5qd1scaj1NYq2gq7jXt1DoMKwcnFiwoYrMk9X74+aOet/fDT+1CbyH9oQzZT3hAOdvD3IUm0P8VkSqWZdj6N/vBPqvOM2UhwgbrSnPsyhzJDUsdWKT8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(376014)(1800799024)(366016)(38350700014)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EaIZpabvXB6WBhqAJDKfWK9n/wSXbFNKU1HpEqAn5TNrWadEXlDs3FWC6HHX?=
 =?us-ascii?Q?8RcV3eBNy7XDx3rxkCnaP7jkuIs16EAnARll//kBQfq+oTblD/gxMcaFtJ/q?=
 =?us-ascii?Q?B5bd8wCpX+15PyuNdoPCHnwpx8CowORhjQ81ySSWjVzwk/Rj9ngku8W/KsSU?=
 =?us-ascii?Q?0moK9A2VbMxowEk0z1xSbRVZeBym373p9yyMvb2+iJE7Ac33knQmWFkvJYNJ?=
 =?us-ascii?Q?hkAvTDOFfCJ2Y7dybhhGIZNuwYSulKXO+HVMMXL/6wUHS7uT0lkbSi9fRWe+?=
 =?us-ascii?Q?eCPXMEl/ztmbrBmEakpeDbwEbWEk/bEdG33kg0jw0kZHbG3ofBP3d3T5nuhg?=
 =?us-ascii?Q?KuqPVqBagTrG9Y20HoRWyOTRFpE6HmIyRyKRISYX50Spzb9shv9GEwYy/Gje?=
 =?us-ascii?Q?v+3T2umon6QP1GMRyQjj8zFTchOoUcOcHHc8wurj1IbPqlaDmyE872s3hb3s?=
 =?us-ascii?Q?gIlEoMYAm16sS27z424cfjrGXiIeu0xQamdz4DXjFs12GeWUvo9p/N+K/7Z/?=
 =?us-ascii?Q?sjFjhJlHnw8bdRv+S2m9jKH0GF/Tmr2F+BJhSY4k7eMTjzWRYhb+Snsk4v1z?=
 =?us-ascii?Q?c3aBoDj9JoeGukFGNyXGC/XlB1GNfRzuq1/83N6an+U0qki0JTUv+997K+w2?=
 =?us-ascii?Q?yMkvoBgyl2lbACs2SCKWbriMnRXPkzwVxprOSk/2Mnhu5l1c05v44EUtWZTY?=
 =?us-ascii?Q?pVCUd0lSQrB3gxCeOVfX7cUo5aMYCcGNPiyqXB9Qek9gIsF58s8gRbKzYu61?=
 =?us-ascii?Q?nch+W4uWXN2AHjkw7TXbSulvGcuXh0C5FLOV0Bey6FxiurF9xR5zyxZiiQJI?=
 =?us-ascii?Q?LIEOvL+WBPZockdO1ZeqOqdZjPNLKUPWSKd+27hzp43EK//T/zXgkBiF5fAw?=
 =?us-ascii?Q?bjynoVCjtpDOdNHg3KF5TmvQPh0UdG9DmlZG1ntLkEM80cIcSgmMVIhikTH9?=
 =?us-ascii?Q?o7YV5h6nhju+tfP7P6S0WsWgf13uuF25aJaG4kyGFG1+ZWGeRxqQPC9l4uRU?=
 =?us-ascii?Q?PR4K8YErfzGRgn/D26B2F7CdmdcvFLYxpenRU5Nsljvg5IgZrCq+Bu+ED8sv?=
 =?us-ascii?Q?TmtKF7T/HQlS1E5mKQQKlsJcha+G4looiVVzAp5hV6aGEMe9GjbOQ3MaiqN5?=
 =?us-ascii?Q?a/TYR/xdhg53nKJp6U5UsNQuNEMDtb/dVzxf8PPje5sEKUcbtGwqEiAf0OVa?=
 =?us-ascii?Q?0YnRVFn2H0objn6OHqFOwwAqak0W4zpXX/Z+GO86+evvp7OMBiHCXjhxExvE?=
 =?us-ascii?Q?0BDKk78mM/wx6VXCq5ZLHq/sWw9ULNWeX8I6Whqr50W+S0ruI34G9dldr0kA?=
 =?us-ascii?Q?XKi8FqzNQFikqS+8dqa2tVmvAhCr16cNkFJ+cKKBzyS7k3joHma3gOD5lreZ?=
 =?us-ascii?Q?8TTS7H9knnmhEqUikw9D1pgbVEHEXinJ6jKdvV/sLDbR0bBM4Nr8qy2Isy2z?=
 =?us-ascii?Q?3vxnAYeBGvBvElJVaeY5HtbwVvAbdphVdaovJTbuinXltxwfFX3be5ipz1ls?=
 =?us-ascii?Q?qJ4SKkHrPdJsSRyxBehcH9ub6j4LjB2hRzcf+NdfbdZc4JIM3uXAy0d1PshJ?=
 =?us-ascii?Q?GSz0ZoZkASUol32Hw5htuJBfyep3eJnwsFl0mWckhP4Wxm7BcsojyJueyr+a?=
 =?us-ascii?Q?S8+KL5fwNAGkwCK4NIDLJB31XAvLLEhCrcoBIfAfXq4Xq0PABkbgnlK3x2Nc?=
 =?us-ascii?Q?YemtAIy1MEERj/e37pDwId8xWIyNirmRBZAVCkiPBeJcpt2FDeuY0bYrVjAu?=
 =?us-ascii?Q?3t6++JhY46GVLYgmSfjdBU3My9VNjcGotD1AXZvnIr/Ykjq3ipJF?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76b34d58-e2fe-4b85-a195-08def1c17f4a
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 00:44:10.1649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XKwcpM5+64KJdIwJld9LO7yUlqOJANGvYfdJsANBhv3GPf+2jCCy7FfjaLxTRNXV366nRkxcFjPuH2SMQ5DH522soBwtpjMSrkZAN8DULEpWy8hC5SXVIpxAQXa1Zbn+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB18293

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/wm2200.c | 10 ++++++++++
 sound/soc/codecs/wm5100.c | 10 ++++++++++
 sound/soc/codecs/wm8350.c | 13 +++++++++++++
 sound/soc/codecs/wm8400.c |  9 +++++++++
 sound/soc/codecs/wm8510.c | 12 ++++++++++++
 sound/soc/codecs/wm8523.c | 13 +++++++++++++
 sound/soc/codecs/wm8524.c |  6 ++++++
 sound/soc/codecs/wm8580.c | 15 +++++++++++++++
 sound/soc/codecs/wm8711.c | 13 +++++++++++++
 sound/soc/codecs/wm8728.c |  9 +++++++++
 sound/soc/codecs/wm8731.c | 13 +++++++++++++
 sound/soc/codecs/wm8737.c | 11 +++++++++++
 sound/soc/codecs/wm8741.c | 13 +++++++++++++
 sound/soc/codecs/wm8750.c | 13 +++++++++++++
 sound/soc/codecs/wm8753.c | 20 ++++++++++++++++++++
 sound/soc/codecs/wm8770.c | 11 +++++++++++
 sound/soc/codecs/wm8776.c | 13 +++++++++++++
 sound/soc/codecs/wm8804.c | 15 ++++++++++++++-
 sound/soc/codecs/wm8900.c | 18 ++++++++++++++++++
 sound/soc/codecs/wm8903.c | 18 ++++++++++++++++++
 sound/soc/codecs/wm8904.c | 18 ++++++++++++++++++
 sound/soc/codecs/wm8940.c | 13 +++++++++++++
 sound/soc/codecs/wm8955.c | 18 ++++++++++++++++++
 sound/soc/codecs/wm8960.c | 13 +++++++++++++
 sound/soc/codecs/wm8961.c | 18 ++++++++++++++++++
 sound/soc/codecs/wm8962.c | 13 +++++++++++++
 sound/soc/codecs/wm8971.c | 13 +++++++++++++
 sound/soc/codecs/wm8974.c | 12 ++++++++++++
 sound/soc/codecs/wm8978.c | 12 ++++++++++++
 sound/soc/codecs/wm8983.c | 12 ++++++++++++
 sound/soc/codecs/wm8985.c | 18 ++++++++++++++++++
 sound/soc/codecs/wm8988.c | 13 +++++++++++++
 sound/soc/codecs/wm8990.c |  9 +++++++++
 sound/soc/codecs/wm8991.c |  9 +++++++++
 sound/soc/codecs/wm8993.c | 18 ++++++++++++++++++
 sound/soc/codecs/wm8994.c | 20 ++++++++++++++++++++
 sound/soc/codecs/wm8995.c | 20 ++++++++++++++++++++
 sound/soc/codecs/wm8996.c | 12 ++++++++++++
 sound/soc/codecs/wm9081.c | 18 ++++++++++++++++++
 sound/soc/codecs/wm9713.c | 13 +++++++++++++
 40 files changed, 546 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm2200.c b/sound/soc/codecs/wm2200.c
index bc78b553b6cbe..692e933dba753 100644
--- a/sound/soc/codecs/wm2200.c
+++ b/sound/soc/codecs/wm2200.c
@@ -2066,10 +2066,20 @@ static int wm2200_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const u64 wm2200_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops wm2200_dai_ops = {
 	.probe = wm2200_dai_probe,
 	.set_fmt = wm2200_set_fmt,
 	.hw_params = wm2200_hw_params,
+	.auto_selectable_formats	= &wm2200_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 #define WM2200_RATES SNDRV_PCM_RATE_8000_48000
diff --git a/sound/soc/codecs/wm5100.c b/sound/soc/codecs/wm5100.c
index 2fe937a93026c..f7ecbac386e5e 100644
--- a/sound/soc/codecs/wm5100.c
+++ b/sound/soc/codecs/wm5100.c
@@ -1501,9 +1501,19 @@ static int wm5100_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static const u64 wm5100_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops wm5100_dai_ops = {
 	.set_fmt = wm5100_set_fmt,
 	.hw_params = wm5100_hw_params,
+	.auto_selectable_formats	= &wm5100_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static int wm5100_set_sysclk(struct snd_soc_component *component, int clk_id,
diff --git a/sound/soc/codecs/wm8350.c b/sound/soc/codecs/wm8350.c
index ad68ff1790e01..13e3fde87e149 100644
--- a/sound/soc/codecs/wm8350.c
+++ b/sound/soc/codecs/wm8350.c
@@ -1426,6 +1426,17 @@ EXPORT_SYMBOL_GPL(wm8350_mic_jack_detect);
 			SNDRV_PCM_FMTBIT_S20_3LE |\
 			SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 wm8350_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops wm8350_dai_ops = {
 	 .hw_params	= wm8350_pcm_hw_params,
 	 .mute_stream	= wm8350_mute,
@@ -1434,6 +1445,8 @@ static const struct snd_soc_dai_ops wm8350_dai_ops = {
 	 .set_pll	= wm8350_set_fll,
 	 .set_clkdiv	= wm8350_set_clkdiv,
 	 .no_capture_mute = 1,
+	 .auto_selectable_formats	= &wm8350_selectable_formats,
+	 .num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver wm8350_dai = {
diff --git a/sound/soc/codecs/wm8400.c b/sound/soc/codecs/wm8400.c
index 0eecc8657a38d..83e2d72a4a76b 100644
--- a/sound/soc/codecs/wm8400.c
+++ b/sound/soc/codecs/wm8400.c
@@ -1222,6 +1222,13 @@ static int wm8400_set_bias_level(struct snd_soc_component *component,
 #define WM8400_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 	SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 wm8400_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
+
 static const struct snd_soc_dai_ops wm8400_dai_ops = {
 	.hw_params = wm8400_hw_params,
 	.mute_stream = wm8400_mute,
@@ -1230,6 +1237,8 @@ static const struct snd_soc_dai_ops wm8400_dai_ops = {
 	.set_sysclk = wm8400_set_dai_sysclk,
 	.set_pll = wm8400_set_dai_pll,
 	.no_capture_mute = 1,
+	.auto_selectable_formats = &wm8400_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 /*
diff --git a/sound/soc/codecs/wm8510.c b/sound/soc/codecs/wm8510.c
index 137dcd3d74874..7d40ed21f569e 100644
--- a/sound/soc/codecs/wm8510.c
+++ b/sound/soc/codecs/wm8510.c
@@ -545,6 +545,16 @@ static int wm8510_set_bias_level(struct snd_soc_component *component,
 #define WM8510_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 	SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 wm8510_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops wm8510_dai_ops = {
 	.hw_params	= wm8510_pcm_hw_params,
 	.mute_stream	= wm8510_mute,
@@ -552,6 +562,8 @@ static const struct snd_soc_dai_ops wm8510_dai_ops = {
 	.set_clkdiv	= wm8510_set_dai_clkdiv,
 	.set_pll	= wm8510_set_dai_pll,
 	.no_capture_mute = 1,
+	.auto_selectable_formats	= &wm8510_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver wm8510_dai = {
diff --git a/sound/soc/codecs/wm8523.c b/sound/soc/codecs/wm8523.c
index b8832a1d61feb..9972d6599002c 100644
--- a/sound/soc/codecs/wm8523.c
+++ b/sound/soc/codecs/wm8523.c
@@ -374,11 +374,24 @@ static int wm8523_set_bias_level(struct snd_soc_component *component,
 #define WM8523_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 wm8523_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops wm8523_dai_ops = {
 	.startup	= wm8523_startup,
 	.hw_params	= wm8523_hw_params,
 	.set_sysclk	= wm8523_set_dai_sysclk,
 	.set_fmt	= wm8523_set_dai_fmt,
+	.auto_selectable_formats	= &wm8523_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver wm8523_dai = {
diff --git a/sound/soc/codecs/wm8524.c b/sound/soc/codecs/wm8524.c
index 23daf158f35f6..8d0565b103cdb 100644
--- a/sound/soc/codecs/wm8524.c
+++ b/sound/soc/codecs/wm8524.c
@@ -190,6 +190,10 @@ static int wm8524_hw_params(struct snd_pcm_substream *substream,
 			SNDRV_PCM_FMTBIT_S24_LE |\
 			SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 wm8525_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF;
+
 static const struct snd_soc_dai_ops wm8524_dai_ops = {
 	.startup	= wm8524_startup,
 	.shutdown	= wm8524_shutdown,
@@ -197,6 +201,8 @@ static const struct snd_soc_dai_ops wm8524_dai_ops = {
 	.set_fmt	= wm8524_set_fmt,
 	.mute_stream	= wm8524_mute_stream,
 	.hw_params	= wm8524_hw_params,
+	.auto_selectable_formats	= &wm8525_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver wm8524_dai = {
diff --git a/sound/soc/codecs/wm8580.c b/sound/soc/codecs/wm8580.c
index eb374ba6e5b5b..c807efe021943 100644
--- a/sound/soc/codecs/wm8580.c
+++ b/sound/soc/codecs/wm8580.c
@@ -860,6 +860,17 @@ static int wm8580_playback_startup(struct snd_pcm_substream *substream,
 #define WM8580_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 wm8580_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops wm8580_dai_ops_playback = {
 	.startup	= wm8580_playback_startup,
 	.set_sysclk	= wm8580_set_sysclk,
@@ -869,6 +880,8 @@ static const struct snd_soc_dai_ops wm8580_dai_ops_playback = {
 	.set_pll	= wm8580_set_dai_pll,
 	.mute_stream	= wm8580_mute,
 	.no_capture_mute = 1,
+	.auto_selectable_formats	= &wm8580_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_dai_ops wm8580_dai_ops_capture = {
@@ -877,6 +890,8 @@ static const struct snd_soc_dai_ops wm8580_dai_ops_capture = {
 	.set_fmt	= wm8580_set_paif_dai_fmt,
 	.set_clkdiv	= wm8580_set_dai_clkdiv,
 	.set_pll	= wm8580_set_dai_pll,
+	.auto_selectable_formats	= &wm8580_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver wm8580_dai[] = {
diff --git a/sound/soc/codecs/wm8711.c b/sound/soc/codecs/wm8711.c
index 2db8829661c39..390af15a749a1 100644
--- a/sound/soc/codecs/wm8711.c
+++ b/sound/soc/codecs/wm8711.c
@@ -325,6 +325,17 @@ static int wm8711_set_bias_level(struct snd_soc_component *component,
 #define WM8711_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 	SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 wm8711_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops wm8711_ops = {
 	.prepare = wm8711_pcm_prepare,
 	.hw_params = wm8711_hw_params,
@@ -333,6 +344,8 @@ static const struct snd_soc_dai_ops wm8711_ops = {
 	.set_sysclk = wm8711_set_dai_sysclk,
 	.set_fmt = wm8711_set_dai_fmt,
 	.no_capture_mute = 1,
+	.auto_selectable_formats	= &wm8711_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver wm8711_dai = {
diff --git a/sound/soc/codecs/wm8728.c b/sound/soc/codecs/wm8728.c
index 3109a6a0df742..7af5ce0fffe05 100644
--- a/sound/soc/codecs/wm8728.c
+++ b/sound/soc/codecs/wm8728.c
@@ -190,11 +190,20 @@ static int wm8728_set_bias_level(struct snd_soc_component *component,
 #define WM8728_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 	SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 wm8728_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops wm8728_dai_ops = {
 	.hw_params	= wm8728_hw_params,
 	.mute_stream	= wm8728_mute,
 	.set_fmt	= wm8728_set_dai_fmt,
 	.no_capture_mute = 1,
+	.auto_selectable_formats	= &wm8728_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver wm8728_dai = {
diff --git a/sound/soc/codecs/wm8731.c b/sound/soc/codecs/wm8731.c
index ce87280d590db..f25b50919a9a5 100644
--- a/sound/soc/codecs/wm8731.c
+++ b/sound/soc/codecs/wm8731.c
@@ -519,6 +519,17 @@ static int wm8731_startup(struct snd_pcm_substream *substream,
 #define WM8731_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 	SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 wm8731_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops wm8731_dai_ops = {
 	.startup	= wm8731_startup,
 	.hw_params	= wm8731_hw_params,
@@ -526,6 +537,8 @@ static const struct snd_soc_dai_ops wm8731_dai_ops = {
 	.set_sysclk	= wm8731_set_dai_sysclk,
 	.set_fmt	= wm8731_set_dai_fmt,
 	.no_capture_mute = 1,
+	.auto_selectable_formats	= &wm8731_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver wm8731_dai = {
diff --git a/sound/soc/codecs/wm8737.c b/sound/soc/codecs/wm8737.c
index 33a3f88fffb3c..72b7d09503a9c 100644
--- a/sound/soc/codecs/wm8737.c
+++ b/sound/soc/codecs/wm8737.c
@@ -516,10 +516,21 @@ static int wm8737_set_bias_level(struct snd_soc_component *component,
 #define WM8737_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 wm8737_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF;
+
 static const struct snd_soc_dai_ops wm8737_dai_ops = {
 	.hw_params	= wm8737_hw_params,
 	.set_sysclk	= wm8737_set_dai_sysclk,
 	.set_fmt	= wm8737_set_dai_fmt,
+	.auto_selectable_formats	= &wm8737_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver wm8737_dai = {
diff --git a/sound/soc/codecs/wm8741.c b/sound/soc/codecs/wm8741.c
index ca56fdfb50887..e49adc9808b4f 100644
--- a/sound/soc/codecs/wm8741.c
+++ b/sound/soc/codecs/wm8741.c
@@ -381,6 +381,17 @@ static int wm8741_mute(struct snd_soc_dai *codec_dai, int mute, int direction)
 #define WM8741_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 wm8741_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops wm8741_dai_ops = {
 	.startup	= wm8741_startup,
 	.hw_params	= wm8741_hw_params,
@@ -388,6 +399,8 @@ static const struct snd_soc_dai_ops wm8741_dai_ops = {
 	.set_fmt	= wm8741_set_dai_fmt,
 	.mute_stream	= wm8741_mute,
 	.no_capture_mute = 1,
+	.auto_selectable_formats	= &wm8741_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver wm8741_dai = {
diff --git a/sound/soc/codecs/wm8750.c b/sound/soc/codecs/wm8750.c
index d3f1178c2d34e..b0b4447938303 100644
--- a/sound/soc/codecs/wm8750.c
+++ b/sound/soc/codecs/wm8750.c
@@ -659,12 +659,25 @@ static int wm8750_set_bias_level(struct snd_soc_component *component,
 #define WM8750_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 	SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 wm8750_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops wm8750_dai_ops = {
 	.hw_params	= wm8750_pcm_hw_params,
 	.mute_stream	= wm8750_mute,
 	.set_fmt	= wm8750_set_dai_fmt,
 	.set_sysclk	= wm8750_set_dai_sysclk,
 	.no_capture_mute = 1,
+	.auto_selectable_formats	= &wm8750_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver wm8750_dai = {
diff --git a/sound/soc/codecs/wm8753.c b/sound/soc/codecs/wm8753.c
index ac4008b4832dd..cbdf1e6aea5bb 100644
--- a/sound/soc/codecs/wm8753.c
+++ b/sound/soc/codecs/wm8753.c
@@ -1380,6 +1380,22 @@ static int wm8753_set_bias_level(struct snd_soc_component *component,
  * 3. Voice disabled - HIFI over HIFI
  * 4. Voice disabled - HIFI over HIFI, uses voice DAI LRC for capture
  */
+static const u64 wm8753_selectable_formats[] = {
+	/* 1st priority */
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF,
+	/* 2nd priority */
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF,
+};
+
 static const struct snd_soc_dai_ops wm8753_dai_ops_hifi_mode = {
 	.hw_params	= wm8753_i2s_hw_params,
 	.mute_stream	= wm8753_mute,
@@ -1388,6 +1404,8 @@ static const struct snd_soc_dai_ops wm8753_dai_ops_hifi_mode = {
 	.set_pll	= wm8753_set_dai_pll,
 	.set_sysclk	= wm8753_set_dai_sysclk,
 	.no_capture_mute = 1,
+	.auto_selectable_formats	= wm8753_selectable_formats,
+	.num_auto_selectable_formats	= ARRAY_SIZE(wm8753_selectable_formats),
 };
 
 static const struct snd_soc_dai_ops wm8753_dai_ops_voice_mode = {
@@ -1398,6 +1416,8 @@ static const struct snd_soc_dai_ops wm8753_dai_ops_voice_mode = {
 	.set_pll	= wm8753_set_dai_pll,
 	.set_sysclk	= wm8753_set_dai_sysclk,
 	.no_capture_mute = 1,
+	.auto_selectable_formats	= wm8753_selectable_formats,
+	.num_auto_selectable_formats	= ARRAY_SIZE(wm8753_selectable_formats),
 };
 
 static struct snd_soc_dai_driver wm8753_dai[] = {
diff --git a/sound/soc/codecs/wm8770.c b/sound/soc/codecs/wm8770.c
index b8b4d1e823e6e..1e485d2fe21a6 100644
--- a/sound/soc/codecs/wm8770.c
+++ b/sound/soc/codecs/wm8770.c
@@ -537,12 +537,23 @@ static int wm8770_set_bias_level(struct snd_soc_component *component,
 #define WM8770_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 wm8770_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops wm8770_dai_ops = {
 	.mute_stream = wm8770_mute,
 	.hw_params = wm8770_hw_params,
 	.set_fmt = wm8770_set_fmt,
 	.set_sysclk = wm8770_set_sysclk,
 	.no_capture_mute = 1,
+	.auto_selectable_formats = &wm8770_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver wm8770_dai = {
diff --git a/sound/soc/codecs/wm8776.c b/sound/soc/codecs/wm8776.c
index a8e4f71c77d10..c633fe824356d 100644
--- a/sound/soc/codecs/wm8776.c
+++ b/sound/soc/codecs/wm8776.c
@@ -360,18 +360,31 @@ static int wm8776_set_bias_level(struct snd_soc_component *component,
 #define WM8776_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 wm8776_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops wm8776_dac_ops = {
 	.mute_stream	= wm8776_mute,
 	.hw_params      = wm8776_hw_params,
 	.set_fmt        = wm8776_set_fmt,
 	.set_sysclk     = wm8776_set_sysclk,
 	.no_capture_mute = 1,
+	.auto_selectable_formats	= &wm8776_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_dai_ops wm8776_adc_ops = {
 	.hw_params      = wm8776_hw_params,
 	.set_fmt        = wm8776_set_fmt,
 	.set_sysclk     = wm8776_set_sysclk,
+	.auto_selectable_formats	= &wm8776_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver wm8776_dai[] = {
diff --git a/sound/soc/codecs/wm8804.c b/sound/soc/codecs/wm8804.c
index 94aa3c8de0ab6..2fc9634fe51f1 100644
--- a/sound/soc/codecs/wm8804.c
+++ b/sound/soc/codecs/wm8804.c
@@ -502,12 +502,25 @@ static int wm8804_set_clkdiv(struct snd_soc_dai *dai,
 	return 0;
 }
 
+static const u64 wm8804_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops wm8804_dai_ops = {
 	.hw_params = wm8804_hw_params,
 	.set_fmt = wm8804_set_fmt,
 	.set_sysclk = wm8804_set_sysclk,
 	.set_clkdiv = wm8804_set_clkdiv,
-	.set_pll = wm8804_set_pll
+	.set_pll = wm8804_set_pll,
+	.auto_selectable_formats = &wm8804_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 #define WM8804_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
diff --git a/sound/soc/codecs/wm8900.c b/sound/soc/codecs/wm8900.c
index a9128cfa6ff17..dcda7a7be0b10 100644
--- a/sound/soc/codecs/wm8900.c
+++ b/sound/soc/codecs/wm8900.c
@@ -992,6 +992,22 @@ static int wm8900_mute(struct snd_soc_dai *codec_dai, int mute, int direction)
 	(SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 	 SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 wm8900_selectable_formats[] = {
+	/* 1st priority */
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF,
+	/* 2nd priority */
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF,
+};
+
 static const struct snd_soc_dai_ops wm8900_dai_ops = {
 	.hw_params	= wm8900_hw_params,
 	.set_clkdiv	= wm8900_set_dai_clkdiv,
@@ -999,6 +1015,8 @@ static const struct snd_soc_dai_ops wm8900_dai_ops = {
 	.set_fmt	= wm8900_set_dai_fmt,
 	.mute_stream	= wm8900_mute,
 	.no_capture_mute = 1,
+	.auto_selectable_formats	= wm8900_selectable_formats,
+	.num_auto_selectable_formats	= ARRAY_SIZE(wm8900_selectable_formats),
 };
 
 static struct snd_soc_dai_driver wm8900_dai = {
diff --git a/sound/soc/codecs/wm8903.c b/sound/soc/codecs/wm8903.c
index 156e1e24a3885..68112cb2eec8f 100644
--- a/sound/soc/codecs/wm8903.c
+++ b/sound/soc/codecs/wm8903.c
@@ -1733,12 +1733,30 @@ static irqreturn_t wm8903_irq(int irq, void *data)
 			SNDRV_PCM_FMTBIT_S20_3LE |\
 			SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 wm8903_selectable_formats[] = {
+	/* 1st priority */
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF,
+	/* 2nd priority */
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF,
+};
+
 static const struct snd_soc_dai_ops wm8903_dai_ops = {
 	.hw_params	= wm8903_hw_params,
 	.mute_stream	= wm8903_mute,
 	.set_fmt	= wm8903_set_dai_fmt,
 	.set_sysclk	= wm8903_set_dai_sysclk,
 	.no_capture_mute = 1,
+	.auto_selectable_formats	= wm8903_selectable_formats,
+	.num_auto_selectable_formats	= ARRAY_SIZE(wm8903_selectable_formats),
 };
 
 static struct snd_soc_dai_driver wm8903_dai = {
diff --git a/sound/soc/codecs/wm8904.c b/sound/soc/codecs/wm8904.c
index 9e5782e50f475..153ce2c1a0f60 100644
--- a/sound/soc/codecs/wm8904.c
+++ b/sound/soc/codecs/wm8904.c
@@ -2026,6 +2026,22 @@ static int wm8904_set_bias_level(struct snd_soc_component *component,
 #define WM8904_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 wm8904_selectable_formats[] = {
+	/* 1st priority */
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF,
+	/* 2nd priority */
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF,
+};
+
 static const struct snd_soc_dai_ops wm8904_dai_ops = {
 	.set_sysclk = wm8904_set_sysclk,
 	.set_fmt = wm8904_set_fmt,
@@ -2034,6 +2050,8 @@ static const struct snd_soc_dai_ops wm8904_dai_ops = {
 	.hw_params = wm8904_hw_params,
 	.mute_stream = wm8904_mute,
 	.no_capture_mute = 1,
+	.auto_selectable_formats = wm8904_selectable_formats,
+	.num_auto_selectable_formats = ARRAY_SIZE(wm8904_selectable_formats),
 };
 
 static struct snd_soc_dai_driver wm8904_dai = {
diff --git a/sound/soc/codecs/wm8940.c b/sound/soc/codecs/wm8940.c
index e631ec0722496..f155b8378e909 100644
--- a/sound/soc/codecs/wm8940.c
+++ b/sound/soc/codecs/wm8940.c
@@ -730,6 +730,17 @@ static int wm8940_set_dai_sysclk(struct snd_soc_dai *dai, int clk_id,
 			SNDRV_PCM_FMTBIT_S24_LE |			\
 			SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 wm8940_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops wm8940_dai_ops = {
 	.hw_params = wm8940_i2s_hw_params,
 	.set_sysclk = wm8940_set_dai_sysclk,
@@ -738,6 +749,8 @@ static const struct snd_soc_dai_ops wm8940_dai_ops = {
 	.set_clkdiv = wm8940_set_dai_clkdiv,
 	.set_pll = wm8940_set_dai_pll,
 	.no_capture_mute = 1,
+	.auto_selectable_formats = &wm8940_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver wm8940_dai = {
diff --git a/sound/soc/codecs/wm8955.c b/sound/soc/codecs/wm8955.c
index c897a9ab764dd..1d367a957f3ee 100644
--- a/sound/soc/codecs/wm8955.c
+++ b/sound/soc/codecs/wm8955.c
@@ -845,12 +845,30 @@ static int wm8955_set_bias_level(struct snd_soc_component *component,
 #define WM8955_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 wm8955_selectable_formats[] = {
+	/* 1st priority */
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF,
+	/* 2nd priority */
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF,
+};
+
 static const struct snd_soc_dai_ops wm8955_dai_ops = {
 	.set_sysclk = wm8955_set_sysclk,
 	.set_fmt = wm8955_set_fmt,
 	.hw_params = wm8955_hw_params,
 	.mute_stream = wm8955_mute,
 	.no_capture_mute = 1,
+	.auto_selectable_formats	= wm8955_selectable_formats,
+	.num_auto_selectable_formats	= ARRAY_SIZE(wm8955_selectable_formats),
 };
 
 static struct snd_soc_dai_driver wm8955_dai = {
diff --git a/sound/soc/codecs/wm8960.c b/sound/soc/codecs/wm8960.c
index a810732c6af00..093530ae872b7 100644
--- a/sound/soc/codecs/wm8960.c
+++ b/sound/soc/codecs/wm8960.c
@@ -1340,6 +1340,17 @@ static int wm8960_set_dai_sysclk(struct snd_soc_dai *dai, int clk_id,
 	(SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 	SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 wm8960_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops wm8960_dai_ops = {
 	.hw_params = wm8960_hw_params,
 	.hw_free = wm8960_hw_free,
@@ -1349,6 +1360,8 @@ static const struct snd_soc_dai_ops wm8960_dai_ops = {
 	.set_pll = wm8960_set_dai_pll,
 	.set_sysclk = wm8960_set_dai_sysclk,
 	.no_capture_mute = 1,
+	.auto_selectable_formats = &wm8960_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver wm8960_dai = {
diff --git a/sound/soc/codecs/wm8961.c b/sound/soc/codecs/wm8961.c
index 504fc59e4be2a..55ccac7286c96 100644
--- a/sound/soc/codecs/wm8961.c
+++ b/sound/soc/codecs/wm8961.c
@@ -803,6 +803,22 @@ static int wm8961_set_bias_level(struct snd_soc_component *component,
 	(SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 	SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 wm8961_selectable_formats[] = {
+	/* 1st priority */
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF,
+	/* 2nd priority */
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF,
+};
+
 static const struct snd_soc_dai_ops wm8961_dai_ops = {
 	.hw_params = wm8961_hw_params,
 	.set_sysclk = wm8961_set_sysclk,
@@ -811,6 +827,8 @@ static const struct snd_soc_dai_ops wm8961_dai_ops = {
 	.set_tristate = wm8961_set_tristate,
 	.set_clkdiv = wm8961_set_clkdiv,
 	.no_capture_mute = 1,
+	.auto_selectable_formats	= wm8961_selectable_formats,
+	.num_auto_selectable_formats	= ARRAY_SIZE(wm8961_selectable_formats),
 };
 
 static struct snd_soc_dai_driver wm8961_dai = {
diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index 8a9598161b357..d77ff4daddf73 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -3056,6 +3056,17 @@ static int wm8962_mute(struct snd_soc_dai *dai, int mute, int direction)
 #define WM8962_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 wm8962_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops wm8962_dai_ops = {
 	.hw_params = wm8962_hw_params,
 	.set_sysclk = wm8962_set_dai_sysclk,
@@ -3063,6 +3074,8 @@ static const struct snd_soc_dai_ops wm8962_dai_ops = {
 	.set_tdm_slot = wm8962_set_tdm_slot,
 	.mute_stream = wm8962_mute,
 	.no_capture_mute = 1,
+	.auto_selectable_formats = &wm8962_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver wm8962_dai = {
diff --git a/sound/soc/codecs/wm8971.c b/sound/soc/codecs/wm8971.c
index a5d2e91b66bba..388ee05d45206 100644
--- a/sound/soc/codecs/wm8971.c
+++ b/sound/soc/codecs/wm8971.c
@@ -601,12 +601,25 @@ static int wm8971_set_bias_level(struct snd_soc_component *component,
 #define WM8971_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 	SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 wm8971_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops wm8971_dai_ops = {
 	.hw_params	= wm8971_pcm_hw_params,
 	.mute_stream	= wm8971_mute,
 	.set_fmt	= wm8971_set_dai_fmt,
 	.set_sysclk	= wm8971_set_dai_sysclk,
 	.no_capture_mute = 1,
+	.auto_selectable_formats	= &wm8971_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver wm8971_dai = {
diff --git a/sound/soc/codecs/wm8974.c b/sound/soc/codecs/wm8974.c
index 4656652b8e97c..b9e8c544912b0 100644
--- a/sound/soc/codecs/wm8974.c
+++ b/sound/soc/codecs/wm8974.c
@@ -623,6 +623,16 @@ static int wm8974_set_bias_level(struct snd_soc_component *component,
 #define WM8974_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 	SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 wm8974_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops wm8974_ops = {
 	.hw_params = wm8974_pcm_hw_params,
 	.mute_stream = wm8974_mute,
@@ -631,6 +641,8 @@ static const struct snd_soc_dai_ops wm8974_ops = {
 	.set_pll = wm8974_set_dai_pll,
 	.set_sysclk = wm8974_set_dai_sysclk,
 	.no_capture_mute = 1,
+	.auto_selectable_formats = &wm8974_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver wm8974_dai = {
diff --git a/sound/soc/codecs/wm8978.c b/sound/soc/codecs/wm8978.c
index ad8064bbaaac8..25cc433c7653d 100644
--- a/sound/soc/codecs/wm8978.c
+++ b/sound/soc/codecs/wm8978.c
@@ -892,6 +892,16 @@ static int wm8978_set_bias_level(struct snd_soc_component *component,
 #define WM8978_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 	SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 wm8978_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops wm8978_dai_ops = {
 	.hw_params	= wm8978_hw_params,
 	.mute_stream	= wm8978_mute,
@@ -899,6 +909,8 @@ static const struct snd_soc_dai_ops wm8978_dai_ops = {
 	.set_clkdiv	= wm8978_set_dai_clkdiv,
 	.set_sysclk	= wm8978_set_dai_sysclk,
 	.no_capture_mute = 1,
+	.auto_selectable_formats	= &wm8978_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 /* Also supports 12kHz */
diff --git a/sound/soc/codecs/wm8983.c b/sound/soc/codecs/wm8983.c
index fab25f35fd141..3366166a2b771 100644
--- a/sound/soc/codecs/wm8983.c
+++ b/sound/soc/codecs/wm8983.c
@@ -943,6 +943,16 @@ static int wm8983_probe(struct snd_soc_component *component)
 	return 0;
 }
 
+/* FIXME: it doesn't support DSP A/B for now */
+static const u64 wm8983_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops wm8983_dai_ops = {
 	.mute_stream = wm8983_dac_mute,
 	.hw_params = wm8983_hw_params,
@@ -950,6 +960,8 @@ static const struct snd_soc_dai_ops wm8983_dai_ops = {
 	.set_sysclk = wm8983_set_sysclk,
 	.set_pll = wm8983_set_pll,
 	.no_capture_mute = 1,
+	.auto_selectable_formats = &wm8983_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 #define WM8983_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
diff --git a/sound/soc/codecs/wm8985.c b/sound/soc/codecs/wm8985.c
index 2a64d5a851da8..77ca9a0feb8a4 100644
--- a/sound/soc/codecs/wm8985.c
+++ b/sound/soc/codecs/wm8985.c
@@ -1072,6 +1072,22 @@ static int wm8985_probe(struct snd_soc_component *component)
 	return ret;
 }
 
+static const u64 wm8985_selectable_formats[] = {
+	/* 1st priority */
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF,
+	/* 2nd priority */
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF,
+};
+
 static const struct snd_soc_dai_ops wm8985_dai_ops = {
 	.mute_stream = wm8985_dac_mute,
 	.hw_params = wm8985_hw_params,
@@ -1079,6 +1095,8 @@ static const struct snd_soc_dai_ops wm8985_dai_ops = {
 	.set_sysclk = wm8985_set_sysclk,
 	.set_pll = wm8985_set_pll,
 	.no_capture_mute = 1,
+	.auto_selectable_formats = wm8985_selectable_formats,
+	.num_auto_selectable_formats = ARRAY_SIZE(wm8985_selectable_formats),
 };
 
 #define WM8985_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
diff --git a/sound/soc/codecs/wm8988.c b/sound/soc/codecs/wm8988.c
index 741aecc7641a1..6f97c9aa453aa 100644
--- a/sound/soc/codecs/wm8988.c
+++ b/sound/soc/codecs/wm8988.c
@@ -762,6 +762,17 @@ static int wm8988_set_bias_level(struct snd_soc_component *component,
 #define WM8988_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 	SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 wm8988_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops wm8988_ops = {
 	.startup = wm8988_pcm_startup,
 	.hw_params = wm8988_pcm_hw_params,
@@ -769,6 +780,8 @@ static const struct snd_soc_dai_ops wm8988_ops = {
 	.set_sysclk = wm8988_set_dai_sysclk,
 	.mute_stream = wm8988_mute,
 	.no_capture_mute = 1,
+	.auto_selectable_formats = &wm8988_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver wm8988_dai = {
diff --git a/sound/soc/codecs/wm8990.c b/sound/soc/codecs/wm8990.c
index 11dfbbbdcd920..c8fef187f5401 100644
--- a/sound/soc/codecs/wm8990.c
+++ b/sound/soc/codecs/wm8990.c
@@ -1151,6 +1151,13 @@ static int wm8990_set_bias_level(struct snd_soc_component *component,
  * 1. ADC/DAC on Primary Interface
  * 2. ADC on Primary Interface/DAC on secondary
  */
+static const u64 wm8990_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
+
 static const struct snd_soc_dai_ops wm8990_dai_ops = {
 	.hw_params	= wm8990_hw_params,
 	.mute_stream	= wm8990_mute,
@@ -1159,6 +1166,8 @@ static const struct snd_soc_dai_ops wm8990_dai_ops = {
 	.set_pll	= wm8990_set_dai_pll,
 	.set_sysclk	= wm8990_set_dai_sysclk,
 	.no_capture_mute = 1,
+	.auto_selectable_formats	= &wm8990_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver wm8990_dai = {
diff --git a/sound/soc/codecs/wm8991.c b/sound/soc/codecs/wm8991.c
index 225c235d3d895..2cb7fb9962af5 100644
--- a/sound/soc/codecs/wm8991.c
+++ b/sound/soc/codecs/wm8991.c
@@ -1195,6 +1195,13 @@ static int wm8991_set_bias_level(struct snd_soc_component *component,
 #define WM8991_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 			SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 wm8991_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
+
 static const struct snd_soc_dai_ops wm8991_ops = {
 	.hw_params = wm8991_hw_params,
 	.mute_stream = wm8991_mute,
@@ -1202,6 +1209,8 @@ static const struct snd_soc_dai_ops wm8991_ops = {
 	.set_clkdiv = wm8991_set_dai_clkdiv,
 	.set_pll = wm8991_set_dai_pll,
 	.no_capture_mute = 1,
+	.auto_selectable_formats = &wm8991_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 /*
diff --git a/sound/soc/codecs/wm8993.c b/sound/soc/codecs/wm8993.c
index 2a94b23319b53..934fa41a53cfa 100644
--- a/sound/soc/codecs/wm8993.c
+++ b/sound/soc/codecs/wm8993.c
@@ -1441,6 +1441,22 @@ static irqreturn_t wm8993_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static const u64 wm8993_selectable_formats[] = {
+	/* 1st priority */
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF,
+	/* 2nd priority */
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF,
+};
+
 static const struct snd_soc_dai_ops wm8993_ops = {
 	.set_sysclk = wm8993_set_sysclk,
 	.set_fmt = wm8993_set_dai_fmt,
@@ -1449,6 +1465,8 @@ static const struct snd_soc_dai_ops wm8993_ops = {
 	.set_pll = wm8993_set_fll,
 	.set_tdm_slot = wm8993_set_tdm_slot,
 	.no_capture_mute = 1,
+	.auto_selectable_formats = wm8993_selectable_formats,
+	.num_auto_selectable_formats = ARRAY_SIZE(wm8993_selectable_formats),
 };
 
 #define WM8993_RATES SNDRV_PCM_RATE_8000_48000
diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index 8bf58a6a8af7c..97d8df3815ac7 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -3202,6 +3202,22 @@ static int wm8994_aif2_probe(struct snd_soc_dai *dai)
 #define WM8994_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 wm8994_selectable_formats[] = {
+	/* 1st priority */
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF,
+	/* 2nd priority */
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF,
+};
+
 static const struct snd_soc_dai_ops wm8994_aif1_dai_ops = {
 	.set_sysclk	= wm8994_set_dai_sysclk,
 	.set_fmt	= wm8994_set_dai_fmt,
@@ -3210,6 +3226,8 @@ static const struct snd_soc_dai_ops wm8994_aif1_dai_ops = {
 	.set_pll	= wm8994_set_fll,
 	.set_tristate	= wm8994_set_tristate,
 	.no_capture_mute = 1,
+	.auto_selectable_formats	= wm8994_selectable_formats,
+	.num_auto_selectable_formats	= ARRAY_SIZE(wm8994_selectable_formats),
 };
 
 static const struct snd_soc_dai_ops wm8994_aif2_dai_ops = {
@@ -3221,6 +3239,8 @@ static const struct snd_soc_dai_ops wm8994_aif2_dai_ops = {
 	.set_pll	= wm8994_set_fll,
 	.set_tristate	= wm8994_set_tristate,
 	.no_capture_mute = 1,
+	.auto_selectable_formats	= wm8994_selectable_formats,
+	.num_auto_selectable_formats	= ARRAY_SIZE(wm8994_selectable_formats),
 };
 
 static const struct snd_soc_dai_ops wm8994_aif3_dai_ops = {
diff --git a/sound/soc/codecs/wm8995.c b/sound/soc/codecs/wm8995.c
index 799989a5bf0f2..3933a419f1e2d 100644
--- a/sound/soc/codecs/wm8995.c
+++ b/sound/soc/codecs/wm8995.c
@@ -2091,6 +2091,22 @@ static int wm8995_probe(struct snd_soc_component *component)
 #define WM8995_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 wm8995_selectable_formats[] = {
+	/* 1st priority */
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF,
+	/* 2nd priority */
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF,
+};
+
 static const struct snd_soc_dai_ops wm8995_aif1_dai_ops = {
 	.set_sysclk = wm8995_set_dai_sysclk,
 	.set_fmt = wm8995_set_dai_fmt,
@@ -2099,6 +2115,8 @@ static const struct snd_soc_dai_ops wm8995_aif1_dai_ops = {
 	.set_pll = wm8995_set_fll,
 	.set_tristate = wm8995_set_tristate,
 	.no_capture_mute = 1,
+	.auto_selectable_formats = wm8995_selectable_formats,
+	.num_auto_selectable_formats = ARRAY_SIZE(wm8995_selectable_formats),
 };
 
 static const struct snd_soc_dai_ops wm8995_aif2_dai_ops = {
@@ -2109,6 +2127,8 @@ static const struct snd_soc_dai_ops wm8995_aif2_dai_ops = {
 	.set_pll = wm8995_set_fll,
 	.set_tristate = wm8995_set_tristate,
 	.no_capture_mute = 1,
+	.auto_selectable_formats = wm8995_selectable_formats,
+	.num_auto_selectable_formats = ARRAY_SIZE(wm8995_selectable_formats),
 };
 
 static const struct snd_soc_dai_ops wm8995_aif3_dai_ops = {
diff --git a/sound/soc/codecs/wm8996.c b/sound/soc/codecs/wm8996.c
index dface555f9288..25a6186e074a9 100644
--- a/sound/soc/codecs/wm8996.c
+++ b/sound/soc/codecs/wm8996.c
@@ -2703,10 +2703,22 @@ static const struct snd_soc_component_driver soc_component_dev_wm8996 = {
 			SNDRV_PCM_FMTBIT_S20_3LE | SNDRV_PCM_FMTBIT_S24_LE |\
 			SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 wm8996_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops wm8996_dai_ops = {
 	.set_fmt = wm8996_set_fmt,
 	.hw_params = wm8996_hw_params,
 	.set_sysclk = wm8996_set_sysclk,
+	.auto_selectable_formats = &wm8996_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver wm8996_dai[] = {
diff --git a/sound/soc/codecs/wm9081.c b/sound/soc/codecs/wm9081.c
index 2e4e0a76499d8..824e9c6b5f3e6 100644
--- a/sound/soc/codecs/wm9081.c
+++ b/sound/soc/codecs/wm9081.c
@@ -1230,12 +1230,30 @@ static int wm9081_set_tdm_slot(struct snd_soc_dai *dai,
 	(SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 	 SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 wm9081_selectable_formats[] = {
+	/* 1st priority */
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF,
+	/* 2nd priority */
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF,
+};
+
 static const struct snd_soc_dai_ops wm9081_dai_ops = {
 	.hw_params = wm9081_hw_params,
 	.set_fmt = wm9081_set_dai_fmt,
 	.mute_stream = wm9081_mute,
 	.set_tdm_slot = wm9081_set_tdm_slot,
 	.no_capture_mute = 1,
+	.auto_selectable_formats = wm9081_selectable_formats,
+	.num_auto_selectable_formats = ARRAY_SIZE(wm9081_selectable_formats),
 };
 
 /* We report two channels because the CODEC processes a stereo signal, even
diff --git a/sound/soc/codecs/wm9713.c b/sound/soc/codecs/wm9713.c
index 3ba7ca3c1770c..3cffdfbbf9dda 100644
--- a/sound/soc/codecs/wm9713.c
+++ b/sound/soc/codecs/wm9713.c
@@ -1067,6 +1067,17 @@ static int ac97_aux_prepare(struct snd_pcm_substream *substream,
 	(SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 	 SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 wm9713_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops wm9713_dai_ops_hifi = {
 	.prepare	= ac97_hifi_prepare,
 	.set_clkdiv	= wm9713_set_dai_clkdiv,
@@ -1085,6 +1096,8 @@ static const struct snd_soc_dai_ops wm9713_dai_ops_voice = {
 	.set_pll	= wm9713_set_dai_pll,
 	.set_fmt	= wm9713_set_dai_fmt,
 	.set_tristate	= wm9713_set_dai_tristate,
+	.auto_selectable_formats	= &wm9713_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver wm9713_dai[] = {
-- 
2.53.0

