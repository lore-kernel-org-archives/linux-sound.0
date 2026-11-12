Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794443558;
	b=CoczgXMz7bnehVKW3RmZPmIFo2BeS2U3f7a8L74b+gJOmWWtB6/vL+XpI4qmd0VpQCpI
	 W7hzw78EBWuIGur1M7AF7a86T2zKipK58vGIks2Kqq9ijcD4t9YNAdKXPY7Id+My8Dbuz
	 cgdPD/qRTP5GPwQWjp85Mmc0ICgRARGb1ii3qZ8CHxLgo0SX1bKprYXuCTJyY5H2QKE4s
	 TbkYkWNHSafmh+hHNrwBXKoMioktpxciYsxxfCevnwGjYrYIIn6laJK+jxWTIk74B21Ph
	 N/gps+gYxuNmGfLOQD6vUU9FA6gnxlmoRp/B9hE3f7wXO+9b3RwHi3vM6fN3bGkuo0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794443558;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:From:
	 Subject:User-Agent:To:Cc:In-Reply-To:References:Content-Type:Date:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=KSlrYBRCcbEYd818prPFUp/k3IfqeIvjis3tW7uVg5E=;
	b=bRUtYrcT8rak72oLoR6DHzHK3XdmwvmJ3VUkKzE03W/9tJMKUTJ9iTM0HAaxPbQsOHIW
	 qSET7lzSqGjj3woMiuBQRcpLfQ8OstMUCocl95XamHJcpoLtEV+DukZfxnRsan01EQkAe
	 1F8khc6BmO1L5pRhGqwyM9OnZ6fwKuYZmxThNklWAdtQoikvArqyzHbQOKukYx//WHsJb
	 h25pShWLbJqeXlNXGQY5F0hT5rPWCcFod38thA/2k2T5TW1yTgcESKKrkRC6p9cWOsgWt
	 0rFrM8w6kqrbZGjuEK6dLRnUW7kd+S2ct7UNO3c58loCwUAXvtPqvQAka2H5c57KIpA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=eUp7oW7D;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.14
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011014.outbound.protection.outlook.com [52.101.125.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA74F606A327
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 00:32:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA74F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=eUp7oW7D
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VOf5PtSWV7QzjyJvRoRN2oHz04jl83cjaZOf69jVxFBGvebeI3DHQzj7r3PPbHQjlgUZVF4riwx34C7e8Z7T32DYYlEjwVCjzl2uti3jlGXULm/ZzepqaQyL5jI/Gr/4/5WXtgZ+6Ogn3hbZtYjiY833CmCwBYC08yEDdlVw/ptUmbIWwG8k6rjedRu4zsTo0/gvv9CnlNze2FQsYV9NpoNi56OaRoy0r1BW8CfcjqdXrcCsDf0lfkiImGcNCy1UO3bvyMuURKyjJR2PaPWhfHLHVE97I4c2CyitPKbnMp2RUgtPTdbOY3M0c1WBkca1LXGaXupjKdAqNp51pm39YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KSlrYBRCcbEYd818prPFUp/k3IfqeIvjis3tW7uVg5E=;
 b=iqykBbHxbHUkp5zXftWnLb7xRHj1CAT9elvgNH/Qyylc26Qv/qD+sRlQgNuIl+q52Dx/GvP8dH/1S7bsFnBpbHAAdblo1exkVIUNUPFM5TEQVeZmX390wuDwkzWwvE/5xeiW7oMkSy3nMyQwMn+ETxPEoH/eKhmtNN4roKO/AZ6E7oGw3/kBwB0/trcxBJORQVJtRqprIUHBDbAXyC/wDoLckNBWe9rHk7+r+gAqN/BWHOYzwTcwYhifS1RW+vLZL5OXd7+e1Zjvx8Ubq0bcFDAaA7CKt4V5pItSWGglm+EU/q8UItRh2lEuwKUHV6jTnx+FTr6ouWd78Sbp1nGxRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KSlrYBRCcbEYd818prPFUp/k3IfqeIvjis3tW7uVg5E=;
 b=eUp7oW7DYkBx59sa7ZbsxNYP9Kw8CY1nMFeGFSitd6hpDDnp+B8ba2oMTNPntwFBC90G73DT3HnVGpZwmiZKGOTJCA8Ho0caN579+7a2pYtp06/IDSBW41qaHNlU93NM228ogkZ9dTZOMsqTz4sHPhyI5ByMavrXi217dQW4Q1U=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by TYCPR01MB6867.jpnprd01.prod.outlook.com (2603:1096:400:b6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 00:32:36 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%6]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 00:32:35 +0000
Message-ID: <87ld6y28kc.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 10/27] ASoC: soc-core: remove snd_soc_unregister_component_by_driver()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
In-Reply-To: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
References: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 12 Nov 2026 00:32:35 +0000
X-ClientProxiedBy: TYCP301CA0005.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::8) To TYYPR01MB15175.jpnprd01.prod.outlook.com
 (2603:1096:405:27d::8)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB15175:EE_|TYCPR01MB6867:EE_
X-MS-Office365-Filtering-Correlation-Id: 29fc14da-b672-425f-a640-08df405472b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|18002099003|22082099003|261009223027099003|11063799006|56012099006|261102130727099003|261028144727099003|261102123227099003|261026121527099003|261026140227099003|261022105027099003|261021121427099003|261021123027099003|38350700014|10067099003;
X-Microsoft-Antispam-Message-Info:
	M0meSMgyiU7X9heF7uQhom1LXRm5hwZm7kw7iwDEc+oY0aTGXMbfuOMcqbJ/UCI/W19XFlawF/57lJT0Hyeon5XAfFecszvX8HmdsJX9Gh+EyfHl+pGk1YKEZStKichEXw2XVGJ0AgJMRrJDkpQIFsKNZxjN8tOB72ZGX4GBtNJjM6AlOBPoZtJz2jNXjgRzrk1h4238Cc3yF5nkw3CL4XC1BTBoyltZOE/axpAmRYYbzwfyQt4BKRz2yIQ6ddMZaKE9eLHoFYn5HJcgxpLIBd3ehpzh5TZ+rVETlUmBj/AmiGpaV8fNs4nrUeaWzlQPHaGs34Omwl3gT48XCwsr2p5a0a8CJrOSl3j0urAFqTc3FeaJTvgfvCfg3OQj0/ePuKXIbv0au4WvMiCHZc6iSVpZFkrfBEkjNmchTlIEOdVq5xj+muxAJvhyiUrtv20IV5z6Gdi9vzGbM4BDu6mcCYrJ8/PrsvAZVjJqEGk2Wf38xo72Phda/Fkd8IlwiPVlZZKqeFMTCSTKErwqDYdWeYlQ7TaSdgPK2IJxkQjDK0LML65wENEvLWOFY15v0i6wImWuvB1CDyC9ZO43+dvLkQL4uhqKnSwmkBCkcQ7Mr3C444TL/8u2TjtJ1nzxExwqaXyk/BaLjj2jrf5Dly7cuAODeUC44AQf0FNUZJ0HxjVFHX7VdT6ifw9wSJqT2S4dpOLhzrCVrC6Fg8rjYhr8wa6deV1bCXHd4ftdIkBZ9J4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(18002099003)(22082099003)(261009223027099003)(11063799006)(56012099006)(261102130727099003)(261028144727099003)(261102123227099003)(261026121527099003)(261026140227099003)(261022105027099003)(261021121427099003)(261021123027099003)(38350700014)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ItBDM1PTpY7DPnA3ALKSXPcs3TJ99wsikp7obAxcWL5putAKd1TXh6j/7ZKU?=
 =?us-ascii?Q?e/InHKvcdJn1gXxpLSFlhvSSi3YeeC0k+SoWil33ftechmgmauMdBo4ypCCn?=
 =?us-ascii?Q?3rWzPT8EXHvx6Hdi48XQVOOJF1Fqa+TjOPN/11DnySP9YVKVcvYU9NcP75Dd?=
 =?us-ascii?Q?Erz05srjudtGvs8YLmUQqwsp4DL6uGLSMEv4veffkly6G8epqWTftUIHw3Pm?=
 =?us-ascii?Q?orM8Ut9D8KVxzCGGfGY/nEZK1Fe3Qae5So5iP8Mb0uu9IIStbgqXcG744vEU?=
 =?us-ascii?Q?vpaYX7XZdBYBeOydZrigtZJhSCB9r6Idarzow73UR6BDmiD1hMofpM95K8W1?=
 =?us-ascii?Q?Uy3FcUipHipsG7MPRfGBUR1bXwm6QAM8BTLbQmMRDZNAanjLswvbNjIGtL5R?=
 =?us-ascii?Q?Cx7dSr+SGs49o8YasLpRCyjG5DH/Iyc2fxVrgxwlbZnWnlyeYA6pmP40bO8C?=
 =?us-ascii?Q?9XDexdJFGggpAyAnSMzWTveN+ll5kuBBr/xCUKJvcy381IHRFO4RSATcN8nb?=
 =?us-ascii?Q?9mUi/mDrzELc/bpVMkcGKjpld5co6ksRQN3dEEAOGUo5P8xxRHWkaado0GU4?=
 =?us-ascii?Q?TsL4uRE98mZaO+XO8LbKX66NRlJTqf+FhYOwe6aYOWlGNmYLVtbBkiUeJ7o/?=
 =?us-ascii?Q?0ZQIlXhoDyvhMVpoR+jEIsIsZvN/ElgLn9uthKemvMRDdK7+oHBz+8v46SB/?=
 =?us-ascii?Q?wARl0ZymHfx6Sg0G5vHf5DsfImaQ6JvrbSqUVHFRzyfc6gR4kfyohBANEAWm?=
 =?us-ascii?Q?iz+aJ/Fbxztf/CHdHfq1Zj7A8VK0F6e10dS7057TwAxYvdjq/BcUU7gcMH2V?=
 =?us-ascii?Q?TlzsD9FMzNS1iN2H+EpjnTwFVbwmJ+iN0juAE1KlNiXly88dfu64bqj+FkAQ?=
 =?us-ascii?Q?8YD8Vf5kjiBT5QF1bor+qUzZ4oFZz21fWeqZfIg31M4rifoOVp7ZUpktE6G2?=
 =?us-ascii?Q?OZfVvSwcpmMl8ltQOow91Mf5F7Xk+A2/FCQsjsh2scb+WZ2M4KLAHIsMR/N6?=
 =?us-ascii?Q?blN7YiIkMzLBTwabSlbpqxHYNALRozDRJGLpaU9vJD8eucfoDERfWqMMt7kh?=
 =?us-ascii?Q?/fVkfZwmsgx0BDPoRn8SWRHoZhR8CcbekSXQ2/RnfbHoht0xnpmNF+55zt5R?=
 =?us-ascii?Q?zJjxJbhFLtlNFpSpBUGyxWuRiz5rI3wPisTy0tJi3O2NiLirfrJxq/EyI5aT?=
 =?us-ascii?Q?YcUP5YfqPP69FJwA9Cer9Zz/N1L3lI6/2TD9hbJG925Ce/XRTIDyOQyiIAC4?=
 =?us-ascii?Q?+c68iHN/SRKFkz3QA91hxjFFH/5DF7c9Zfcjwoc9np/fKYUMUv3i9GlWlWwe?=
 =?us-ascii?Q?vJ5/N7t8KSaZOujsTt86bjypHLTgELQZ+y/K9N0hPBUPxQHKbLfnuCsBw01J?=
 =?us-ascii?Q?Cu7b1GLxib7fC6N1fT6JsP9nMxmxiD8KGS1QXCjK1vvOvYXTtHsHCZ6qmldL?=
 =?us-ascii?Q?diYOcOVSDaUMKF2F5+fn829czKXeBTVAt1ptWBNuKw8QVrE/J3s9EYpS0Wig?=
 =?us-ascii?Q?3uKvtNqiJcP+ORYs1U2yJujN/ZeaG8WrVWHHB5wbVbDWFfMvA+kXgyj7xLV5?=
 =?us-ascii?Q?f0R+6Jr+uJ9/ld3bXn1stQdu4va30XcHkhF1V/OA6pqsfRQ9wPfxEXsdRn/t?=
 =?us-ascii?Q?tCvy4mwHMk92C2ltcMayfqF8C6q/jMhy4wa6fr/KeASXR/tSSQN1JKMgLVKx?=
 =?us-ascii?Q?NSR92ViU/3mpvlTk3WY331WFL9q30EaPomv2ERIZl8kcTFZBP3ElsPzNc+qR?=
 =?us-ascii?Q?PZ6D49rQIGyqzh0kIFYP3Sf3cp4mG00z4LRqDAiKEiwxqMoaIFfp?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29fc14da-b672-425f-a640-08df405472b3
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 00:32:35.7775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nXHy8P8tgvl7pxApI+3JQuth9qQhBhHAIsOTtF6UQmrNn6spLItwpbGXy6cg8jjzCFlJaziOPnrvtGp1tmtui+6NrtdzSorxG8x0h8xlu5M0vNnfe6qD6qnVxo0wo64j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6867

No one is using snd_soc_unregister_component_by_driver().
Let's remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h  |  4 +---
 sound/soc/soc-core.c | 15 ++++-----------
 2 files changed, 5 insertions(+), 14 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 338662645b42f..0f8e46c131c91 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -454,9 +454,7 @@ int snd_soc_register_component(struct device *dev,
 int devm_snd_soc_register_component(struct device *dev,
 			 const struct snd_soc_component_driver *component_driver,
 			 struct snd_soc_dai_driver *dai_drv, int num_dai);
-#define snd_soc_unregister_component(dev) snd_soc_unregister_component_by_driver(dev, NULL)
-void snd_soc_unregister_component_by_driver(struct device *dev,
-			 const struct snd_soc_component_driver *component_driver);
+void snd_soc_unregister_component(struct device *dev);
 
 int soc_new_pcm(struct snd_soc_pcm_runtime *rtd);
 #ifdef CONFIG_SND_SOC_COMPRESS
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 1cccde174c22c..7b0ce619fc3a7 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1569,24 +1569,17 @@ int snd_soc_register_component(struct device *dev,
 EXPORT_SYMBOL_GPL(snd_soc_register_component);
 
 /**
- * snd_soc_unregister_component_by_driver - Unregister component using a given driver
+ * snd_soc_unregister_component - Unregister component using a given driver
  * from the ASoC core
  *
  * @dev: The device to unregister
- * @component_driver: The component driver to unregister
  */
-void snd_soc_unregister_component_by_driver(struct device *dev,
-					    const struct snd_soc_component_driver *component_driver)
+void snd_soc_unregister_component(struct device *dev)
 {
-	const char *driver_name = NULL;
-
-	if (component_driver)
-		driver_name = component_driver->name;
-
 	guard(mutex)(&client_mutex);
 
 	while (1) {
-		struct snd_soc_component *component = snd_soc_lookup_component_nolocked(dev, driver_name);
+		struct snd_soc_component *component = snd_soc_lookup_component_nolocked(dev, NULL);
 
 		if (!component)
 			break;
@@ -1594,7 +1587,7 @@ void snd_soc_unregister_component_by_driver(struct device *dev,
 		snd_soc_component_unregister_unlocked(component);
 	}
 }
-EXPORT_SYMBOL_GPL(snd_soc_unregister_component_by_driver);
+EXPORT_SYMBOL_GPL(snd_soc_unregister_component);
 
 /* Retrieve a card's name from device tree */
 int snd_soc_of_parse_card_name(struct snd_soc_card *card,
-- 
2.53.0

