Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011026.outbound.protection.outlook.com [40.107.74.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AA93C4555
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 05:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788152893; cv=fail; b=Ct4/PMgCB9XP+cLeGdjxsfSmEOikem1P3lIo4b9syHfOPocVH99vQ1/GgzFWaHmgZ6Dz/JbYojjknjzAjM0ALT7bh1C6W6bxKidw2vwCq6HElHYInVPqVBfV2H4Zl+PE3f7q045dZP+bpSowkRNh64oY5I68g6/aUbV2hTGrquU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788152893; c=relaxed/simple;
	bh=oXTU86teQWcjqHzIRzj0/r8tGGx9IJKFPSb928GQS/0=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=sD5EaA5WFUy5QGIbxMKrEY3msC7XjjRN81qwwC+//y1sgPgzNniwP95NBHpYlMSozg0U1nYbNuXGU9mPaRd43veXSSXGuggoB4DBLsB9esOF9oNn91eOCju0Ed8460xDAyQKfxqqT/eAFVDtceTPQWB9zACQf90ya2BBI1vaNVA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=a1hlMtAe; arc=fail smtp.client-ip=40.107.74.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="a1hlMtAe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n0TyPN5sY2xLfFDKvVxVrYixVmuytNAd2iOrdx+AR9bCzs+4qiB3LNHHpkJ6gWcJxNf2NYq7uZ5JtxAuPJtPGCe/irdKhvdtCa11H2pU+/K3W+B4CwlsQklDtyAOuhL54Wn9+7iOuQ9KcLqkXb2RIaGmCFEFVF2bdlabpQqmDW664fCUa2zWzhp+bkswsbHam+Tg2vHtyR+XfbXP6CVQRQ0/LWIPEcUHTaMj/NEPZxh8IcuJXZZ6hGrjFY6xIrYaQkCj3DyM2PeTapae9iW38HGF5NgRc9YKCMNrGXZWdnymaTiBOxT2I3h1OFvrR1f9judpJmuCEhA8EXJy5bchLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yM2dKhaLRM/JE944nfB2eu/oHG7N/Q4Gn+gCOAbxmK4=;
 b=gfZgH07sgXN+QV+1fojfjb1XwqU3ZbKdyB7YLtbHL6gm8wdHDsoJPeZhO1NTYpTRvyV08c32LjtYP4B4CBIopNQQnMGNFNLo0neu1+GS659XTQwZMjjx7KMTHfsqFQDJ29AaIsoFcGZHMmVSpNtU7nPuxUJlSnYWAjw7QIAccU8Rji+cJOSskafSmx1GOLpNQSojQT3PO1i4sJlB1jWE1/ZVLh61jphVYht93MiG1nEknh9sLFPCD4X6iplnUwfSaKVJZ0incBTFFkodFS+skfAEYOmJHd84pvIU8xTqFQeIY1DW9VQoPWLLLk/dW/EI25yaj+3/cQ18eHMG8qkQeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yM2dKhaLRM/JE944nfB2eu/oHG7N/Q4Gn+gCOAbxmK4=;
 b=a1hlMtAev18aFRO1OZjWDWQnMXeJGqgUZFcc7IbjyyZxZhJEEMu5uga9bRfBGKoipmEVKW0FRxg3o2WBRdtZTJ4kZB92aswvtBuuGlVw5951W9MB8oKBD5P8gEDvvvcSe9LEqlDJSExXikWSyOckQvrRUa1S2BT1+AkyBW/6dDc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by TY5PR01MB18382.jpnprd01.prod.outlook.com
 (2603:1096:405:3e5::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 05:08:09 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 05:08:09 +0000
Message-ID: <87y0dmubbb.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Peter Rosin <peda@lysator.liu.se>, Takashi
 Iwai <tiwai@suse.com>, =?ISO-8859-1?Q?=22Uwe_Kleine-K=F6nig_=28The_Capab?=
 =?ISO-8859-1?Q?le_Hub=29=22?= <u.kleine-koenig@baylibre.com>
Cc: linux-sound@vger.kernel.org,
 "Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= (The Capable Hub)" <u.kleine-koenig@baylibre.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 18/39] ASoC: codecs: max*: use .auto_selectable_formats
In-Reply-To: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
References: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 31 Aug 2026 05:08:08 +0000
X-ClientProxiedBy: TYCP286CA0095.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::18) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|TY5PR01MB18382:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a3b01cb-b7ec-48eb-b260-08df071dd935
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|1800799024|366016|376014|22082099003|18002099003|56012099006|6133799003|11063799006|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	H/46Xdd0bAukT+d6b1tORBoH0Ot9w4EOEdxtWaGDAXpUwRSIWIQTa+m3CR3FFeUMrsH1CUoyCJUQ91veY5uQN9h+u8PqhjIHhfmZcCpa2dOTyaLRuZiJmeFXCb7WRf2aXEhusf9r3jxZgzlkXLcgUZg5sfiBfZN3QpIsqB1EM+Z6H/aViIDRj1e/cOb+gXKsA1j/eObtMEVsgiDECVUulufksuezElHw4FygUV5gWSFACvtqLFI2zaRyOP1UKgQcxB599qMhtb9N51uxcS2OrZfNho2FjUf933NGgeI/jkso2dSgDVmfYgxxNRq9hiBG+y8hOQgmx0MMf+L3qbEZ6vq+tAhVcK6daAvxsKTfDdu7NyTHLeu4QnAmm6G+4TkN1nboaqVlyX8Cke6TebY9BxXsSRtanVnWVesY3yezwlC+qdCm/whL1vMwgVdrmFxUnfBKRlP5I9yfik0yHTRCUn23pVZNSOmZaY2LC7GL6+CpUjsW1CUQqaMxj3t1Bn+pjfDvxwp64QY9xoetdb4uwfQIM2zoOBzmqeViA1HfKTRFgJeOS8hNCAssmKoCUj7LNNKc6DfrodJwmzRglZ3ES1WiAPBSxq3SbRw6fKX90b4B+56KzR6MAZ4CiyCukpYNIfvHz/I6gALWlZAgYzekLRKbaFQaROmPDzEsCR4AEDS0CG777caCUxKCcyH/TT2/1Ei3EDxlCL1APTP3N3HmWdBkibMOSbRig7WNpLYPmi4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099006)(6133799003)(11063799006)(10067099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?if2e5ET40k85oS10QGC7cBc/xN0Zj424aq/aU5i5Efuy2pHOPyDaJn86dw/d?=
 =?us-ascii?Q?dicQbXxdiQIw2yXJH8vXL3XVPYBYWy5RAbzVPy0LO5TNUOVJm99RD74TjKqE?=
 =?us-ascii?Q?XPdWp6NAcrMEKBg6epKVi1Xri0/sWhla8/mk1bDWp5qMB9YMVXdPVT5kLNNc?=
 =?us-ascii?Q?pQLsbaEYU5nV4AGdoeuIuK1DFztLvrsOvg0GAQri1L4IlRAaUHz+6uBJteJF?=
 =?us-ascii?Q?RDaBQcz8njQXYLTnkXz5o9pwfZCbCPj2tHwdd/H5Uja0HbojmDL7pWeneLKM?=
 =?us-ascii?Q?TKgqOS8NVf8xZwvbwkyfoufu9/zIjd2OrCwACZUHTawdcIdBfBomY8BgMuin?=
 =?us-ascii?Q?Dmtb45zcSPmx9dXkxkjIzhTAlYMYaf4uRnZw1hDJMZFOi3nDv/bbGQcMg5Ca?=
 =?us-ascii?Q?ZX7kUPLEhQ+P9q4chOTGuOnT7uxYoMRjsfZOd2teNIF95RHO4Aerg2Lkz8Y5?=
 =?us-ascii?Q?K4kZxG9ZCNOPNFsaHw+oOb9+ylEwrWa3ctk4uzFxHU3Y4bhIL9GCIbl2DOuJ?=
 =?us-ascii?Q?fcemLp9pn28/e5L26djJ8Vrq7tRrxcPb3r/gMpK26tOoAg/ejTgWkIx8gkes?=
 =?us-ascii?Q?8JzBfHZAx8uk/PcrWfWsYQRHuU4vNm7AMVaaFsyhnxlmdSzVgmPbO31NyK5l?=
 =?us-ascii?Q?KU8ocSKOAFqw1WMAK1QQoEU78PkFOxvM0Q6RQj5sOwjNf+fXxwtgOxnoFcL2?=
 =?us-ascii?Q?/NrfpckG1pIsxIlooO+lcnlULz+kJfdJn3i5EKpklhzPFHqnpaPRZUbG7mTA?=
 =?us-ascii?Q?RN+yLfcf65uNJngcVTDZf1Ut6/uydN0uPJ8URPIyrJmYzU8euiHfNy0vNXLD?=
 =?us-ascii?Q?pMhidOADo0ciTQdLTlxSI3Wr2gEgnsCiHylrP51WfeRw2xk+cfD4vTkSR9dm?=
 =?us-ascii?Q?MTNrgqZUnnl/oFn94UXadyJBYAct0ixswMGxWOJsniDATnDEhBVQsz4Yc/eb?=
 =?us-ascii?Q?zLfsqiLy0fYMY7s5ITyeWGCTJLAtcQRuXOe7CrufM6JIkZq5xpQAnIuzIWI/?=
 =?us-ascii?Q?J57Npe6Lp2uQKUZqtZ/bHJ6XPLG5JyLWgE32GaK/H43xcJ5XKNWVxpXR7ntC?=
 =?us-ascii?Q?FytlhWvg0TsBt2iihj5TxOWy3l4OnzpHyJ+R3J1RfRTcY2FBJuUzDzozibvC?=
 =?us-ascii?Q?N/RiT3Cqh0+d1No5vGPPlEhPZD+MVskQOhOsDfR/rFy0XNdt4iY37jpR+A5y?=
 =?us-ascii?Q?B6FmXw3CPWYeQBNW+DYgp4w8SsehLomI9TgNHLDGhRqjZlOzlTXfgC9bxqAP?=
 =?us-ascii?Q?XvBKgnOfXmw9KCdtXqhYrci+/3PV9PqbnsrnvR925gBF4AA0anLz+YeO1lqX?=
 =?us-ascii?Q?FD80pGJa33odR1PSvOubG30jUUGbWQxiQRz9P4Wcz1zLWXLfgmWq9G8hP1ED?=
 =?us-ascii?Q?NqgUN1QMSXhhrTRjrhTYBCCD/wT0+W+kuzqeVEsHtmEJ0279EK8IExEy3OgW?=
 =?us-ascii?Q?bfw9IW0KoCtO8donjtdVafcaxNTkupFSbpBfVQhNdZyd6JIBIapA/inHWRGR?=
 =?us-ascii?Q?dQo7oDN6yrknciWaph8X2ewU5A3+OHG2rqCC99jtcWWX7iNlW5xiKM5sve2m?=
 =?us-ascii?Q?OX5qduNesfPIQUZj5MzxZ5S97AX9E8jYt8eQ0PcJG9p+Z89Y6SXo5bRdSGp8?=
 =?us-ascii?Q?LlACYoz0EUt4Ym3UUNhMFmNL4vVe3Mqc65yomYPm6WNQR2WnUSlGzeQa+dhn?=
 =?us-ascii?Q?Grn9F124RCKuk2/l9Ywpr7pPwIG5nGFo3lQsiGOqtpQq7XLn90mDFoMnNMEG?=
 =?us-ascii?Q?rRMl37431bWMte6jUGL68OAJFIxaxXJpcoQ6t8++yYk3Q9fY9z8h?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a3b01cb-b7ec-48eb-b260-08df071dd935
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 05:08:09.2365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c4Q0lV41EzzDUII6U+xVFaZ1Mb3W6F3PW1QjguapI+wCtD34w2gtcRvKq0FXibKQHcC/PvZBTeyWeDYhdi4blCWF73fcE6hJ3To2jW9t51aQ1nzsLCO3UYgGu8ClNtQu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY5PR01MB18382

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/max98088.c     | 12 ++++++++++++
 sound/soc/codecs/max98090.c     | 25 +++++++++++++++++++++++++
 sound/soc/codecs/max98095.c     | 14 ++++++++++++++
 sound/soc/codecs/max98371.c     |  7 +++++++
 sound/soc/codecs/max98373-i2c.c | 10 ++++++++++
 sound/soc/codecs/max98388.c     | 10 ++++++++++
 sound/soc/codecs/max98390.c     | 10 ++++++++++
 sound/soc/codecs/max98396.c     | 12 ++++++++++++
 sound/soc/codecs/max9850.c      | 11 +++++++++++
 sound/soc/codecs/max98520.c     | 10 ++++++++++
 sound/soc/codecs/max9860.c      | 23 +++++++++++++++++++++++
 sound/soc/codecs/max9867.c      | 10 ++++++++++
 sound/soc/codecs/max98925.c     |  8 ++++++++
 sound/soc/codecs/max98926.c     |  8 ++++++++
 sound/soc/codecs/max98927.c     | 10 ++++++++++
 15 files changed, 180 insertions(+)

diff --git a/sound/soc/codecs/max98088.c b/sound/soc/codecs/max98088.c
index df438baf05dc3..1dd7881c84aa3 100644
--- a/sound/soc/codecs/max98088.c
+++ b/sound/soc/codecs/max98088.c
@@ -1342,11 +1342,21 @@ static int max98088_set_bias_level(struct snd_soc_component *component,
 #define MAX98088_RATES SNDRV_PCM_RATE_8000_96000
 #define MAX98088_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 max98088_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops max98088_dai1_ops = {
        .set_sysclk = max98088_dai_set_sysclk,
        .set_fmt = max98088_dai1_set_fmt,
        .hw_params = max98088_dai1_hw_params,
        .mute_stream = max98088_dai1_mute,
+       .auto_selectable_formats = &max98088_selectable_formats,
+       .num_auto_selectable_formats = 1,
        .no_capture_mute = 1,
 };
 
@@ -1355,6 +1365,8 @@ static const struct snd_soc_dai_ops max98088_dai2_ops = {
        .set_fmt = max98088_dai2_set_fmt,
        .hw_params = max98088_dai2_hw_params,
        .mute_stream = max98088_dai2_mute,
+       .auto_selectable_formats = &max98088_selectable_formats,
+       .num_auto_selectable_formats = 1,
        .no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index 64dc442e90663..c31f3d32fa435 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -2382,6 +2382,29 @@ static int max98090_set_jack(struct snd_soc_component *component,
 #define MAX98090_RATES SNDRV_PCM_RATE_8000_96000
 #define MAX98090_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 max98090_selectable_formats[] = {
+	/*
+	 * Non RIGHT_J formats doesn't have 24bit support.
+	 * priority is RIGHT_J > I2S/LEFT_J/DSP_A
+	 * see
+	 *	max98090_dai_startup()
+	 */
+	/* 1st priority */
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF,
+	/* 2nd priority */
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF,
+};
+
 static const struct snd_soc_dai_ops max98090_dai_ops = {
 	.startup = max98090_dai_startup,
 	.set_sysclk = max98090_dai_set_sysclk,
@@ -2390,6 +2413,8 @@ static const struct snd_soc_dai_ops max98090_dai_ops = {
 	.hw_params = max98090_dai_hw_params,
 	.mute_stream = max98090_dai_mute,
 	.trigger = max98090_dai_trigger,
+	.auto_selectable_formats = max98090_selectable_formats,
+	.num_auto_selectable_formats = ARRAY_SIZE(max98090_selectable_formats),
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/max98095.c b/sound/soc/codecs/max98095.c
index d93436046849b..a64a5ba00379b 100644
--- a/sound/soc/codecs/max98095.c
+++ b/sound/soc/codecs/max98095.c
@@ -1413,22 +1413,36 @@ static int max98095_set_bias_level(struct snd_soc_component *component,
 #define MAX98095_RATES SNDRV_PCM_RATE_8000_96000
 #define MAX98095_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 max98095_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops max98095_dai1_ops = {
 	.set_sysclk = max98095_dai_set_sysclk,
 	.set_fmt = max98095_dai1_set_fmt,
 	.hw_params = max98095_dai1_hw_params,
+	.auto_selectable_formats = &max98095_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static const struct snd_soc_dai_ops max98095_dai2_ops = {
 	.set_sysclk = max98095_dai_set_sysclk,
 	.set_fmt = max98095_dai2_set_fmt,
 	.hw_params = max98095_dai2_hw_params,
+	.auto_selectable_formats = &max98095_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static const struct snd_soc_dai_ops max98095_dai3_ops = {
 	.set_sysclk = max98095_dai_set_sysclk,
 	.set_fmt = max98095_dai3_set_fmt,
 	.hw_params = max98095_dai3_hw_params,
+	.auto_selectable_formats = &max98095_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver max98095_dai[] = {
diff --git a/sound/soc/codecs/max98371.c b/sound/soc/codecs/max98371.c
index c8d4c68af5623..b62bd98f2252a 100644
--- a/sound/soc/codecs/max98371.c
+++ b/sound/soc/codecs/max98371.c
@@ -322,9 +322,16 @@ static const struct snd_soc_dapm_route max98371_audio_map[] = {
 #define MAX98371_FORMATS (SNDRV_PCM_FMTBIT_S8 | SNDRV_PCM_FMTBIT_S16_BE | \
 		SNDRV_PCM_FMTBIT_S24_BE | SNDRV_PCM_FMTBIT_S32_BE)
 
+static const u64 max98371_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops max98371_dai_ops = {
 	.set_fmt = max98371_dai_set_fmt,
 	.hw_params = max98371_dai_hw_params,
+	.auto_selectable_formats = &max98371_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver max98371_dai[] = {
diff --git a/sound/soc/codecs/max98373-i2c.c b/sound/soc/codecs/max98373-i2c.c
index cbd7ebffa6d61..4e52282ace7f7 100644
--- a/sound/soc/codecs/max98373-i2c.c
+++ b/sound/soc/codecs/max98373-i2c.c
@@ -398,10 +398,20 @@ static int max98373_dai_tdm_slot(struct snd_soc_dai *dai,
 #define MAX98373_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | \
 	SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 max98373_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops max98373_dai_ops = {
 	.set_fmt = max98373_dai_set_fmt,
 	.hw_params = max98373_dai_hw_params,
 	.set_tdm_slot = max98373_dai_tdm_slot,
+	.auto_selectable_formats = &max98373_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static bool max98373_readable_register(struct device *dev, unsigned int reg)
diff --git a/sound/soc/codecs/max98388.c b/sound/soc/codecs/max98388.c
index d97dab41bf0f5..a653e0a21899d 100644
--- a/sound/soc/codecs/max98388.c
+++ b/sound/soc/codecs/max98388.c
@@ -776,10 +776,20 @@ static int max98388_dai_tdm_slot(struct snd_soc_dai *dai,
 #define MAX98388_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | \
 	SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 max98388_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops max98388_dai_ops = {
 	.set_fmt = max98388_dai_set_fmt,
 	.hw_params = max98388_dai_hw_params,
 	.set_tdm_slot = max98388_dai_tdm_slot,
+	.auto_selectable_formats = &max98388_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static bool max98388_readable_register(struct device *dev,
diff --git a/sound/soc/codecs/max98390.c b/sound/soc/codecs/max98390.c
index 2295fc057c71d..b87cca2a5b437 100644
--- a/sound/soc/codecs/max98390.c
+++ b/sound/soc/codecs/max98390.c
@@ -462,11 +462,21 @@ static int max98390_dai_set_sysclk(struct snd_soc_dai *dai,
 	return 0;
 }
 
+static const u64 max98390_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops max98390_dai_ops = {
 	.set_sysclk = max98390_dai_set_sysclk,
 	.set_fmt = max98390_dai_set_fmt,
 	.hw_params = max98390_dai_hw_params,
 	.set_tdm_slot = max98390_dai_tdm_slot,
+	.auto_selectable_formats = &max98390_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static int max98390_dac_event(struct snd_soc_dapm_widget *w,
diff --git a/sound/soc/codecs/max98396.c b/sound/soc/codecs/max98396.c
index e5a2fe824c03d..935319fee41ba 100644
--- a/sound/soc/codecs/max98396.c
+++ b/sound/soc/codecs/max98396.c
@@ -790,10 +790,22 @@ static int max98396_dai_tdm_slot(struct snd_soc_dai *dai,
 #define MAX98396_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | \
 	SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 max98396_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops max98396_dai_ops = {
 	.set_fmt = max98396_dai_set_fmt,
 	.hw_params = max98396_dai_hw_params,
 	.set_tdm_slot = max98396_dai_tdm_slot,
+	.auto_selectable_formats = &max98396_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static int max98396_dac_event(struct snd_soc_dapm_widget *w,
diff --git a/sound/soc/codecs/max9850.c b/sound/soc/codecs/max9850.c
index 9bd6a61212c1d..c229b732121fe 100644
--- a/sound/soc/codecs/max9850.c
+++ b/sound/soc/codecs/max9850.c
@@ -254,10 +254,21 @@ static int max9850_set_bias_level(struct snd_soc_component *component,
 #define MAX9850_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 	SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 max9850_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops max9850_dai_ops = {
 	.hw_params	= max9850_hw_params,
 	.set_sysclk	= max9850_set_dai_sysclk,
 	.set_fmt	= max9850_set_dai_fmt,
+	.auto_selectable_formats	= &max9850_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver max9850_dai = {
diff --git a/sound/soc/codecs/max98520.c b/sound/soc/codecs/max98520.c
index 4fb98505db1a1..57759d85907be 100644
--- a/sound/soc/codecs/max98520.c
+++ b/sound/soc/codecs/max98520.c
@@ -326,10 +326,20 @@ static int max98520_dai_tdm_slot(struct snd_soc_dai *dai,
 #define MAX98520_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | \
 	SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 max98520_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops max98520_dai_ops = {
 	.set_fmt = max98520_dai_set_fmt,
 	.hw_params = max98520_dai_hw_params,
 	.set_tdm_slot = max98520_dai_tdm_slot,
+	.auto_selectable_formats = &max98520_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static int max98520_dac_event(struct snd_soc_dapm_widget *w,
diff --git a/sound/soc/codecs/max9860.c b/sound/soc/codecs/max9860.c
index 20e288e38669b..35265c2502fe0 100644
--- a/sound/soc/codecs/max9860.c
+++ b/sound/soc/codecs/max9860.c
@@ -459,9 +459,32 @@ static int max9860_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	}
 }
 
+static const u64 max9860_selectable_formats[] = {
+	/*
+	 * DSP_A/B has some limitations.
+	 * priority is I2S/LEFT_J > DSP_A/B
+	 * see
+	 *	max9860_hw_params()
+	 */
+	/* 1st priority */
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF,
+	/* 2nd priority */
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF,
+};
+
 static const struct snd_soc_dai_ops max9860_dai_ops = {
 	.hw_params = max9860_hw_params,
 	.set_fmt = max9860_set_fmt,
+	.auto_selectable_formats = max9860_selectable_formats,
+	.num_auto_selectable_formats = ARRAY_SIZE(max9860_selectable_formats),
 };
 
 static struct snd_soc_dai_driver max9860_dai = {
diff --git a/sound/soc/codecs/max9867.c b/sound/soc/codecs/max9867.c
index 07a53ec2a18a3..f2214e3a19ce3 100644
--- a/sound/soc/codecs/max9867.c
+++ b/sound/soc/codecs/max9867.c
@@ -522,12 +522,22 @@ static int max9867_dai_set_fmt(struct snd_soc_dai *codec_dai,
 	return 0;
 }
 
+static const u64 max9867_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops max9867_dai_ops = {
 	.set_sysclk	= max9867_set_dai_sysclk,
 	.set_fmt	= max9867_dai_set_fmt,
 	.mute_stream	= max9867_mute,
 	.startup	= max9867_startup,
 	.hw_params	= max9867_dai_hw_params,
+	.auto_selectable_formats	= &max9867_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/max98925.c b/sound/soc/codecs/max98925.c
index 4302ab16a642a..fe43ef99a0cba 100644
--- a/sound/soc/codecs/max98925.c
+++ b/sound/soc/codecs/max98925.c
@@ -484,10 +484,18 @@ static int max98925_dai_set_sysclk(struct snd_soc_dai *dai,
 #define MAX98925_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 max98925_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops max98925_dai_ops = {
 	.set_sysclk = max98925_dai_set_sysclk,
 	.set_fmt = max98925_dai_set_fmt,
 	.hw_params = max98925_dai_hw_params,
+	.auto_selectable_formats = &max98925_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver max98925_dai[] = {
diff --git a/sound/soc/codecs/max98926.c b/sound/soc/codecs/max98926.c
index 51a30c182167e..5b590a1f00de6 100644
--- a/sound/soc/codecs/max98926.c
+++ b/sound/soc/codecs/max98926.c
@@ -448,9 +448,17 @@ static int max98926_dai_hw_params(struct snd_pcm_substream *substream,
 #define MAX98926_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | \
 		SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 max98926_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops max98926_dai_ops = {
 	.set_fmt = max98926_dai_set_fmt,
 	.hw_params = max98926_dai_hw_params,
+	.auto_selectable_formats = &max98926_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver max98926_dai[] = {
diff --git a/sound/soc/codecs/max98927.c b/sound/soc/codecs/max98927.c
index 524300d8fb0bc..d8dfaefdca7e8 100644
--- a/sound/soc/codecs/max98927.c
+++ b/sound/soc/codecs/max98927.c
@@ -463,11 +463,21 @@ static int max98927_dai_set_sysclk(struct snd_soc_dai *dai,
 	return 0;
 }
 
+static const u64 max98927_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops max98927_dai_ops = {
 	.set_sysclk = max98927_dai_set_sysclk,
 	.set_fmt = max98927_dai_set_fmt,
 	.hw_params = max98927_dai_hw_params,
 	.set_tdm_slot = max98927_dai_tdm_slot,
+	.auto_selectable_formats = &max98927_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static int max98927_dac_event(struct snd_soc_dapm_widget *w,
-- 
2.53.0

