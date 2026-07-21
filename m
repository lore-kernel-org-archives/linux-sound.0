Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010033.outbound.protection.outlook.com [52.101.228.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5B63F1AC4
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 01:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784596688; cv=fail; b=HkC9ugS5m94urYhh5TdHhYCvXgr6aKfIgxcsOkCpiWTXgXNWRCiqJgInLBelZYBS1FRnDASxFVddVqkJ6TrKK8ZQrRovP3REPrbFSVsqmWU88gZ7k3koZezflXfBatiWI7qHVGlqqjBKnpb3ZhlSAGWshNimV73PTCgxLkxEqZ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784596688; c=relaxed/simple;
	bh=P+UV5G2YtvEzWoJuo3YuJf8fcjSbhOi3FvuMYCnasWE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=fCZ1Iqzj8/S9Hpz5pMH1BEgxEivOa0RcYtZIJ2x0A2BdTCv6GwquAqw1vqA5Z7NkQgAtu9o0pd/a2apEaYd9TZlAbCtaqCsWVbBxS4VsmB0sfOj6rXzPnq9/th6efdlOcajfjb5NdLrgqVTpcElEGARY/yIRtdTU9tUWtuKH2kA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=o+QJP6c9; arc=fail smtp.client-ip=52.101.228.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="o+QJP6c9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vMHyP6o3DRSdLw4JgaYcKh0i70jgkNqs78ZaryGAKfCwW9jEc/3ed3L8algjuGMqUOb/fDcwJMb0ipkMXiG2nRQEYaKLj2F5TShqe/vr+nwnWAcZjqsQbUhlj5fK2YLTL49xVU0bLUh6qUNqPX2d58GrrpdzC0zrB8bO40GIdvbA0s7BqrDmOFGjXQIdXg2oRHRA9hBmZedeOTGaxfhcV/gRrv5lC94Y+M8G4r8nt+3CllxXsxsY5UHrWGeinKiFBUdk+PPBazpiFZS29vfrmpUKjdieXcQmrUoq/1nqI1hksj0djJn5b0BsHT8u1/rneMcWNHZtlIKGn1leTAnTGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YFE6k/LWm9yIgUic/V5Xi13sRpMsMaW46xDjddiodDY=;
 b=NrsKZEFGL8kU8v+9coi9xFO7kncAx3IrfawJjPORTMpqLEWf+3JRCv6o8fkTIcwp7sPW4byCwaFzenPVju9EXw2aMHqSiKZddXwB91mkvkUcOKF/GAjwpKYQ9HKVYW1Ucs0xe594ctuTBjKruuYdM8uQRfsX3hz8VL9OnU0frra3XHiK3hNyJCYzR35Hys6AQPo2AW74ATMr0gUXhbeWoy/gAJKR58ZFV69l/6vBmIRwCH9fSK9OdOFArix+TVpWmFBwm17658iuEysUPfr4aOcqgrytrtVSJQV1UjQAfAZLNQzC3h9vLLkPjPeHnJWbHS2GJ+kiFAY36ONMLBPvqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YFE6k/LWm9yIgUic/V5Xi13sRpMsMaW46xDjddiodDY=;
 b=o+QJP6c9e78+8gBZnYZgNJ2/R5B5cFazh23zXoqeYXRqiorEGV/BiYx8oW76SOaEqIgMe8tr0mHs8ccgO1FgpLbqc0B84LGmuiNEqih9Yme4SNcY2DtUxFOYmxfL4R+wz/asLgXDh1tDTNHroN3laOYQg0RlVLtA3zoeoRAzRz0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYYPR01MB14135.jpnprd01.prod.outlook.com (2603:1096:405:211::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 01:18:04 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 01:18:04 +0000
Message-ID: <87bjc1jg37.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 11/12] ASoC: soc-core: makes snd_soc_component_initialize() / snd_soc_add_component() local
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Fabio Estevam <festevam@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87qzkxjg53.wl-kuninori.morimoto.gx@renesas.com>
References: <87qzkxjg53.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 21 Jul 2026 01:18:04 +0000
X-ClientProxiedBy: TYCP286CA0065.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::6) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYYPR01MB14135:EE_
X-MS-Office365-Filtering-Correlation-Id: a5afd681-eb65-4ece-0538-08dee6c5ea3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|23010399003|1800799024|921020|38350700014|22082099003|18002099003|6133799003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	x5wUpSeX3p33KyXcyAAG7DXOKVauOeb2ahJUirGgV+sTWMGsgR9WLetkomWdS/JY46IjFMDcsetFkmrM3Ubad2PIIimIHmhWKm2oMtlsQH3Z7b3d8DqQZPC8GCFa2jPo/gRS83GjM7rzmISx/+AU/DPgFA8ggKZ0v2h2XQv72D7Q3XC2J5+g1xsoASfKKTgHAXQx2ZbSUyba6pxnBweoxZLYJpY27vP2GY1iiOzADqNeB6cI0nah8yy9gxJzMprsYMuk02gOFQdgoG2xZ8Z+3K2Ell5co2khkyKkLhOowgpLEaADaCAUAr19VsfYjv8A4QYJo04oEzjzf1sD/Av5JlSBZLCVepDOjx3Bl3aKIF5T9DkXDrYC1gm4oZ5QZTjKylGkZbTxVT9BRrt2Y7o1p1sAia3OV5AKSw602Lqkd1Pv0QrkGocEyjID4xMx+WOMlkhzTk+cE1Vq1kpgVNfUbobpsiN4gRwmH6Z5wZjC/ER0YWS2DgkTS0Q5Or6wpQ61qZFIDjBBOXPqbsacdFWc8ZgG9ffj1yMSar1XuunlA7bJG/x3+fvoH7kqPf8VRAzRhd/Lhfh2tTDjOVr352yB32/G/9F7T1x4WijvWxulFYXeOBUXMUGm4YZ2CM+365Ioaqht2a+4bXnX1Jjm6LJpWpNzAWIrA1lqga+xiVENAo6mJ/MeOIpf6CCkcBRmjF8ibQKn5mhFhgT2xrkSj9FNc+SgaKnZ1G5o+xX+sfC4y8CF3gpuPalKMLeBMF9PG2PR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(23010399003)(1800799024)(921020)(38350700014)(22082099003)(18002099003)(6133799003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?giJITzIuvJglvSI9O+Qs3hsk1rqnyrtAxhPDMAhDHTn8WQe2TRTl7BKo17Gp?=
 =?us-ascii?Q?s/EWOaFpHmDw4zRVYJOuEFvs6opqt/Cwy9byeOC/p1PHK+EiFfClmvILCTW4?=
 =?us-ascii?Q?KbvXwB2S9S3/ZirvhVJ6DESNUKNAb5GeoGms3/TdML+w9RoHHGNelIWQx0jb?=
 =?us-ascii?Q?7G4grFdwBU2m8Ht2CL+UYaJZ/ejtiqqBa/kqZ5oZ/zDd+fXpjfr0qjbL5ydv?=
 =?us-ascii?Q?6YNWMU1BQ7epJJuHxQ35G5DKhhSu7WxC1Y06ilbgplVVdJe/zYdSzbdiETy9?=
 =?us-ascii?Q?6SqheNIkY8ETvK8ZsPbv/X0Rp/exW78sHW82YSd49my8mr0iSHWYZVC56IYW?=
 =?us-ascii?Q?r7RYQEWw5Ni+oxflh62xhUN4BKQYNdVXyxUnX7DNOXsbc4cMFiuAv3BN3lkp?=
 =?us-ascii?Q?Ptvqg9dc1g8nnvox5lSwLAp9Pt+XEYnSU/Bxkn6B0Fuxn09HSWYSBPGJTNXo?=
 =?us-ascii?Q?JfToTkEobiZovmqYInASKnJSi8l/kVT+/Lt70cu8/3pYjc7RxaNb8fw/cbSS?=
 =?us-ascii?Q?i7YPo4t/wAAchaYLQnvAIsD7z7vQs9C/RsZ4NKKwqVk61ckgyVY9ObKqgRqq?=
 =?us-ascii?Q?zTYcqN6SyoGpMlM/NKRlgsEdG2vNdIx6bSVNeVw8IsoK6e8Rz5PU8u0UDm4y?=
 =?us-ascii?Q?d+lzvojyWWbv1vo56snlX4+5TfFS34fM3Q6oxHN9/7yVj4ywsc9aLmOxFBS/?=
 =?us-ascii?Q?iAuMi3zPqwog4eA/TWQqVtZp74fCb3DzrZmeOiQGhq4ESigojRlbpj3X7ar8?=
 =?us-ascii?Q?0QzLS2F21e76OHu1hztvW18Tz1ykN28J0b8fQkxvuX59PchDDfUNJGfs/iWh?=
 =?us-ascii?Q?ilc+4HkNC6yh8MJkj81hVQuLbozHmTiqfWfbs5RpUilBnIcuS3VwOaroxEfs?=
 =?us-ascii?Q?IbrUw+1WHxETY3K9FThaJp6ScH8qixJOyxDHMibJZSedG4nhNFrUO4N0ezpa?=
 =?us-ascii?Q?p6G0yDO69TdIE8Bon3E4c00SoebbZ3F66aVBxPoKeCXjK60SEv36bboxkDPD?=
 =?us-ascii?Q?IfWgCOvy6zUiFkcdHsfkQEbC+lPao1UHSid82s2ZB+3atsyaUDSU2tqxtkLY?=
 =?us-ascii?Q?K6KD6S9t8ecLjwPu3j6R+sg/11DL2TXV5BN803nnFbOZtZ6a8UpOUMivHUQR?=
 =?us-ascii?Q?w5ftyAY27rR5iv02rFBH4mzVawhk9qiHHQdykMFu9E+L0HA+dm1RFDKI2Ax+?=
 =?us-ascii?Q?LYBrLcg4CirUAhzxgUwcYmz0FDAAUHhfxZAaZHsZMrEvU1H7YMdQOITm6PWD?=
 =?us-ascii?Q?PndaBX6S4uPLRgucyyNOGUIiNlScmu5ZKzv3ucVp9BjZMp5EXr6Ym6QUg2+s?=
 =?us-ascii?Q?BeXf4cZ4Gb9rSoJAmpc1sO4YLBVidCs+6LMHdm9ZLStc7hsREAUhP6Aw2XkC?=
 =?us-ascii?Q?tJjxxS4xSemp85d7J9Y1dR0XeCTOgVZoEh1xQ6w87jx5co6P7sOoIN89MXlk?=
 =?us-ascii?Q?EnMIvGkXRD9fdL+mUeTwQSiTS19QnFGvqlLh4CqDPwC+sP7dj/6/2bX2trMp?=
 =?us-ascii?Q?VG6yzdLMgQzQ89J24k7hrpdY1IYWcgbwNiLJ0P+71NZHkYux9WNcXdnXqb3A?=
 =?us-ascii?Q?18u8a82qECVTGk/DkI7zYbvnOcpySSIeW3AMEEVykI7NQ6HFkw/mLUnfzayo?=
 =?us-ascii?Q?1U9c6FB+dkneitO0HmiCcwhPHfOuIxXQEKeCETBYwmvG+oLxjc50rtWW+iAK?=
 =?us-ascii?Q?fCkqEScgw5DJhpftdwW+Ko4oKrw7ISffb/En8f6xFL/Qv5b2DT4DVW+3bnL6?=
 =?us-ascii?Q?I3XIWvbRBpOCtqsTZ1r4TuUEd33Mr0g7CKcVwm6DVuTYv6XTLhh3?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5afd681-eb65-4ece-0538-08dee6c5ea3a
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 01:18:04.6824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iJUICQUTccjE1Ru7Jzo0sHYFeo88p0ialN5rNjwUy2CXcIuFV0XdQ1CYXvgS/jiDJyHkj5FSE4KiPONqjv47unV2YEw51C6DuCWPdT3FXAe5m/irszV+aAV7RauW0Wa3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB14135

No one is calling snd_soc_component_initialize() / snd_soc_add_component()
calling from driver. Makes them local functions.

It renames
	- snd_soc_add_component()
	+ snd_soc_component_add()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/soc.h  |  6 ------
 sound/soc/soc-core.c | 18 ++++++++----------
 2 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index cb0de41e2ada5..f46b2bc2a022b 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -447,12 +447,6 @@ static inline int snd_soc_resume(struct device *dev)
 }
 #endif
 int snd_soc_poweroff(struct device *dev);
-int snd_soc_component_initialize(struct snd_soc_component *component,
-				 const struct snd_soc_component_driver *driver,
-				 struct device *dev);
-int snd_soc_add_component(struct snd_soc_component *component,
-			  struct snd_soc_dai_driver *dai_drv,
-			  int num_dai);
 int snd_soc_register_component_c(struct snd_soc_component *component,
 			 const struct snd_soc_component_driver *component_driver,
 			 struct snd_soc_dai_driver *dai_drv, int num_dai);
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 3b1d18bfadda9..f1368bfe3fa4e 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2702,9 +2702,9 @@ static void snd_soc_del_component_unlocked(struct snd_soc_component *component)
 	list_del(&component->list);
 }
 
-int snd_soc_component_initialize(struct snd_soc_component *component,
-				 const struct snd_soc_component_driver *driver,
-				 struct device *dev)
+static int soc_component_initialize(struct snd_soc_component *component,
+				    const struct snd_soc_component_driver *driver,
+				    struct device *dev)
 {
 	component->dapm = snd_soc_dapm_alloc(dev);
 	if (!component->dapm)
@@ -2730,11 +2730,10 @@ int snd_soc_component_initialize(struct snd_soc_component *component,
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(snd_soc_component_initialize);
 
-int snd_soc_add_component(struct snd_soc_component *component,
-			  struct snd_soc_dai_driver *dai_drv,
-			  int num_dai)
+static int soc_component_add(struct snd_soc_component *component,
+			     struct snd_soc_dai_driver *dai_drv,
+			     int num_dai)
 {
 	struct snd_soc_card *card, *c;
 	int ret;
@@ -2773,7 +2772,6 @@ int snd_soc_add_component(struct snd_soc_component *component,
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(snd_soc_add_component);
 
 int snd_soc_register_component_c(struct snd_soc_component *component,
 			const struct snd_soc_component_driver *component_driver,
@@ -2782,11 +2780,11 @@ int snd_soc_register_component_c(struct snd_soc_component *component,
 {
 	int ret;
 
-	ret = snd_soc_component_initialize(component, component_driver, component->dev);
+	ret = soc_component_initialize(component, component_driver, component->dev);
 	if (ret < 0)
 		return ret;
 
-	return snd_soc_add_component(component, dai_drv, num_dai);
+	return soc_component_add(component, dai_drv, num_dai);
 }
 EXPORT_SYMBOL_GPL(snd_soc_register_component_c);
 
-- 
2.53.0

