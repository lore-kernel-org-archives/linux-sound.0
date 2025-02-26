Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011005.outbound.protection.outlook.com [40.107.74.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F2525FA23
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 23:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740612658; cv=fail; b=If+PWdV6liqAJKHF4klMrV/EiEG5Yb0s2pbicMg1FpQADeMh9D4Hy6KBqkl/XEictwpT/lZv8l0FrkySyvZLTsVQYVb5DPX2lmCmCJujEJpAA4P9tAbqcRYIzyVlWf8qUyaQPzAEBuwC+ekqvpldAjrOpRdl/Xnme6WzssqOzkg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740612658; c=relaxed/simple;
	bh=dv/PKhvhObDsuhYjgUqBSAMTfG7z6EaNB+Kl9Jufw5k=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Z+RehOrMGVXu5sngKUzc+q4AfsBEqeACXoOxbKSTy26ZxNFJS7OMOh2peMFPvgQ+Sr0039w1nXzLVqkg0UYMN2CyMt7j9oDQRvrvcXYxbfO5y6GgEDpa3CmvujfUNBHID14DmfHZPRfSReIv+2mZg5R/zxR04JSqUkTyfo3oo4k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=CM5FfdGd; arc=fail smtp.client-ip=40.107.74.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="CM5FfdGd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C+HiamzDYvc/Tcp0yrh4BcR+qjsrvLP0xj8+kjMHq5imDl6pYNjn533BEtYgd4as0B4Sg6ePqTuE/7iFq01nKby1JDPACGDET6Z8Dag9PJCEeV8Tg6pE7YdpcbZiO4+Wq292ONsUJZPSdNwwUel8eIeAsSEjBVA3QyaRdsTNlwtbiWlDZuOBXUN7zlnRFB20VyiHAFYtDTIdCDuur5gCSCdjmR7dTLyhqVcoVifbAqbRYRxmd9IPbU9Zl5w52MO8WxHiMB0J02rXFAcLv8zRZYq13+ofl66fUkhvTnGC438n7wNvK5dkuPnWS7qJnMM4anH7KCwM6H6uWY8mdr+93A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/qyOTGaKxbR9fGJohqcDj3axmOswyYNX0vz9S1noWPw=;
 b=PTxBf8mW6CVfXMWRBkUi2RAu9Gx7etFociFNQOvWP1TQwooS2PuSXl+X8sEfV82Fk4bJcenLjhuaJ5uYB+UNjMZAodN+f1iYd4TdT4dxJ2lQQjEP80vGWdcv7qPh2YvZ5x5gaiD6LEUR0rOWrrUylbbo9I29VDnyJuDPIAb+tUUBvUVw8M73q/pB6DV3mO86Knm4O6kmZWUTHPeFBmKpgBLzmH9XegixjH3lfHpFBQuUHUTHRt1mrzjWTCZMViekDioze69M1O8c3gcDUymnuDwAz6EeXmmKCOrFwUVgofYnr5hgu0JAiuh9y97rNloRYoZ5FPwJE2nodMGcjv/Xfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/qyOTGaKxbR9fGJohqcDj3axmOswyYNX0vz9S1noWPw=;
 b=CM5FfdGdcBlpTZ8wxVdsbCVE/5Y55IQ/Vt8oLR7mY+VzenvLgVKauAGo3Lg952t1Du4Hf7ZoPsZgn4nK63NAlMNB2Ex+dRok9YOmS4v/N3EZdMIlmBrbcwNhNikqMfp1oBdXUIivEK4L7RtjXflecl2QgRdOPMBJAO840xULVnw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB12895.jpnprd01.prod.outlook.com
 (2603:1096:405:1ba::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Wed, 26 Feb
 2025 23:30:55 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 23:30:55 +0000
Message-ID: <878qpsqo5t.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 2/2] ASoC: simple-card-utils: fixup dlc->xxx handling for error case
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87bjuoqo6c.wl-kuninori.morimoto.gx@renesas.com>
References: <87bjuoqo6c.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 23:30:54 +0000
X-ClientProxiedBy: TYCP286CA0171.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB12895:EE_
X-MS-Office365-Filtering-Correlation-Id: 67d1e4e9-04e7-437f-6994-08dd56bd9d8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GxY0Ldz9qacpq4DAWAupEHyVL2z+feK4XguA7Uoyx7OVKqPWFOZTzT/YW89M?=
 =?us-ascii?Q?NCahpsj5pvKADHfdcjPPpvosjWN+FfpiZvsB2ApCTsFyz8PrPfqlN6iJsWd6?=
 =?us-ascii?Q?K7+EruwuZiusqxkqxA+tmkpYU0PKbRi+cVxMjx1oiPnOP/mp7YEDK1jOa2rv?=
 =?us-ascii?Q?Obadbb6gHsbPKRMDCDewNHnKn+Otnxs5d/ZiM8mSmKWPD5Tb5+3pR1SjgaXY?=
 =?us-ascii?Q?USiZkgzxbEJ54HSnXhoVtGvUNrwsLHRckh34EtXMRhaBkAJCS5CbPt3jnT7F?=
 =?us-ascii?Q?y/kijigiPe3V5spceh99C7kbEFgg8wcTR8qNwp1+LOvxz1YgRltUyA2PN2u5?=
 =?us-ascii?Q?IKbcw4wW70YKLxQxXi5mk7ExVIgDu3JJkFHCVquQ6IAwH3GOrvgZJaEFVovy?=
 =?us-ascii?Q?1GvpTco6XR6vkihbrsHugvhKcjrZ+J0iEmkxuoKz7Q/zHbTf+sreTN1qd0hM?=
 =?us-ascii?Q?DYqADOy2SgDf8wcRKOx/K0bHb1qSvwpY0qJDBVWIRLfVq7lLIQeLR+QJJ03i?=
 =?us-ascii?Q?FERUEZ8dgsedyfWs3AKObIdguRBA5PmnugAcnOfdqxkDq/s2FQMtML4tnu3A?=
 =?us-ascii?Q?ShJesAK9Kaga0j+Hi3EhmTrw0i+lRJFxOxsUorolmMyONz1AmblTyTUQ+TH5?=
 =?us-ascii?Q?vQeurQO8kx3bmYxF4QLpEJqJ9auP1f2CfqJByoq4qzyKa0a/0gD3BwT95vtD?=
 =?us-ascii?Q?mXVqqut8W/71gsTdvUsYluVnzytNOJVJWnNUBg3rNOnbOkZl6ihrItolgaoh?=
 =?us-ascii?Q?TrRj77TE/EEUl/e7VpL2gSlNCHNupQWB9GYeVpC3HZ/HrrIxQP3cLFmu3u92?=
 =?us-ascii?Q?4L51+pZGLnTl9TMeKNMPy/jl4uPeGeqCUrMtPit6KOmvLRzBSkqGZLH05eLn?=
 =?us-ascii?Q?IP5d4Za524VbMgPcmJikV9buFTS1g8nVLrfyT7YIRqU2aVix1dwnRKfZFhyw?=
 =?us-ascii?Q?0kkns7o6SNu2o50pEXg/yVQmELn0B9+mgQqNUWYZVEKBC5VdWVi/YQzlUYju?=
 =?us-ascii?Q?6GagY4Tf5ZhVBOaGBk5qxi2WjvVaSPhtMYeQ5cSv9raWxHwvQorz6l1+u5V8?=
 =?us-ascii?Q?A493CWhoF4Jkt8JIerFPv6XpZMuVCOSNGxsqQTyqExAKcJKdX+wEEgGWoax5?=
 =?us-ascii?Q?aXE1WuZREWtUq+ZUrshWhV5n8g9LO6q3dZJNU06wGm9RyRMUx7ESJvpATjmN?=
 =?us-ascii?Q?hmW0xwE0DDGSQQUTd6SAQwcOMncAR5aST1gF2L/xb6U3102I2EViY0msxaiO?=
 =?us-ascii?Q?23Y6z8/kQgeYZpNlcENIYiiVZHGGpXd4qXEgwZ6AtfkB0RHuU0epCDESzOWK?=
 =?us-ascii?Q?v6Ahs2TLrcqjD6CYdrYLqfooujLBu5u+0TNhm/AV8wPVE4tL5hFhFTNYFmdK?=
 =?us-ascii?Q?JrsP9FlPwgxXVYjL4E2xEPCZZJ4eyPtsDxPWjh3MN6dxT0y8HUyMRoR4YCWh?=
 =?us-ascii?Q?z3iORjQsJRzi0gSnCVa9vZEkmw8srLaB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2QqsOA5Fd9HCRRj+ckcRo2LrJqzSZszN+8q9HLnw/X6HXlV96h80ZFYXkV+R?=
 =?us-ascii?Q?Ragli6B9iq0nuwKsF6Gmz+gdvmhwbXwl8ndExsx3F5nGWJPid0sLbzNYvQ1c?=
 =?us-ascii?Q?lYwgFf/4gCA5kJgffqWjpHyCNE5oQBmtnHaUeweTlNbWdAewdp9D5ZWuqobY?=
 =?us-ascii?Q?taeGB+qy281hAnQKpjwbU8AAk+lpEUStYGnleyHHVxMuyKxdkH3TmEBLEyJS?=
 =?us-ascii?Q?WIZhKjZsfrK0t6/W6Q/RS/iCOLGLAWjEVuG8/ZOzMPI2EXfaE+54PKiEmUIA?=
 =?us-ascii?Q?mgsO6kcWrqBlNNTvNYL9r3wZBMz9a0DDHJADwEvn3ONt+c7s9IbHBbhRAkEA?=
 =?us-ascii?Q?tEXBtGk3S8AyHjWPZwK7WfiLywPHTNp2TODt9gtb+qjjilWuGigZ+mTxIgvn?=
 =?us-ascii?Q?r1PhH2BmwlB59Xxhjl+ftkJS18PBMocNY8uJILZ17kbtrSAIO/SdiMeqTrBu?=
 =?us-ascii?Q?kvX97JElvPtsrZZ+Z7jygL6t6tQBEsVe4sZeoCpXoYU/WeRUlvUUMCS79rE4?=
 =?us-ascii?Q?9crc/IHCHRWWmfQGI6OQlh6IuTT7+R6FmLXHURyIbXCGjba51oAtNuukdSJr?=
 =?us-ascii?Q?JmYVfr7USuqMazTl4GLkTseDAKffbCSqKesHxze7RaG3o6cNebCE6XJEGzWk?=
 =?us-ascii?Q?hKyifFfKTl+m4zf/D4gd8Btr+50jphP1MftPopJNvCWm6HmMjWZ8SweO9S/W?=
 =?us-ascii?Q?fE98PPP8LAR/VpfzZpZr+Dc6qmWrIlDqeRrSsMTCndY3I6iGtyHwJuVhYdmX?=
 =?us-ascii?Q?1O9Gtiz7wNPSi3vy41Ur+VXM4HPxrBZmy6sQKcyL6cFINQLxF8Oz4EI6mQdC?=
 =?us-ascii?Q?exkL2wpIKXHPJsHojNVFFLiuWGb8FScEiYsKN5zL4X6xKMhIYYtEy/x6sSjR?=
 =?us-ascii?Q?nsQiEQrrrM7szjN1E4iyNRMny+BoEIOyGIoVNXKCJ5J7GVtZ+vOphrtLKqze?=
 =?us-ascii?Q?002ijx78rRgc4vLAcMdHebPdsDbgxSE1lZ0b0y5b04VSGtpOQ1DybiORIR2F?=
 =?us-ascii?Q?/RuGTcoo9SEqmOYpdQ7ualLm01mXrW41Xp2kBpqLmnu68kWih9z4fnrpO1d2?=
 =?us-ascii?Q?K6cpei9xHSYoV+t2qJCStIEwUh227qVrQmoUdiZERXes3/6YpsNqy2r1wWLt?=
 =?us-ascii?Q?2WmvsFOXNJV6513BqoaEFJ0FbFs2/Ki0n8ueCKfxmS2Or2No63Tmk7YPtL2a?=
 =?us-ascii?Q?212ZlpCXHVwupEO0mN9V3Wm+2yOAqehIo8uT5DH5XoEKF0iqEbVgNgISjQiU?=
 =?us-ascii?Q?i3rNWDwBAa0Yw4mjPKz1t5p3iJcKxumNocmMoL/7e3e1dTu9UJYEXM+7Qr3l?=
 =?us-ascii?Q?gmVVXuSS2szBwuDGRAISIxYs0I8LwpN3mJw+TrEJeQDaCVvs+PVNi+6B6wBJ?=
 =?us-ascii?Q?B3aC0KsONrTWYxtRlodFGq0VltwW3VU2GNT4KC0wWy5OE0hWXAb0JwQfuAOR?=
 =?us-ascii?Q?NkACtZlLABWLyC6yd6Hfstx9SUNK/nvcDPLO8hXTY3ZVH2vt36R+FfhohT1u?=
 =?us-ascii?Q?XBArMWmI/f8YcQ9MlwdKPug5mjGrs2cdCCS/ZVJJb3lougRbZFdjttIL/Fa8?=
 =?us-ascii?Q?5vXooWLCbyznY9LK3KZ0dh10Oj6GZNqTg7AdcSCVCmgXP/kt5ZRVqv+uH2kQ?=
 =?us-ascii?Q?p/gIBvFFzMiDrIrN2M/WytM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67d1e4e9-04e7-437f-6994-08dd56bd9d8b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 23:30:54.9730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WNdJtJNTV01Zmw6uW+tDEvWohX1p+iC6sQmZ7n2AF+FVeSWc4kZvXFoC9nuSZGpqMJN7uimWBm0ONkoUa/0/AODyp0+LT+MKXF6EsF1IC8qk3mY2Efq64a6ZA08oqsux
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12895

Current graph_util_parse_dai() has 2 issue for dlc->xxx handling.

1) dlc->xxx might be filled if snd_soc_get_dai_via_args() (A) works.
   In such case it will fill dlc->xxx first (B), and detect error
   after that (C). We need to fill dlc->xxx in success case only.

(A)	dai = snd_soc_get_dai_via_args(&args);
	if (dai) {
		ret = -ENOMEM;
 ^		dlc->of_node  = ...
(B)		dlc->dai_name = ...
 v		dlc->dai_args = ...
(C)		if (!dlc->dai_args)
			goto end;
		...
	}

2) graph_util_parse_dai() itself has 2 patterns (X)(Y) to fill dlc->xxx.
   Both case, we need to call of_node_put(node) in error case, but we
   are calling it only in (Y) case.

	int graph_util_parse_dai(...)
	{
		...
		dai = snd_soc_get_dai_via_args(&args);
		if (dai) {
			...
 ^			dlc->of_node  = ...
(X)			dlc->dai_name = ...
 v			dlc->dai_args = ...
			...
		}
		...
(Y)		ret = snd_soc_get_dlc(&args, dlc);
		if (ret < 0) {
			of_node_put(node);
			...
		}
		...
	}

This patch fixup both case. Make it easy to understand, update
lavel "end" to "err", too.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/simple-card-utils.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 79fdd57a470c..692bafca55af 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -1119,12 +1119,16 @@ int graph_util_parse_dai(struct simple_util_priv *priv, struct device_node *ep,
 	args.np = ep;
 	dai = snd_soc_get_dai_via_args(&args);
 	if (dai) {
+		const char *dai_name = snd_soc_dai_name_get(dai);
+		const struct of_phandle_args *dai_args = snd_soc_copy_dai_args(dev, &args);
+
 		ret = -ENOMEM;
+		if (!dai_args)
+			goto err;
+
 		dlc->of_node  = node;
-		dlc->dai_name = snd_soc_dai_name_get(dai);
-		dlc->dai_args = snd_soc_copy_dai_args(dev, &args);
-		if (!dlc->dai_args)
-			goto end;
+		dlc->dai_name = dai_name;
+		dlc->dai_args = dai_args;
 
 		goto parse_dai_end;
 	}
@@ -1154,16 +1158,17 @@ int graph_util_parse_dai(struct simple_util_priv *priv, struct device_node *ep,
 	 *    if he unbinded CPU or Codec.
 	 */
 	ret = snd_soc_get_dlc(&args, dlc);
-	if (ret < 0) {
-		of_node_put(node);
-		goto end;
-	}
+	if (ret < 0)
+		goto err;
 
 parse_dai_end:
 	if (is_single_link)
 		*is_single_link = of_graph_get_endpoint_count(node) == 1;
 	ret = 0;
-end:
+err:
+	if (ret < 0)
+		of_node_put(node);
+
 	return simple_ret(priv, ret);
 }
 EXPORT_SYMBOL_GPL(graph_util_parse_dai);
-- 
2.43.0

