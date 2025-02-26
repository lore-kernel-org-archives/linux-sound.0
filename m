Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011071.outbound.protection.outlook.com [52.101.125.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787F718DB1C
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533525; cv=fail; b=SEjxf8lMNJSACsxX+xNWkpMmaJvpBrk0pvz1BYB/jny17wqeh0iEUFW7uLzeb6DCSb0yxp2GX6R3SJJMGM0DFmpaTsFPBH1Q8z2A2+DTl+fe9dKs5KqCGT18LGw6BVwQLgU6k9KcECZ+V5FqSL/TJIpfWZh3S2ja0jzTVkEAZD8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533525; c=relaxed/simple;
	bh=YLcIb1cSDHuTVpTuyftGhnrwwrv1wMS0SmLYRG1BNZg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=coyqhYu3CcCgC7NG574LBzlEe4zC6zQmrxGvuQhfQhPcIxFd1FLek0Q3nvua0T3uQ8Vw7NSGq9SiqZPoAeO/tKrNEM0ExWtTzPG1GnxAULz9W6SDtDfTsX9YyBbuirHtM+5FC3ZpVbZMLN2D1uf4yVSGV5mlc7bdvAKcN7G2oR0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=mcB97FvK; arc=fail smtp.client-ip=52.101.125.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="mcB97FvK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VefPtiX0GmwJRWtPzBPuBUradtctib2zOdj9vaJDLZl3LTKDUS4UI4Jp10RJZcYkFLZLMyJZ3hdyareh/ym+7H6V7/u5AAvyTdc53IElG2AAU2vrnfKZmswbNVUwYWxuzOWOdyH7YXNzNcXpsoH4nZ6An9tEJKdKZxAT9wyQcMPLEGR7uROtoTxCtGeTdoK+xueRSlc2sVHEM+KyEkuI4Qx+ejvgl0FmnKlJT19ximWTg1C3W0P23wS+e2MhA8/e5AXrsuJxqQqysg5R9aZSKM2v14oiew2efwGpGuQlkOSungby/mjYUskxJl1++0EW2aK25lNK+G9o0w8X+QREpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mn3Kls0i3J1iXg528Lgx98BXi2oBLw1FutfkXiSu+zI=;
 b=WgWAnHJ3kzFhtiMOT7mkgTmUZyfep+jT1ZezcSXQetirVH0q3EPhh7FuBCCoDcmhTUxghsvfMvbc+ekM3698PinDQ3yL7aCdHnHxYPxhjVuIZFuAvYfQZrED2fZLmca6ZWTvZoptQUgr0ARkbD//rv6sxcvlTyr5GAMbeB9eeH1Ar978ZrwLcGWzHexA6DrH6hlXi0IxEbOO5RpDpC1LTEnfssDBqMQj6lU2GOPKaJ6ciMez/FtQHYYe+fftOld2TJs4blPcXgWHVwDWV3xnoJRorFTnkzOj3eccEVREYwaT3OqcvePoNTTQlVUZZ3rLZVDZH5qlWliTIe1OfEwllw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mn3Kls0i3J1iXg528Lgx98BXi2oBLw1FutfkXiSu+zI=;
 b=mcB97FvKolh6ipcRHlgDj3vfiqq5hnG+EM01bvH71Dqfb//f7RpFjVGysNrnxNHho8dHMe0JTYpkySs86dTkPEenR5KQ0xNGGwav2W6QJTbcinigDnn9JeAg2QL4ktIWCn+PxFxT82XvbMnQPD8Big8k3g354uQE6CdOz1BvXL4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB14997.jpnprd01.prod.outlook.com
 (2603:1096:604:3a9::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 01:32:01 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:32:01 +0000
Message-ID: <878qptfq3z.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 030/157] ASoC: codec: cs43130: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:32:00 +0000
X-ClientProxiedBy: TYCP286CA0351.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB14997:EE_
X-MS-Office365-Filtering-Correlation-Id: e2624aff-5bca-40b0-f6c0-08dd56055e0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?udQ8pEFUHSvHtaD5L9Nj09uewBoYGlQvsa8S7HmZkHkW8sSvmrz0Ghl8dSbu?=
 =?us-ascii?Q?mlxbk+hhPrSSko1Z+kx+HX0w0FBgDbdgcP1eFo+S7/xmfyBMolGkFMT7r7VF?=
 =?us-ascii?Q?zGYOY6KkculjRsv33fzfObXgLsPoEpMDbUGgagaaGBFmQIT0N/lMW5ewqOo9?=
 =?us-ascii?Q?0lMxSQgHcqZgfAQL/Zxb+4R8UJ9Xjju4D9F0+PTuTbl2QW1pfs/tw0V23bZM?=
 =?us-ascii?Q?kWxuPSKIpo4OV/RNlPAm2hwEujwWHxBdZxxGW4OjeK4Ohgx9hiUryLGaklP9?=
 =?us-ascii?Q?hnaBde/vTT47B+qlo9rKlmyaGJkRaSiXJaVxr5Ly9a5MjW6eUpvj7PGTK1RZ?=
 =?us-ascii?Q?Pg4nHZZMcNNV+bmDzDRgDEqy5HFuIpIDxu64bY/o2ORi7cHRUmHkr80f/vzB?=
 =?us-ascii?Q?3nab9r+nKuveQYu+f6/nA4lmwqjrCZkD317kpuQZZK6Gt7CITnq7ZZxouPXT?=
 =?us-ascii?Q?uQzEtE0fenLB/vqfN9L0iUQ4eADmKXNUZDm8xftk286n0hw/wGj8j4v9AD+w?=
 =?us-ascii?Q?t48LXhjbVOtdfdIRPFloGD7V/qR036HaShx/Af7EcNEr3TSm2I4pj/jTzdwD?=
 =?us-ascii?Q?MAwJ3E9JqXVndO3zUpKYBsjueGPam1GpEPvdlrqJYyGsWf6epOJsme5Pa61t?=
 =?us-ascii?Q?aYESwQHEPDBTX6jlF+eLeQjBo2NqUmyt1WMfNFmSyAemFl0wN2hTZqh+J7GS?=
 =?us-ascii?Q?yJ8GeWD3Oa1+wnPyW44vLfhm5a2m/2QDxxY5ewG+bYLVxc429QHe9u6wPOl9?=
 =?us-ascii?Q?HcBv6S60a6G78ZfBf8+URb3VGNygtjOwZ1upIlokg1Ook14RnVnxLy+0iz6R?=
 =?us-ascii?Q?NL7R+Hx+Oxumxt8ir/SfDb+rfYd3nAvBt42IavmsJad+ZmxjbvlKR2vFci2b?=
 =?us-ascii?Q?TDatC6HXmAeuHmk502bYH+Qi+E6Sk2y6KSoPW8vLVpCCcOMBThKUMaTZCaHK?=
 =?us-ascii?Q?jBfBriwHMfNxYkT/EGxQ5GzCG0q5eZYnLuTf9yGWkO+IW/lqCeSFq06e/Hj/?=
 =?us-ascii?Q?74k2K/VoItecg2jZrz7KxjOEiUyiFdvPB7sX0iZdVWtLTPntof7MwwCpftTg?=
 =?us-ascii?Q?LzfDPPVbs38LzUjp6m8K98erZD9FH6R9hxV1u4FX02bSphgG9fR6P8hb0gmF?=
 =?us-ascii?Q?AQd9tDeI7YPVm4Ls+TvB5rd5ns5opBkwfBbswKmWUoWSLA7NnZejF/bz9Vn9?=
 =?us-ascii?Q?mLaQj3GqiU6ARoPiKM9DV7etjcn57IZaxg7rFQicb57UuaScuMCPuyHe7JJU?=
 =?us-ascii?Q?w/dpMohK2eQlYC4k39PFBntTPxJylI9O7ivW8s92O3PlTPd0GbezI2/8bX9m?=
 =?us-ascii?Q?+fI8P4JpLp62YmFkrpyeztRXUFeqZ/vx7/fWWuPlDN+9rslfqaoZXB3RDg6/?=
 =?us-ascii?Q?HqtF6UyzmxCnPvgo0x40G88QHKOuOMvznsqHd2Acgyyyb/8eo193L5wqqOXN?=
 =?us-ascii?Q?AT2k85IitFMRhGE/OOrIWC1wMSBzRu5W?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mMJ9+r6F1CbNY1fijYru3s2e281KNUXN4SKI01lWhBcEmujQ3RJQdmnputpA?=
 =?us-ascii?Q?jHGus5vREWKAs18kK8jGfmgHWwVqjazo9MsPEZOiQtVrHxZVRwJwgOIhRGW9?=
 =?us-ascii?Q?jNmacGO4T4VTyq54mqI0paOGGR4A96U4lI2gGfWlGe7Kx0MigoHyAzxyKR6O?=
 =?us-ascii?Q?J9f1gYbMnfdyl43Z/bWA26rALyo2ZLVMRu7c/ucmCz7K+tFunBKNbPUCEBxl?=
 =?us-ascii?Q?u69Z8G0Bq3/dCrP2DZUhTNIe5LA2TQIjlNQ7kgnqL/T1rMMrZbGXkN0teYBd?=
 =?us-ascii?Q?vXuFin/sZu1naJ59ot+TygeQ3uzs7QPqOFlTfAIzNoSpVkBItL3tT+IAOiZ6?=
 =?us-ascii?Q?JShCleTUZhe6HukQ+44z3G91efFeRdAERE1dkTfh31lGmV3/aNRUK9czVlz/?=
 =?us-ascii?Q?z92Jwha0p/ZvfZGPCx/ktY2bj6Wea2pHzzHFOugyUqqFU0vjKI0a0bv8rAyT?=
 =?us-ascii?Q?bnlbhmysGEBGJ/+jIytzzXRu+DQf33vf+3C5cnCG8h5A9iKo6NzSeKUWPTrc?=
 =?us-ascii?Q?gfJjdGuXgNKhmLq4FGjEMEU42cx3zVC5aQqRXGSujICbl8TYVOuAjIqa2v9y?=
 =?us-ascii?Q?BaGcrBZFkeEIb3wmP2hA1OYPjTIkrzL/dTossLxmNu+xdYc4wd33FL3m8Rmv?=
 =?us-ascii?Q?el6sPn7DEN1ndg9Sbgfww1Ug1rgDmmLpoYnjG6JsS45kTGcAc+zWjWetIEXQ?=
 =?us-ascii?Q?T7557V99atsuVCweUinBcGIhA/4OIqZGp0YLx2wSQLTUtYfMoki9Ex3yNGvU?=
 =?us-ascii?Q?nCVlV3aMfPnadCrKWVKVz1LK/LYO1godA3P7/OaQpYdGLBH1+gsgkSRWBoi1?=
 =?us-ascii?Q?QP1yNXLpJtrm69nVV0XbteQcf+r1lBT0g1+MkoNjSWxe7yBjKjxFY6cp5S4Q?=
 =?us-ascii?Q?YGq4DcjnTG32J2VbuK6qGMQ8HwwqHpxkJW4gVkcdAd1RYBZz9f/QoqXenr9x?=
 =?us-ascii?Q?NU5P7qTPk10pvQPMFRHbimpSSDJPvsH4mbNNPiCnwrV9O2y0T1dG2sygj+7z?=
 =?us-ascii?Q?/J6C7EehjFx0qVyj50jQvvlUvI/1UUSSSXKPJklpsv0Yj3DxFXAU//c9Rnox?=
 =?us-ascii?Q?Ngjs1ZaU2fQH6NArOUl2Q1df9EjRScVKA9pJruG7C7J7G/bNPk43zkgdE4Ur?=
 =?us-ascii?Q?jv0SM635q/0ClglZ9+UBh3RhGgA97lWVKARzjZwxJs//zQJXpmChcdy0WqIH?=
 =?us-ascii?Q?I2s22QfIMQcopVX3DdUJskcd5UAI10liO0K0eiMGjCUCJFhU7yDQKqGkSsR0?=
 =?us-ascii?Q?/cAfMtH0ovNm7qDdCXG7rm3WYpMejElJezaV1c8CY3ul1u9R3JvNdtDwkXJE?=
 =?us-ascii?Q?laLdTr2iippzRQVIr3RkOUZzsGJ0z73NV2jxvVrPYY3ooF91JkRwmL1h+/Pe?=
 =?us-ascii?Q?JfJGCpULs30U+5KQ6Prtv9i5epn0DRzQCUB4QH5CPR2vqJ9cBdIJdvS02iIv?=
 =?us-ascii?Q?Gvio9OUbtsZp6xhLA3ihKl/oF0DZi3ltsHsDmuSmFUVm1cWDrMGJa+9hAWAH?=
 =?us-ascii?Q?pZgqtfJYAVSJtDErHIygTKZsZw4ObCtivdRk08zSg7tqa5W8Uz6j8mJNQpnH?=
 =?us-ascii?Q?9iX7bsa7KoIg6lxS5cN2SWhzycE3JGk3H0zCIKAAoM8fujbBAzwyO0OBZ2JD?=
 =?us-ascii?Q?wuyOLgwJUx0pmv7qLEkPLQE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2624aff-5bca-40b0-f6c0-08dd56055e0a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:32:01.0129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kg5f5h7ijV1yWd7hA6dkPcJa+M/Rm/xYxVorQktOdxDWZcKaKNtF7XyfQM8DkIWn81K0kh9A9wgAoF21omsByO+4oBZDA4wQBJF2WPSxix+CqhQ8gkbgHtAlWhnapxyR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14997

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/cs43130.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/cs43130.c b/sound/soc/codecs/cs43130.c
index f8e2fb69ada2..cd535be0b4ba 100644
--- a/sound/soc/codecs/cs43130.c
+++ b/sound/soc/codecs/cs43130.c
@@ -640,10 +640,10 @@ static int cs43130_set_sp_fmt(int dai_id, unsigned int bitwidth_sclk,
 	}
 
 	switch (cs43130->dais[dai_id].dai_mode) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		dai_mode_val = 0;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		dai_mode_val = 1;
 		break;
 	default:
@@ -851,7 +851,7 @@ static int cs43130_dsd_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	if (cs43130->dais[dai->id].dai_mode == SND_SOC_DAIFMT_CBM_CFM)
+	if (cs43130->dais[dai->id].dai_mode == SND_SOC_DAIFMT_CBP_CFP)
 		regmap_update_bits(cs43130->regmap, CS43130_DSD_INT_CFG,
 				   CS43130_DSD_MASTER, CS43130_DSD_MASTER);
 	else
@@ -951,7 +951,7 @@ static int cs43130_hw_params(struct snd_pcm_substream *substream,
 		break;
 	}
 
-	if (!sclk && cs43130->dais[dai->id].dai_mode == SND_SOC_DAIFMT_CBM_CFM)
+	if (!sclk && cs43130->dais[dai->id].dai_mode == SND_SOC_DAIFMT_CBP_CFP)
 		/* Calculate SCLK in master mode if unassigned */
 		sclk = params_rate(params) * bitwidth_dai *
 		       params_channels(params);
@@ -1516,11 +1516,11 @@ static int cs43130_pcm_set_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 	struct cs43130_private *cs43130 = snd_soc_component_get_drvdata(component);
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
-		cs43130->dais[codec_dai->id].dai_mode = SND_SOC_DAIFMT_CBS_CFS;
+	case SND_SOC_DAIFMT_CBC_CFC:
+		cs43130->dais[codec_dai->id].dai_mode = SND_SOC_DAIFMT_CBC_CFC;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFM:
-		cs43130->dais[codec_dai->id].dai_mode = SND_SOC_DAIFMT_CBM_CFM;
+	case SND_SOC_DAIFMT_CBP_CFP:
+		cs43130->dais[codec_dai->id].dai_mode = SND_SOC_DAIFMT_CBP_CFP;
 		break;
 	default:
 		dev_err(cs43130->dev, "unsupported mode\n");
@@ -1579,11 +1579,11 @@ static int cs43130_dsd_set_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 	struct cs43130_private *cs43130 = snd_soc_component_get_drvdata(component);
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
-		cs43130->dais[codec_dai->id].dai_mode = SND_SOC_DAIFMT_CBS_CFS;
+	case SND_SOC_DAIFMT_CBC_CFC:
+		cs43130->dais[codec_dai->id].dai_mode = SND_SOC_DAIFMT_CBC_CFC;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFM:
-		cs43130->dais[codec_dai->id].dai_mode = SND_SOC_DAIFMT_CBM_CFM;
+	case SND_SOC_DAIFMT_CBP_CFP:
+		cs43130->dais[codec_dai->id].dai_mode = SND_SOC_DAIFMT_CBP_CFP;
 		break;
 	default:
 		dev_err(cs43130->dev, "Unsupported DAI format.\n");
-- 
2.43.0

