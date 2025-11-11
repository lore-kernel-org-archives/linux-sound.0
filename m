Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010013.outbound.protection.outlook.com [52.101.229.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC121EA7EC
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820999; cv=fail; b=OYUWlH0B/mpcQ0KzxFvtKTVa37xI1Q7PpKQGlkZYJsDeKpXlS/O9GGxPh26F56ix4RyBWZWH0SnvaL8832yZ/qkr+jGbBMkI5maEA1ByiQHYM5qq9OKzktkz6HcQYGvEQDJQgPTrjsZIDKKML/1SRV++xebGVQZ1ZMAlxBfYVbM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820999; c=relaxed/simple;
	bh=8fcrRpqQ0z0LJpbauclayhShDM/rLymgk9fZ6kRGTds=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=L6vZBFE0/uFp7yg05w1PIdb9hhvMa9lQ6ZlLbVLTuESKy3eaRXredHi5r5vmLlR0BSuA536O1qS3kxQps5sO9t1ObxTMXegJ20MnLYwC3IL06W/VG6U2xXU/1m43CFrNX5NN0Sig+5RsjQE1pVr9qsYOxCg/EAkrlBjPmJuAfsE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=PgeaRVNr; arc=fail smtp.client-ip=52.101.229.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="PgeaRVNr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PjP78WQSv76W9goEIpSxrGXrMHW+zpNpgmTDppvRt4kNoGPLbzK6K0/5bdq9ioJuq38nAEejskxcIdx4T7bCH/rhKGBbQMgMTVcf39uIO7UpRuyaSh/ezKCrs/WKdAdBuh/1sdERmHgMWPUG5QRyMmLdB7tN8Ou6+QN1fxbSQg75kCkZstqdrjsq69A7yUdJPO+X7Q1543yP+AE7Y4OWCvPFggPctYue4xPJengLbfxbAUI4Dfp/8eaE6r7T7Gl/htCDM6giTxpOBJdS2CKRaDq9cOv3A2AWkJ+K883sf+46bZ5ieGrGnsJXXFLRmVYde1W4Nc98ZXIeOdrlDJM6+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bB9hau9vbznwa+HHT/2YEha81QAcZ8ZfIf2sPqqxm9E=;
 b=Ix2XtwVTI0VNrctDZwrL9cALrV/qGZLyiUAh5rUGUZH7pzLYn2JQYqKJQFZiQLPQlqozQsy/ZdstzRmBbtmJMfL7ptBAo/nmgql6whmWJjYidPUJukewhHu3xA3kF/T8WTGvbL3egV5Ah+8tqgC7EuzRVFGxtvjrY8EQ3MAl6eseYiCfy3egkOSJdJPi+FDZMhz/ZrF/MLzWUD/GKRyUCK8qSXQ4vdhAbIgQ3J6YHXRCQcLus+V89ycYv+mgQy817n95oBjGKvB1bM8agfe9gIhZ6bD9ThG0bndF+bkPGfMUn9MojoXJv15wsfzzKFbRR9+GaINGjVznmnzQ4VfldQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bB9hau9vbznwa+HHT/2YEha81QAcZ8ZfIf2sPqqxm9E=;
 b=PgeaRVNrn3mqHZRtauRETqRx+CDah3X0ogCcD3CmWMrRQ7EsKOWFH/zjtVneLdNaIeIncIu+7vYUFlPJBJ+uJDbe7/9xhwZ3a8fdb1TjbwnNb8BgKQMeEVZIlDsZ/V/C8/YrPTrMgCol4k6WAELLWPGvrAKDZ/l3l6a0+TkaWYQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB16440.jpnprd01.prod.outlook.com
 (2603:1096:405:147::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.11; Tue, 11 Nov
 2025 00:29:55 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:29:55 +0000
Message-ID: <87zf8txvgc.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 183/292] ASoC: codecs: wm8993: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:29:55 +0000
X-ClientProxiedBy: TYCP301CA0030.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB16440:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a514985-3096-411b-1440-08de20b97031
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vX3yEhpgwLiz8LwKzQgiP0ZTllx4jCtUxGZifSTNc7RFSfZZwy7pedBeju0H?=
 =?us-ascii?Q?WaAFDNClvezGcqTn4jrXk6gRJyu8UsYTRWJAFYNy3c0NOdC1Vas5pMqqu02K?=
 =?us-ascii?Q?YAUVBiZNi1acVg8aYCy9GW+sEQClGXnQMRIib2JdSkSuNoo7DhaVxDT3+cjH?=
 =?us-ascii?Q?VOok/2bMQOAyLTG1g/yEwUGNsfii8y/LfZlrA+fO/KJCQ4XpqkHqDcMfo2ob?=
 =?us-ascii?Q?206t08N3cUkPEn0nrrwoZJ7V3y/Ni3nu8pYEzSkKrdV2m5AMxoDARKrDgUoQ?=
 =?us-ascii?Q?dvQGxCSjx7NpTnUC+BthkY8/flwu+nnntUxHgFqtGK7p0Fpr5zXq59CJREHq?=
 =?us-ascii?Q?BwugbI7HEdDnzs9EOXcCpmHYtZO9006lyJVIvkwObWOYitT31E01AeGUWiu5?=
 =?us-ascii?Q?aDiENS0MaSBbhvRELupUBRSbrKtwtLFz4gf7f86y2qN+VfRf2w+EykTvgYAf?=
 =?us-ascii?Q?5FKQf/lYLQD5Y+B7hGBm/DpFwMTxHpIhPzgb1aqdm9tMM5GD3naTVxprGVqW?=
 =?us-ascii?Q?siK4Dt4FLMQ6luPXh0ydcT79+v3zIFPSE8vy/j8MeX4nSIGJp5pS/M+NmHt6?=
 =?us-ascii?Q?DyQjAxP/H9ycrSK11vlAxN59FJ+HqwR4bxtTNz2g+IGNpQQ16bQuA/iEzhbn?=
 =?us-ascii?Q?xXYiNgL8f/JwAjSYt8tXAAXHYWB88LOyYLjShZEcapWM/GOJqdyYiJUVqfLD?=
 =?us-ascii?Q?2AMeHE/89kZKQPI/Jw4u0F6yTwi1ZLlIJGv0jbCMGkyo07icQeSAeJhMA8zJ?=
 =?us-ascii?Q?FIm4eYHVdGXvPt7aaqgl/AqyxvN5XsMDP7jTPOG6AwFq7FGqCrIh5C8CNvyp?=
 =?us-ascii?Q?FzIBs3RwFH3RqETEQnOW5o3XR/u4s/DssFKtR2tNT8aR/YT0MLO5ddmABCF7?=
 =?us-ascii?Q?Jj92SgNqrRKCWRTArJNXlhK26tUl2JOiFDs7tu7hoHDNb4Agu+y2Aehz6ze4?=
 =?us-ascii?Q?cv9IMADid48Ojl8z9ZAHoTIlfuMAsNjO5ZFVNo/jzpsAgm1diyfyCsQFBawN?=
 =?us-ascii?Q?z6da5XvY8pGQu6okHJPb0gasCAcMiL0G8bF+GStXce0Wi1swqmgRYDZlasz7?=
 =?us-ascii?Q?ehPCUQmfQ8fHKm0gmlNcaK/sPfOFrQR23zwqmlqSFYbEQ3bPXYm8ZEXGmb3M?=
 =?us-ascii?Q?X0lvdH4zINzFv0XH5Anki2k5/rxPjIx9bE2wxkeRxXvIfHznqC2UGujbPjpW?=
 =?us-ascii?Q?9R4c3UfjSVQ4OhD2j+lVBTPo+A6Hf7Sw0Cpva67NGQj3c0Mbex6HGti8bC/V?=
 =?us-ascii?Q?uO+3YCNF7Hx8k0LW1vEkgopyuOXeOm7kO/w+3vmd5t6wRG6CbyAgVPlprS7s?=
 =?us-ascii?Q?yrgh6w5D7usnzePOP4pJxYhbMqGSZfS3vamgEwDftuuF32BCp0YbC470Q1mt?=
 =?us-ascii?Q?zKUq8P5h1ehS5Mv6x806NMrlY7yRFVCaPE6pDw4PeDtHmH/mZ8YIwzytgCTO?=
 =?us-ascii?Q?iOQtXbeteuNR2y6rsWbyYkHfgvCS4vJuk8pu5Q9PSpDbbDlHqJ2K2hivQ5YM?=
 =?us-ascii?Q?8/SpHW8FDV1I/I+UvDQSY6Zo7dfH490UkxC5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?H/V1JElKcepUBdsXJKNJftFRiaFff7Hvz3dce23TpNDczqBfRsN9qNSH6Nlj?=
 =?us-ascii?Q?gB4PG1epLbuqsO9uFhDMEpA0WvwD7wB09LFAqfJ78vHRjPzXtFk27QxsijR3?=
 =?us-ascii?Q?nS0/fAhIjYBBB2CdiZmzuwrHSjTssvEgmiVgmQnsah0UkASeXcDTKueRkbFw?=
 =?us-ascii?Q?OFWXR9U4gyV9Vb688hch4JNXhH9gbIFnCLTxe7KCqkMcJuZUBnEC8LGbsUBk?=
 =?us-ascii?Q?zFr9glBKP/FUbXHlS3zYEfuCWYMSVia5WPDQP+L0oppjU8qvRmvEeu+UdFHe?=
 =?us-ascii?Q?QwD8WGXpEUm5dRSl9zpPrawOS72LLPpTsOSqmfdky8S1EUWeIhR52JWZdUkD?=
 =?us-ascii?Q?86Xh43W7VUqyTMawHBMgWv4Thhz612AdU+L51f4LXBN+DS/y6yvY15T+YMGh?=
 =?us-ascii?Q?266uSkycCrctHwD6jPX9u8FUq6OKlPZlj5brzHSCXCVUt5zWhg7XlvspU56+?=
 =?us-ascii?Q?uRPdRKgnNf8qDmVn/qlm/jhqOcrZVDGe7rjbPb7LEGw/Bc2IOnTBU2Pdd4Ud?=
 =?us-ascii?Q?khZyXG01ZEwzsun+KxtsKy0+gbpxZ0tU7E8grDX4vcvMAlfVvVW7oEub/LQ4?=
 =?us-ascii?Q?lngBrNTRB7XZ43AYkwSnY7umMNM1o6VJR1Qog1gqeodha+Ad2oMgvHlmMxB5?=
 =?us-ascii?Q?zAJw+nd1ReqiIhikGO1v9fjYPUjpRbPqJ2O84wTg/BquzYpinRxgtPlyGVSs?=
 =?us-ascii?Q?2HTyUYqX9JPgPUf7Hn/06lu9ojkYumSBm0x1nZmS1iOkuhh1Fk5dgBqmLO7k?=
 =?us-ascii?Q?LXepeByqaFsTk3rtge8tt7iqUTtGGclbSaDz2z238XO5Ur6RqJilfzCg2JUV?=
 =?us-ascii?Q?2Z4AHjFqB2v+nf/89WEo03nLjO8gdvqEU385CpR7v2tCckCp9VARqvMr9fmm?=
 =?us-ascii?Q?QhUtMIea95G1gsXFnhCe7nCui1lkN+JNL4FEMZ/GzSYfk42M+6bwsPdA7q1j?=
 =?us-ascii?Q?TmTl0F9tsuQMMNG44/hcF/mHxMlVTSxfNkV4Zkb15CrfULACXwQhrTobJA3n?=
 =?us-ascii?Q?ledvmMYaoVuAhsVaeya2Nhn3QoFlKjisz9Toe8cjd6gpQ2r0iTOa/i8dyws4?=
 =?us-ascii?Q?8buiCO8vvS8DV1G3XmPTzF2mKPNZ4uZjfDLcP75dnFHyBDHYAkax3i1hV9Ch?=
 =?us-ascii?Q?G28+jVCOJL5jSMEV6VlHjQNQQr99h092Buw/DX2PWCNuInwan3i0oH1Rx5gB?=
 =?us-ascii?Q?UEMF5uV7jLe+60rBoZUAymTtnwlKzZ0CAo1sRGTwJTkteTbQkJaWevuKANjE?=
 =?us-ascii?Q?vJ/UHiVnGG63/eSX591Gj5U4gD6Ia7KvouX7VG2s1PzrKT+AUt/BDIcI+9cZ?=
 =?us-ascii?Q?IZ2Jj7uytuXF50x7wi9a5yx/DrFZXFOL6YCdyRVJVfMGHCJA0AE+OvjH1yys?=
 =?us-ascii?Q?5qZyrnP9w37OFYBEIrWKXgbRvozgrFIvV2lVKIU8ItoOLPafu48SzrIenyPN?=
 =?us-ascii?Q?tE62vLPKXvD+a3NgxbyEIzg3E0La3RXkguMgjUQFWNG3gSuSv/eLLSjoRlnR?=
 =?us-ascii?Q?DkWLqs/VL4c9lmNFvdwlxs/3sqxouvGoNDV3jm/HB1+gkAq0F/Z+e73WFxZk?=
 =?us-ascii?Q?Vdkai/KcXXbAiAvwm6rdICwuuVOAi86NWJ2AM1gXJtBGC1dDCLfrpFTcTw1f?=
 =?us-ascii?Q?vtweTB6BZeYXy/qH+Ilolag=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a514985-3096-411b-1440-08de20b97031
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:29:55.7437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +/89oOeOTALeZndkyurII0QiYanM0Qn3r/D6Xn5pIvlQ0UYT7m7MFe7zsXk2eKsKKnbKRTMiAujFAUt47ce9XbEr33+qN8B8priA40pi1Kd/KkwqALiu2rhyQt8tRIrk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB16440

This patch converts below functions.

dapm->dev					-> snd_soc_dapm_to_dev()
dapm->card					-> snd_soc_dapm_to_card()
dapm->component					-> snd_soc_dapm_to_component()

dapm_kcontrol_get_value()			-> snd_soc_dapm_kcontrol_get_value()

snd_soc_component_enable_pin()			-> snd_soc_dapm_enable_pin()
snd_soc_component_enable_pin_unlocked()		-> snd_soc_dapm_enable_pin_unlocked()
snd_soc_component_disable_pin()			-> snd_soc_dapm_disable_pin()
snd_soc_component_disable_pin_unlocked()	-> snd_soc_dapm_disable_pin_unlocked()
snd_soc_component_nc_pin()			-> snd_soc_dapm_nc_pin()
snd_soc_component_nc_pin_unlocked()		-> snd_soc_dapm_nc_pin_unlocked()
snd_soc_component_get_pin_status()		-> snd_soc_dapm_get_pin_status()
snd_soc_component_force_enable_pin()		-> snd_soc_dapm_force_enable_pin()
snd_soc_component_force_enable_pin_unlocked()	-> snd_soc_dapm_force_enable_pin_unlocked()
snd_soc_component_force_bias_level()		-> snd_soc_dapm_force_bias_level()
snd_soc_component_get_bias_level()		-> snd_soc_dapm_get_bias_level()
snd_soc_component_init_bias_level()		-> snd_soc_dapm_init_bias_level()
snd_soc_component_get_dapm()			-> snd_soc_component_to_dapm()

snd_soc_dapm_kcontrol_component()		-> snd_soc_dapm_kcontrol_to_component()
snd_soc_dapm_kcontrol_widget()			-> snd_soc_dapm_kcontrol_to_widget()
snd_soc_dapm_kcontrol_dapm()			-> snd_soc_dapm_kcontrol_to_dapm()
snd_soc_dapm_np_pin()				-> snd_soc_dapm_disable_pin()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/wm8993.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/wm8993.c b/sound/soc/codecs/wm8993.c
index 75d923c2c9cac..1c9299979898b 100644
--- a/sound/soc/codecs/wm8993.c
+++ b/sound/soc/codecs/wm8993.c
@@ -973,6 +973,7 @@ static int wm8993_set_bias_level(struct snd_soc_component *component,
 				 enum snd_soc_bias_level level)
 {
 	struct wm8993_priv *wm8993 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int ret;
 
 	wm_hubs_set_bias_level(component, level);
@@ -988,7 +989,7 @@ static int wm8993_set_bias_level(struct snd_soc_component *component,
 		break;
 
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 			ret = regulator_bulk_enable(ARRAY_SIZE(wm8993->supplies),
 						    wm8993->supplies);
 			if (ret != 0)
@@ -1482,7 +1483,7 @@ static struct snd_soc_dai_driver wm8993_dai = {
 static int wm8993_probe(struct snd_soc_component *component)
 {
 	struct wm8993_priv *wm8993 = snd_soc_component_get_drvdata(component);
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	wm8993->hubs_data.hp_startup_mode = 1;
 	wm8993->hubs_data.dcs_codes_l = -2;
@@ -1536,7 +1537,7 @@ static int wm8993_probe(struct snd_soc_component *component)
 	 * VMID as an output and can disable it.
 	 */
 	if (wm8993->pdata.lineout1_diff && wm8993->pdata.lineout2_diff)
-		dapm->idle_bias = false;
+		snd_soc_dapm_set_idle_bias(dapm, false);
 
 	return 0;
 
@@ -1546,6 +1547,7 @@ static int wm8993_probe(struct snd_soc_component *component)
 static int wm8993_suspend(struct snd_soc_component *component)
 {
 	struct wm8993_priv *wm8993 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int fll_fout = wm8993->fll_fout;
 	int fll_fref  = wm8993->fll_fref;
 	int ret;
@@ -1560,7 +1562,7 @@ static int wm8993_suspend(struct snd_soc_component *component)
 	wm8993->fll_fout = fll_fout;
 	wm8993->fll_fref = fll_fref;
 
-	snd_soc_component_force_bias_level(component, SND_SOC_BIAS_OFF);
+	snd_soc_dapm_force_bias_level(dapm, SND_SOC_BIAS_OFF);
 
 	return 0;
 }
@@ -1568,9 +1570,10 @@ static int wm8993_suspend(struct snd_soc_component *component)
 static int wm8993_resume(struct snd_soc_component *component)
 {
 	struct wm8993_priv *wm8993 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int ret;
 
-	snd_soc_component_force_bias_level(component, SND_SOC_BIAS_STANDBY);
+	snd_soc_dapm_force_bias_level(dapm, SND_SOC_BIAS_STANDBY);
 
 	/* Restart the FLL? */
 	if (wm8993->fll_fout) {
-- 
2.43.0

