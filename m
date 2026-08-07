Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011041.outbound.protection.outlook.com [40.107.74.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C06A22A4EE
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 00:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786064090; cv=fail; b=X0jM7lHYZsyydusiifHY2ff1tdu65ISUofhEGG02CoLXxEjvpHs9Ubsrhs8hG2fhhGI1Bpo+LBVUBpt/e5c2E6twAG04WlkfGoG58HvMJBbHi3ajd9YWdLQovyMFFOkh9vOigHk52TRtxU8/jOVfdNQqtcOko+gkWfIrey7iaGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786064090; c=relaxed/simple;
	bh=/q9kmsc4X56tmKxT0uz/wf7YCmVWeO0D8McPL3lsgEw=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=kOu30hXVxmWuwvp2jEbuM20zT0O1dsnymf/VpEUxbvV2H+Vg5AXvo7LlBXpVUPrCv4ue1jtFEHxnx1yc+XFxtLG6oL3+wIJPL0W+sN6zqZ/SEA+gCobF94FRGIyAFxICSWOYKLQv+w4BsP6H719N2v8+yONRbVzzIxseSQZnlGU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=AB2VFvXX; arc=fail smtp.client-ip=40.107.74.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="AB2VFvXX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lHAIlMFWdB5D+ZosSoalDsIWAploHqLY2SUM+8kTV2kIOi6/NAXCKmPgewhYWlkJpVxRnhI449rhWC4QKo4xhtq33rzin9IrPOg2s1Y/fhvSZFCJMdA3l6K5Mv/4BtYRHO46gsqJTCj20Y8iQAB/aR2ZR89J435iEQfnLBOdY7rCXVX9DmjUD6n2Hbx+YVRvGu+uUyflOqgjW2VkzM173YY0jajK/+NFhmRGNxws2slktx2NQU1HWrXcI6BwW6P7PgD4t6/eLXZfeiw4ifQ/a+Lyq544nqTHbq6SJR2xQeADlyBW45vnkUPscXCsbYrACW0qcXgZt4+Fr/SL9Gy7bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9krpdSrBAHnHBPS6QxrDLkRL6yExh0V/doJYueRXW8Y=;
 b=B0QdaRxn8ZUB+9IUkEeBToB2BCN7Mlj2LLepB05dpzhHf0ktEJ8d1LVT8Mkll9Nt/pnkN8+bpE6rjdbrCO6FNimSkjuXf05baz6v6IJe4/s3VPsxNuax2Lfmncc+0xFQi8AtQIlHWi4Eb8jbSPLRC8FtcDNpem1P2t4fpFNqt/Hj5F355iNulU/ulcss3Zen7ub5eq3yz6lIKjtU96uwYIL4etZ/J0mKT4VyCM20HmqvWCm/gUbdkIA8XTCOYSx9SpEXUFbViwTiMBjINJggB6TsYKeF4CpniB8MhjRxTqnYZX9ujw32I6FUbUuMYW9IdPQIGoOJlT4CnjUEgj6dgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9krpdSrBAHnHBPS6QxrDLkRL6yExh0V/doJYueRXW8Y=;
 b=AB2VFvXXBtfd3T3CFuzzJkM7sVVSkXyLog73DBZno09vZH177eBfvtrEf+wDFbh5MH1ZHp++J/MJ8DWqXF9fbAPmPScg065WJExELXRHiR5+/ti9zAD//62WovGbEJjqGSc4MLVnEMeT1Ovgp4Sy0BFgiR5QMxEhDIoJFIPMrHM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS7PR01MB14460.jpnprd01.prod.outlook.com (2603:1096:604:38d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 00:54:46 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 00:54:46 +0000
Message-ID: <87ik5mu4ve.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>, bui duc phuc <phucduc.bui@gmail.com>, Hsieh Hung-En <hungen3108@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, Zhang Yi <zhangyi@everest-semi.com>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH v2 17/44] ASoC: codecs: es*: use .auto_selectable_formats
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
In-Reply-To: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
References: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 7 Aug 2026 00:54:45 +0000
X-ClientProxiedBy: TYCP286CA0331.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::10) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS7PR01MB14460:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b434b48-65e1-4400-b43c-08def41e798a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|366016|1800799024|376014|11063799006|56012099006|10067099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	4pHR9U1WX6Z/O7yelYPGaLTGojZ1ZvWe21Oe+Iua6tr+vvcWHcpNxHaBRLVaVxQEH8i7mEVnJLVQxsxREbQe2aeOQEyIFFfkw1edIfzm33gaNYgOBQanEbu6CaGSdluKXTBmkv2F2JAIG71R3s8HOOOzko7wQShiuQNRVoIqQ/YVGUmSeU7Vz8sj/GZ/Fc7j97qphc1tDEofQDmJnlVK7EiZiv6MfVSVI9o+awxIfJNsG6TIJbvp2lwnc/yP2OdCN+nmEYzUYcO3S9EPAY2CxM+1OL936dS84yv0nj7nKrH/YmjyF010T8noMM5Qsp7FLP356svYzDbsHlz0oCvQzNhI6SoGKv3C3rAIfvx1tg/O6wKnXqL4fNF8E25SwlbZynVpuK6JA6uzcd9EzB+Ktp1w2QNY43zCy5Cl+foJg0hSqR4PlOyrY6wTSaVXuzT63ITb7BCI0xG5CwckWq/B+324Ka8w6ip46R38SHF9vcsxilim9JaKHKMUT6alygOJPbubQkK0mdrXtJSfHY44Ab0FCCrC5g8okw4hPymoAakhITQWMOhKgAfaf0EafG68e0nL6jD8aeRZZfI/byhodNgN2tqN0Zi2mXUTX6z8ebm4j72zeyTwrUPSzAxE18F28enjHi858WjnpwDSMfnfWx8UTAQga0t1pxczYIekQm5R+/QaEtEZitaDBTND21jl8BKm4v23ALA6BPN9O5g6kp69XcZhBjLod0GVUFyyVFo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(366016)(1800799024)(376014)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YaDR0s36uiuJExlSbA/iZsnTK5McjJD4/QrDNyI2OhTE0TFq8MlPxTm40ibu?=
 =?us-ascii?Q?CSLYtz0F3KG18Dma5rPdDFVQAoFYjAyQlBFAZBKIE2QuA2uNUAgR4TqM7sup?=
 =?us-ascii?Q?evWmVEjXDPXyjqSdaXVaDmcbz+QYrkFxVif8C4HwMiKg7ypGrvTMXLxsMIsW?=
 =?us-ascii?Q?zf0jw4VsTIhwomeDm3oM+D7qmHL/WaDMb+maBrFpg38Cfp6S7beLAGTJPCbZ?=
 =?us-ascii?Q?f1bMyM14SdMUURjwfZbY22mK8o+N6+8rCmIB+Z3/8FP2qBJD6ghfSdpkFwmK?=
 =?us-ascii?Q?Zi9lACI2tD3LLFEZFoQ+JIVkL/Hndg5K6IdSI9zbzfQM3teq5Zoeg5iM6wwb?=
 =?us-ascii?Q?xIsq2Xkhb4u8hz1NSTqpc2uSsA+ck4u+vcUYfUB9DbYfylJdevL6x67Uz3RD?=
 =?us-ascii?Q?EsTPlC3b/Ne8LzL1rAtfSIRk/oJYdB3nmfUD5U4GuRET5tQ9HXGtNQQtC/Ws?=
 =?us-ascii?Q?+EvpQ820bjRE+BBrWiaNL9txtkRky7fHm/PlwU8TmUXcYoXyLAssRMvhSRgo?=
 =?us-ascii?Q?4Qm/UCHiVH9Dx10t6iEzkJYLcX8LzsvA/6mdxNKSv7cnJS3op1SKsV2M0S/C?=
 =?us-ascii?Q?6L07uejiyoaE7Qa1/hKLdWtbAPMQMRyqimsXwDyZtX+XAcRUlVLYPu2NCJOG?=
 =?us-ascii?Q?4wyYDuESrOowiDotlRABCZLsjxMt4abPJpJ88xk8rN2MKOHEWhOlRXjgieDW?=
 =?us-ascii?Q?ZPXaUMV1pcmxcZEhV0qIGUM0LIiDG05WS/2KmiWlEK1Tt2pL9jQ4rEuMvAyZ?=
 =?us-ascii?Q?MbhN03A7tAFSwgTXVl37bZnPaoo02fga6r0aygsxySJGZyu7QvDIo9mB2Gri?=
 =?us-ascii?Q?uyExYNjhhPLZDs5QXh3CBd07zk7cpSrrk2tCW9Cy0KCyDhq4POj///8LKfwp?=
 =?us-ascii?Q?x9gvGlQWA91zh2PsXd8b/awa4DAyId4z20Z9ckPCqCWx9zLgRSTs2RO3vP+F?=
 =?us-ascii?Q?PQf4lR4ftCkmrTJiJ7fn4YaHLFkIjnXLlUbUULkdxYtAoFYWH+WGYhhDYkGF?=
 =?us-ascii?Q?YtIN2Z+ArpseBsj14u9ISI7U7OshugBQA4C9nkmJsi8z+alL1kR92QvsY7sS?=
 =?us-ascii?Q?TDvq7jpdpHKUe7e5p16o6pkP1zXbRwJ3jcmF96RXcMUFMP0wga6YTBe10hKU?=
 =?us-ascii?Q?0e5pQpPnkvvRa0rGowxudHQHeMoESFYYxRidai1hiTQBrWi1YxfMVaZcwp1a?=
 =?us-ascii?Q?xjpJ9lBxg9+DhgIZYrYRTAXWa6TZ7B9icYBQioaxYZ3MqbJZGK9CsNT9kI0+?=
 =?us-ascii?Q?Kd47JZegSbfk74PXo1+KgzBgHCSsywRJq0hYD/0SH9IBBgUIYrugLED88DCP?=
 =?us-ascii?Q?2yUYrJQYX+K2jYqYxDrsYmjwP0fhkkF+FBuB1uNo/MEPsstyKi8l9mx8I7xz?=
 =?us-ascii?Q?grbObFWZXmLg3zS81uBvEC00mW8adxv6XkyoftxqMdCJ03RZ8xqF+850fjZW?=
 =?us-ascii?Q?6q0MwXSsDt7nkTnztKAPX++g+p3lBl2vjqwjlR4WJNl1oiHc+QipyTo1eoZx?=
 =?us-ascii?Q?eakhpPmon/tl9Gv4GkiYdnj1SwcVdx2gYbPKsU4Pjl7V9xpX1/mvREL7jq/E?=
 =?us-ascii?Q?jDE2mFD2shNhT2gvlUXleKUPGzaJ7k8ND2tj8OF480Q5H9copIiDlnl18iEd?=
 =?us-ascii?Q?ptskacpfgdcHlja0gv/19h13XgjFhI1kcT2lrz1aUo4f51LU61KS8XcLl0Oi?=
 =?us-ascii?Q?qRBkO1/TrqjEu0qskAw1cq/uZiMuUojVRpMbQCBdT+SNq7Yrpa2vkHjbudgX?=
 =?us-ascii?Q?W7sNiMiv+8hYMPQiV96PjkGRuz4O+DkUz/WEwhvLb+R7oKvn+EZX?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b434b48-65e1-4400-b43c-08def41e798a
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 00:54:45.9804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i85uYmQKGAF8Wl40dAX8yBXrE2AJe4Iyh4+f7hrLCPS03PujIjLXyPOBoKnBPO3AaBXnUeMXirk+fJe48FdEJMU7HttS5a6R46Ypk9I2QMn42ggaK5LNtafuj72ouLtN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14460

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/es7134.c |  6 ++++++
 sound/soc/codecs/es7241.c |  7 +++++++
 sound/soc/codecs/es8311.c | 18 ++++++++++++++++++
 sound/soc/codecs/es8316.c |  9 +++++++++
 sound/soc/codecs/es8323.c | 13 +++++++++++++
 sound/soc/codecs/es8326.c |  9 +++++++++
 sound/soc/codecs/es8328.c |  7 +++++++
 sound/soc/codecs/es8375.c | 12 ++++++++++++
 sound/soc/codecs/es8389.c |  9 +++++++++
 9 files changed, 90 insertions(+)

diff --git a/sound/soc/codecs/es7134.c b/sound/soc/codecs/es7134.c
index 441df1523f1c9..e3e6142ca0288 100644
--- a/sound/soc/codecs/es7134.c
+++ b/sound/soc/codecs/es7134.c
@@ -130,10 +130,16 @@ static int es7134_component_probe(struct snd_soc_component *c)
 	return 0;
 }
 
+static const u64 es7134_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF;
+
 static const struct snd_soc_dai_ops es7134_dai_ops = {
 	.set_fmt	= es7134_set_fmt,
 	.hw_params	= es7134_hw_params,
 	.set_sysclk	= es7134_set_sysclk,
+	.auto_selectable_formats	= &es7134_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver es7134_dai = {
diff --git a/sound/soc/codecs/es7241.c b/sound/soc/codecs/es7241.c
index 339553cfbb48e..a0bd5386387d4 100644
--- a/sound/soc/codecs/es7241.c
+++ b/sound/soc/codecs/es7241.c
@@ -152,10 +152,17 @@ static int es7241_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	return 0;
 }
 
+static const u64 es7241_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF;
+
 static const struct snd_soc_dai_ops es7241_dai_ops = {
 	.set_fmt	= es7241_set_fmt,
 	.hw_params	= es7241_hw_params,
 	.set_sysclk	= es7241_set_sysclk,
+	.auto_selectable_formats	= &es7241_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver es7241_dai = {
diff --git a/sound/soc/codecs/es8311.c b/sound/soc/codecs/es8311.c
index 6fe3ae41afbd5..69289cb1d3180 100644
--- a/sound/soc/codecs/es8311.c
+++ b/sound/soc/codecs/es8311.c
@@ -800,12 +800,30 @@ static int es8311_set_bias_level(struct snd_soc_component *component,
 	return 0;
 }
 
+static const u64 es8311_selectable_formats[] = {
+	/* Hi Priority */
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF,
+	/* Low Priority */
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF,
+};
+
 static const struct snd_soc_dai_ops es8311_dai_ops = {
 	.startup = es8311_startup,
 	.hw_params = es8311_hw_params,
 	.mute_stream = es8311_mute,
 	.set_sysclk = es8311_set_sysclk,
 	.set_fmt = es8311_set_dai_fmt,
+	.auto_selectable_formats = es8311_selectable_formats,
+	.num_auto_selectable_formats = ARRAY_SIZE(es8311_selectable_formats),
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/es8316.c b/sound/soc/codecs/es8316.c
index 87f331868dc7f..026ac7649efc3 100644
--- a/sound/soc/codecs/es8316.c
+++ b/sound/soc/codecs/es8316.c
@@ -558,12 +558,21 @@ static int es8316_mute(struct snd_soc_dai *dai, int mute, int direction)
 #define ES8316_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 es8316_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops es8316_ops = {
 	.startup = es8316_pcm_startup,
 	.hw_params = es8316_pcm_hw_params,
 	.set_fmt = es8316_set_dai_fmt,
 	.set_sysclk = es8316_set_dai_sysclk,
 	.mute_stream = es8316_mute,
+	.auto_selectable_formats = &es8316_selectable_formats,
+	.num_auto_selectable_formats = 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/es8323.c b/sound/soc/codecs/es8323.c
index b926340256be5..12fcfe017ab2e 100644
--- a/sound/soc/codecs/es8323.c
+++ b/sound/soc/codecs/es8323.c
@@ -622,12 +622,25 @@ static int es8323_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 					     mute ? ES8323_DACCONTROL3_DACMUTE : 0);
 }
 
+static const u64 es8323_selectable_formats =
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
 static const struct snd_soc_dai_ops es8323_ops = {
 	.startup	= es8323_pcm_startup,
 	.hw_params	= es8323_pcm_hw_params,
 	.set_fmt	= es8323_set_dai_fmt,
 	.set_sysclk	= es8323_set_dai_sysclk,
 	.mute_stream	= es8323_mute_stream,
+	.auto_selectable_formats	= &es8323_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 #define ES8323_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index c5460589a88b8..74c0bceb0f9b4 100644
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -723,11 +723,20 @@ static int es8326_set_bias_level(struct snd_soc_component *codec,
 #define es8326_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 	SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 es8326_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
+
 static const struct snd_soc_dai_ops es8326_ops = {
 	.hw_params = es8326_pcm_hw_params,
 	.set_fmt = es8326_set_dai_fmt,
 	.set_sysclk = es8326_set_dai_sysclk,
 	.mute_stream = es8326_mute,
+	.auto_selectable_formats = &es8326_selectable_formats,
+	.num_auto_selectable_formats = 1,
 	.no_capture_mute = 0,
 };
 
diff --git a/sound/soc/codecs/es8328.c b/sound/soc/codecs/es8328.c
index aaa6646ad4c5e..7d52b5d9d0615 100644
--- a/sound/soc/codecs/es8328.c
+++ b/sound/soc/codecs/es8328.c
@@ -727,12 +727,19 @@ static int es8328_set_bias_level(struct snd_soc_component *component,
 	return 0;
 }
 
+static const u64 es8328_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops es8328_dai_ops = {
 	.startup	= es8328_startup,
 	.hw_params	= es8328_hw_params,
 	.mute_stream	= es8328_mute,
 	.set_sysclk	= es8328_set_sysclk,
 	.set_fmt	= es8328_set_dai_fmt,
+	.auto_selectable_formats	= &es8328_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/es8375.c b/sound/soc/codecs/es8375.c
index e8747bc24433f..bc21cf7e602d6 100644
--- a/sound/soc/codecs/es8375.c
+++ b/sound/soc/codecs/es8375.c
@@ -494,11 +494,23 @@ static int es8375_mute(struct snd_soc_dai *dai, int mute, int stream)
 #define es8375_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 		SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 es8375_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops es8375_ops = {
 	.hw_params = es8375_hw_params,
 	.mute_stream = es8375_mute,
 	.set_sysclk = es8375_set_sysclk,
 	.set_fmt = es8375_set_dai_fmt,
+	.auto_selectable_formats = &es8375_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver es8375_dai = {
diff --git a/sound/soc/codecs/es8389.c b/sound/soc/codecs/es8389.c
index 80efce3e0a22a..452e597d81d57 100644
--- a/sound/soc/codecs/es8389.c
+++ b/sound/soc/codecs/es8389.c
@@ -904,6 +904,13 @@ static int es8389_mute(struct snd_soc_dai *dai, int mute, int direction)
 #define es8389_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 		SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 es8389_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
+
 static const struct snd_soc_dai_ops es8389_ops = {
 	.hw_params = es8389_pcm_hw_params,
 	.hw_free = es8389_pcm_hw_free,
@@ -911,6 +918,8 @@ static const struct snd_soc_dai_ops es8389_ops = {
 	.set_sysclk = es8389_set_dai_sysclk,
 	.set_tdm_slot = es8389_set_tdm_slot,
 	.mute_stream = es8389_mute,
+	.auto_selectable_formats = &es8389_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver es8389_dai = {
-- 
2.53.0

