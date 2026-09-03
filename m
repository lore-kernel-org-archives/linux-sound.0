Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010018.outbound.protection.outlook.com [52.101.229.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACEF1A2C0B
	for <linux-sound@vger.kernel.org>; Thu,  3 Sep 2026 01:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788398025; cv=fail; b=aDj0kHgkJmEvJYcQAwZuoFoxzkLIzySlh5Ol9C7idu3MzvkB041I7qJwhmPtELNScmO7NyT2/iRnyidCcInTInTmXlwEIj6EeCd45kmOvXRTo7qUXTd9GGQchp/B2wcVxiW+3PjqyaKHP0qFXY2N9TxYFUieCAjJwhosyrhLgGY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788398025; c=relaxed/simple;
	bh=U2kr8+kVTPghK6ES//tp68tUP4nhy72YjHsSy/FRKjw=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=H2VAN8uil4LPMQij7oBtP3bWFi0c/eodK60VTq5AcgCR9sXgzu9ZE/u0Fpeuic6G2GswGPBVZQo99zl935wzSzGqCLJWWg/6pNf5QsiOZe4PzCpzRNjvgOQ6C2qAtMRMyBEaNaKUxGquWDl+n73nUuSQt3SHuaBgfg3uC58RNwE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Hk73FZ3y; arc=fail smtp.client-ip=52.101.229.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Hk73FZ3y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CKgSLSHzE/gntueK+Mb/JisI45+kA8Mmnq6cZuOf5FO+sHYNX5BO74qZhiYz2JI55AwkvXzLlHUl4AdkZHGoNGRTWeiKUS6Eb+Y7m1L/bM6NOb1pfdt9ARYkscCrnE5/mr6qAeOrZmJ47acR0kCXQgCp73l17dalOWnZNUoGX8ynSjogAnQrAZbJbq6rZ9AOH7Vuj8IMw7VKpy9blQNxkt6GFnCWSxLeTRKD3suctGqDoNDckMDGSZhNbwNaWG2FgEy8fSxlgUxVmB5aSK2lWQ9p9gCi0/ATTI+wpBG6ocJpKDWgCm9O9ptn1RlZeZu8ll0Fi/paTDkUGGi6/+zXsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GZoj3I3x+UOIOV5G2XCGJ3LX2UBIqI5VsSRAsp4EiHk=;
 b=TDw81QZLAXnWhvlVJQmqRnCQ4NnLUwky3dBFTep4XBN/YQqAzDMkdYyag6BNC159fr+PDlQwA5kV4QZjQphD4ycp+J2vajFUnLXKCTy6r1QyzEdEl2PCKbmcieZn2L2PUYDeG6GnnTyu1wjZJdS2a/174C5/5cuWajqhwDuOYMno0bSyoeWsKR2dNvM5RXUhZmzv8jtnqM+Cic8EE+qi5ndQTFU2nKQdtkA1f7mjhS9lYJIOJXBgK2tyT5xYO++lBG4DawaFtX9/QS49nseIuReb90h6OauRVM85UV73Nh1dDGY3Dc4r7FfSwePlIr4xudPwXJT0TDF7sTXRO1RUCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GZoj3I3x+UOIOV5G2XCGJ3LX2UBIqI5VsSRAsp4EiHk=;
 b=Hk73FZ3y4ZLI5tZOh3kmGGWDd0itsEtHNNrqxqe8Frb/6DT+3PzxjE8xeGsxE1NyQdR2YVxRq+Qefa35j2VsFuBKtfYKshBqwc+WJzKOCJdXIuRTdVBnxmusENlZtDmwme/Nni/TMyR3MvYPPq6nsVMoAJtU//xrMrEBzSmc2Dg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by TY4PR01MB17164.jpnprd01.prod.outlook.com
 (2603:1096:405:367::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 01:13:41 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 01:13:41 +0000
Message-ID: <87v78nyw57.wl-kuninori.morimoto.gx@renesas.com>
To: bui duc phuc <phucduc.bui@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: bui duc phuc <phucduc.bui@gmail.com>, linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 03/21] ASoC: hisilicon: use .auto_selectable_formats
In-Reply-To: <87zexzyw5v.wl-kuninori.morimoto.gx@renesas.com>
References: <87zexzyw5v.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 3 Sep 2026 01:13:40 +0000
X-ClientProxiedBy: TYCP301CA0074.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::14) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|TY4PR01MB17164:EE_
X-MS-Office365-Filtering-Correlation-Id: 91a816a9-fcc4-4ad4-9351-08df09589739
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|23010399003|366016|38350700014|6133799003|56012099006|10067099003|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	GTlPTf4qijl4ie2lYbKg+BlR/aw7Tg7B0+sBMSlo9a8mf4kpxxlkEmdUlpOmMxWV9o01lEBzoHuEnclqAudb6eTdgjkv5/aWVObI0Wlab8UmBEb8cD82Q/8Fg330QrW6wchXNRN1qBm/hbpLltIBmfElCcXbU+k3vhh1wi3rFoezeMLYZmDBmvPJfMtZmpWKkTHkE46ozV2Lr4OgvynW0nolupWSYFZ3KNS6I2LMZlEiLmHb+cx0SVuOqrHGtkjxcHaF/KAM26xywO/EPHajmpWz/tV230CRS23N5rc2ezd152pXPOynF2gG+mNUnLCYj+YvcR4SECeVfcCIdkJgf59lHXSkgJoW+F84igQ4/YTi2XLNQSQEesV5xWKcrfOhhUfFAuCefuors6wBN8/i7z6hyHv+TgtL5ITJUe8ttHsyp/n+jDhF6XmFkaokSRCAmYZsCNyFDlpXh70pZYSdr9WlREg8Z4Jnd2rUh7dDTWSHcrINYG3Kj+YOZz87uFmwNBEvVH+8TsgAc9iW4iSOJ9scP5LG6wNIbktPGQGxX7dAXCVVqE4W69bQzIkRfKWLUPGj498tlQ4AxnvUTAhDI1SGMKHEl8xPPGhRPNmoLv5TBGFPCB2aGPXJ7hnayHSKpkzN4Dy7WGs5GxjcqKU5KWHNQ1V8LMeTnoTMcUEENVS+ZY1XmusROp1TOrf97myWPDiE+TW28/q8fjyDn0Iw1z5xOe3QBaT2E1hl7h8ktrw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(23010399003)(366016)(38350700014)(6133799003)(56012099006)(10067099003)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?70s8/+zsQs2RYEAltQAqV8f/YmEjCCBftCpV1fCfg4JHCy/z95iwR1KkFIAd?=
 =?us-ascii?Q?lyarNkhMmPbUmbElsRZdcUcdZKHwfeM3oL6IHpOxuPUaEtIi/9AHC8u0mabd?=
 =?us-ascii?Q?f0vfrpkRybJ0OZdg7RimbLtJYqBvlDCFlJ+0orldFTdm3hO6aFLxaC7v/7iW?=
 =?us-ascii?Q?4DBtLoRefU1dBl0EFmBWON4RxSs7pZJlDFbGiwqOaVe7yucZ4IMpYMxA1FNw?=
 =?us-ascii?Q?saIS2ntXgDpnwd9FmMOb9qlRg6KY0FiGrrffsU9NrFHLcy7Z3Y7o0lmH7iMd?=
 =?us-ascii?Q?3kPWX8BL1cbebfQyhMSaG+408G5Bwe8int7npKfpthm0Z9ENDiO7nE8sXzZN?=
 =?us-ascii?Q?vqY2VJUFbHRPb0NJCiJQi+rnpL+B8LAUb/xqozrBiPf3GGUF86GGMbag0D1E?=
 =?us-ascii?Q?B0IdmnmTZehW1Qj2DCnKwkMla2nTerEnPH4M0/F6VAq4u9NnEmC+U1xf7/Uh?=
 =?us-ascii?Q?+FuSJPUHiqcuJQ0emkGdoRK3TfErggg3+s6S302JnP27MvkoGYVyq7dTp0rC?=
 =?us-ascii?Q?tNun+7YNnHmkZsD9wSrotoqRNVMk/wWZGirlTs9GAOD7ag1vOoF6fN02B92E?=
 =?us-ascii?Q?Fm8EjeocGndhSdYrTL6Px8R7xqsurWUXHtPSkfeDJywwGeLpWwptQvsbDOAa?=
 =?us-ascii?Q?0WrnwTcg0I7BNB1uMsUJw09ChJjKncOMphzmqJHHd/ZVSkExhhrBGA/GNwLI?=
 =?us-ascii?Q?3mONUmcnaRQZcLNmDEdY2Z+XZZNnRt6vgYcpqQdd6ikle3XLlF1Lu+7rjNuX?=
 =?us-ascii?Q?k75QodaBjkqaONWrMhxju2o/tz+3xmjgK9rG1QJiWSghIrFfX+9iGjBPAdIy?=
 =?us-ascii?Q?jtx+MlXthAbOVzSuXVVXzBOnVQ9F3hQ5VHNJTSO1cU2RbhlSVmp2cerAyCXv?=
 =?us-ascii?Q?Gq7bzC1M3EQ9Yqb6fA08Mp5nJyaSmgX9qINldmwhimIMBLm9+0KleW6NmTW8?=
 =?us-ascii?Q?9spOPHdAHMOuSjWk1ju1IMb77w7pLZZuQIZ8Q7ElwMpRpOSH+SJXoIkrKjiP?=
 =?us-ascii?Q?jDN4bmd0fa4sSnadMbBIFKa0KwetqXD9Ji2pixD1fIRTB29MsQ92UtTb94ww?=
 =?us-ascii?Q?EL9/TCQXcLzruQi1J3H0V1JvFxS5gRr3YLEdmzbRYqy1kwccP5GT/rRTfodo?=
 =?us-ascii?Q?+rdY5WUXv3OWL34V/RFXtFLcTEk+WUVoEyHfoJ3Xww0PFYGaQmv/X318W+zz?=
 =?us-ascii?Q?7AlGiOlFJj98dqaFeCdHrGr/aTQdjKR8rIVjs7PS/737RIrILs/sDjpdYe18?=
 =?us-ascii?Q?7mXKimD44hZu3ezV24AGYfYL4qWlwYKkaYKpkFHYnB3aPyVoeQjUlAMHhUrP?=
 =?us-ascii?Q?6EBoSDKcZKF21q6WP5wZkgW4nyVb20h4/fRkLl7fTI8qM6cUI0sZMHMGeMmK?=
 =?us-ascii?Q?WAH/SYfHZYmy8n5muth/iFBPPNMvfcI+Dhd7i6I1M8Ta6sZk5R5bHSa8CC1U?=
 =?us-ascii?Q?7J8AHAxYEVoacKTxQcozI81oO71AgALvBTdOqFsB5kjY871bcBD5bhHnGONL?=
 =?us-ascii?Q?PEQkICPWParmKgWhsE5FR7RZ1IcRRSrlKkwQMTZBFSf9BP+66PZ7XpH4bGG6?=
 =?us-ascii?Q?tca0ECh8gAhspoWTD+9wmYp+PMCCUf5landzI+xS66pbxhmsSusp8eFQCcrw?=
 =?us-ascii?Q?OcsW6StWEjz68TofqivVnOA+2Zob0WQcmlTQKeGDdI+zcykKX3OdMk57xRR/?=
 =?us-ascii?Q?BnZN9jHTlge4PIC6K3uZYEPZGm9KiXh6bwU77EMZ+Nd+DB+NFNzVTgBAUpwq?=
 =?us-ascii?Q?HGQ1pZF8/+IdZCrVPwpeAyTmhpiHPKmUIGeuv36udr74dRxHDchl?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91a816a9-fcc4-4ad4-9351-08df09589739
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 01:13:40.9806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1vbyNB3rrtDoKDyWeC2kUlKbZxU3ZdcqemN0hfRW3iS3Cvor8CPp3wGDEO+WA5yMGRqDvVHHcco+aw/VOj3Vx4Wk06T/1O9aMt8ww14FNU+5Yv+CmG8mHnx/kKXCo9Bt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB17164

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/hisilicon/hi6210-i2s.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/hisilicon/hi6210-i2s.c b/sound/soc/hisilicon/hi6210-i2s.c
index 33b1dafb2540a..554356f060b07 100644
--- a/sound/soc/hisilicon/hi6210-i2s.c
+++ b/sound/soc/hisilicon/hi6210-i2s.c
@@ -507,6 +507,11 @@ static int hi6210_i2s_dai_probe(struct snd_soc_dai *dai)
 }
 
 
+static const u64 hi6210_i2s_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops hi6210_i2s_dai_ops = {
 	.probe		= hi6210_i2s_dai_probe,
 	.trigger	= hi6210_i2s_trigger,
@@ -514,6 +519,8 @@ static const struct snd_soc_dai_ops hi6210_i2s_dai_ops = {
 	.set_fmt	= hi6210_i2s_set_fmt,
 	.startup	= hi6210_i2s_startup,
 	.shutdown	= hi6210_i2s_shutdown,
+	.auto_selectable_formats	= &hi6210_i2s_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_dai_driver hi6210_i2s_dai_init = {
-- 
2.53.0

