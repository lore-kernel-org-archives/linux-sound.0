Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010011.outbound.protection.outlook.com [52.101.228.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFC02E0925
	for <linux-sound@vger.kernel.org>; Mon,  8 Jun 2026 01:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780881899; cv=fail; b=hwT76f/X79QNBqiFwt0lem5gL27SfJuvcaX2iZ7WHogf3TFJBhJEy2PZO4A0225aR5D//GF2v/TEYbVJ02/uNR+pzkSnIBXTsHrndrFHlvDmIJqEsWV+5waKkNhkCOCtRWkeqfeOA6SGeTJ7BNvyBqlWyFl4UPkDhAwmXcBKKIY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780881899; c=relaxed/simple;
	bh=32O47KH0SI2JyBwLsRkz7BSIZCZYdDATGrm+FVRj5Zw=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=jedMBcKNfz6sYaNxsjVs41aTZBNt2Jn5c1vmamfo6/RQntkv/d5GPuGOlZsW+LZZYSvgTxlJdFMtrfB3zv4MrdgCH4v3rlwoHlGXt4H+i+MJnzRkcPWQwOdJWKWEfLz9snbSpITSguIREinOMI1Y9O/syRO4e4QZgBHhd8VkJ9w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=BJpnBmQ+; arc=fail smtp.client-ip=52.101.228.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="BJpnBmQ+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HefGYTRC8Q6tME3RrgDvUZUPdiLb8zcoriIn1HFGXha43raoiPCqNl3LjOnBre2omRdeeU0FW8jnpSQ4Oto4KeNL/4Y/btyHxEqNmnuGz7a+cFkiT8fDJvtZJnW0yOa6sn6HyZ+Jwo360cWn++5tDviYShBxpUL7oeddIYOfJo3SvePALFO7I+4ayIWEsCU8e/xHrxtI0lKxwY+zJMaH+RNWg3lPA6RygOc8cZgUuMrIj3+FbkA5WF0UIr9FgqPZ2jAK6H6b1LldHVClw38gEM9jvc1XytF7PG3sZaIO8Ljs6OKychUKi+9sh+euYgftgoUiS6zEBtZbrF/tn1jMiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kt0icaescjDJ2jdL5q9NA6zvWO+/3SZ7i0/Q5z36Z4w=;
 b=fOTlO1JzqCNZxJg3tQhM7/bqXJik4DqqVK0zOXousONrkWnGmIdU+0c/OiBuQMxy/W6gSJ8ilvBHdGfTOk+gxoNavjt+iS54D5ObnwQiZU/2DezGhFc1niUmicASqdFoCvEAoG8+AmD8blOvLi4pMrp7U6cxcAiXycSIZzAxy/nBD+/bwxRMQyyx70oTfoGHkviBMmyeMC5xRuv9slc/jdtL1KlbWz1wB8BCjislQm5MFiR9YtNB4wPwaUHPbDV+cpzwGN//K9TRDLMrM0d59EQRvsz9oQOk4SzVa0LfiYPmc+YmdUIu0Clt2dtrC0/KXOfTQm7zglbcGmVpEYR0KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kt0icaescjDJ2jdL5q9NA6zvWO+/3SZ7i0/Q5z36Z4w=;
 b=BJpnBmQ++UaS+GxCgyQJAjdG2H9h2e29gECwmR7owFI5jMcMJ5xr2Nt1CKiTerMVO6GulPAAN9ygDjE7/Ez4W9JrKE3DbEQjBKqDaAQXEyCdv8498xtaBkwvugh2wyBCgnkjRMbStnlsRzYN0F+tJHMXn7JwjATtDcsbfc7TNOg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS7PR01MB16954.jpnprd01.prod.outlook.com (2603:1096:604:41e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 01:24:56 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 01:24:56 +0000
Message-ID: <87cxy1esd4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 4/6] ASoC: mediatek: mt8186-mt6366: tidyup mt8186_mt6366_card_set_be_link()
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Takashi Iwai <tiwai@suse.com>
In-Reply-To: <87ik7tesdw.wl-kuninori.morimoto.gx@renesas.com>
References: <87ik7tesdw.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 8 Jun 2026 01:24:55 +0000
X-ClientProxiedBy: TYCP286CA0183.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::12) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS7PR01MB16954:EE_
X-MS-Office365-Filtering-Correlation-Id: 75bcb6ae-5c5c-491b-3515-08dec4fcbf9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	w5TBYuxgZ+QJ7DKOJPrnnEU5iJLUfDJEBCUtPsazwWjRXpGg3F2EInaQ5f/1eH44enblI7WgLG6G61vjn4QRcqAy6OWCeAKa+sruxogeFvQq2ivj8GYCXJ4XiEffNLCkckn/ejfjHUHVu5bBtL95knuHKYG38888nBqw4ukR5wkUBrRRGghbnxGGXWJgAAvrRyRmvRhGuqHpTNBLc2JGpY2F4wR68XxB5rp9Ky4CeVBdJxWE11YjehlLweb3NLNlqAh/1lsYdfW9EWsv4nPs8b5ShAd/d0Ko5xcDU3hWlG9WntXYr/HfxzelM3GRrGu8QeVLjg7i6vJD2MGrYo9ZS262LhxTmkMaCf+LKINAUVoIsLahY3NuAUQNyCWXw3skn7cbYdV+EwcOiPsVQVSOkJzlBBjVQc0woqz5vMpWeum4pAFvtFJ3C4L51DBmrNMhhjNrnL91aot8X9N8ytBTfJzSRQt36fFLAhusMKOfOPYyMGavlssP/UkVrZDZtmjH4ytN2qjWRglSkH5njZ74deKGkmQT5HwQgoBrDRop2Nu7wx6lV0TVqJAz2jOcUh9faopsKomHp+qPttdNN3RUfBU2J2a2B8GPPAjKC/vHPAj7/tF9p5tCTTa/NejVwrWkjHckkDgH9K8N01x8PzEWUlExT3t2nhgfOzGrBA7At6UBGGdjwtYb97gO9ELlyya+6bSEi7UApSiKxJnNYYXC5M8ImbgR2VV4CBKJe+2p4wvEW6sHLJlydq8e5bFtl1ka
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K4hDWlnvI6ErTLQYeytSsIT89wLcBkNW3NpVy/7BEnsRegTU6Xlgr2GGobAN?=
 =?us-ascii?Q?PGcaagT/wlh/hCu8gr+xOeJP4hQDTeRGGvzdR0H9Ct1Ow+2r2BlwBhLeDUrV?=
 =?us-ascii?Q?B8EG247tPXbDRPAZEiZ3kANpAFH7+PEkB/4BFI/CnzEsMZ3FRQZT6rOTShyt?=
 =?us-ascii?Q?gimlrEYxz7I8iuRuC/MdN7nCbaLl/VyOXSpYqP7k4M3c/LxS+FfL+72wPBCl?=
 =?us-ascii?Q?U/znQQ8z7WL/2Hyoolbmf3NEWYNbBd1m9K1RrHb6ChVMekGGvpFZUxSBQ2lP?=
 =?us-ascii?Q?jXi45Sl1tKm/t4e4J18KkzNInQnD0lazeHsBs7Yu/mAWlDb21KasN1Q2OTih?=
 =?us-ascii?Q?IzU/UBlYS/MJNFypgrsXS7ZcFN3XMCWQW2SB6SI825lhZ5Xh6wm9VG7d87ZE?=
 =?us-ascii?Q?sY9J/iS6xRXTcajyAcpZ83XEzyPuzjZVy5RpwEx5aX+ig7xgCwh2y/dHnMpQ?=
 =?us-ascii?Q?G/2RQ8LBiwIyxepL7pg3AqcMhfC9k2hVF5YGaI119BJDd4kfEPad6wOTOrnN?=
 =?us-ascii?Q?LonIXvTx/1hPfRGV4LCWeWFqni7QnnBWPZboT1qArEMBWB/6i+BC20uBRhpK?=
 =?us-ascii?Q?MKXzljZgl3FAvBpTaqPv3XRp06BYFivUMAVk7f6i1a+XL9uLLhMcJs2zyeLQ?=
 =?us-ascii?Q?9TpeKZNat4XZKMw/8t37hVyy2Bdoi2lM/Zv970S1Xxv0aOmHCLwliknNu+Ds?=
 =?us-ascii?Q?55BIUlezrw5k98WEVTTIwRiPEVhqRGikYFtI2yV8WaeuFKVjMeAH83bFSRzA?=
 =?us-ascii?Q?fsBCdubDi34iV6Ei11XfJxPwd4oFuZvOLkOA2ALjtP/YMIHlnUaHx3iHn5iU?=
 =?us-ascii?Q?7UbJHpXUUwVxnl2Hs+OlCjkKh45eHIq/vYYs5PLpulQ1Y+BDxAc5g7Y6jUUv?=
 =?us-ascii?Q?oWloFdeb7m4TYchozqUVhZT8utsKojmRAvOpd2gyOUcgrQzYQzf8m+mH03kW?=
 =?us-ascii?Q?puaGJF6U+zWJvY8Seqv8NH8LcMSEWx14WljRTpcCA4/FheZgAU4fDwpwZ6ml?=
 =?us-ascii?Q?Co1oG6ThKcENPYbgUqMGi9+n47I6Y7mVcq8spnBbhm33qOOR2RIbxIkIuRCZ?=
 =?us-ascii?Q?aUy4kC/OeWjw2jabgwXkhLMNPQZQ9XOvSAWa6Z0S/fpK5m2F5QAflKVGWeOU?=
 =?us-ascii?Q?DjvTvwukeE1XbSlxKk3BqN2bufTSf/Da4M2jwB+I0cqF9rTzSye6UZkw+sPd?=
 =?us-ascii?Q?XRJ3IwwejUZcEvpHPTK0F9GgoimnSGoUh5aE9GoG9HyFKbhvL2hnLMcA5qd7?=
 =?us-ascii?Q?d6ClnFTdHlJi0SVYS/Za0Jgr9tkBCoOGS1oun+9hFcVpUcikOwIDZU8Z3gxP?=
 =?us-ascii?Q?hCD8X8VQUmRakImh3SUPLBs9f3a2+3fIHYn7cCOrsQjPMW+/sEsVOH8HDgBq?=
 =?us-ascii?Q?3oOujo4W3ylb/bCv+HfDe9AAwzcC1/zZxytT480eDMEBsZ1Aq3Jn7jZCa6yM?=
 =?us-ascii?Q?3mhO9rjW0j1l2sCMD5glL8pIqnR+NwT3qtWVsaRuXGP2kIcFxN8q5mi9ppGZ?=
 =?us-ascii?Q?Zm5Ni1AG0kFSznT/aI6yTx/8ECIeTvAnYfZc9jyakEDlVtEuw0CLHkvIZzqj?=
 =?us-ascii?Q?Z1lPKJW1UH+6MUelhrFBhN26Wzh4wnSz5oA6j4SUzAsaiugaa+VoJPOOA+MH?=
 =?us-ascii?Q?4IcRbrBrktwKFSesSEiOyMABZZRwiMwqpg8D0usLSxzKjjiu3Bh6oi+rGnnr?=
 =?us-ascii?Q?onaWADsp6ifStXay/5Fo9tr+mPuuxXSlussr6/Eh21K0agdzSHv78Al9+oH6?=
 =?us-ascii?Q?yh6FLlmA8oKi1cGQH3ywB0CuFLQ7sriKlVhIpejPjnli3OCBYufP?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75bcb6ae-5c5c-491b-3515-08dec4fcbf9f
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 01:24:56.0206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dYtIClgehiTsUfEmX18EfVIhr3TTN82DRSjnsMvVX7WWdlmrzhhog8IqkM3M0TzoN5Oms1ZXHjr4TYQCpeiszTGCqnGsNWa8UrbzL+SBHZMmC720io9Y2iere1FHxHnn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB16954

mt8186_mt6366_card_set_be_link() requests *card, but necessary is
card->dev. Tidyup it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/mediatek/mt8186/mt8186-mt6366-common.c | 6 +++---
 sound/soc/mediatek/mt8186/mt8186-mt6366-common.h | 2 +-
 sound/soc/mediatek/mt8186/mt8186-mt6366.c        | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-common.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-common.c
index e325d216c0089..5a34d3f7fa589 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366-common.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-common.c
@@ -39,7 +39,7 @@ int mt8186_mt6366_init(struct snd_soc_pcm_runtime *rtd)
 }
 EXPORT_SYMBOL_GPL(mt8186_mt6366_init);
 
-int mt8186_mt6366_card_set_be_link(struct snd_soc_card *card,
+int mt8186_mt6366_card_set_be_link(struct device *dev,
 				   struct snd_soc_dai_link *link,
 				   struct device_node *node,
 				   char *link_name)
@@ -47,9 +47,9 @@ int mt8186_mt6366_card_set_be_link(struct snd_soc_card *card,
 	int ret;
 
 	if (node && strcmp(link->name, link_name) == 0) {
-		ret = snd_soc_of_get_dai_link_codecs(card->dev, node, link);
+		ret = snd_soc_of_get_dai_link_codecs(dev, node, link);
 		if (ret < 0)
-			return dev_err_probe(card->dev, ret, "get dai link codecs fail\n");
+			return dev_err_probe(dev, ret, "get dai link codecs fail\n");
 	}
 
 	return 0;
diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-common.h b/sound/soc/mediatek/mt8186/mt8186-mt6366-common.h
index 907d8f5e46b1b..2094e786c623e 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366-common.h
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-common.h
@@ -10,7 +10,7 @@
 #define _MT8186_MT6366_COMMON_H_
 
 int mt8186_mt6366_init(struct snd_soc_pcm_runtime *rtd);
-int mt8186_mt6366_card_set_be_link(struct snd_soc_card *card,
+int mt8186_mt6366_card_set_be_link(struct device *dev,
 				   struct snd_soc_dai_link *link,
 				   struct device_node *node,
 				   char *link_name);
diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366.c b/sound/soc/mediatek/mt8186/mt8186-mt6366.c
index 2c3033f305eaf..3fc93a8ad408e 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366.c
@@ -1178,21 +1178,21 @@ static int mt8186_mt6366_legacy_probe(struct mtk_soc_card_data *soc_card_data)
 	}
 
 	for_each_card_prelinks(card, i, dai_link) {
-		ret = mt8186_mt6366_card_set_be_link(card, dai_link, playback_codec, "I2S3");
+		ret = mt8186_mt6366_card_set_be_link(dev, dai_link, playback_codec, "I2S3");
 		if (ret) {
 			dev_err_probe(dev, ret, "%s set playback_codec fail\n",
 				      dai_link->name);
 			break;
 		}
 
-		ret = mt8186_mt6366_card_set_be_link(card, dai_link, headset_codec, "I2S0");
+		ret = mt8186_mt6366_card_set_be_link(dev, dai_link, headset_codec, "I2S0");
 		if (ret) {
 			dev_err_probe(dev, ret, "%s set headset_codec fail\n",
 				      dai_link->name);
 			break;
 		}
 
-		ret = mt8186_mt6366_card_set_be_link(card, dai_link, headset_codec, "I2S1");
+		ret = mt8186_mt6366_card_set_be_link(dev, dai_link, headset_codec, "I2S1");
 		if (ret) {
 			dev_err_probe(dev, ret, "%s set headset_codec fail\n",
 				      dai_link->name);
-- 
2.53.0

