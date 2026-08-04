Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010028.outbound.protection.outlook.com [52.101.228.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0023803C5
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 00:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785804164; cv=fail; b=AppEXXKubcppMHqfBxRBU3dylRLs1nIQXGjW8XulGvmmb4uTnN244BFqL+kKfRihCZ/nxqwakhJf+GcVWt8HogKOilhN7+7NA4qyD2B6HQz3MpBJ0mRN5JFTxBS4GogZ1JcL2hJ8DneE4hqOPoVqe320sWHaa5OJTgjd9kdwJtc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785804164; c=relaxed/simple;
	bh=V3i1IFBnDRufSNFFZn0m7JcchwbQGAo8X4fxxFlhMR4=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=AQ0ie05Vw0gThOuJvw5tM/osht6CWOMbx40h34qt1GmZTWNAybIMoqSgdGO52vZzBS7I7ihtGFNUjcVriQACoe8RIa66L5uFfpQbnn2WCI5EiwphPh7Stni/aIFEHzHLgz9IP3jIGAwO7xCAgAN3H5taYIpcg8RXnkF30F+MUJk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Q0DyVm10; arc=fail smtp.client-ip=52.101.228.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Q0DyVm10"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MvVJo8LqqSnJe2+4bTtmZXMp5ZrzEWP8coLclKsQ1wEOPdh15Kq/1tfRWrGOfPThB6KdOQljYC4MpHdgQmN9vjZ30c9BuSMnjss/Clmy2+WseIx8kdGmwgVq78HMeIZnB/+/GFxU8nbkxDfOqPgRInFVipcvq2kQx5dKJ6P2CkHO1TVfLyLqgSRHfIvnN2baa0zlOGZqLZZfgM5d4DoOHZ/ugMYl2f71LajjYztFhiGKPRur3aYq2CmYG9hviJySPlCAbzzejWmea1+aPvam/NwsB5EgONT+3oqyuk+mI9401WwqB0WLHBbL8vuTQlnhwkIMhezpMrtI0t/LunDMVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uKIdWIpVKi9oLn+9cjgJ1IjPA7d0MXGIcRDQA25sOWY=;
 b=e9asVTK5sktJbzXmVHUTv8wFZEpVAWBZ4500HPdKtqYfMcR98HmxflTzpOdAvKXKjVhaMstjWpWlen47c31cNELBNutwR5daY11njXZH0WaoUK5bYhuugVaO9pvUgg156TM9jlfZKDD0vdFTA03osk+txxRp46w57Vz4l9/WSQZLULvbJhqrN5hNeaK7lHLnwOHLSlFd5CjQsO1nmr0BYLiVu3mFDBi/liDpIWaE97nzm0MhlrLUiw2GB6uA499nhwS/0H1sHmNKnjedLFpHD0/qtPJacf5olelftEe0+Fw74B6PbVgVFkGja7DYy+dP7otuB6G0a6ToDLMA/D2Hvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uKIdWIpVKi9oLn+9cjgJ1IjPA7d0MXGIcRDQA25sOWY=;
 b=Q0DyVm109vcS/wZSjupNX8xAgMGQFb+WdNXgJWfGeYNWb1/Q9KZkgNQxfrYcbHaUeyZD45Cj5tYYHOYy3NrvjzpUtFuzUs9Mb7/emnup9GIgEe9N62ZMAP8JGo+L3DOTSlHeyWjrRW1GN8v9eA6WHu8kl35p+4omCQp9tCcfSc8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB18168.jpnprd01.prod.outlook.com (2603:1096:405:3ee::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 00:42:40 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 00:42:40 +0000
Message-ID: <87bjbiwwan.wl-kuninori.morimoto.gx@renesas.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Jaroslav Kysela
 <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, =?ISO-8859-1?Q?=22Uw?=
 =?ISO-8859-1?Q?e_Kleine-K=F6nig_=28The_Capable_Hub=29=22?=
 <u.kleine-koenig@baylibre.com>
Cc: linux-sound@vger.kernel.org,
 "Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= (The Capable Hub)" <u.kleine-koenig@baylibre.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 26/44] ASoC: codecs: nau*: use .auto_selectable_formats
In-Reply-To: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
References: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 4 Aug 2026 00:42:40 +0000
X-ClientProxiedBy: TY4P286CA0139.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37f::19) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB18168:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a1077e9-4104-4bca-a9d5-08def1c14a09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|6133799003|11063799006|56012099006|22082099003|18002099003|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	tE5MLLAPKfuFbgI6YbH91ysmHhVrwPpCCCxNC03iIS7q30KBZ2syX+0r2bJG40yhIAFhQQrMUIRPGzNdPDuhn0Vmm5QIPtPvpkW8f2jLLVGAEdRDX8iDkG2Nw6z3THzj6fQjp+gs3CNw+WwN+HX7TbUZ7+bQpdUWEGixafqrej3797aaQ4DEbvxWwRP+LCJofMDSp3iRTM4/+HrDeduslac31AaMyJKhstEoDqMyWKJ3zVoKUtHdOYmecSoBMPwJQgC2CItPVkcs41nH1gVdgSmxzmiFutupNJisD4Of5wEulfp+MkuIFuCUVxl4r9hZM/E8OAx42xb6aw1Q780chhRmI25mtozs87uflFkjQ3zku7b5BjcBTlzw53FFxMpZ3BFju3A8sTBKcomnpwFCrdaDUxggujVKxf5uvh0Qy9XpPjy6KHJROgl/uaAPMz+TZ5lmzBOMGbdFUcouKx6Alup9CB+bMaGYqiKVvty16DyqB3SEUuq91lr79yn2rUN8Km6XES9wX+/2M8rlPzonAoRocXGinRhwt4yyDo/UNScUPNG6+cIaRlmB+sZgH9QXqjOC/CRyGyT4W32Xl9LloyqlXFjTS28BsWK7XZmgVNmvpdpOnugU1qPCmDwqwuhhkyJMkvtWpHC93ZlStGx7b5dQj3rALuiJVieOfNETi0qStxvHdjIFS/4vLVAP0tP7aNbftJJSYs2F+DHYIPCe4VTfqF7+OorA2zoowGa7dGQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(6133799003)(11063799006)(56012099006)(22082099003)(18002099003)(10067099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TiiypMvCi6K27WsrT9Zbv41rQsy4Rj9oa68/RpCB6qoncUybG0nunReIPlTl?=
 =?us-ascii?Q?NsCnX26mMYiYspZdJVQ3nwEZDsKJTOg3OIZSHRknFmsYKZQw59YMdbbntouZ?=
 =?us-ascii?Q?DVSsd5bQFGfnENUDrJrvKmiFGezswgx6s65zxnDIECzevVqs0KacyXUOvQ4y?=
 =?us-ascii?Q?fEHnZ+wD39rFOAIOwmMpDbfXXKEhBLbWIuZ4sT7ex9fJKxcbyAuC/KcFjRZo?=
 =?us-ascii?Q?EANfgdhdEL8cqLl5+rXfAhZIgR2VxV4qKyrKODVtLmevGSlP72OYSwKhV9CD?=
 =?us-ascii?Q?7IFsvYtFHxuoRl6KZ9FIE0Yd9pmQnVsgtgLgxXatfO2qjfAQUVtsHCofpqiO?=
 =?us-ascii?Q?fwHNJ89M11kkKvyxWtykdZR6UvEwVT6OR5xNx6eAa894m2/9cjHck+jmrUB8?=
 =?us-ascii?Q?vua6Alwb5O5syiFdSwOJkC7M1i6DrooJuWwcjIciG3IX/SYmjoeDU+PYOaLb?=
 =?us-ascii?Q?QF3KS4+9HBi9S0sI9CS4JB3U//krJCC3c57ORIipdEeOZKPOnEpTFV+SC62Y?=
 =?us-ascii?Q?Lv1eUjxlidGeW7Oi9EsxTODyEZWMWJcI4mtjR8MZ1K7t4YauawDF2vtpSAGu?=
 =?us-ascii?Q?O+7p79hbClY4GNEnT80kK1TW2wUROWfDVstQEkKFy4ck6bMMme+QP5gP4fHj?=
 =?us-ascii?Q?tKe+OmAqwY9g7I2VB2QAZ/EX5ZcGiLJ6jqkL0SviypSMyMHmEaNVdzCTGmth?=
 =?us-ascii?Q?yUnd81VSdpkrmNZVCV3x3Fg3sX6ADTGMDev1VbPWe+9QvrG8ZNzROjCXsM4o?=
 =?us-ascii?Q?+sdV9gNcdMxCg+SsAXrlQMvjMDqIU00yBOmbY5QgWFI8Gc6Sl7rSB2OzIeVW?=
 =?us-ascii?Q?MmSKmW/vM0FK9sfQRoPB5pbbj9e+pOAwB6+J9u3iidFNTU78ehG4ehMgtQfr?=
 =?us-ascii?Q?e/nP/3r9QkMkpSzIf8pktHGAjZVDWlKqio9j2u613WwK0lzcuLamDriYsfxI?=
 =?us-ascii?Q?izlfFwDRT8QdWvRDTSUup04WQn7OYN0dGQZDj4Ou/pCgQu+42YwM5YFarxPJ?=
 =?us-ascii?Q?KVh8Goa5fMJIYOurK+QTzj/fEHKjNQ4mr3qLyG6UWoDqItA+ntwbcf/NaQuT?=
 =?us-ascii?Q?GLlVZBocqg52DI1aXvS0h7koHhJXk36rkCRY2X/3F9L9lAYRPPHUwIqPBM7e?=
 =?us-ascii?Q?hJmLvbXEvVRBe7JXiY9Z0UpmW3E8tRjCRgjGen3fmxH70ZsWxaitVKCct35Q?=
 =?us-ascii?Q?xNM5rhbS5NeyxQHv/ZoObRB3LzkgCrqGV+aeQ48u7PTXn+1t7a36ivBKc3Wy?=
 =?us-ascii?Q?HtlTLF1Lm5kn4vYTTzxFLQmTB/l/2ofQwhPuFS8u5xt1fMJ8CS/MIOITOSKS?=
 =?us-ascii?Q?URmUZCkwjyzqPIzX2oSJ9RQ4Vo0dUwap1jY7zP6YCNoBFV1QVBZJfaJxFxLz?=
 =?us-ascii?Q?OuOC5ch4BPba1MiYjpHAVHjMt4xD4fLSAMlohbos3Ck5MduXV8briottU90J?=
 =?us-ascii?Q?KYUooB0Y6f3yGrTlMGD/I/TLJdbDC/d8lFkLzws/zDCrIRLG0MqsHW3GKoJ2?=
 =?us-ascii?Q?Rb2TxP2frOlMVyvLz+77Kwu9XA30rwoSe5mvbQ96bJsjKrGilwqzaVddpKYP?=
 =?us-ascii?Q?LHycBe7PmjLuGGBTH7Nittc+T3musOQ80JW2HroxBhZq3UdpEO/4o842zy3w?=
 =?us-ascii?Q?8zng5EIE0v67Dl0F0xqoYO34KDlxcZPllpTJ4QUAlKYDA9qHPZ0mZ3BgBR+G?=
 =?us-ascii?Q?Qgcs4x3lZ2InYR/KlANM/MlEIynfJQaTv7lr0Jyq5PgJ0sSX8vevkJqvmRca?=
 =?us-ascii?Q?EhBGXslJ/+UFct6Co6R25sAR0chKEWUhwhfszQD67aWB2aEDxMXr?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a1077e9-4104-4bca-a9d5-08def1c14a09
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 00:42:40.7741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pLi78c+pb747Oasdn9D9HKh3EaSJSfSVXCXrXckZvUEKej9xp03JeoxgcbdZ5L2qEasYrDiEXs04lmjemMVRwnV48eAm3C0/pbrrNgWaC+lGj5tOlvLwOmN2wFbAAaY1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB18168

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/nau8325.c | 11 +++++++++++
 sound/soc/codecs/nau8540.c | 11 +++++++++++
 sound/soc/codecs/nau8810.c | 12 ++++++++++++
 sound/soc/codecs/nau8821.c | 11 +++++++++++
 sound/soc/codecs/nau8822.c | 12 ++++++++++++
 sound/soc/codecs/nau8824.c | 11 +++++++++++
 sound/soc/codecs/nau8825.c | 11 +++++++++++
 7 files changed, 79 insertions(+)

diff --git a/sound/soc/codecs/nau8325.c b/sound/soc/codecs/nau8325.c
index 236d94c29c249..2c95ed00a681f 100644
--- a/sound/soc/codecs/nau8325.c
+++ b/sound/soc/codecs/nau8325.c
@@ -628,10 +628,21 @@ static const struct snd_soc_component_driver nau8325_component_driver = {
 	.num_dapm_routes = ARRAY_SIZE(nau8325_dapm_routes),
 };
 
+static const u64 nau8325_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops nau8325_dai_ops = {
 	.startup = nau8325_dai_startup,
 	.hw_params = nau8325_hw_params,
 	.set_fmt = nau8325_set_fmt,
+	.auto_selectable_formats = &nau8325_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 #define NAU8325_RATES SNDRV_PCM_RATE_8000_96000
diff --git a/sound/soc/codecs/nau8540.c b/sound/soc/codecs/nau8540.c
index fefbd5722c004..a939f4b7bb250 100644
--- a/sound/soc/codecs/nau8540.c
+++ b/sound/soc/codecs/nau8540.c
@@ -623,12 +623,23 @@ static int nau8540_dai_trigger(struct snd_pcm_substream *substream,
 	return ret;
 }
 
+static const u64 nau8540_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops nau8540_dai_ops = {
 	.startup = nau8540_dai_startup,
 	.hw_params = nau8540_hw_params,
 	.set_fmt = nau8540_set_fmt,
 	.set_tdm_slot = nau8540_set_tdm_slot,
 	.trigger = nau8540_dai_trigger,
+	.auto_selectable_formats = &nau8540_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 #define NAU8540_RATES SNDRV_PCM_RATE_8000_48000
diff --git a/sound/soc/codecs/nau8810.c b/sound/soc/codecs/nau8810.c
index a050387dd485f..eb3e93380678c 100644
--- a/sound/soc/codecs/nau8810.c
+++ b/sound/soc/codecs/nau8810.c
@@ -817,11 +817,23 @@ static int nau8810_set_bias_level(struct snd_soc_component *component,
 #define NAU8810_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 	SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 nau8810_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops nau8810_ops = {
 	.hw_params = nau8810_pcm_hw_params,
 	.set_fmt = nau8810_set_dai_fmt,
 	.set_sysclk = nau8810_set_sysclk,
 	.set_pll = nau8810_set_pll,
+	.auto_selectable_formats = &nau8810_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver nau8810_dai = {
diff --git a/sound/soc/codecs/nau8821.c b/sound/soc/codecs/nau8821.c
index c45c5b864ea4b..ecadbaee10379 100644
--- a/sound/soc/codecs/nau8821.c
+++ b/sound/soc/codecs/nau8821.c
@@ -981,11 +981,22 @@ static int nau8821_digital_mute(struct snd_soc_dai *dai, int mute,
 		NAU8821_R31_MUTE_CTRL, NAU8821_DAC_SOFT_MUTE, val);
 }
 
+static const u64 nau8821_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops nau8821_dai_ops = {
 	.startup = nau8821_dai_startup,
 	.hw_params = nau8821_hw_params,
 	.set_fmt = nau8821_set_dai_fmt,
 	.mute_stream = nau8821_digital_mute,
+	.auto_selectable_formats = &nau8821_selectable_formats,
+	.num_auto_selectable_formats = 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/nau8822.c b/sound/soc/codecs/nau8822.c
index 830164e991a79..20913d9f7be97 100644
--- a/sound/soc/codecs/nau8822.c
+++ b/sound/soc/codecs/nau8822.c
@@ -1026,12 +1026,24 @@ static int nau8822_set_bias_level(struct snd_soc_component *component,
 #define NAU8822_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 	SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 nau8822_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops nau8822_dai_ops = {
 	.hw_params	= nau8822_hw_params,
 	.mute_stream	= nau8822_mute,
 	.set_fmt	= nau8822_set_dai_fmt,
 	.set_sysclk	= nau8822_set_dai_sysclk,
 	.set_pll	= nau8822_set_pll,
+	.auto_selectable_formats	= &nau8822_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/nau8824.c b/sound/soc/codecs/nau8824.c
index 426a488ff2a34..853eb9472af92 100644
--- a/sound/soc/codecs/nau8824.c
+++ b/sound/soc/codecs/nau8824.c
@@ -1580,11 +1580,22 @@ static const struct snd_soc_component_driver nau8824_component_driver = {
 	.endianness		= 1,
 };
 
+static const u64 nau8824_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops nau8824_dai_ops = {
 	.startup = nau8824_dai_startup,
 	.hw_params = nau8824_hw_params,
 	.set_fmt = nau8824_set_fmt,
 	.set_tdm_slot = nau8824_set_tdm_slot,
+	.auto_selectable_formats = &nau8824_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 #define NAU8824_RATES SNDRV_PCM_RATE_8000_192000
diff --git a/sound/soc/codecs/nau8825.c b/sound/soc/codecs/nau8825.c
index ae83b778bf935..5165aeba4b675 100644
--- a/sound/soc/codecs/nau8825.c
+++ b/sound/soc/codecs/nau8825.c
@@ -1507,11 +1507,22 @@ static int nau8825_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
 	return 0;
 }
 
+static const u64 nau8825_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops nau8825_dai_ops = {
 	.startup	= nau8825_dai_startup,
 	.hw_params	= nau8825_hw_params,
 	.set_fmt	= nau8825_set_dai_fmt,
 	.set_tdm_slot	= nau8825_set_tdm_slot,
+	.auto_selectable_formats	= &nau8825_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 #define NAU8825_RATES	SNDRV_PCM_RATE_8000_192000
-- 
2.53.0

