Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010046.outbound.protection.outlook.com [52.101.229.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A96C38238C
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 00:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785804215; cv=fail; b=jvOY9bb379OOQn6LAmo888bMMvrUQ9svMVuO1lnOQtY+RBN+YwLXXe+scVl08GKC3Tbah4mt0mzFdF0YhMVE8kNwfDaJcbx11h24anTxX0chl2/EQKfrfhw64nC2qKEC0emsJF+T3cpHgc06WYjwHhKZ1+yBBbOLFixL9UAygGs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785804215; c=relaxed/simple;
	bh=bsOoXr3KNp0ZLDzdrepgbxGvRLFs37JdrXQwOIdEfTU=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Ubi6ubFXM8tLdeDxAM+7rW4gn15oG4AEdKahP42O2THbLr0Zsdo3Ez6Hxsw3M4ZmUgzZ3Cos05COee8QcZrZum1n+hzPJGMga2j9MBKqIaHUn3Tyu/DyKhpQD1DXK5N75Te69zefG3MD+4Xf5NqtQjVRp6RB2jfNC9TRrtovJF4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Ampoh72u; arc=fail smtp.client-ip=52.101.229.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Ampoh72u"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gD3va61eMoFfxGQR1GoQqDotPz5r+n88N6ejyZ2+PR2W6yGq6x9IgooqKw89RpS506DJHVw6Saq3JI0NrJE2cTvwQIP/tJacUWOS6b4i3QiTIzul8IWS5qKGB0Nh6HYK51+ww/+HpLWf7xBMCj6wdqaeoC7YnoygOw8KVjWnq2dS5dyveOP4uzSlKJrdHvauclu8rSso46Tr4jPpeyk7bo6E4A1aXOaPetDGgLyyahqgSmleiKUphJ//6Rm4bsz0P4O2h+tbzOPJgf0Sa7pdxBzd1L700OxR452SmS1mR/DP9CThN55ttgEHWjTmV/iZWECSnbxY0L/BSkmdtga7Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+KTXAdik7W1QAWuEJJOwnCZW4vsZMBkUHQRG6iKiN00=;
 b=DrUG/bXTD6eFsFf+QjPo4wno8HjVJmZSV63y06fdH1DVLrLtqDZuDkWpkx/5p7Quj+ewaoYEjnl5xv+6eJGD7yVkfX3/7XTIksG0Qkah9YeLg3wZedV4iVz0jmc7GtHUFtoMYa//dTVzp7n50qxU4LEpi36YNndqYwJQhgKVHWmRUOxWK3D5HG9ZB3YFNwZMksPhyRII9qnSp960ZZFx2ktOPOz2ZAkSs+PV0F4i22Fu4OgiEYsd/H0IUVvF6Jak3SAAdh2sd+hB4N2sEcBXy0ubXJ2KrtmjRv7Vk85lykIckff2DerdSA3F86HIwFvrwWwVz2MgV+08tp+Vwwavhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+KTXAdik7W1QAWuEJJOwnCZW4vsZMBkUHQRG6iKiN00=;
 b=Ampoh72uaQgOklDRxrzdBeuM6VvEs804Wv1ejj7zyaQ3F17E+hAsTL3ttz8jk5sjvZO/tFBqyGq7thKTBhQXnm/cAlAOeTWhi2eOIRAlvle+7gn4UE4obHGcLYBq8HzwVUAZTuxR8R4Z1n06P94OBwE79hc6/1MsNH1FCi6TQw4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB18293.jpnprd01.prod.outlook.com (2603:1096:405:3ef::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 00:43:31 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 00:43:31 +0000
Message-ID: <87y0emvhos.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Lars-Peter Clausen <lars@metafoo.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 =?ISO-8859-2?Q?=22Martin_Povi=B9er=22?= <povik+lin@cutebit.org>,
 =?ISO-8859-1?Q?=22Nuno_S=E1=22?= <nuno.sa@analog.com>, Takashi Iwai
 <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 35/44] ASoC: codecs: ssm*: use .auto_selectable_formats
In-Reply-To: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
References: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 4 Aug 2026 00:43:31 +0000
X-ClientProxiedBy: TYCP286CA0227.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::14) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB18293:EE_
X-MS-Office365-Filtering-Correlation-Id: 490bde6d-9526-4deb-be1b-08def1c16858
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|376014|1800799024|366016|38350700014|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	LIyWMysX5niXktR9a3sFgm0oIVV0rVr7eR9RyyxUjxrraxVRa+ZXz7neEaePpmbtWpwaaCTaV/IbWLVecklqpQOdK8Jh2Z3W6sBpVmLIooI29mXBcl2rB0fInlGvXpX15SwXAn7IfLrxwZeIUs89Imxtn5yICsdWbGtVxfAfkSJbwxgoEkKzzkCoHymATwLJ2TMtQWsDTo8KCUp6YxmcMIVw1k8cbIoMUTNT5R9ZzuaevHgjyUbwmibSkwoZG5iIt7rT7jtbOBVQvoEc3N9rm4evz09CG4NHFS1Gmc/cY/ikBah269PikzUlr6rOzoi96ogylH7iR2y4kGrIBXvf4Wp2HyT3QF26oidlecwPX5hXnJm/GzHXSZyWfHG5PQMwVbH3t7q8sM9f4B7gBYrv7OI1JuUOZgmrZyfBU3fymR/zrHubdS41ld0fRNOM0Qu/iMyp2QEe6SmH7u4LZkG83m5tRmsT348ZuW3o+0tsHV0BzB2VmjQ6S1dQH2q8Uf9oaTcNLQzBW7UmIrVXC1RiifSU3ouXsU1UT2/BHQ09LZ1XVb7YiSM0Noe3QBRzpq3yfBUXkFQikvc48DUOxzxjd6K3r+/75BElXgiYqC1CVm0K2beyq2CE93vUHOHkoCw7VhW0E2zJ8XPnap+zmYrTT+/6j7NeM+WeTdhlRCa+4sJ5wFP6VzaUVZugEodIaVYI+gqdzIa/VyGwet7gVdoKki9F3OVJqIreCw8bzy5YaiQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(376014)(1800799024)(366016)(38350700014)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zleYLfS3KTK6PKwR3dgF00Xulbbzqr3z7dMv9MWx/45rO+gEj3oi8udDXJBd?=
 =?us-ascii?Q?GKaxplw5J6ys6GW81LHdnOP5OE2Bdt+CSBHyLRVP67xW+AFCCh83RP/O5YwR?=
 =?us-ascii?Q?++Dv9EnQXy4D2hPxvPV/c1NM1YdXuSCPmyX1+h/PNb8hheL6fFS/tojQh8Ku?=
 =?us-ascii?Q?EKWnTJ74Ss+GaIopeC3JwMjoRwj/6q9/NFdG4zwelbpRd1zvlKgqcSPpozTe?=
 =?us-ascii?Q?BqxjQE48Ieyy9yaSxzmNDzev/f0QZ/ZEvY/PWcDMS4guuPlEObzOQ+osAHTh?=
 =?us-ascii?Q?8+0BMekkUE5Wsi1kRtYfX3ekvdjcvbQSfr+aeNI77eAijQU5Xl8ruq0TQMYf?=
 =?us-ascii?Q?I18ROabktcEEIys3nB+NSDfntZ5KvMTKVLJVp1uZF6LcxoctganItVB3c2uL?=
 =?us-ascii?Q?odYkmDpyF35s3sJ+SnOX3fkBBUQcTg+KhMODgjg2fxSFyFW5luJ0SINcNGJu?=
 =?us-ascii?Q?l/6lsF7Ux7wHH0G3TgXMyXDtvJ/oclLGzQzu1JCCcuR4jhqgIiSEbYvcvM8G?=
 =?us-ascii?Q?+iFNLVUmTGcGpa/71TlxRgkn3Q4EvijMq/aQsxhLyoKoqaTIPnDJkz9x5L0r?=
 =?us-ascii?Q?RgI1qx9c1dtQ8T+ixKM6k+6amCg0YP0IP1QaCueoDvg73/+7j9nOIBBJKOZt?=
 =?us-ascii?Q?4bU1W1AIadHs2XyMob4Ox4d6S39nG0Y4mfkXPP6fZ8ENLa8q0s79YO33qZEX?=
 =?us-ascii?Q?tbP2d0esSWOtaXR+AeNuD50ChzkTMfLnP+HNlRo95kgdYFi3mfb0keLEmRXC?=
 =?us-ascii?Q?j37spHAY4ARezdUuct2sz/OW4OcfVqfou2+yBS9x3IgXOA69MUpsVNCylKVg?=
 =?us-ascii?Q?MegBA7EeUdrZvTEUhajOoi618pxNdiHYWpjqSwmkyWAJCmAK1Sx7WW++PX/m?=
 =?us-ascii?Q?L2rvBFd9U6AAeP87cw35AsA52nOJL/HCFpg/iNaBtnaD1imp/L6BO/YjnL/j?=
 =?us-ascii?Q?4pTsfJhPr6eGsv+9MG2RmCy9/3cSjphinn8y3Efq8ZpCbmWGCQHkyqkQbTJB?=
 =?us-ascii?Q?YiOqszZtLy1g7g35MuVZKNi65yR0AzD0S6r6IF0aKo07eI/+l5U5Y3N7vR6T?=
 =?us-ascii?Q?Lesf2AVolUFEofbLLvaSKOnv7NgAHO0uMcIZJ71S6ySuH3mMzhi1/dqSJLfa?=
 =?us-ascii?Q?MC8gH323AS6l9pUEmf9tqhuB3oyYBDLUzMOBTYTLV2c+IvEpS4XWmyHFi3A6?=
 =?us-ascii?Q?kGoIyw1bX84yz3FkMuAUPVW2+yEspykkEmvmemmPmsNNckGJyWjAnz3KX/sp?=
 =?us-ascii?Q?QwGsl+pzvzBu6jCbcvaOujczquS9c6KD8muT9noe7n3ta0YL5yeCobtf7aYF?=
 =?us-ascii?Q?r/SOex9wQhHazCnFwGdAsZaU0i46zGUbfX/L3M/fOM+TnQb3ytGjByiK+W9U?=
 =?us-ascii?Q?yMrfi8xz+0MlX1FbOQSlop3wOh2sI4bbd2IG+E5FdzPLrfqQs2axfTCwPNHH?=
 =?us-ascii?Q?p4MmskKRCYoMs1bKj0b3H61j3UuUeCXuS1h1vMK/wt1KhgUIpGpvmhFqhgQl?=
 =?us-ascii?Q?GW67+vUA0pLYGJzU9thyR6BBnyEvFe0+1rsfLCf5TgVtyPapMP5KezCQq5vc?=
 =?us-ascii?Q?eA6mh1cNrisit7CbEC4FkINvSxhhfUzF2l1lZRjI/E6Bme9x7D9slwaXEYgV?=
 =?us-ascii?Q?xcqgc4kFPAFjvV6XIiKM3elawN+s21jEyefjY96u1/fp5nh38X3EbHnwX8MJ?=
 =?us-ascii?Q?siyGE0UAket79rkc2lmlbIKs6hSVaDj6l+GADg8lQLRRKqR8d59sPtptHh/h?=
 =?us-ascii?Q?xZx6pdsrrRXbWAcbWv5rhxA9WjfCGyg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 490bde6d-9526-4deb-be1b-08def1c16858
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 00:43:31.5867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Im3nMow4fB5nzEqp1wI78H2Hn43TT7UzDpads2/0sXQDj0M4DohIiEs2PGVslRrsS6j3LubS5GppO/TZObOmj1GFyrmj8u61ichGNs+y5OCF5+KdLn4B/ULdTE/3j9Xq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB18293

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/ssm2518.c | 13 +++++++++++++
 sound/soc/codecs/ssm2602.c | 13 +++++++++++++
 sound/soc/codecs/ssm3515.c | 10 ++++++++++
 sound/soc/codecs/ssm4567.c | 13 +++++++++++++
 4 files changed, 49 insertions(+)

diff --git a/sound/soc/codecs/ssm2518.c b/sound/soc/codecs/ssm2518.c
index 5192569ba6a89..32e81b31479d1 100644
--- a/sound/soc/codecs/ssm2518.c
+++ b/sound/soc/codecs/ssm2518.c
@@ -620,12 +620,25 @@ static int ssm2518_startup(struct snd_pcm_substream *substream,
 #define SSM2518_FORMATS (SNDRV_PCM_FMTBIT_S8 | SNDRV_PCM_FMTBIT_S16_LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32)
 
+static const u64 ssm2518_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops ssm2518_dai_ops = {
 	.startup = ssm2518_startup,
 	.hw_params	= ssm2518_hw_params,
 	.mute_stream	= ssm2518_mute,
 	.set_fmt	= ssm2518_set_dai_fmt,
 	.set_tdm_slot	= ssm2518_set_tdm_slot,
+	.auto_selectable_formats	= &ssm2518_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/ssm2602.c b/sound/soc/codecs/ssm2602.c
index fccd2eacd7a6a..92df44f869155 100644
--- a/sound/soc/codecs/ssm2602.c
+++ b/sound/soc/codecs/ssm2602.c
@@ -523,12 +523,25 @@ static int ssm2602_set_bias_level(struct snd_soc_component *component,
 #define SSM2602_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 		SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 ssm2602_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops ssm2602_dai_ops = {
 	.startup	= ssm2602_startup,
 	.hw_params	= ssm2602_hw_params,
 	.mute_stream	= ssm2602_mute,
 	.set_sysclk	= ssm2602_set_dai_sysclk,
 	.set_fmt	= ssm2602_set_dai_fmt,
+	.auto_selectable_formats	= &ssm2602_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/ssm3515.c b/sound/soc/codecs/ssm3515.c
index 8c6665677a175..f71509237fca4 100644
--- a/sound/soc/codecs/ssm3515.c
+++ b/sound/soc/codecs/ssm3515.c
@@ -356,12 +356,22 @@ static int ssm3515_hw_free(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static const u64 ssm3515_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops ssm3515_dai_ops = {
 	.mute_stream	= ssm3515_mute,
 	.hw_params	= ssm3515_hw_params,
 	.set_fmt	= ssm3515_set_fmt,
 	.set_tdm_slot	= ssm3515_set_tdm_slot,
 	.hw_free	= ssm3515_hw_free,
+	.auto_selectable_formats	= &ssm3515_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver ssm3515_dai_driver = {
diff --git a/sound/soc/codecs/ssm4567.c b/sound/soc/codecs/ssm4567.c
index 8415dd163edd6..181047b38d3df 100644
--- a/sound/soc/codecs/ssm4567.c
+++ b/sound/soc/codecs/ssm4567.c
@@ -389,11 +389,24 @@ static int ssm4567_set_bias_level(struct snd_soc_component *component,
 	return ret;
 }
 
+static const u64 ssm4567_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_PDM	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops ssm4567_dai_ops = {
 	.hw_params	= ssm4567_hw_params,
 	.mute_stream	= ssm4567_mute,
 	.set_fmt	= ssm4567_set_dai_fmt,
 	.set_tdm_slot	= ssm4567_set_tdm_slot,
+	.auto_selectable_formats	= &ssm4567_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
-- 
2.53.0

