Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011029.outbound.protection.outlook.com [52.101.125.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E2F19AA56
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533966; cv=fail; b=OGdmpLd7JYlW4GPWgen4iFc5EvFxB1raFSkfKN1E5iFuCv0JRdajXLccKk0T+/Rp/F+sbBCaWNe7MUX62USEaSoptDgYggi86sthS3YDiwMOaiJ5Za4TwX4KhdN0gWgC7GaaMG3nfS3bVXzk4PBWdcXXMVKbPDegdULOCMprG+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533966; c=relaxed/simple;
	bh=5N1qyplBCSgxaBas3U1gWl9mxi3NVMpc6bIU+xbQFTk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=HjuimCewoCWYPJHZp8OAxlHGfBy6el6rvcAO/wBg0F838p3ocM7ZWRB29nEW2abzbmXnk4xdOVrGzxmWWC8wWBsTha4ZLk2ctx0DXUAULgfKAXnG2n/NH/uOYjSB42VElsEv9DlBZQbAWROa9O6TI6jY0cGzY90y15ZI4KfddQA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=iTia8V7D; arc=fail smtp.client-ip=52.101.125.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="iTia8V7D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w+VbY1ssi6fD4aHAZMNq+OcuVbasjbXM7+el6mexAX0CK2U7SNnfTnClaN5CnOvaeY/rGJpoXbEv5EbXhAc3cHxni2CELZKjJIZa8oltfaj1janihMeJCnPDOSfpnj0/JwTm/8Bd70vOcYoWqTMJV/qWha/TU/IkKK6fqnpVxqFwzV07CscmvCk3yaYxobniYdihXnXNMHFBxKh1nC4LHfTPbHGrMOcYd2Xm68k87UU3vSfT6bY/f/GaSaMMVhepJSjHcc6jsNYiAV7hfQpBTxE+rums+WfvM6QAL7q5+LyJB2i5EytwG3qZzuAwSDM/FBakZfD5Q1PjqUAuG2uHag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=etjOIkoxEJnQ0FFE5FQgeWXnZz/utgb06fxV+xwTJSs=;
 b=tmr3K1UpbEgYPGSKi2rcbzVp5KLTWzxlUz3DBRAgDhpZuTjmf90WixbqjB+IKdSdjPPDKN1OkCPncvkUGOSkVp9Ok9yrwcmvpRuHzZ/8v85IU6zTQZhJdLYr36fl3q4hWuWP937N+0PerdzylzCyEpU/i1VAs5Lney8qW33uiPdk/GOEuzlGdYDOrLse3mTCioVvsdOVIVZxalAzo1ucgUBua0k0hVrBk8nXFzDBp9rIOvoi/KxMYVBPavZs+0ba7Ox++Cvc/i4VOyyb8pM10TPvBPre4MFWIr8PF/S/pHbuBXudts/j9IdX9LozbnfqIBjDit4c1hRIkxb5Mu3Egg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=etjOIkoxEJnQ0FFE5FQgeWXnZz/utgb06fxV+xwTJSs=;
 b=iTia8V7DVtt11D8HPcTXVqiBnqWoeK6c9zR+jlWtn/nl8oK1vMZyt4daWbpXjHxNxiTb/NrZ7sGRPODpul9uCirhYkWpSFgR5tqc/ROg66GtALcBfKGVOzSijBeYAzoFIaBPDFSxwNF9XdCJoKK5CHHHGjj5DiVCG4FtO2Q09xI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8140.jpnprd01.prod.outlook.com
 (2603:1096:604:1a5::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:39:22 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:39:22 +0000
Message-ID: <87h64h8oxh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 149/157] ASoC: mediatek: mt8195-mt6359: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:39:22 +0000
X-ClientProxiedBy: TYCP286CA0053.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8140:EE_
X-MS-Office365-Filtering-Correlation-Id: aa43fa26-3886-487d-3b0a-08dd56066548
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?snnV74FKtORknzUHzZsYMxSpGMymXbZUPr1liSrYxUsI9bacJ9+uYqyjoykt?=
 =?us-ascii?Q?PnncTBC4O1DVHXvg/0ztA0ccTv7bmD0Pyklnodwe0Ti0iVkCWpLJ5mvFvz0D?=
 =?us-ascii?Q?uBYtZEtw6Bw8Z9bBhnI6e8NnX/d28SX25k1FjvF5tDuYaQ1eDQYvZBLASK+p?=
 =?us-ascii?Q?HlTjz8NTtbDm6IzvT8zEDlIqVgaosyFGCjupuL/eg1yXMZPcSMHRAGxLdtHd?=
 =?us-ascii?Q?cmGvyi62EZg7vSoC3N4HdenDxsFemTBBMEp8NO7Xnfn1HWfqNpA1YIbC2vWU?=
 =?us-ascii?Q?Jp1E1cnRKYHi2QT2jsq/Lp0No1f7BCWROJHbYAAj6dpYmM4b9kT9pLhaVn1r?=
 =?us-ascii?Q?iQn0bLQ0D+14dzTmUtjEN3Kdwndw5YXsOl0wEkbnNVNz8nhzdMDS7o8LyLl3?=
 =?us-ascii?Q?gWDbCjJP3C6gtrog6jKuvTTVshlN8O2a4OdM6EVcyrdgHiwtdVlh1on46bPW?=
 =?us-ascii?Q?XrNVrZ0l+UkAxUjbaMPiI8oK7umSzbydep7QIThN6vpwbhoGRZp3RcoUOJgA?=
 =?us-ascii?Q?WmnI3fk/mKofHaDKoRyKTXmP7jnaS/31Lw8gryzTUmlFp25Kdghg53+jC3nN?=
 =?us-ascii?Q?Hbp9TkXNw/bVz0SGYAVyY1FuZHiyR2bTIHY3Rx8IRtvKjXEXxYX9F7mxpSG4?=
 =?us-ascii?Q?B4z7lc0fXb973AhvaKrNYa04teBk/TWnJoRCgnSne2bY4KDCWkAQHWd6BYVo?=
 =?us-ascii?Q?9ytyAuMSLBvnGgXFMzhoDzI2+4ZORSCGmmEP3xt4t7AdB9r0tKv8VKRcKmfl?=
 =?us-ascii?Q?z8TbmehkUk+OSeBLuEkpQ+JqPBjP7inAJxS5h2o/P3xxqCLDDqMF3Fskl+2t?=
 =?us-ascii?Q?2/IFooFiSQ9a0NP5iNufNoRh304Ebf+dxuzyiIlW5Dv1ylGDNXM5JvdsJdGo?=
 =?us-ascii?Q?P71zBHukum7A0FqawI5pkOOcwvVMyAXgvrDU+3Zq+kCmI7iaY/pB0VOlWUTc?=
 =?us-ascii?Q?kEkygSFityDxOcwXaggdqRheZHF1e4UNTFK4Z/DLHp28bFP1b93pdO0KVyPM?=
 =?us-ascii?Q?GPgm5lZhjt82fe+LNJFWrQI+PTHuUlswxNPGpxSjVSussgZNKnXOnQVqhyIS?=
 =?us-ascii?Q?6N5FXYwyElWmJ1QpP4EwxqtZiVEwdR2wojJCS5P9D6qJdYe1bmntvpGO9/s0?=
 =?us-ascii?Q?yVoAGr2BkY1DvhkwAvSWQZiWe6a7z1c3XG7kZ5New4qNQ4ROm/oyOFdMwaCe?=
 =?us-ascii?Q?+IxCahjfzgcaefqMsjfho3EqyzpAURlvqG5qtF3V7HlCM7FS0G9E6Pvp752+?=
 =?us-ascii?Q?STXX0v0ZjvrjA40EkmO6mQykdlYJatTzkpkJ0afLPuLnjus+sIoAEGXQ8LZ0?=
 =?us-ascii?Q?C7BEYx85QX58m0Yg3vJEK2EdZNnWwsVUHAhNWVEIQQIrR79OAvCCS81lrQDd?=
 =?us-ascii?Q?MlVY8p2w+x2W4CgTEYDZiI73VB2cGB90JDYgD4BijRN+b80ND/YxZyp3rXMb?=
 =?us-ascii?Q?PDSCDlcNG5lilrS87OXhQhD9nKfTSaCT?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ETwp43QG8mhZYDiHavHJfjhIiX31v/xT+zkkVmGxowjQXh4OEdeLIuMml9kJ?=
 =?us-ascii?Q?tbJVJNpQF8BVg4xcCycXMpELGwSZ418YnpIlrNA6vagyl9ZJYxAaadENNW/P?=
 =?us-ascii?Q?eVHd35EZf9pdV4ypKY4YoKtcIF7e/4e+BI2iAkDEFhAFsl7ozH07++Vf5vQ5?=
 =?us-ascii?Q?2UgZ45+gu0VlmAZ8ejOdsxfEf8u5wXnZNWsfkGRIwGcFg/sE/WAy98dFbf31?=
 =?us-ascii?Q?AnhyKN2KLgTIos/0h8P2CVG5m0BYFTBYwI723JgZ8B0UXqZUmdGdIiv47Z0F?=
 =?us-ascii?Q?rOn2aCf8U38M+A3YFIuEddmNM0KEIsiufD8yt+VzL6k3+tMi/Ue1ceYXSOC2?=
 =?us-ascii?Q?vk09Um6MK+oRabRS9nDmUbrumM3AqJjhvfrroTEKhWqSM9ThdD+dEXqohW98?=
 =?us-ascii?Q?RyXvEa+mJtGd3ZJa+Pan7Wdx5GOwqjdgy7xqPSOMLDuMgpBhG705dIF+JS9m?=
 =?us-ascii?Q?QFT2+Ly6Fl+zfLgxml3oTilGrYgiionfw9CP+IWoCMmxRpE7DpMi+Nz3NMEN?=
 =?us-ascii?Q?DJGI0VthlwcbXYaDtBOria6D88nWd8gjgT3pO48eCq1iT+V24nFBcXzKdrF6?=
 =?us-ascii?Q?MgyaNlDX64sPU3afomk6LbFlh1JdwR3A51eWBtWY0VAQLFc1XD9wO5QpsZu+?=
 =?us-ascii?Q?6Ctn4Vpb3qV31XZlDnGjd6h7KyvIIhk5ZAvzpDC2nuvW6IPznpZl5vm06JpY?=
 =?us-ascii?Q?trk5AirPKkpAzHkFvshc7vKecCVSgWaqkj4lqrFNhKPw8YMNGrOJetvkLtR5?=
 =?us-ascii?Q?QZvHLeaNKg7fYGye2C4krKO1waAzbUePyEw7HB/JVTDVzdo3QBB+kcCvcLNU?=
 =?us-ascii?Q?exynmKZXwGfGuKvd/4h/p2TZThrVPTlNHymOA78YjFvf39M+AsIDkTeoEHw0?=
 =?us-ascii?Q?hU6F23q8zRa7RA2QnbP/5r340WFyD0TdIewwtkdq59Gy5ragklnxkkR5WQFb?=
 =?us-ascii?Q?xywNrk6vHtbDNxFhW+C252xPvToP6yg23abCbEcIBJU4YSrttW6eqJi7ipnO?=
 =?us-ascii?Q?uyPGzdMxWyPiTkJlDZlvOvP2sbDIu7aPpEvZ+xtIBUHuGOq1HVkVqAahiPaH?=
 =?us-ascii?Q?AxTR3Bo60FRnxoM4BwbLEza7pAm5dnBhUoXpnaMUYcjHDiigjApzLqWVdDGj?=
 =?us-ascii?Q?4/tf93zMK9rWMDVSH/jQdeofLprguaNRZGglxVBKy46YC2L5NYRmtk8Endu2?=
 =?us-ascii?Q?VuPUUZuDNpxh6LdSHMoboSoU8TKE4RR32GX7AjmU6xL70tUWVY9Er5Jzs98s?=
 =?us-ascii?Q?WV7uxGWaRiyYK1VY6vjEavFL4LJ34AmurWMnc/btz382g0a9kodJWSbVqJTD?=
 =?us-ascii?Q?yWM6XguvtQ/HuNtFbKffMoS3wZGlv1VprclAuNS16CIEhaNkz21z0XTSGyW0?=
 =?us-ascii?Q?Bfy8EUNK29XB+UtBIL+5i9QwTHH6iBRFQ5czHlmc7kiB9K/WWFMzpWOA9JfU?=
 =?us-ascii?Q?K7AEQ57LcnkHw1VR32CYJETjb4BCJTsmUEvFdRN5rFkqP2gk8LduMLtFfJxg?=
 =?us-ascii?Q?VmIP7R3Y6GfG1cOP/5eGKRaf5yVCEmTEPZKm44XbnCpL9b7PuTRZzg749IV/?=
 =?us-ascii?Q?Cnq46nc6N4JJ4rsifAOP7+EGmAiqVdESYTWVxqhIuAPaLC/RF3YFMoaunCdA?=
 =?us-ascii?Q?4M25UHr5Q7Egl1havvmDp+E=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa43fa26-3886-487d-3b0a-08dd56066548
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:39:22.6569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6l7pxehT/h6OJ+l4vkHzsXixs39zzrhiB25j1RkilTPJmhlBGTjMmyc1sWHZ5nIDvOQ3KhYBtz98RWRdMF9ZeJgB0GpfFD+V4GuuTjdX5tcJZcpKogg66vI0FyHhv1N9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8140

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/mediatek/mt8195/mt8195-mt6359.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359.c b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
index 2b9cb3248795..df29a9fa5aee 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
@@ -1114,7 +1114,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 		.no_pcm = 1,
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBS_CFS,
+			SND_SOC_DAIFMT_CBC_CFC,
 		.capture_only = 1,
 		SND_SOC_DAILINK_REG(ETDM1_IN_BE),
 	},
@@ -1123,7 +1123,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 		.no_pcm = 1,
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBS_CFS,
+			SND_SOC_DAIFMT_CBC_CFC,
 		.capture_only = 1,
 		.be_hw_params_fixup = mt8195_etdm_hw_params_fixup,
 		SND_SOC_DAILINK_REG(ETDM2_IN_BE),
@@ -1133,7 +1133,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 		.no_pcm = 1,
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBS_CFS,
+			SND_SOC_DAIFMT_CBC_CFC,
 		.playback_only = 1,
 		.be_hw_params_fixup = mt8195_etdm_hw_params_fixup,
 		SND_SOC_DAILINK_REG(ETDM1_OUT_BE),
@@ -1143,7 +1143,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 		.no_pcm = 1,
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBS_CFS,
+			SND_SOC_DAIFMT_CBC_CFC,
 		.playback_only = 1,
 		SND_SOC_DAILINK_REG(ETDM2_OUT_BE),
 	},
@@ -1152,7 +1152,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 		.no_pcm = 1,
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBS_CFS,
+			SND_SOC_DAIFMT_CBC_CFC,
 		.playback_only = 1,
 		SND_SOC_DAILINK_REG(ETDM3_OUT_BE),
 	},
@@ -1161,7 +1161,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 		.no_pcm = 1,
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBS_CFS,
+			SND_SOC_DAIFMT_CBC_CFC,
 		SND_SOC_DAILINK_REG(PCM1_BE),
 	},
 	[DAI_LINK_UL_SRC1_BE] = {
-- 
2.43.0

