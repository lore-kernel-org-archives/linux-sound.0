Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011069.outbound.protection.outlook.com [52.101.125.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D556430ACFC
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415988; cv=fail; b=idLZmuv1wQld6c+xY+ngLgMgRvnW/c/R+3AMVMwZqWxR9mfjYfdz0736JdDQW7ZcDnk1xSD9/FRByUti7HA2O5gClFzJMLwh2HxV/W1n2Pl7VkSigFV7dQqyVbo1+GGiatLc228N4F7G3Nk+wVNAIWiKkuHKTn23nWlk12ZCuKo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415988; c=relaxed/simple;
	bh=GOiLD2NKhXTAqSejcdbqJZFlKTI8HhKr3q+s5p1sn6A=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=VFX2PxWKrcMp7Uh8okMOqz9hTR6ngR1FkBT8ydCUgi9rqdmyw+pvbyPAEYkXJ8d/+BuBThIwebtWUqJPG7QvqNVn5/+1iXRtpWz1Mfq6NeEu3IOH6/+NyDrBmaaAO2yzqcWRkU90GRfrB4RnfaaR7/Ku+mpEGN6OLrxkqpCKqig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=jzQkbcjk; arc=fail smtp.client-ip=52.101.125.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="jzQkbcjk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CR5B2s+1TFgEQfCaCHeHlMUR/5PrrJGA0tmsuIwDHy+UitE3TJAFLtHY3KhBtnr3yX+MyZ86dKVjRk0APNcsU/9iIzx3C35ONNQYEwapNFbu6tBIxNhnvHtakTGisqNeSmuaJaQ2VeB6OeWg+HPbROUzlZzhj2TdadL4V24HimX9DyI1ozLVbiZzslyZXT5IZy0AIJ1JSmivjJXE/Z0KoWqtWQ9BKk1MzKTlKEoYzhW/Ca6nE8EG7Cm6eRzipwK4/2t92d+FDR/bJSCfgVn4snpyqpP5cTssN3LD24Cv4b6dbOOtXKo5xzYiH8hGkVIK6CHI8B9L9uAbCcy2Ha2iMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iLzdroWH8ijwPgw5SMrlbF4XcVgdFeWVXsGUicHQC/0=;
 b=fKoGv+Wc0Qv+Sdgr8GYaRsNxL3eVA43obyAWBukyrtjtUtR7ocM6HfS+hKo1QCSocyUmjTfAF7Jq1emF0EbPXjUM82IrhO5kEe2O3c4FBIdJ7wCz2tHScqdFLaUDmdiSQWUKcRM2EtnMDgQwVEWQoUc+zOD9LVJHWxrse+2OviMRYFlEV13GIFet2g9zxBy0ya3lRm6mY7mlS2desxDv7vp67bPpaweu9Vpc/mOi0nCLRfyCrT8ml2kjIxBlGt+USPiBFPWxknwiDhT+yWYYlDXjykA7bbe2vqfqAa1UT44kjb7Y1lHBM/8ch2B4ToMoAcvBmX2xKlX8EmbXYQbF6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iLzdroWH8ijwPgw5SMrlbF4XcVgdFeWVXsGUicHQC/0=;
 b=jzQkbcjkII+JJLnHKapsf4ZAtiPAjXdk7Mo71oDVVEQJ7EBmrmakcNE6KQxN641pLTm3Nv6X6h7et4BSsSU97p0YeoYTQ7a7FR1Fbu5Y9zz/sXwBm2caLfvIqJbMZHhPF05jLC51U5tmgylT2dHIsgiZn/3r40Mb153kDaeQjVE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB9955.jpnprd01.prod.outlook.com
 (2603:1096:400:1e3::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:26:25 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:26:24 +0000
Message-ID: <87frbmnm6n.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 111/139] ASoC: codecs: wm8958: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:26:24 +0000
X-ClientProxiedBy: TYCP286CA0093.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB9955:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b42c684-bf64-44d3-263e-08de0ad9d602
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NxiAYIcHNPnA/AvOOb2ev7Puv73DdGB+AlRGhagfA8LRQCvDqyK+/VICd1UP?=
 =?us-ascii?Q?NzpYzaxAwtv0Omp3dF48GtG4MtD2wh2VPosipS/hSLST1U2SbLqiw+M2DRPq?=
 =?us-ascii?Q?XT/VoBshRnKY2w/UuqpEicDWirt/eoER6aULxQ5SzmKlp4xVsuE7E0nBAy1d?=
 =?us-ascii?Q?aI/C/uNeDNQ7/zcoj2YVnKk0VnRezorCPeAI9QGSRqUNh/BT+aod1t+I1NWx?=
 =?us-ascii?Q?cKssGxIFED55BifDEq1JO5BmldVt45feUmBoferxbE7mq4E7X2ikWe8wPdRk?=
 =?us-ascii?Q?fdm3FUrRS26iYwksnrpqdXRNgufxsBtOcpo/Ifx5l2sF+D90atvszpWrAWp9?=
 =?us-ascii?Q?UMjdDPMXO/v7iaVL28EtgJn+bi3dKMw/X3ZZ0zkTelshQwN4agLAYJW1exAu?=
 =?us-ascii?Q?DCwSp68aj/yxFYyBIMRn4yOTbp/ngoogelbdmo9YUYFmqCoR8pi/kZRdt8DX?=
 =?us-ascii?Q?LE5uYSGMbZn9fwbhIXlSaks2EqOd1HMH6sbYtIWxYxIgZzKKXeqBC/MbC1oB?=
 =?us-ascii?Q?nQCEQEXGlF8Ajgf1YLucPdqoFPVFGAtPSfVe/rlGQAmQUI5TV+HgdS+an2pi?=
 =?us-ascii?Q?CTgBJlV/M+PpZNvsb/Tg6Z2JxHgrm5vcfOO5t70W2gVfL7lfb5x9OlhzK0/i?=
 =?us-ascii?Q?tChAghd4HDm3HEkgTCkKcYgxsgTesQpEA+UIpdxZotiI9/GbjUO5DIMK4gQi?=
 =?us-ascii?Q?qlmADu/H4rYSm3LeQkGzE9leuVAYSbX4TKesEeLFKrxwDev/2reaGzA44rz5?=
 =?us-ascii?Q?tcaJDc+AprDJiiyrCSsAXD0a+Y+IaQraD7g1PwO6Pgp6WHqn20CAY9u78rw8?=
 =?us-ascii?Q?YA+/gZgQsO41Qbi9lo5lORkxQVPsSjeE5/lP9dNh/4aHk8zV9H/YtYXHi33L?=
 =?us-ascii?Q?D7hJk8KFfOfLg+8Dp7ht3Iast7QXoqnimcUgSnfp58OuXxNUNh0ewb+TKjfn?=
 =?us-ascii?Q?KiXrXZ4YstnVZ+iHtnynWHkX0Jh5Rp894NDsjrsCqKkvlMGqEv37bYoX7JFE?=
 =?us-ascii?Q?q8jvrrjAY7QT0g/lmz6i0r1KeA30xKIg4DNCu05kyQMZGTm7J38yoAHQvcm0?=
 =?us-ascii?Q?QWD9RZ0fEucuKd6gxYt/vkULA4lWyxcE3WigJLxuVL7eqvwapfTW7kBTqilr?=
 =?us-ascii?Q?w70qMU2SsUXTLEqkNZuihzD9QeTUnuXyPPhMmoT6GBJlOOGPHoyADjPffi9e?=
 =?us-ascii?Q?5GqNYSlhRBUzoygjUMKz/PjtzVstfPkAWgY0lG4WCPwDT3xKO1Tz2PObNhDq?=
 =?us-ascii?Q?I3xSPNPKjBPLV9usplTx7kj/mOTkTXgPd1MNPmqS4g4Fi23PaPeuQYIY3WTT?=
 =?us-ascii?Q?fjenDx2RBffzPqcTsp/gSANE8L40wMc2dGapCS3pyXsLZXVAjapV2SFQIFx1?=
 =?us-ascii?Q?7cJQST0FAYRNHAe0r1MFv6sGDcVbQfeuBv2BeZBU8Rt8pvyaDHPz0/DUMHgo?=
 =?us-ascii?Q?hnAMVAzFoHE44EsY/5WDbe8I0tn84LVzuZprYkkfnNZbX+fX9l3+VAwAz4mD?=
 =?us-ascii?Q?07pcKTV0VPTBEYlyVzQHWyu0SHNqh+Bpqxq9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KEaoGUkrRJuJQN5HKqM+BIWuuEuHY5vN57wKjsdVNpEzZEN4C8r3YD1RJRPz?=
 =?us-ascii?Q?yzQOVSxiUPzcZVH7DY+TGXERxQUdF7FJYjN+k1awLPuOetgqRQz7JguHvgOZ?=
 =?us-ascii?Q?ZQpJomSuaTs0Cw+i/1jugG6qdN+0+3WQj2jYKtrQGl1/HotK3FFVfvnDV9P6?=
 =?us-ascii?Q?A0VRT8dK+/7w+Jv1fdqVrSmYS6llw7P3/TulSh2LzprX+6EFQlYvpIpBsWDS?=
 =?us-ascii?Q?wcJTfXoxcRMSzqvwFg+GlW3XOpT+cNhYJKvL4Q8XSoebKuRzScx97L8qCO8v?=
 =?us-ascii?Q?KpybQC8V4DGp8UC5Wo7FMKi4NvxRz3ho2Pklce4KtWOjsBo6vZswAhRncSjm?=
 =?us-ascii?Q?zg0ei2UGmc+PPcIG+YjSisVuxqzflGT758t6LoUvK0/sPeT05a4rdTYPXhLM?=
 =?us-ascii?Q?5mIOSjXkJG0n22+ufe8kYJIGDA9yXdOaiE/13NTuV4LDSUEL63jrelt107yr?=
 =?us-ascii?Q?AsV75VKIGBgnREuNZsmnQJcleAHr3sth9BEmbfPw8wpzqyHIBLB+ehHU3Jma?=
 =?us-ascii?Q?1YSQRMZnBPLKzoTwOzDO3fQHazhrSaV/rOvPYR5Ave/J8TnHo7L0xP+Nu6i6?=
 =?us-ascii?Q?6R9Y8I4O1UXNJ2q2bhl6BegucQxFzOcrNbsj59FOMtJOPEoDih7ty8kkkWJT?=
 =?us-ascii?Q?w5FbRzTVwvnsVhfKfqKwWJeZj7i4Qy2Yy+yMDxSzMVbKiz4xISgcd813dtRv?=
 =?us-ascii?Q?3ZWmhJwPGRc0oKymIN0zSFHGwxDEm4Kbkp6rnPjJ81ufmDIZy5XPn19F5vE4?=
 =?us-ascii?Q?Eh0hVPBJPV8lIcCw2iRF40qDvCFQONUoRqlq2DZXFppDIGoLqwAiWZ0YUPkz?=
 =?us-ascii?Q?/zBSgO2dlKJ/zcKgmN4zM0yWLNPln3fpXyxs+znJz8POH6FgAQruBKzhDvgH?=
 =?us-ascii?Q?cead7ipJHRQfGar8Gz8lgTD4R7RlSBuvU4Cz5ZgoyjnnXeJbHStG0QfBVOgy?=
 =?us-ascii?Q?wVmLDa9VCvihZCUnLKWl8oUVhOD0GVvo9Ylyft3G2GHM8EQO9x1FjP1AV9Xs?=
 =?us-ascii?Q?HzsCjikT5PKPEp7aAgOgi4bV0GorvxMD/wdXbHX37bPyYBE66qUYGGKkpGGL?=
 =?us-ascii?Q?j6DKDAad6JfDMMoLtedcFT5KpXmf+hZNs0icB8L+JC8hls/r74QUlXEgiSra?=
 =?us-ascii?Q?TSX3T5NTSLNfpD9BR2JVYj002W9Bn30e24xcj5/g/N6NyKR4nJRTRFgJiEfD?=
 =?us-ascii?Q?yUG9X08uuscdzFApv/NeFnTFgT1mF3clP1+KOiWWHSBkiivVUL5GtUqu/P0f?=
 =?us-ascii?Q?Kz6VbA4FdGOH0Cw7qy2qVlGbG55twLZEz/OoT2Ydquab+MqqO0qPapXBefdu?=
 =?us-ascii?Q?6IhyqDuuOzseFMb99hqxMsvXkTpI3YJDYHGLWyWfP7JQxF/kn5Re+LK4+nT4?=
 =?us-ascii?Q?+5IfrOTWtPKeqWTHYmvx8HpHa41NeG1bgVC+gUSQPwY14WWk+Y5byg+LqmcW?=
 =?us-ascii?Q?dSt28eq8VO/Oiijg3xs8G/mbVjTz4sL4PvhQFUrXcCJfeNn7JaTV1KDD4jUn?=
 =?us-ascii?Q?BGnsavTYoRpu/CH2SzLSJEJAwWkShFi+PQO1X3wgS35ZG0+OT6bi9AikubpM?=
 =?us-ascii?Q?hO9trZ8WtCovhI8ee9+gByUUXad5C2NBNVeBLG7Wu4cL8nOe3o5LQJf5leyP?=
 =?us-ascii?Q?PgVjPcj1pNCIL2/uE1m4dEs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b42c684-bf64-44d3-263e-08de0ad9d602
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:26:24.8844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lOYcFjQEdx9ZNh0c2S++pCcGLIEPzFNDFQENdPsr+soqLEbPouQG+5YCPGct6iKdYQewdHyShalvde4/yT5LYTk7p4nXPwU68gypY2pbJ7/yMQzBikHuPID9F+3adXDX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9955

We have very similar name functions (A)(B). Both gets component from
snd_kcontrol, but (A) is used in callback functions which is registered
through snd_soc_add_component_controls(), (B) is used through
snd_soc_dapm_new_widgets().

	(A) snd_soc_kcontrol_component()
	(B) snd_soc_dapm_kcontrol_component()

(B) is using very picky way to get component but using it is necessary in
ASoC. But (A) is just wrapper function to snd_kcontrol_chip(), and directly
using it without wrapper is very common way on ALSA.
To reduce confusions of similar function, let's use common way on (A).

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/wm8958-dsp2.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/wm8958-dsp2.c b/sound/soc/codecs/wm8958-dsp2.c
index d08419b108fea..8ff0882732e7f 100644
--- a/sound/soc/codecs/wm8958-dsp2.c
+++ b/sound/soc/codecs/wm8958-dsp2.c
@@ -453,7 +453,7 @@ static int wm8958_dsp2_busy(struct wm8994_priv *wm8994, int aif)
 static int wm8958_put_mbc_enum(struct snd_kcontrol *kcontrol,
 			       struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 	struct wm8994 *control = wm8994->wm8994;
 	int value = ucontrol->value.enumerated.item[0];
@@ -475,7 +475,7 @@ static int wm8958_put_mbc_enum(struct snd_kcontrol *kcontrol,
 static int wm8958_get_mbc_enum(struct snd_kcontrol *kcontrol,
 			       struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.enumerated.item[0] = wm8994->mbc_cfg;
@@ -497,7 +497,7 @@ static int wm8958_mbc_get(struct snd_kcontrol *kcontrol,
 			  struct snd_ctl_elem_value *ucontrol)
 {
 	int mbc = kcontrol->private_value;
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.integer.value[0] = wm8994->mbc_ena[mbc];
@@ -509,7 +509,7 @@ static int wm8958_mbc_put(struct snd_kcontrol *kcontrol,
 			  struct snd_ctl_elem_value *ucontrol)
 {
 	int mbc = kcontrol->private_value;
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 
 	if (wm8994->mbc_ena[mbc] == ucontrol->value.integer.value[0])
@@ -543,7 +543,7 @@ static int wm8958_mbc_put(struct snd_kcontrol *kcontrol,
 static int wm8958_put_vss_enum(struct snd_kcontrol *kcontrol,
 			       struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 	struct wm8994 *control = wm8994->wm8994;
 	int value = ucontrol->value.enumerated.item[0];
@@ -565,7 +565,7 @@ static int wm8958_put_vss_enum(struct snd_kcontrol *kcontrol,
 static int wm8958_get_vss_enum(struct snd_kcontrol *kcontrol,
 			       struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.enumerated.item[0] = wm8994->vss_cfg;
@@ -576,7 +576,7 @@ static int wm8958_get_vss_enum(struct snd_kcontrol *kcontrol,
 static int wm8958_put_vss_hpf_enum(struct snd_kcontrol *kcontrol,
 				   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 	struct wm8994 *control = wm8994->wm8994;
 	int value = ucontrol->value.enumerated.item[0];
@@ -598,7 +598,7 @@ static int wm8958_put_vss_hpf_enum(struct snd_kcontrol *kcontrol,
 static int wm8958_get_vss_hpf_enum(struct snd_kcontrol *kcontrol,
 				   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.enumerated.item[0] = wm8994->vss_hpf_cfg;
@@ -620,7 +620,7 @@ static int wm8958_vss_get(struct snd_kcontrol *kcontrol,
 			  struct snd_ctl_elem_value *ucontrol)
 {
 	int vss = kcontrol->private_value;
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.integer.value[0] = wm8994->vss_ena[vss];
@@ -632,7 +632,7 @@ static int wm8958_vss_put(struct snd_kcontrol *kcontrol,
 			  struct snd_ctl_elem_value *ucontrol)
 {
 	int vss = kcontrol->private_value;
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 
 	if (wm8994->vss_ena[vss] == ucontrol->value.integer.value[0])
@@ -681,7 +681,7 @@ static int wm8958_hpf_get(struct snd_kcontrol *kcontrol,
 			  struct snd_ctl_elem_value *ucontrol)
 {
 	int hpf = kcontrol->private_value;
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 
 	if (hpf < 3)
@@ -696,7 +696,7 @@ static int wm8958_hpf_put(struct snd_kcontrol *kcontrol,
 			  struct snd_ctl_elem_value *ucontrol)
 {
 	int hpf = kcontrol->private_value;
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 
 	if (hpf < 3) {
@@ -743,7 +743,7 @@ static int wm8958_hpf_put(struct snd_kcontrol *kcontrol,
 static int wm8958_put_enh_eq_enum(struct snd_kcontrol *kcontrol,
 				  struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 	struct wm8994 *control = wm8994->wm8994;
 	int value = ucontrol->value.enumerated.item[0];
@@ -765,7 +765,7 @@ static int wm8958_put_enh_eq_enum(struct snd_kcontrol *kcontrol,
 static int wm8958_get_enh_eq_enum(struct snd_kcontrol *kcontrol,
 				  struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.enumerated.item[0] = wm8994->enh_eq_cfg;
@@ -787,7 +787,7 @@ static int wm8958_enh_eq_get(struct snd_kcontrol *kcontrol,
 			  struct snd_ctl_elem_value *ucontrol)
 {
 	int eq = kcontrol->private_value;
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.integer.value[0] = wm8994->enh_eq_ena[eq];
@@ -799,7 +799,7 @@ static int wm8958_enh_eq_put(struct snd_kcontrol *kcontrol,
 			  struct snd_ctl_elem_value *ucontrol)
 {
 	int eq = kcontrol->private_value;
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 
 	if (wm8994->enh_eq_ena[eq] == ucontrol->value.integer.value[0])
-- 
2.43.0

