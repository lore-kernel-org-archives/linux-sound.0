Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010031.outbound.protection.outlook.com [52.101.228.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26103C4555
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 05:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788152913; cv=fail; b=PD2c0bSD4qpReZz1zwEgzHN7HUEZGC4E6oyBhkndvvuLsHOf/6V7RVTlD3XaRDUCf3L0I15KEA3RcwzI9cHhXYcrC+bq0CRuz8IOqyEKOD3OgtnIjdf0GZL+Iwb79iiPFgiozFgXGfYq9UF3ZEsxawSbrx5y1Dyxt/IwBWIGGQA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788152913; c=relaxed/simple;
	bh=yu0UL//nS6FD/hI4jADH5QMuNys1puOxaUYMZDBDrlM=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=eeOh7UnycxLnjhnmJs2YUcCIc0CuyxE8kxmoPvzQEZxUyqt6Xk8je4Cpy8XK/er+ZvjeKqJirFbF9PFcJbw+J9EBLLc+CrhB2Fk9Frcu7t1oWUxSqF2Mq05zb0kkzmDYb4sZ/sTHbYsiRRpDpFs7k6/QEY+6kQhbRQDmL2LZn8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=XQzhgvy0; arc=fail smtp.client-ip=52.101.228.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="XQzhgvy0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HS0i3DgXDg+tzgpL6GfhLuGueNl6unVw+8gE50bq3PSPJYz6+LWcLaUz66ViWOhjJz8/68OiGTedVglZBKn+H10t/TguCi6d6ALJeO416VC9jQsd4gkkCpqq15zH7x2eXlI7r0gF7f9hDjrTBw8zX+wSGkEHNGvk7hxs+/M4xfB1I7nj0IvBO5vtL1zCbS1JD94p+X4pd1oZLyJuGK3pfEhBSoScL24qFa9rF8namnouQ+JCuSTLAoFtDcdi1CR5HzT74ev9JlPDKCb9d9P6uBsa2rcI/jGZfctCJV5uEGG0CTN2gC5vpkNsM0YI5QRgTQzKvDj07piiJrRgqnO7Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QE4U2vAcTah2VHUKRUuj39R8Bip59Ns0nqg7bTgQr44=;
 b=mx/uq2H5KcrxWqZ7JcVQJTBJr7iBpyaP3WN5fXbbLCk66CFxztc7ffA4Xxn/QUiPX2tTEvhLNo86g2C0BPOWN4taFFg165pxn77jSaj/t5/4PXcS5DSyHNjApjG8+wGCYZGSRJd4VVHoqiLJzoFvYbjPerM0lh/bEM+0v2NPowGa0NB2ydFYQStoYaGBuAeIHGTI341Rra46+WUf7lUhQitfK1QUVaK8dJxfAsD2fcXlgTsx3mFa0z4gGtZTCA/5QmkQ2g9CUn4MPbV8/eBcrWQvTvI2odBlKtV2rjiKZ7QsSLG9/7mga9SMRYfa++e4C48haQnuyxht8lusOEQzzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QE4U2vAcTah2VHUKRUuj39R8Bip59Ns0nqg7bTgQr44=;
 b=XQzhgvy02nT67yfOV9+M+ibdLVNUgMw0cPyj9qe5+QOPYCaUE2n/L1spvg0GhVNfD/3wqcD3LyZirf9FrvFJHMW547gLnwkOGQfcCELdlh5sVlOmd4WPttnnuKifl2FolKreiSM0U8j/6F1wJ1CgxfTwTmSUMk1fv0Sj+NWwUOw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by TY5PR01MB18382.jpnprd01.prod.outlook.com
 (2603:1096:405:3e5::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 05:08:29 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 05:08:29 +0000
Message-ID: <87se3uubaq.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 =?ISO-8859-1?Q?=22Uwe_Kleine-K=F6nig_=28The_Capable_Hub=29=22?=
 <u.kleine-koenig@baylibre.com>
Cc: linux-sound@vger.kernel.org,
 "Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= (The Capable Hub)" <u.kleine-koenig@baylibre.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 22/39] ASoC: codecs: ntp8*: use .auto_selectable_formats
In-Reply-To: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
References: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 31 Aug 2026 05:08:29 +0000
X-ClientProxiedBy: TYCP286CA0090.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::19) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|TY5PR01MB18382:EE_
X-MS-Office365-Filtering-Correlation-Id: ef690b35-cb35-4b03-87d1-08df071de589
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|1800799024|366016|376014|22082099003|18002099003|56012099006|11063799006|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	qNOPkx4AfEmQMEpphNL2KP+3uFkDwGtxwkCpDINF0LUaTxulOMdGxPZjx0gXiFVZMy5EsgQ9spPGJYq3ICGXikWFTHNt8ZNDcazwD6boBP/WLwM2hH4He3WUzD1gWnFUnf3yRssoFQhDf7p4V+IckQFw11C3G9IFAN7rIAR/TE2miTfmQvmQH+SB4s1hRFdF1rYb4zKvqTJolfFsENdTpLX2ZwYtVpGVe8iZM6Uny2ckl4E073luNTRM6aIJYz5Fkg6Herjt3Ho8wiZCELpIOnGznI7tGaYUFkiDIAqK95nwVV/3Y2poayE7lozbyXL+NWE6IUZPaaQ7BXIFiQecBB9xJW4mJFfEiUfwDGwRTSEWSvfp4ms32kZb9wrpEFvQ0Yw1Sr/j1HAeH7jqXJNvsVDvCoYJTxgF5cKlZmS6ChcbWcrRjyasPGIznnddX2dvgdja94HwWYvY3Pdmmx5JhPKHowi/O4Nl/JAo7+abbZNltAvHwAG7UNU4MvzA4OjPrl8i9oQmR+FabIoN4hNVniZsCbU/qHZ7NiKx2urYEnKKupE6lC5XnKOFRQP9Rd0HQ4V6aAss+1SQg/VBSyTMmCO3KoJiie9XMyRRyjEti6ifthdvdOZaTO0h2ckWQZmc+02BAYFfV9TdjZvoQXg8cRaNvQi3BuFZ9ttpVsq+RtUWEM+Ttg6te93ErA3zhKt1JGZaoLR7bIgToL0ZEaJnJApntwK12WVczV2jQaUwbAg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?H1LMgB4HW3kgh+FLiwfD76/mZidFBFd//PuUQkXa+UHzaU5tVlDDTNLuUwZ4?=
 =?us-ascii?Q?6fIm2Yjc7+4X+7qNfUBtGT3TI5Nuc7Hgni33To/6q56EWTOVCEWtOKGz8/9u?=
 =?us-ascii?Q?e6N3MmnON7OCTYDRhsvVpAgNhREMizYFFY1IV1IJmhseA9CGYFgT2jD07BQG?=
 =?us-ascii?Q?OrL/jBL/O27tL5EaWewKZ0dwqn11zAcU6Ab0/bhmCnpBOtPk7qjR/5x9QxkG?=
 =?us-ascii?Q?5cj4bIEeTBE6H1htQ+gO2ftPsROZ0buLGnoKi4EL2mtnPsGnCg5GvSMedjXe?=
 =?us-ascii?Q?k1EHSpBRKpxE/9SUNks7VKCy2xIT+znQHzCQiRJGN9Ie3agxlE+0VMgMmpT8?=
 =?us-ascii?Q?qH+ujTZhOPjg62wVnrhXTwoTs3oika/WGCDusIprEa0hneJF0hFdx7EQGtsb?=
 =?us-ascii?Q?GX5fdjaeTYRN96m6ZSaWtNYW61DLIgjmIX6y9fTw+B1GN/fi+LOOW5Fsjn6Z?=
 =?us-ascii?Q?7DeRojyokN3bnkfsgoQKhUZJKgxy3wMMPsINOnq9s+fW+etgGEvkiIZ7kv9+?=
 =?us-ascii?Q?tFQJn9F27SSI7Cs50hxw//zpKSPYZ0Wl/nO6tCclZhREXrcee/r5yzahsckz?=
 =?us-ascii?Q?oRacw8/ryDETVo5jrBEVSNIT769d+fn2ImtaItVyjl/6rz/GXRKFm3y3GNi7?=
 =?us-ascii?Q?h7I2XsOr6dgn92W8QPZJ5fKdLbuOJIV+McRfRuVESaoalspWfq179ggnNO7j?=
 =?us-ascii?Q?lhIus545sRxZl/f0WPMgKlORUsz7LUE2OH16Afoo/7FRjk00+E4R4DYPgmDH?=
 =?us-ascii?Q?CO1xPUmZbfD86wdAv5oAvbLjyJKlSGlnuVunDcfwVls4MK6nMrz/qOuKs6ZT?=
 =?us-ascii?Q?Q83oDm6FL0iLOxj197tRfpCFzYMggTpq808MoWWFRTYdyB+O9OUNzvHeLOFu?=
 =?us-ascii?Q?uwnhcfJ31onjT2MMTcKM5dwNg5dI0aqGgBN20NCLGLRU1bv66nBQsx4kleJS?=
 =?us-ascii?Q?RyFSt0GzreBBgNIeEs1a4KXgj90UomH3LvrbO8iRYqFIkrzS3VTWSN6nS0oq?=
 =?us-ascii?Q?lrfNPM3tjBnGCbXRNv+CZ2RqfL0/8eLlIHJHQ7xLj18hZZMkCZseiaySKf6H?=
 =?us-ascii?Q?sWsnl5JDZp+VFHyy1ifGRXiFGF2hd6uNwGq6tm+dGfEMj1NaGzPO/G7hZIvx?=
 =?us-ascii?Q?vxfuNDYeve8Ujhieys35G9R6xZg4kdQ8PwT4tmW3ZbRu4ErXzaOxzpACYrwf?=
 =?us-ascii?Q?SvX8bNYKrWD1b2M0V9tC2KWVbWLPdSI03PrdJp53qJRvt2+Dky8HYyF8piSk?=
 =?us-ascii?Q?fXtV4QDe7Y2ajitXnO+LmmxYHIkBYhKd1nB4yLoVo+TPkoRyhWJ8ebyJB8sE?=
 =?us-ascii?Q?kUKp7u4Tj3bQsuGUC+1vQwZmaB4IZyyRpHib5IbuK2MVlG8/2Vrlq4K+H3qP?=
 =?us-ascii?Q?yUQrIRTi5l+88jAUluEckkz4Hkj5Xpv2o37J0T/WUsysEc6eIvc8xUwex5Vg?=
 =?us-ascii?Q?i38yjV/vhNvd4mCDCs3s2bIfpPlCDYU1uSx0DydnZcPVrtfnOMY/+0SytR8o?=
 =?us-ascii?Q?F9xwY/JUmdt/kqub8R83kIJrS/AdzIv8wEjPYa9BXUlUAE5fcQrhQ20Amly/?=
 =?us-ascii?Q?4TXuDWz9ceC8yuvmw7P2al8yn+QzdVRHUdxOwZwKWfI24TB+9rgp9uwWRx+k?=
 =?us-ascii?Q?44WnSL5xzV92fkOi3UomWCXAHXOZvge3dP25uRPKreRITwukwz0OvYzntHBY?=
 =?us-ascii?Q?OQ3OGg7YMbxikRURxOM1Bp04sU0EESzrxtSe5I//ys8pDi2En1XK/W0rPjo2?=
 =?us-ascii?Q?rJNj2V5mGUbLCa/LzyhR5KYCSRqOtRAM07D9nulIEEAMMtt1BGI6?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef690b35-cb35-4b03-87d1-08df071de589
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 05:08:29.8248
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uMg3Zb4T4QcmJBdRTLQX+Oju7vLu4qHGlezwLhlmroZFdDRiu+Pupfhht+9dzFtLszPWBr/ttZoZkkjP+ZB3pFZukViDYs0HBv78Hh754J7xYDmdyCOdcpLZA/qKOAAU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY5PR01MB18382

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/ntp8835.c | 7 +++++++
 sound/soc/codecs/ntp8918.c | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/sound/soc/codecs/ntp8835.c b/sound/soc/codecs/ntp8835.c
index 5837b9379fee7..39620b84e214d 100644
--- a/sound/soc/codecs/ntp8835.c
+++ b/sound/soc/codecs/ntp8835.c
@@ -385,9 +385,16 @@ static int ntp8835_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	return 0;
 };
 
+static const u64 ntp8835_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops ntp8835_dai_ops = {
 	.hw_params = ntp8835_hw_params,
 	.set_fmt = ntp8835_set_fmt,
+	.auto_selectable_formats = &ntp8835_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver ntp8835_dai = {
diff --git a/sound/soc/codecs/ntp8918.c b/sound/soc/codecs/ntp8918.c
index a18d79aa80aaa..eca34fafc4e6c 100644
--- a/sound/soc/codecs/ntp8918.c
+++ b/sound/soc/codecs/ntp8918.c
@@ -306,10 +306,17 @@ static int ntp8918_digital_mute(struct snd_soc_dai *dai, int mute, int stream)
 					     mute_mask, mute ? mute_mask : 0);
 }
 
+static const u64 ntp8918_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops ntp8918_dai_ops = {
 	.hw_params = ntp8918_hw_params,
 	.set_fmt = ntp8918_set_fmt,
 	.mute_stream = ntp8918_digital_mute,
+	.auto_selectable_formats = &ntp8918_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver ntp8918_dai = {
-- 
2.53.0

