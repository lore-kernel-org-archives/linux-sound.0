Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010040.outbound.protection.outlook.com [52.101.229.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF181386C9
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 00:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780964575; cv=fail; b=hPZ823YEYAwpTnJwn9cVXWGSsYGlmlfBff47tzwvUyUuHI81bM5tRKfUQbNNpRbsa9Cwu5aZr3aenk57vBOA8JMxUIig7Mh8cuYAidquPpTkQSXrCVPZKkzJzFi7j/DSkX7wx1z3cvyd9vuQuqLr9WNJwo8Dl92m1Wk4GnUsJrQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780964575; c=relaxed/simple;
	bh=p/rz1FQuiISe0C3C38DV6C5bSOHj4j3C8ew9y4PFBIo=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=VrmrD4KINGg2G4DvlrTUm4oAuisjeN1AvzdSsZ5YEHICHxTMqqdvsCzPdpSIEnrk+lv5NqX123JZJND5zmghpqxbQlzPm2ary+kr6QyAo0L9WPkazIcHKQNHKuL0Qkc+4ssudHQGaYZxAkeK6Aw2reMP4kq3/Qy/EPzcxbqTYH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Jz5CwFca; arc=fail smtp.client-ip=52.101.229.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Jz5CwFca"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fejjLgT6XaSbrVgwX0LFlShES1uNpsst4ScZTxWmmqgAxgDGhjOV3WxY1Sq5oSUSXrVsi+0RDLFveTyV6P4X1PVg2OA70mfBpnXuCuQb1VwcKH07LzuG2RoJeJ5iJZflxZ+uft46oo3Lzh0zUYZf8qRoPcX6rp7SjLWvk19fea/sa5jI22doUw94f6iP1vbIugIYZN2JyFqhRJRXw07Gw3SaMGuBA7OqyCQ6PNPQ6Napnr9ZpibFhLVi/b3QUeulGM/FDe1Zl/EKcQUIatG8pSN6VvtJkLOwRfkyY7YiJArY9cfbNE0CT36c+OC5w+fLdZiFkt49kUnX/ssxj30Grw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xFLQQnL3/T35WbK8GMjPATocCNe7EBImGVJwIlJsFNk=;
 b=puw4dn7xHa/PtZjygI9mE9Qm6dmAYmr2lsNSGcuaEHnv/OEVaQ0WrHjRi8G23tgGv7gH7zaVvtGrs3R270brO4ogFsVm76c8kyEk5XUD5tfHdYxlZPljnUhypQBmWVGXZc95LBnjRm2GynFBjD5tH5jBKtGRcTSzGl2s9EbbGkVYeGI21ZCGmdHIyCxTlXJvPPupCa/CT82YvMaApYR1+TwYvfbdcjUBErddRdLJ/G2PW2n0NIKpvfQsOcurGS+LyT/5+3UEkoTMhry/2n7dPa6qT62T6xzFWKDkdF2C2OatyuuIxBzpL5ucLR6wcfLY2qh1I8I9hwHRyXJZfMLaeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xFLQQnL3/T35WbK8GMjPATocCNe7EBImGVJwIlJsFNk=;
 b=Jz5CwFcabRbAJsizu1X9oD6XqrpbcFqV7TY5G2YQsXzpNmugXhQMAk2wTnukAIllQKm5GJIwVkbkkbwIC7GI7vv7yM4gz3PKr/5s3fHKNQwy4M+GweKhDNKf4ctiCaQmM2EZgHLmguncZ/0kw6jpr/f/Hb+K5TbPD/UuMJk/sZ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com (2603:1096:604:235::9)
 by TYYPR01MB12760.jpnprd01.prod.outlook.com (2603:1096:405:15e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 00:22:50 +0000
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834]) by OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834%3]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 00:22:50 +0000
Message-ID: <87tsrc36li.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 1/9] ASoC: remove SND_SOC_POSSIBLE_xBx_xFx
To: Baojun Xu <baojun.xu@ti.com>,	Geert Uytterhoeven
 <geert+renesas@glider.be>,	Herve Codina <herve.codina@bootlin.com>,
	Jaroslav Kysela <perex@perex.cz>,	Kevin Lu <kevin-lu@ti.com>,	Liam Girdwood
 <lgirdwood@gmail.com>,	linux-sound@vger.kernel.org,	Mark Brown
 <broonie@kernel.org>,	Sen Wang <sen@ti.com>,	Shenghao Ding
 <shenghao-ding@ti.com>,	Support Opensource
 <support.opensource@diasemi.com>,	Takashi Iwai <tiwai@suse.com>,
	=?ISO-8859-1?Q?=22Uwe_Kleine-K=F6nig_=28The_Capable_Hub=29=22?=
 <u.kleine-koenig@baylibre.com>
In-Reply-To: <87v7bs36m0.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7bs36m0.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 9 Jun 2026 00:22:50 +0000
X-ClientProxiedBy: TY4P301CA0103.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37b::18) To OSRPR01MB11811.jpnprd01.prod.outlook.com
 (2603:1096:604:235::9)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSRPR01MB11811:EE_|TYYPR01MB12760:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b008b94-fd40-4e41-faf2-08dec5bd3d75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|6133799003|22082099003|18002099003|38350700014|921020|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	Uo8LklkzUVBkeKU4Jj6XU2WmVYKF5GrZ8WfuLNAByHfAbQWImpi/srWJx8psGbryJc8SsqB01+nNuxX0LJbGgl8bGY737wZPG8TSl9KGitSlY3q8Y96KZ+l40bfgAPFxjB/slJqvsrbHtyQsX0Re9Cy1/OxtnVShChPJTb8XuHs1ImMGDGjYKADwrmyW87fKZNcIanitxaMSLC7kgdzWLGpTI+IOvkYb1PIYHQ2PKymykTHVuipD4weiHwqUb+uYrtKCq6j0Ck1O3duXo+7ZCm4bL6XFyTCvC+TFPDWfFsBOUL5Tud397c9Nq4CW8RWxydcNRZ76h0TzEwECyZrrjs5jVfsxkpyzolXsDoWaqWsRcZLv7xNM1RqG140EoI5YqfQKKfa4ic0seSD6k7wgz3Ot2sH44FXk0HqComLFWpXtCXkF7I7mwLI4O7CW/xy/3iP6ZRDyKkHtHUk1ehTbVsDyRQQf3QABmMFr5dSQ3rxZg1+18f9yiqKQqV32qP1f/BmDv91DBoGH2NWWpD7hyDwXGXj2ALYP4NspQGMJM5Ojy+Dn940FeWxOrYmuVqA733nBju7hpI0iNz30XpllHLUm/MAnS/0l/S2y6ceDNUBnEWXJca+lknS+XbyJimSZWkm0WODagwspmxaI3YRcch2YhcauZxpxY7YmYpbfvvr40YgCExcNs3QYpwgYxdM6AISARnWuGshL1XR7md8T9nTe9CiIgIygwLWFgoqA5EDqyl91OMjc1+DCNt/jW2XaQ5vAl5ycup7RuZvaknqVgw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11811.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(6133799003)(22082099003)(18002099003)(38350700014)(921020)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qiITWuKqxB/Bl1hFphonk+O2WXfBVgxwl0U2yDP160Yu5tM3fUJHoVqYXufL?=
 =?us-ascii?Q?6A6g66IF862YijuBXs+dqEQhSiw4eADMfUfjAtgA+C/8bjntdizVaFP/KevZ?=
 =?us-ascii?Q?jau42GQIRrglbrn7L1h/5/qBD8PFhUBqIUZvLX3Lq5tF8TOV9Yv+/aTJ5lAq?=
 =?us-ascii?Q?j+1rIj/w2NaVgcuasTuicMFt0/b5xa/knTUC8cReT2G29yk0+/igaSBePsNV?=
 =?us-ascii?Q?NEw/gDCYvJh1mfTMDbLHU0FwGOR5FHmmbz15h5Nc6vPw5fsV4mvWmkx96ge4?=
 =?us-ascii?Q?NDha2PuKw/bPUdqlSyAH5FQ605/1cUhVxjO1nRWTZOWBM8mtI4MnjFLNFSmF?=
 =?us-ascii?Q?sYuz3fui5rV22ADVyyLisbeNQ4SFunwtjPqrsnOFLELVp5wtzqDO/IPEwBZH?=
 =?us-ascii?Q?ZcWGnVe3gnIW9y+uPfk4YAk/3aiZJA5/IlVjHmemVKMNZMTrSf8cUK8yddh4?=
 =?us-ascii?Q?ms1NyHsPKaPfn8bkU9SWYd7lU4q8ZFVZPjtgozLhd4UDQMmjOcxSEjMkLwQo?=
 =?us-ascii?Q?jWQYvO6/nei2MJSjp1VRMw6PTnY1elPc2zwI50M3OLbhIsr7PYU992NP1+Ts?=
 =?us-ascii?Q?iAWw8scOm+WNw2+UoaBnn9XeLGzxgj7XMwoiVJb/V1F4fa+1OH0c9zr0Bfh9?=
 =?us-ascii?Q?i/kCQmIn9OObECtvc56nTWESqUJvNrMO1ZvFjhGfuxGSv1l1yuavjuqxR5c4?=
 =?us-ascii?Q?68v8dqR+Wci5ZE5Z3mTgHDJh+N+HB/nBk6YvkIoWmJStpZj5J+YPbCXh0OVF?=
 =?us-ascii?Q?CS2iCI9dgZ3aNpxu2q2CLU5Jcyss6IU0TjGaBb8+NK2juO2SBGVJnt32T0DK?=
 =?us-ascii?Q?inGRqWPOn8ydMW/OENuOq2IM5L1o7TtfG2E4PvpGEneb1ZE4Bip6mgZ0Fc1z?=
 =?us-ascii?Q?U2vppB3u9BNVJlAPLraCh2yKueUyrnO0wdRIWLjElH+qvXbgssGcdpTb5KXz?=
 =?us-ascii?Q?6lYg1f1aAXzpXMdSlxvMnVwx+DqHC2JztOxe62Vng0vj3OaVpfxQ6oYu2f6U?=
 =?us-ascii?Q?HaPsxfzqgMk9/X2pw555ZTh6c31wdFVyUkIs4Zu0YjZ/Sn0a7kpvnhknxtHx?=
 =?us-ascii?Q?1xcUyD3T3Qil/7EnyKQobSQShEt4CPQCrNKt23kihGuMM2JoCXIG3Pp25E08?=
 =?us-ascii?Q?WsBbrcMC5Cr4UgS6826t+sg00EyFvVZwhIDOoGr3wPOaddXCTWigbL2I00XN?=
 =?us-ascii?Q?vxZOOD9RoU0uIsD9bjEf32105xJ2OID2rIQmyA9I2Yi34dkBCarrRZofZMKc?=
 =?us-ascii?Q?rciG+m5EEKQNbNzgo7sE3TST63cOAeW6GRNrUi86e4WizxjI64tIB+ybEgNf?=
 =?us-ascii?Q?LKRfbSDOXO84tAyuJ2EIBN8H/nPojJnPaIG0wv8byojpmb5s6wTxH4Fq3KqB?=
 =?us-ascii?Q?efdO7MfluKe4fwdTSV6mRsDomQmVfs1a9aKxG1TikEYz5z/eyVKI43sMBw4i?=
 =?us-ascii?Q?VXKTFO15np6Y5Gvy+nvcl+B+EQTLF7WWekbgoQl3vQlMFVMp9rCI43Cz2IpC?=
 =?us-ascii?Q?cF6vpyn2LShNfgIuQjf57Oj110zE0xd52aq/i9nNcF0vFO+MsCIT3jwHGWV9?=
 =?us-ascii?Q?yR8uETGIGQTPFme/ET6J7d0Q/cOcFID3mklkPaZd2RnGwlVb7Q38u33gBuot?=
 =?us-ascii?Q?K3kzXfcpQsqPDyCyXIOv+Bns2aKPiBW5S0J9rJj7A5L8MEF3LpdXbY4T3s73?=
 =?us-ascii?Q?KjdTOEOPAU/3CqpbeQLIcXjoVsI25VANOEBHCNAmHvlDAHzgoias3/Pm4Rhj?=
 =?us-ascii?Q?aIvkFYLvvaggw+HkidnbhWKw5L7OE32UZQwWmCJgdDlca9gagrgT?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b008b94-fd40-4e41-faf2-08dec5bd3d75
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11811.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 00:22:50.5040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Ib3AHGgKUxyixeL56WtWITcOCpGUZAP0DgHPm5SFfH2E0AF/hvGtFJ/10o8worTBqSCWOrekMQTRH/D8TGmPTJKYQQZaH7moZfSU4lf4yXIGcOyvQTNaZ4MHEuDAq6x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12760

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

