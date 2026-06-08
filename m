Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010018.outbound.protection.outlook.com [52.101.229.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F747A59
	for <linux-sound@vger.kernel.org>; Mon,  8 Jun 2026 00:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780880272; cv=fail; b=f3SKjmA5FazI/Tialw0X+FHoFfe7lc4qd48NCIB83z2GGCRtaynGlaAfVxlFS16lmwpofDMKj5m5iQq78uMuVSAhZnRU2k5kbi/s4uLUk/0I5siM3KMAeA7RLoMcvXHsTZXOFvAW9HMsx73MnVkhSJTQmOElP0g9Q1IPSiS+ALU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780880272; c=relaxed/simple;
	bh=p/rz1FQuiISe0C3C38DV6C5bSOHj4j3C8ew9y4PFBIo=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=heK75woypbDiiEYCCDsywPhAq2+uoU2zf4G11Vx6n+ArG4wZ4ROWYnemZdRLV/Iure9tZvpugCOKu6UuRfQ4kQs9lZyUq90ha27Q+IsOH7XPBonfHAocfRNL3e94rMKY7OHHbxLdLkQpZ1UPnJw1ZwEzVeBBywDme8+cmvLk6yo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=dSt0KrKu; arc=fail smtp.client-ip=52.101.229.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="dSt0KrKu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wagZ4u/OW9dEZEyG8RZ92/Sk7kTPEIUJDQ6fB0+C9WTWhWxeCr1MGFjnjL6XrVeCv9TTNuFsXcdeS7aN9z63/HiCjZI8plxt/0OxvmALhTRDa0H30Crd31T35+qjy+HyRlXCPuxgoENPQCN5tWyUB1B3b8fzZICYWbvbojsUXyjZDsuYU96hywWZ0947/5Hke/5jp4x3bV+S7PzJp0KMKjONcL/qpVsjf80GuQ+EJvaUhpSTbOiaNjxbqVvWFjZeEOCs/ep3gYa6NscU+V750bshVBQXR/KmtW4H300l7FJVO8/6sQ19WDZcg3W365icjiBJj+8xle08YWzRi4S7/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xFLQQnL3/T35WbK8GMjPATocCNe7EBImGVJwIlJsFNk=;
 b=n4LryX/6e4dBpFrOiiB8m0CY/15Q12V3LSGHU5WXfEO+IyoBnCXZBRzcmhh4TnL+BhjmL/QUbM7xGwqr/7tYxpStpUGH2C4Teyxd/WvzTH075J31IH6Rs70l0WhEgu9HDyWVHgFlYpxeI+DeIJjdRTUcCAHOBmbTNTxESHnyIut5D9FboyNS/OHgPgFfvCPryqi26ZVhnZOXTmiEkRtds0Cjc8tBBMfnQqlXeSaHiwqelXBcdR97vWfz1T1tN7DbjUOsZXfklm0WBiI6l7CKPNs9QFD5vloYqYLeN4gPLqmNTuZL5nch0z91BLDRK+We2Ceyd7LrJeSBh70YsccJiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xFLQQnL3/T35WbK8GMjPATocCNe7EBImGVJwIlJsFNk=;
 b=dSt0KrKuZwPDScmXcw6upQEn51Bvcfp7pQCEVLtOveVwGQoe8Rz71VG419ybAAQBoHuPddca/vDKFu/64jXkoFMgYE14d1PizwYBngtGE89MxYoPGbLRydGKvNbhotQRZyvyv83KcbSoNvpsVB71n1Kutyj9thq2uriljxskevI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSOPR01MB17966.jpnprd01.prod.outlook.com (2603:1096:604:478::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 00:57:48 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 00:57:48 +0000
Message-ID: <87v7btetmc.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 1/9] ASoC: remove SND_SOC_POSSIBLE_xBx_xFx
To: Baojun Xu <baojun.xu@ti.com>,	Geert Uytterhoeven
 <geert+renesas@glider.be>,	Herve Codina <herve.codina@bootlin.com>,
	Jaroslav Kysela <perex@perex.cz>,	Kevin Lu <kevin-lu@ti.com>,	Liam Girdwood
 <lgirdwood@gmail.com>,	linux-sound@vger.kernel.org,	Mark Brown
 <broonie@kernel.org>,	Sen Wang <sen@ti.com>,	Shenghao Ding
 <shenghao-ding@ti.com>,	Support Opensource
 <support.opensource@diasemi.com>,	Takashi Iwai <tiwai@suse.com>,
	=?ISO-8859-1?Q?=22Uwe_Kleine-K=F6nig_=28The_Capable_Hub=29=22?=
 <u.kleine-koenig@baylibre.com>
In-Reply-To: <87wlw9etne.wl-kuninori.morimoto.gx@renesas.com>
References: <87wlw9etne.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 8 Jun 2026 00:57:48 +0000
X-ClientProxiedBy: TY4P286CA0047.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36e::16) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSOPR01MB17966:EE_
X-MS-Office365-Filtering-Correlation-Id: 84fcb099-be4d-4162-9353-08dec4f8f569
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|38350700014|921020|11063799006|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	EDsh8ZpEbEnMGCRD7Xm5rVryAEWk2qC1b+rZuvwtjWh361OC/W8/FWyuQZGClbUyUuZxw0ao835I0Q7Q77ZXNHZRTwEGDcQ+V5zbQEcsMBpVXJP8EQDuCrHS3cc+G2lXC1jWXS8kQYSuMPCMJfQKsCO7vlB82m1JJNkEpij5UekDCcUsnojOKIHHTMjqp1Rn3QaKaMAbjqjhYFbDXrBabpbCOagP6dtWTEX1xxy/3vR3sUG3KLyWbYQOvEOrnez2B/xlrLiQmO/FI3hBMhLVdYn7MFbcMatRfwWPSO2XAPzHktlzxug49gYeZB/tMHgIgW0bTOu4ybLsPNUy4K8M4+wWOYN+P+SpxlLYnDT/2cLVLrOJWMSdzWMk76HYavasbgTFmCO6e//4agJylr32lrc/lm9EVf8OOMtq9Tsa6pDGdqGeOKJ4n80HDEkI/6Qma+xh9RvzUtUiznXPHVEOoij8S7CRG1Q/E+pOZG8qGul6HgqTVHQCbuUaeRblLAmOERGx+PfSYrNGbi+HuAi8fD7sDkW+t2QYPk/hLbDbvtW0OvyWrK8W+h+MLz+MpG5N7/JpC8r3UEd6kG7SgNSQfp2k62e7lx7aNXiNLF7Zygs0P+wSYaMQ1z2sjzfg49qrt8m+oilneOcAxW0HGeB1EOXoYC2tnxMJXPFKL5wckPD9rp6O6imcomegQzeUD+jVESKz9ED9frDMVfwkA8oSMWagkzc5iAQRnKMiPpUjg5Tmek0ER3JeS+dUSbdQhDAlBUakZaeY3NyKspwvHtNOQw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014)(921020)(11063799006)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fpBD8n4bKcLaDbxdbwNCrKurXmbSTe6j/oRQ+lZrG1nCT0bldloJBYmZufmk?=
 =?us-ascii?Q?h9x/ZdBsQ798OIeYqKn3Z6G3o9VWpflPnhefxMqOqHLT80JMwNDxCmsME8AE?=
 =?us-ascii?Q?jp55cHsF9EvQTHi39E+nx8r1NjmkL8B4VNCucHwyiKeENK6GSQjGxOAKgU0l?=
 =?us-ascii?Q?R2cy8ibV8fGqgMLZSy4mxk0xurmxZtXM/EP7Yjy/OiOvRGxaBk0YxTyh8gw/?=
 =?us-ascii?Q?HwQ3iof2LvZhRI0+0gfuvIMbcFEgzfix1itGSkWmHejLwtWdWf/5WbEvs3p7?=
 =?us-ascii?Q?Bakc/CHrOCWBtwcM+iCVOEsOYZHtABodXU/9+1V6OO7z2BhTewzr9lGRGlo+?=
 =?us-ascii?Q?7QGsTQ5rTkRnm6oOfI7UgAtvN2yu+bGx2eaGN2LoXfuEqOozIdmZIINa3Wty?=
 =?us-ascii?Q?D58EuFPmWd4ImatjpZEVkhSKsTRglIPvg7jKMSfI9L9rghmfy+2d8x/8atul?=
 =?us-ascii?Q?ewhtnMI8b8otk/ZcIallvm9d5fWpVQ5oyS0KJCHvBlEbaO4ShUVmd+dtt673?=
 =?us-ascii?Q?0mUuulP+7bq22Xe55taDWeLoscHV9NgisjDn1tkzrh8j4ejgircz4suSYqpa?=
 =?us-ascii?Q?v17bwVYRx4T8s/C307+SaHtqPBHzOsCIIQl4s0+AoQllR2NzEjL8l5BuOyZH?=
 =?us-ascii?Q?cG+VfB+JtTv8YvmalrQfX9/hFMLLVzBi2m/Ld89d4Wzfx+7WAnafFXh9lXnF?=
 =?us-ascii?Q?K9lX3IjCzlAHV9prwFpdPH27RkZf299iHdrQR0duE5mmbdn5+SbLilfaU6BO?=
 =?us-ascii?Q?RAXfEX1xbQ04Km2u1iufiI4tJie2ta6f9XJbi9+w8tYFZ9aYuUSv0uOUtzb4?=
 =?us-ascii?Q?kgSEXoMSevopAynTWMgA0OQCkMKPw9ePzaXHFPSK3WcR8v85kawJNkFuXe3X?=
 =?us-ascii?Q?+79wU5zWp+akveR3lOXRXmtWhRnCkRdHULcv4DNdZGa5xT22TybCxaJM1+Pz?=
 =?us-ascii?Q?3PMB846+Dx1a+YYBDaqqcavp8qiwMh6kjZGnSmqyCQuqOL7tVINdvo4qzP7Z?=
 =?us-ascii?Q?+XTKKQgaxJ0c8GTn3wXZ2wiiszZaWxrSsbsu9znsjctx+vpd0h7RPo2RDeD7?=
 =?us-ascii?Q?H2ryyATcOo8ejwZTx4iZ+AnOFz53zXLthiQw6iTLokFv3fmkkdhNViEIyz0N?=
 =?us-ascii?Q?3l+XmEM6HwhmFh2ixeuu1FWSylkC9R7WVSKIWxNSwPzc85YDVgW1Ew3QXw09?=
 =?us-ascii?Q?TOV1s9m94qaQaRXjTXdK+8jdP5G1JAyWmvO0xCGBDQUUDfd+UPOKMeuNFJ4E?=
 =?us-ascii?Q?qlhO3FGOYQWW2K2vGD9+c6OwMZO8k4fISbAKLXpOF6GdnL+m7QPmA0dQxxsj?=
 =?us-ascii?Q?zTKg3fGDAid0dIW7l+mQh6NR5IIVXFKapaGvKq/eM02C7ck9vnt+go9DQeQd?=
 =?us-ascii?Q?Dx88TkmdVoAfmYWOoF6lft0p422n5DJpkc8lOLJef5JGs9xH0Tu/bMRTwGUe?=
 =?us-ascii?Q?9gnGaqeDMB908TQhF4YHMSnfxN9wk5b8Ml6q/IG0CchZ1EJGbYf/nlY0VsoF?=
 =?us-ascii?Q?RzxTZ0WpC7edeqNfIERUetPuEXLkiskoYMe1eTGBW1M5OeMdYib2+mXN+5lY?=
 =?us-ascii?Q?xr1m4FQQZHgiHavtvkbOYeqOm7pi1MXj2Rl8v/5RrbcUvBUOf1yYNn/y7x9O?=
 =?us-ascii?Q?BqygcGOHT1O9Hb9M4VFjhuXi+UzlL3sKtfiRTlDCm53Kw+yTHxop3+w7D73q?=
 =?us-ascii?Q?1Yn+IRLnUXFoDNS3wWyZVMI4Svin8TT32c5MFcZNqDgTbP0s8cW1+IU2rVw9?=
 =?us-ascii?Q?E9YoxT3oQag7rCwYaCXE4zVmwuQ07j8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84fcb099-be4d-4162-9353-08dec4f8f569
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 00:57:48.3873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 18oMHPNR4dSaUxWt/GcLWqVy8T7DzNLhV3B1HpLgo4cT8WahglaZ762rUchgU/0Unim/cleeGfTsOEJ8w6e8KOVINaWhi3RMywqgRT+Wp4GQtDPDiq3c/MGYAJcPsni0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOPR01MB17966

Clock provider / consumer selection is based on board, we can't select
automatically from software. Let's remove SND_SOC_POSSIBLE_xBx_xFx.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dai.h            |  8 --------
 sound/soc/codecs/ak4613.c          |  5 -----
 sound/soc/codecs/ak4619.c          |  6 ------
 sound/soc/codecs/da7213.c          |  5 -----
 sound/soc/codecs/pcm3168a.c        |  6 ------
 sound/soc/generic/test-component.c |  7 -------
 sound/soc/renesas/fsi.c            |  5 -----
 sound/soc/renesas/rcar/core.c      |  3 ---
 sound/soc/renesas/rcar/msiof.c     |  5 -----
 sound/soc/soc-core.c               | 15 ---------------
 sound/soc/soc-utils.c              |  7 -------
 11 files changed, 72 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index df010a91b3505..c40823ba54564 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -140,14 +140,6 @@ struct clk;
 #define SND_SOC_DAIFMT_BP_FC		SND_SOC_DAIFMT_CBP_CFC
 #define SND_SOC_DAIFMT_BC_FC		SND_SOC_DAIFMT_CBC_CFC
 
-/* Describes the possible PCM format */
-#define SND_SOC_POSSIBLE_DAIFMT_CLOCK_PROVIDER_SHIFT	48
-#define SND_SOC_POSSIBLE_DAIFMT_CLOCK_PROVIDER_MASK	(0xFFFFULL << SND_SOC_POSSIBLE_DAIFMT_CLOCK_PROVIDER_SHIFT)
-#define SND_SOC_POSSIBLE_DAIFMT_CBP_CFP			(0x1ULL    << SND_SOC_POSSIBLE_DAIFMT_CLOCK_PROVIDER_SHIFT)
-#define SND_SOC_POSSIBLE_DAIFMT_CBC_CFP			(0x2ULL    << SND_SOC_POSSIBLE_DAIFMT_CLOCK_PROVIDER_SHIFT)
-#define SND_SOC_POSSIBLE_DAIFMT_CBP_CFC			(0x4ULL    << SND_SOC_POSSIBLE_DAIFMT_CLOCK_PROVIDER_SHIFT)
-#define SND_SOC_POSSIBLE_DAIFMT_CBC_CFC			(0x8ULL    << SND_SOC_POSSIBLE_DAIFMT_CLOCK_PROVIDER_SHIFT)
-
 #define SND_SOC_DAIFMT_FORMAT_MASK		0x000f
 #define SND_SOC_DAIFMT_CLOCK_MASK		0x00f0
 #define SND_SOC_DAIFMT_INV_MASK			0x0f00
diff --git a/sound/soc/codecs/ak4613.c b/sound/soc/codecs/ak4613.c
index 3b198b9b46051..3e0696b5abf52 100644
--- a/sound/soc/codecs/ak4613.c
+++ b/sound/soc/codecs/ak4613.c
@@ -748,11 +748,6 @@ static int ak4613_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 	return 0;
 }
 
-/*
- * Select below from Sound Card, not Auto
- *	SND_SOC_DAIFMT_CBC_CFC
- *	SND_SOC_DAIFMT_CBP_CFP
- */
 static const u64 ak4613_dai_formats =
 	SND_SOC_POSSIBLE_DAIFMT_I2S	|
 	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
diff --git a/sound/soc/codecs/ak4619.c b/sound/soc/codecs/ak4619.c
index 755c002f0f159..192b0c3413968 100644
--- a/sound/soc/codecs/ak4619.c
+++ b/sound/soc/codecs/ak4619.c
@@ -778,12 +778,6 @@ static int ak4619_dai_startup(struct snd_pcm_substream *substream,
 }
 
 static u64 ak4619_dai_formats[] = {
-	/*
-	 * Select below from Sound Card, not here
-	 *	SND_SOC_DAIFMT_CBC_CFC
-	 *	SND_SOC_DAIFMT_CBP_CFP
-	 */
-
 	/* First Priority */
 	SND_SOC_POSSIBLE_DAIFMT_I2S	|
 	SND_SOC_POSSIBLE_DAIFMT_LEFT_J,
diff --git a/sound/soc/codecs/da7213.c b/sound/soc/codecs/da7213.c
index 98b8858ded025..4bf91ab2553a2 100644
--- a/sound/soc/codecs/da7213.c
+++ b/sound/soc/codecs/da7213.c
@@ -1720,11 +1720,6 @@ static int da7213_set_component_pll(struct snd_soc_component *component,
 	return _da7213_set_component_pll(component, pll_id, source, fref, fout);
 }
 
-/*
- * Select below from Sound Card, not Auto
- *	SND_SOC_DAIFMT_CBC_CFC
- *	SND_SOC_DAIFMT_CBP_CFP
- */
 static const u64 da7213_dai_formats =
 	SND_SOC_POSSIBLE_DAIFMT_I2S	|
 	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
diff --git a/sound/soc/codecs/pcm3168a.c b/sound/soc/codecs/pcm3168a.c
index 4503f2f0724e6..55a7fd5f9251a 100644
--- a/sound/soc/codecs/pcm3168a.c
+++ b/sound/soc/codecs/pcm3168a.c
@@ -563,12 +563,6 @@ static int pcm3168a_hw_params(struct snd_pcm_substream *substream,
 }
 
 static const u64 pcm3168a_dai_formats[] = {
-	/*
-	 * Select below from Sound Card, not here
-	 *	SND_SOC_DAIFMT_CBC_CFC
-	 *	SND_SOC_DAIFMT_CBP_CFP
-	 */
-
 	/*
 	 * First Priority
 	 */
diff --git a/sound/soc/generic/test-component.c b/sound/soc/generic/test-component.c
index fc40d024152e6..6f9f498c4c5c1 100644
--- a/sound/soc/generic/test-component.c
+++ b/sound/soc/generic/test-component.c
@@ -191,13 +191,6 @@ static int test_dai_trigger(struct snd_pcm_substream *substream, int cmd, struct
 }
 
 static const u64 test_dai_formats =
-	/*
-	 * Select below from Sound Card, not auto
-	 *	SND_SOC_POSSIBLE_DAIFMT_BP_FP
-	 *	SND_SOC_POSSIBLE_DAIFMT_BC_FP
-	 *	SND_SOC_POSSIBLE_DAIFMT_BP_FC
-	 *	SND_SOC_POSSIBLE_DAIFMT_BC_FC
-	 */
 	SND_SOC_POSSIBLE_DAIFMT_I2S	|
 	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
 	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 8cbd7acc26f49..1eb3e83c0616c 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -1694,11 +1694,6 @@ static int fsi_dai_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-/*
- * Select below from Sound Card, not auto
- *	SND_SOC_DAIFMT_CBC_CFC
- *	SND_SOC_DAIFMT_CBP_CFP
- */
 static const u64 fsi_dai_formats =
 	SND_SOC_POSSIBLE_DAIFMT_I2S	|
 	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
diff --git a/sound/soc/renesas/rcar/core.c b/sound/soc/renesas/rcar/core.c
index 9ce56cd84f46d..82fbdd550714c 100644
--- a/sound/soc/renesas/rcar/core.c
+++ b/sound/soc/renesas/rcar/core.c
@@ -1058,9 +1058,6 @@ static const u64 rsnd_soc_dai_formats[] = {
 	 * 1st Priority
 	 *
 	 * Well tested formats.
-	 * Select below from Sound Card, not auto
-	 *	SND_SOC_DAIFMT_CBC_CFC
-	 *	SND_SOC_DAIFMT_CBP_CFP
 	 */
 	SND_SOC_POSSIBLE_DAIFMT_I2S	|
 	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
diff --git a/sound/soc/renesas/rcar/msiof.c b/sound/soc/renesas/rcar/msiof.c
index 2671abc028cce..128543fc4fc97 100644
--- a/sound/soc/renesas/rcar/msiof.c
+++ b/sound/soc/renesas/rcar/msiof.c
@@ -363,11 +363,6 @@ static int msiof_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	return 0;
 }
 
-/*
- * Select below from Sound Card, not auto
- *	SND_SOC_DAIFMT_CBC_CFC
- *	SND_SOC_DAIFMT_CBP_CFP
- */
 static const u64 msiof_dai_formats = SND_SOC_POSSIBLE_DAIFMT_I2S	|
 				     SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
 				     SND_SOC_POSSIBLE_DAIFMT_NB_NF;
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index e96dd4a3f46c7..4aa145dc5c570 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1401,21 +1401,6 @@ static void snd_soc_runtime_get_dai_fmt(struct snd_soc_pcm_runtime *rtd)
 		case SND_SOC_POSSIBLE_DAIFMT_IB_IF:
 			dai_fmt = (dai_fmt & ~SND_SOC_DAIFMT_INV_MASK) | SND_SOC_DAIFMT_IB_IF;
 			break;
-		/*
-		 * for clock provider / consumer
-		 */
-		case SND_SOC_POSSIBLE_DAIFMT_CBP_CFP:
-			dai_fmt = (dai_fmt & ~SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) | SND_SOC_DAIFMT_CBP_CFP;
-			break;
-		case SND_SOC_POSSIBLE_DAIFMT_CBC_CFP:
-			dai_fmt = (dai_fmt & ~SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) | SND_SOC_DAIFMT_CBC_CFP;
-			break;
-		case SND_SOC_POSSIBLE_DAIFMT_CBP_CFC:
-			dai_fmt = (dai_fmt & ~SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) | SND_SOC_DAIFMT_CBP_CFC;
-			break;
-		case SND_SOC_POSSIBLE_DAIFMT_CBC_CFC:
-			dai_fmt = (dai_fmt & ~SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) | SND_SOC_DAIFMT_CBC_CFC;
-			break;
 		}
 	}
 
diff --git a/sound/soc/soc-utils.c b/sound/soc/soc-utils.c
index 9cb7567e263eb..87e9c86ca4f88 100644
--- a/sound/soc/soc-utils.c
+++ b/sound/soc/soc-utils.c
@@ -183,13 +183,6 @@ static const struct snd_soc_component_driver dummy_codec = {
 			SNDRV_PCM_FMTBIT_U32_LE | \
 			SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE)
 
-/*
- * Select these from Sound Card Manually
- *	SND_SOC_POSSIBLE_DAIFMT_CBP_CFP
- *	SND_SOC_POSSIBLE_DAIFMT_CBP_CFC
- *	SND_SOC_POSSIBLE_DAIFMT_CBC_CFP
- *	SND_SOC_POSSIBLE_DAIFMT_CBC_CFC
- */
 static const u64 dummy_dai_formats =
 	SND_SOC_POSSIBLE_DAIFMT_I2S	|
 	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
-- 
2.53.0

