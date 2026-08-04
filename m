Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010014.outbound.protection.outlook.com [52.101.228.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB4F25B084
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 00:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785804186; cv=fail; b=nRIwQj5aP+3eRxmuTPTfxwZu7RlrUaMTyFO6wOWjr7zi6URvIRuQOwmmMzJuzKC5cwoZYDgE9rOQJQ7cRA5Iv1R2+zz/1FDE7YM/ArG22xgWl5CgsWpTxrxOEuoKZ9uVfBzwnZfLBscb4sNc5ZSBCSTppIHTbZVs1iJ4AEPB5sQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785804186; c=relaxed/simple;
	bh=88BEofkgh1ur2UTC4YJgUfLPHTwCAJg34ySfKR4exgQ=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=OIHt1l706W4xOthSKyUfObnybev2v+3XT0U0pNnaZjp6djy9RnQx6rKnj0ELHHSbuZl2Q3ifpPPG5XyQjfjXm5tnoEyPX0vzx+xXj6UBWPbfy7nbjr+j24WyKu1KcVZOUU6eE7J9A2OuQN03jpU0cck54+iEZYrtwWUZpMWXaVE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=EziGJscK; arc=fail smtp.client-ip=52.101.228.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="EziGJscK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=odJ9NfH3V4GXWZEGK2jmWq5BxyZDXx6rVZBzzASF1SMWexfMIy8W9oyfl3N8oFMufNKsh+uSF3IKOZgtyBNxQIVP9D8E98I8qpqE/DOBK7VTSHgIs7Lfnz6nHuUiwomlorgaXGi1qy58DSFoJdjn7N9vrDBHp6hFXEG60mLrFK3d7nGZjYLaovOqYPI2quLk+7WZ60qWoEoWpJCGODzJTCcoVE8SKrbcXcaQLvw8pWwXDqepLGleMMNmxD+blcHaQpuG5IDP1OZUfU+Q8A3kfWUkWdNhSqwjxxWVcVsAmEjxgnk25HUSD5CsqcawNhmRI2J7+nnB+b3utXlZC5zwvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V/Knvuz1AHEPIlnnQuflTVusPuI0bYtPKKjrnz/SLB0=;
 b=FKh7oborsD2LN/5yVxM61s06GLJ6HKLBOUY0Xaz99YlP7R1xWH1FjmsxZpf0lu4ucH4zhS/HZFK7ptpTjDCFnH+B/ndI+7PxkhZ7s8ooslyMDvLN/GU9/xoR3XfN9+BxrrCCI38XKiYclYNS4GbJ3sZqNfXNRRsDMfpGck/LsKlYtWCeO4YCDj1SVfuNueKst7nMPWHQW5pnpDlkJWv1oIr6C6pI5s7JjaltMy0FRka1SmYcw0jrnMNdSTkexRa8QwnQzOO1O5oe3Oqc5JnW5khH+VcDVNSM06whynZX9mTvT9+EIxicxfItx9tG+pWph6uZjkQDv5HvMce9HWw4ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V/Knvuz1AHEPIlnnQuflTVusPuI0bYtPKKjrnz/SLB0=;
 b=EziGJscKwrx86gvhdAyeihDS5ixnuh5Q8cEBuwGTXIhLGmAtvyYtUiyGX3LsD/EdNj/xVQ7SH+rtd7CtOPPQY+yB6vA06z+0zZRyBUOQmjUn513u/Y7+OWCE9CfuvzSiXdFl615CVDkYjWuHPnwchjV4Kz/Yq/v9FhnfSvYG87M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB18168.jpnprd01.prod.outlook.com (2603:1096:405:3ee::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 00:43:03 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 00:43:03 +0000
Message-ID: <877bm6wwa1.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Oder Chiou <oder_chiou@realtek.com>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 29/44] ASoC: codecs: rtq912*: use .auto_selectable_formats
In-Reply-To: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
References: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 4 Aug 2026 00:43:02 +0000
X-ClientProxiedBy: TYCPR01CA0159.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::15) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB18168:EE_
X-MS-Office365-Filtering-Correlation-Id: ee3819fc-a12e-4464-1a98-08def1c15712
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|11063799006|56012099006|22082099003|18002099003|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	3w5VXrZlNxXB5Vlr4ouiWA8Qp0vBG9Ac4ZUkoVEiTeHrtbOVNd13Vsz464lTdR5g8ttB0dzzQurkYpixKJPNs5pNtIOrtB5zonTurjsnv6kx3qer7X1dCv/nd4/HeIlbhXGn5qOaTYItzvsIA5izVf9vaA54NiP7zdyKqPG4jyg9wfKZk5zeGvkNlLy7epLg6rbvBTpm8TNHeGAqXT3j/NzckUFoqpopakoR7dTkF1oeizo9Tc2gorwJmPZmTj5vfyzRjiNQHYNUy3zGVxGeI+Pj/tx0XmTT+XBgPSFQB/2iuvsdUD18PkBqi1+KXR/+vchy2YlTiY+2tE5uS6/F0+qZt2Rw0Y3J3WcEs1oc21WBHCrZ3do6vzWpQZbmmCCPEfBZLCkbXP0EAThwWVFQ0gHW/h7BFHwc7EPUigTgi9AU23lzLPyJeyJRQ00puzKhSxJ+w6odX1PJUOBuKEoK3dFFTUxr0p65RXAB01EFGGyC+UtSOYO27fQtuVUTi4ezSi6lyBnXpEP61CSBGtxRV+Kf92nIY9wLJnXeTKZrUKQEFIt8yx85GbzFv9JTi31V//Ab9w6g8wliQiR0+s/n+FuS/vKRZcoMWHjcLbk26nXsSEIaNMepkZHoC7JMAx9a2fGqT9QfYRBi482EPc+1Z+fWPy9qUkgRe3p6hFH/TPuu474VLLEwp1qZaZu0dXrlJJ9VObd1+9kDj0Vl5SwYTnZ8/lYmA+EC6HrceJcEZwU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(11063799006)(56012099006)(22082099003)(18002099003)(10067099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UupE05BwnqlaA0+Lm5gulZCayVUMBsq4tJVdKWigArW+g62igC0XqHraKtpE?=
 =?us-ascii?Q?UoAWbG7b/97s53jQoPbh+k63tNNijhR9zcHwq+dLi0K3y4Ni9Jfd1GUsShKt?=
 =?us-ascii?Q?AJY/BjMg6Mnx5kWAN9I30Drf+/8FBiSQY9PxdTurlfhJArmBwq/9f9lFs2FT?=
 =?us-ascii?Q?tZepx2B43XGQnji6QkCeDi1XTcXgLasiJPYaTS5FqlYvvYciGRQjUubSsCsm?=
 =?us-ascii?Q?8PQG0qDbWoxipA96x7ycktxhryorNTQuuFr2vflCsWw3X7NaEDRhsxhyghgA?=
 =?us-ascii?Q?YMOF+2Nr6mG9YGtkc8HA5EubOftnwO5sH4w7fFvm6YAUSdnTZlVCdLqspJfa?=
 =?us-ascii?Q?h3kKHY8j9SM1fJJ5HXWBkl6eOvjuJwwRFtKi4ZfR30799kwRpLkTGMr3YVIp?=
 =?us-ascii?Q?cMhuTSTZY8TAJ/MmP8VkrnU/HN/1GLYJj8JTiVa6kpxmjaQEhknVGlb7x6eY?=
 =?us-ascii?Q?5obSfh6vnqQ+Ykqk7iafnjpxpFTD6Mt592mP/u441Z5cufYz+fMx7ZYCTne+?=
 =?us-ascii?Q?c19jKDwOuWZBmrhPYK90qkOYGUeNfyBFRMMeGfq0DtpNzpTfnKsJwTsN4CZ3?=
 =?us-ascii?Q?5HGQfwqsY7pMmQc8LLIl2M3HdTDuDBej9GXkUBey9RVUMSULQQVzSemzOQAm?=
 =?us-ascii?Q?GNQbIrqM9tqSPaKk+L91i1KtcFjBbUqd+TLMjGBMeNCwhMpvo+dvpbXSo7qs?=
 =?us-ascii?Q?Rg6XRKkhlvDvF4gRzP0rLP7amtR4c2HX7R/cphsTjNbIpmWiINCHoR+r7ac0?=
 =?us-ascii?Q?gQZ4hJ3+1ofpfrHuPDPpmz2D2cKhrKkFShGPlEwrpUCsNuEJWSxGLbWc6v6b?=
 =?us-ascii?Q?tg4n5+Zqh2ROlZSDw37S7G+v8p7gC+03eQgECL2u1dm97+Jh1jMs9zm7jcLY?=
 =?us-ascii?Q?IZJNtk9tRptdodC5hnD+tITzSwyXZej6eyxx66EBOQFKYmHlR0k132GZ3nVf?=
 =?us-ascii?Q?5i6aO2K77aZAz2VPsY298AoQc/xdNQhB7eOtRGBHbSjiYBeCId04S/IgnlYP?=
 =?us-ascii?Q?qkNWlafeHEq/POkqosftwwukBt0bcePDuCybOtHqMC4E4WBm2b4OFJUr4uhq?=
 =?us-ascii?Q?qYzmNZgKEFsIbEbxDz2u/f3GiudCKeS+9dx8zY8iSK+B/uX6qNVn8aRuDbTs?=
 =?us-ascii?Q?US3eNWOMTsFjCxM89pmR8P5KquDN0Rh2aYz3VjEoXloesC4nRPg+k2ng6W95?=
 =?us-ascii?Q?sQwejrMVLX/CZpclCm9KiXjwepm0fUy/tVvOxEpBjedvMn4x3yY+5DYw7XWu?=
 =?us-ascii?Q?r6lzBX0qffuxRI2gvyASxWebi7uy3SC6SdeJ6Es062Kv1ATy17Z/j9i9qmO2?=
 =?us-ascii?Q?5aw1wjYL2cG6V7COn5m6B7t41sDdpr86hthoKrCWKspg2kqSRG3ao8C7PwaE?=
 =?us-ascii?Q?oIwsjGIJ84CBEcbm3uOXt0l/5mXSN2009gkaTSbLcy/MH8KNmM9QGzOtC8NF?=
 =?us-ascii?Q?3/EwwjAxE7EZTRKE2CD1O0znAuIkU2hMsPWSxrAxQjOrb8Z4Fx6XRnc5/lUB?=
 =?us-ascii?Q?F7tAybnd1YSnVKRIwHEtsxwjgyNjVPOWg7teX0Dzcn5v/oPfcPUZnc9Nq1pe?=
 =?us-ascii?Q?knZ1mFPge2L9Q3sYh/voTo+QeyEMQD918g5VJ/EQMltcGaNd1XxFUiohFqao?=
 =?us-ascii?Q?JEGXjwQxDwIxzlK1EQ26dF3Q/NLn/oIiQ4p8vsCCEJSU2x2iIs5yqqr44vod?=
 =?us-ascii?Q?ncHVrVSp8KgupihunSFDWpb/1dX6tMve79Vfz02JhaEa10/VcOvUwj8rwkDF?=
 =?us-ascii?Q?4ftbktAhH1XJJFc/ZJ8T5A+dJmWqO1SzF4PFjZ3NTHg23bU0AZLj?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee3819fc-a12e-4464-1a98-08def1c15712
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 00:43:02.6331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Qzo9I/vpzk8S0GEV3525UFvrdqq0hOv2x/G6LkRbj26+pcIg45NFRznHAa2qx8FwnG1pa3p11H+u4JMP1Fvwyu9lW2SWwXTglIIraAewkI8aNopluzb2H8yrr0oV+9M
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB18168

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/rtq9124.c | 9 +++++++++
 sound/soc/codecs/rtq9128.c | 9 +++++++++
 2 files changed, 18 insertions(+)

diff --git a/sound/soc/codecs/rtq9124.c b/sound/soc/codecs/rtq9124.c
index 2a041894bc0c9..cc1c68752fde4 100644
--- a/sound/soc/codecs/rtq9124.c
+++ b/sound/soc/codecs/rtq9124.c
@@ -286,10 +286,19 @@ static int rtq9124_dai_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static const u64 rtq9124_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
+
 static const struct snd_soc_dai_ops rtq9124_dai_ops = {
 	.set_fmt	= rtq9124_dai_set_format,
 	.set_tdm_slot	= rtq9124_dai_set_tdm_slot,
 	.hw_params	= rtq9124_dai_hw_params,
+	.auto_selectable_formats	= &rtq9124_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver rtq9124_dai_driver = {
diff --git a/sound/soc/codecs/rtq9128.c b/sound/soc/codecs/rtq9128.c
index 573200e5062f5..9567e90c0b62a 100644
--- a/sound/soc/codecs/rtq9128.c
+++ b/sound/soc/codecs/rtq9128.c
@@ -727,11 +727,20 @@ static int rtq9128_dai_mute_stream(struct snd_soc_dai *dai, int mute, int stream
 	return ret < 0 ? ret : 0;
 }
 
+static const u64 rtq9128_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
+
 static const struct snd_soc_dai_ops rtq9128_dai_ops = {
 	.set_fmt = rtq9128_dai_set_fmt,
 	.set_tdm_slot = rtq9128_dai_set_tdm_slot,
 	.hw_params = rtq9128_dai_hw_params,
 	.mute_stream = rtq9128_dai_mute_stream,
+	.auto_selectable_formats	= &rtq9128_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
-- 
2.53.0

