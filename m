Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010012.outbound.protection.outlook.com [52.101.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F793AC00
	for <linux-sound@vger.kernel.org>; Thu,  3 Sep 2026 01:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788398043; cv=fail; b=Ij1bn0tvo91n0RpHXP7M9p4uHmh5DpHl0zdCGo9Ru0zjvWIleaGLA6LpNV0tTce9uUpygFvZNm+gb34awuOrLC60zp+b8lueaFkTsn7pFCPubBrq4YHmp71l3o1kE0YZWSOmacnS4/nRDdXa0sqeUWPbeMjCR0rpg0dIv+sLcuw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788398043; c=relaxed/simple;
	bh=pbb2y9ZmpA/C9p0yRDwMlTZQNAz/xR+0xxZXL/zop1g=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=vCgkfYHjMavYyToUz6+eMynUU/qGXjFSeci69cNUd2IjyTHMr0rFC+/Gtxyv2TrqvcCT5UO8B9BOnqmHOUH49LTWhrIWpKoW4IHcusDTK+VcyxgTEYJeQigP4fxxlReroc1dwlGwKuOupet8hGPmOP8EHwRSecmyVK8GcR2nHis=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Pgvv1nbI; arc=fail smtp.client-ip=52.101.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Pgvv1nbI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TPcfDlBtxtGQ14Au476sSaROTn5MC/EIvB8pxPqbnvwVQV30/nvr5QI93t3jVvlJkdCp45ScaRI6B50i1FvElktD4N4W6At/7wjDZJKzHE4OmDqAuNrxiuJ6r23EW/6Lms7wj8985M6JQq0Azm+54rC5cUy6NP03pppvM8XMPOky5vZVLzJ8xPBsG02SNpvqgQWmfyvxZuDgN2UHU69CECwLnRSCasNdPI/oU3P21HcoWQhr6Zuz4yG2nfzjHTT57xtaVODQ+YA1NE9pxfmppEaUBV2QGM5ZSVBY4Ihx+Xs/Vh3jn8tOiAkR/pmpRKCSfAXHoDzWjE/fSrjc8obAUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WmoQ9gh32lIPEIpMriZAeuzNjk+dWcXj1z40e5U4zPI=;
 b=uD2uXn+uAJTInV0S26tsrJ2aOSr/vJykwjwbwSU4dUgKXfEo/Y9e5uaTyTOwuWiOgmuxx3NUbt+Wflo8QgQhcda9Zh58EhetDVPatmtrDfAkWIfm3ZwjIL3/T1ylwP9bjwiWm48YzT7QpX8N2rhCwGcfHzNGraCD8bpQGiTZ85v62FD8PK2zPpBJ/rKvataDIdzE6lW668ZtxvPX1Q7YCbepIXLbomjR4NoOvsSJgyYezl0x9xgnyx7KTZNSM6lMfYe3/+XkQZ6o3kA3rxw67ZwLC2csyA72w/FolGsnq1hSKK7qgG9Ydinjpy83Cboatf1zUmj+wxENouUQeogzuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WmoQ9gh32lIPEIpMriZAeuzNjk+dWcXj1z40e5U4zPI=;
 b=Pgvv1nbIcwkoM4t8cV00lB88vPJYxuA7SGxXOh8M2+a0r7jFAef8okBNOhEMfO0wHGOMDqnjJEE3NUA5GHoSzsCJbbweuTTpJeQ1r8ph80KN25ZQRpSkPt1pJkvUEpcITm46X5ogqtZoe38AbJIUx/RH3ioMlp5KKOD1IDqsZaQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by TY4PR01MB17164.jpnprd01.prod.outlook.com
 (2603:1096:405:367::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 01:13:58 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 01:13:58 +0000
Message-ID: <87o6efyw4p.wl-kuninori.morimoto.gx@renesas.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, bui duc phuc <phucduc.bui@gmail.com>, HariKrishna Sagala <hariconscious@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>
Cc: bui duc phuc <phucduc.bui@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 08/21] ASoC: mediatek: use .auto_selectable_formats
In-Reply-To: <87zexzyw5v.wl-kuninori.morimoto.gx@renesas.com>
References: <87zexzyw5v.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 3 Sep 2026 01:13:58 +0000
X-ClientProxiedBy: TY4P301CA0068.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36a::7) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|TY4PR01MB17164:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a0433ac-d219-4859-88ec-08df0958a1c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|23010399003|366016|38350700014|6133799003|56012099006|10067099003|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	CUMry93EdWjDknOoXW5wH0CDaUiEaibsrPePYTODolV2KxIqDKPRRxAuWgc+erFyoSM2fPrGfNeRW2HroGDItj6rPGsWcx/s8rduDA2DPlbKLu1OkAL52oZCOFmjDgqzQqjVBBv5CoacYslT+A9YDBucf9Uoe5NdbOISphxdnzQlCye2mCSpaJWPmDLejntNHCdSbmYwWwH4aNDqRp81iGby6GFxf+b2qEyJGOReVNiyzbzYw40ZNUEBWIxjDcLyztJVhFUkNLUyYuPVD80HxJMhFj7U8MLmLdBS9y3NhOJXztjnQ9JQD+kmiHB11j9+qTDohKt/+EJbxrQlKLXXuihkwKQ2ZtWlNSti3V/fptXnBLCrj8rsj1kPpmwi7AJrKP5tAchMH9lyJ1vP3CJIrxRJqFX5BlBWYyVXRiCOxqXu6Lw7ElZeBUETkTPTEDlKO5t53uZYHdvjVcm51qS8MzcbWd/EzWqIy1o5wIhl4gkW+tyoNU73uF7f0DeeWLFxQ2vUO9kx9DRNGrnkJRvXweTdf1LNbT/bVV35K4+4o0wBoaTQ4Tjxa6W0Zoc4utw5wUtj7cR0jl7Vk6m+DHeWBQlANWY+P/W41k71eoOIWGbkajtNMW/9auFeglM7Qaeuio5GW9fqS9aZfcFFP9X/buxTH9V8Q7bFqbWSYa3X5YvUUenKqmJRUMqpnAWLyJxBVsfFFe8jRTYyqSSN2uDI18MHzsrLjX3mGHiXfX7RE+Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(23010399003)(366016)(38350700014)(6133799003)(56012099006)(10067099003)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?85Vmlfz7E/wiIaUFWuyGWROVyFz09H1rgKJO/Ps0NWuThswWORbItjQuzgCF?=
 =?us-ascii?Q?xAWaikU5y2u/bv6suaTCEC3PObKdSQzbMmqUfKD+YE6IBGyC0AY4TOUwWWVN?=
 =?us-ascii?Q?sj/vRfUa92n/cijkdXGY8pfAQvm9agN3h0iLtLmHIdEEtpjc+DvE8Tka14Ru?=
 =?us-ascii?Q?yxW9ob3yIj37qD6nLg+SsGtz1EGyGwO2Kk/vWQZZI1u26JLvCGSfDR3q6cyA?=
 =?us-ascii?Q?vvn2yTrZUZ7B50dulXjt+BO6ltO0EWFUefu7iTeGnC/ZobpdavYtgqo4UDUN?=
 =?us-ascii?Q?K2OlGphmTWRWJli7QvE94QcBgnEMVu6IYgqNvFIWn/R/+5NFthiTd3sQFor6?=
 =?us-ascii?Q?F1Xc+i9FRVIYyNjINsAPWMF7PjLQjRYoYebavbvEVAr8fZXJ/bchhJunycmg?=
 =?us-ascii?Q?OQ76stdZBDxB1RZ8Hj82WNhchKG4rDDWd2+7IOcxHL0O7donwNbkE9ng7P/g?=
 =?us-ascii?Q?6j4L6LQw/CZR8AGp4QX0cS1curAcbSw0mjv4lm2erpyDZVfozfFz1QPoorj9?=
 =?us-ascii?Q?gnetn2mnrGHJf5cdFXCdDhER6N5yNz4qy5gv1z5Nb8BP+lRYNm3MPBa4Af83?=
 =?us-ascii?Q?4qrGra1eGdGJqNxMt51c6jaJRXe6LzQoyn82DHPJpcuag0shUivTzpYkiP8F?=
 =?us-ascii?Q?9OTiy3Pbn5dY3qfuaathWXHB6A2NKoCgasVefrqMPsSelGqB9g5SG1j5kebd?=
 =?us-ascii?Q?kbMoLac2jJWuaaasQ1e48CUuWs+4WQ4l6Ss9TL28wyIWeiPXTfCD4hpLl/SY?=
 =?us-ascii?Q?unCX0PoEFTnU65pr3fIM4ZZPquZb7s8TvQsJcHvXViw6tUZmYuEp7avkU0GE?=
 =?us-ascii?Q?W+FGSj0Yt4Mn0BZw+gai/OAPdbGi3p2huHSECGz23+7u8+L76P7w/QPv+RwR?=
 =?us-ascii?Q?TWC8R8H3n2tkBBQFQQPueBOex3kdDDSvMW/OGpeaRc++2RDzoWyO1CouD9zC?=
 =?us-ascii?Q?lW4EK3XJox1fMihlm1m4kC3IMagYA4PxbxNicF6L8loadK7JiVeDwLCzlZUg?=
 =?us-ascii?Q?C+jcIY0d/kAho/Ha19m8tC3xozIB/BTK675CfTr2Pyj5tfOahQJxduPZEzoL?=
 =?us-ascii?Q?6Q5Dax4E7W7Lh88bCSz3RgHs1OT1UkADTsPV3os9jW8bSvFm5O8IwLtgGxWX?=
 =?us-ascii?Q?xU6JENq0tYiHNPU3L0l1USGK0uy5K/ehBf/6JWiHwE29nQBPCIfmkffwQSAj?=
 =?us-ascii?Q?1uAIt6INNtL8QsFRCdvFhBfBYxfpEdhjNVOVmP5GynQivGkxGRN6suQkm9/T?=
 =?us-ascii?Q?IHCPf3TtlqSZuoz2zo3C2QAfbUpBOUPjNEDVoxD5UiJOyWwoZ0jSTPOV7M9I?=
 =?us-ascii?Q?IlcVJR6xS8egI6WizjOAHMK2eEevwlw7C/janZ0c1QgGq0bWku7mpWktHD0E?=
 =?us-ascii?Q?3RRXk2emt02FfyaStQqEWAOCDNxekSwca/1xFjV8DUndRDSRt7z+a9Cxfep+?=
 =?us-ascii?Q?jLRqFMyLaoIJg2lQ4h/ysbTSWW1ek+AMEb9Nrr834cqj6G+eW9inPFery7I1?=
 =?us-ascii?Q?32Z418rGDm2HVDJ7STTUJdhesdMBfST9vr0syh/eb76uQClx3I7IoZ+3fHh3?=
 =?us-ascii?Q?cmNoOXD4OMjF16XBISKxNMuyogSzRy/RNfolcF1QN/q0j/W3S0HqR25JHc8w?=
 =?us-ascii?Q?QSjyMqtHtXIIRT9hoSQ4ANPTDK6vFpXT3RJGmYNiNCYW3BlmxXCIAlMOB6gZ?=
 =?us-ascii?Q?lED4U4vW18RRVVoFHJjhRCLiAgI4c56Gobo/3184wvOUwozPifBXhSvWQPJ6?=
 =?us-ascii?Q?JIKEKfFFLwQTqaXBPM0rj9ilHTPn5lZzqMhzTzF+ZeV+Wtx+b/oz?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a0433ac-d219-4859-88ec-08df0958a1c6
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 01:13:58.7570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sgLCImFVPazMMvQwrnUpPOAvLrODqycgjeLyIhFZZNnmlUFVNrYAMKJm+PiEYv3t5M2CsoyFDJOnWrSufl29jJpwDMdB2pT/fxxVg7Fzs5x0ZA3YPoMMHSPtcYN1R7wW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB17164

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/mediatek/mt7986/mt7986-dai-etdm.c | 11 +++++++++++
 sound/soc/mediatek/mt8183/mt8183-dai-i2s.c  |  6 ++++++
 sound/soc/mediatek/mt8183/mt8183-dai-tdm.c  | 10 ++++++++++
 sound/soc/mediatek/mt8186/mt8186-dai-pcm.c  | 12 ++++++++++++
 sound/soc/mediatek/mt8186/mt8186-dai-tdm.c  | 13 +++++++++++++
 sound/soc/mediatek/mt8188/mt8188-dai-etdm.c | 15 +++++++++++++++
 sound/soc/mediatek/mt8188/mt8188-dai-pcm.c  | 11 +++++++++++
 sound/soc/mediatek/mt8192/mt8192-dai-tdm.c  | 11 +++++++++++
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 17 +++++++++++++++++
 sound/soc/mediatek/mt8195/mt8195-dai-pcm.c  | 11 +++++++++++
 sound/soc/mediatek/mt8365/mt8365-dai-i2s.c  | 10 ++++++++++
 sound/soc/mediatek/mt8365/mt8365-dai-pcm.c  | 11 +++++++++++
 12 files changed, 138 insertions(+)

diff --git a/sound/soc/mediatek/mt7986/mt7986-dai-etdm.c b/sound/soc/mediatek/mt7986/mt7986-dai-etdm.c
index fc55ff47b7bc6..a88a0efc1309b 100644
--- a/sound/soc/mediatek/mt7986/mt7986-dai-etdm.c
+++ b/sound/soc/mediatek/mt7986/mt7986-dai-etdm.c
@@ -361,12 +361,23 @@ static int mtk_dai_etdm_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	return 0;
 }
 
+static const u64 mtk_dai_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops mtk_dai_etdm_ops = {
 	.startup = mtk_dai_etdm_startup,
 	.shutdown = mtk_dai_etdm_shutdown,
 	.hw_params = mtk_dai_etdm_hw_params,
 	.trigger = mtk_dai_etdm_trigger,
 	.set_fmt = mtk_dai_etdm_set_fmt,
+	.auto_selectable_formats	= &mtk_dai_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 /* dai driver */
diff --git a/sound/soc/mediatek/mt8183/mt8183-dai-i2s.c b/sound/soc/mediatek/mt8183/mt8183-dai-i2s.c
index 3709100a88659..4d9bc8f9a67f4 100644
--- a/sound/soc/mediatek/mt8183/mt8183-dai-i2s.c
+++ b/sound/soc/mediatek/mt8183/mt8183-dai-i2s.c
@@ -867,10 +867,16 @@ static int mtk_dai_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	return 0;
 }
 
+static const u64 mtk_dai_i2s_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops mtk_dai_i2s_ops = {
 	.hw_params = mtk_dai_i2s_hw_params,
 	.set_sysclk = mtk_dai_i2s_set_sysclk,
 	.set_fmt = mtk_dai_i2s_set_fmt,
+	.auto_selectable_formats	= &mtk_dai_i2s_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 /* dai driver */
diff --git a/sound/soc/mediatek/mt8183/mt8183-dai-tdm.c b/sound/soc/mediatek/mt8183/mt8183-dai-tdm.c
index 0d69cf4404073..afdcd9863bc37 100644
--- a/sound/soc/mediatek/mt8183/mt8183-dai-tdm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-dai-tdm.c
@@ -681,11 +681,21 @@ static int mtk_dai_tdm_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	return 0;
 }
 
+static const u64 mtk_dai_tdm_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops mtk_dai_tdm_ops = {
 	.hw_params = mtk_dai_tdm_hw_params,
 	.trigger = mtk_dai_tdm_trigger,
 	.set_sysclk = mtk_dai_tdm_set_sysclk,
 	.set_fmt = mtk_dai_tdm_set_fmt,
+	.auto_selectable_formats	= &mtk_dai_tdm_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 /* dai driver */
diff --git a/sound/soc/mediatek/mt8186/mt8186-dai-pcm.c b/sound/soc/mediatek/mt8186/mt8186-dai-pcm.c
index a50aa294960b1..e72e5a1eb87b5 100644
--- a/sound/soc/mediatek/mt8186/mt8186-dai-pcm.c
+++ b/sound/soc/mediatek/mt8186/mt8186-dai-pcm.c
@@ -333,9 +333,21 @@ static int mtk_dai_pcm_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	return 0;
 }
 
+static const u64 mtk_dai_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops mtk_dai_pcm_ops = {
 	.hw_params = mtk_dai_pcm_hw_params,
 	.set_fmt = mtk_dai_pcm_set_fmt,
+	.auto_selectable_formats	= &mtk_dai_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 /* dai driver */
diff --git a/sound/soc/mediatek/mt8186/mt8186-dai-tdm.c b/sound/soc/mediatek/mt8186/mt8186-dai-tdm.c
index 7a8890d7122f2..38c7e0ddf4e21 100644
--- a/sound/soc/mediatek/mt8186/mt8186-dai-tdm.c
+++ b/sound/soc/mediatek/mt8186/mt8186-dai-tdm.c
@@ -562,11 +562,24 @@ static int mtk_dai_tdm_set_tdm_slot(struct snd_soc_dai *dai,
 	return 0;
 }
 
+static const u64 mtk_dai_tdm_selectable_formats =
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
 static const struct snd_soc_dai_ops mtk_dai_tdm_ops = {
 	.hw_params = mtk_dai_tdm_hw_params,
 	.set_sysclk = mtk_dai_tdm_set_sysclk,
 	.set_fmt = mtk_dai_tdm_set_fmt,
 	.set_tdm_slot = mtk_dai_tdm_set_tdm_slot,
+	.auto_selectable_formats	= &mtk_dai_tdm_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 /* dai driver */
diff --git a/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c b/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c
index 4dfaa761f9f73..338be2a8f36cd 100644
--- a/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c
@@ -2471,17 +2471,32 @@ static int mtk_dai_hdmitx_dptx_set_sysclk(struct snd_soc_dai *dai,
 	return mtk_dai_etdm_cal_mclk(afe, freq, dai->id);
 }
 
+static const u64 mtk_dai_selectable_formats =
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
 static const struct snd_soc_dai_ops mtk_dai_etdm_ops = {
 	.hw_params = mtk_dai_etdm_hw_params,
 	.set_sysclk = mtk_dai_etdm_set_sysclk,
 	.set_fmt = mtk_dai_etdm_set_fmt,
 	.set_tdm_slot = mtk_dai_etdm_set_tdm_slot,
+	.auto_selectable_formats	= &mtk_dai_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_dai_ops mtk_dai_hdmitx_dptx_ops = {
 	.hw_params	= mtk_dai_hdmitx_dptx_hw_params,
 	.set_sysclk	= mtk_dai_hdmitx_dptx_set_sysclk,
 	.set_fmt	= mtk_dai_etdm_set_fmt,
+	.auto_selectable_formats	= &mtk_dai_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 /* dai driver */
diff --git a/sound/soc/mediatek/mt8188/mt8188-dai-pcm.c b/sound/soc/mediatek/mt8188/mt8188-dai-pcm.c
index 8ca7cc75e21dc..d8d704d0a5790 100644
--- a/sound/soc/mediatek/mt8188/mt8188-dai-pcm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-dai-pcm.c
@@ -296,9 +296,20 @@ static int mtk_dai_pcm_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	return 0;
 }
 
+static const u64 mtk_dai_pcm_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops mtk_dai_pcm_ops = {
 	.prepare	= mtk_dai_pcm_prepare,
 	.set_fmt	= mtk_dai_pcm_set_fmt,
+	.auto_selectable_formats	= &mtk_dai_pcm_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 /* dai driver */
diff --git a/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c b/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c
index 49440db370af0..2ff9bf5117b71 100644
--- a/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c
+++ b/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c
@@ -699,10 +699,21 @@ static int mtk_dai_tdm_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	return 0;
 }
 
+static const u64 mtk_dai_tdm_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops mtk_dai_tdm_ops = {
 	.hw_params = mtk_dai_tdm_hw_params,
 	.set_sysclk = mtk_dai_tdm_set_sysclk,
 	.set_fmt = mtk_dai_tdm_set_fmt,
+	.auto_selectable_formats	= &mtk_dai_tdm_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 /* dai driver */
diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
index 1a20adb2cbf53..e5773f34a67e7 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
@@ -2481,6 +2481,17 @@ static int mtk_dai_etdm_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const u64 mtk_dai_selectable_formats =
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
 static const struct snd_soc_dai_ops mtk_dai_hdmitx_dptx_ops = {
 	.startup	= mtk_dai_hdmitx_dptx_startup,
 	.shutdown	= mtk_dai_hdmitx_dptx_shutdown,
@@ -2488,6 +2499,8 @@ static const struct snd_soc_dai_ops mtk_dai_hdmitx_dptx_ops = {
 	.trigger	= mtk_dai_hdmitx_dptx_trigger,
 	.set_sysclk	= mtk_dai_hdmitx_dptx_set_sysclk,
 	.set_fmt	= mtk_dai_etdm_set_fmt,
+	.auto_selectable_formats	= &mtk_dai_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_dai_ops mtk_dai_hdmitx_dptx_ops2 = {
@@ -2498,6 +2511,8 @@ static const struct snd_soc_dai_ops mtk_dai_hdmitx_dptx_ops2 = {
 	.trigger	= mtk_dai_hdmitx_dptx_trigger,
 	.set_sysclk	= mtk_dai_hdmitx_dptx_set_sysclk,
 	.set_fmt	= mtk_dai_etdm_set_fmt,
+	.auto_selectable_formats	= &mtk_dai_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_dai_ops mtk_dai_etdm_ops = {
@@ -2509,6 +2524,8 @@ static const struct snd_soc_dai_ops mtk_dai_etdm_ops = {
 	.set_sysclk	= mtk_dai_etdm_set_sysclk,
 	.set_fmt	= mtk_dai_etdm_set_fmt,
 	.set_tdm_slot	= mtk_dai_etdm_set_tdm_slot,
+	.auto_selectable_formats	= &mtk_dai_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver mtk_dai_etdm_driver[] = {
diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-pcm.c b/sound/soc/mediatek/mt8195/mt8195-dai-pcm.c
index cdc16057d50e2..539095b619bc4 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-pcm.c
@@ -297,9 +297,20 @@ static int mtk_dai_pcm_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	return 0;
 }
 
+static const u64 mtk_dai_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops mtk_dai_pcm_ops = {
 	.prepare	= mtk_dai_pcm_prepare,
 	.set_fmt	= mtk_dai_pcm_set_fmt,
+	.auto_selectable_formats	= &mtk_dai_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 /* dai driver */
diff --git a/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c b/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c
index a058973662b3a..7a2e41e586fb0 100644
--- a/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c
+++ b/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c
@@ -721,12 +721,22 @@ static const struct snd_soc_dai_ops mt8365_afe_i2s_ops = {
 	.prepare	= mt8365_dai_i2s_prepare,
 };
 
+static const u64 mt8365_dai_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops mt8365_afe_2nd_i2s_ops = {
 	.startup	= mt8365_dai_i2s_startup,
 	.shutdown	= mt8365_dai_i2s_shutdown,
 	.hw_params	= mt8365_afe_2nd_i2s_hw_params,
 	.prepare	= mt8365_dai_i2s_prepare,
 	.set_fmt	= mt8365_afe_2nd_i2s_set_fmt,
+	.auto_selectable_formats	= &mt8365_dai_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver mtk_dai_i2s_driver[] = {
diff --git a/sound/soc/mediatek/mt8365/mt8365-dai-pcm.c b/sound/soc/mediatek/mt8365/mt8365-dai-pcm.c
index 0ec114a566ad1..74c1b6df4515a 100644
--- a/sound/soc/mediatek/mt8365/mt8365-dai-pcm.c
+++ b/sound/soc/mediatek/mt8365/mt8365-dai-pcm.c
@@ -202,11 +202,22 @@ static int mt8365_dai_pcm1_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	return 0;
 }
 
+static const u64 mt8365_dai_pcm1_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_GATED	|
+	SND_SOC_POSSIBLE_DAIFMT_CONT	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops mt8365_dai_pcm1_ops = {
 	.startup	= mt8365_dai_pcm1_startup,
 	.shutdown	= mt8365_dai_pcm1_shutdown,
 	.prepare	= mt8365_dai_pcm1_prepare,
 	.set_fmt	= mt8365_dai_pcm1_set_fmt,
+	.auto_selectable_formats	= &mt8365_dai_pcm1_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver mtk_dai_pcm_driver[] = {
-- 
2.53.0

