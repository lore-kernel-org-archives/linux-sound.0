Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011065.outbound.protection.outlook.com [40.107.74.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE89C8635C
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820325; cv=fail; b=HlcWU3y3l6bZpFb/fzQL/bIoKhFauRfLnXzTP7w1M/u5AIKiIz4Ng30XmhphxaJ/ZIUbnzAkTUZ0wTmUH5KZUA5XaPNpYFp0sKGhqe4OmQVbK4c0eIVRbfcnyt3WNF7FSpr3wsXR74M1N6X/1xxnSWyXqk+GF90NQomjrhLRU5M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820325; c=relaxed/simple;
	bh=zxJEMvQhoPA23hlKLEEI+EuVsmK5OsmPDu0rufzVqXg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=LaOivrsvDZunl4OD/kjYOGBwrEiQqiJHz9Lcg432fc+y1F0/zLI74YthYKt2PzBkkd8U3jIXOGqHiNnwIgeAOrdgD9WQ8ZA3TNjgYgTTcJyDX8U/ek8UIB2JytbC6YhW/SVVcjilKHuuhUk3Mx/lDtJ01fgDAwHX2ZDiicUMhA0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=EgPbqkNN; arc=fail smtp.client-ip=40.107.74.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="EgPbqkNN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PxjCQwz6Bl7hnzTVhWse18r+/fl86ejPBb22lI5Mqw/1W0uU5zi/GidvedI9ww2BQ4IjNfKPRaSOem2IAXMs70BgkSVS6f3Rj9uykUtG06JW3iAkK59e8T7BrrBz0QriAYioZj2ZEDXMmBr44ZS1OeaVlD/2A+2VO1A0gCShGB6dypFigeZ3hhLXUFw8oajAI22cyN/zpLC7RT8m74Ky9D+PsKdq+gN2Tc3BaRqfU8GIRvNwaw4Xmz0Ya6KbB16Zhhk76s2TeUfhOaeIDbrHav4zfzVxZbODvJHDXzPN/purHr7YDSKJU58QlGCL1NPyQOW9RXwJ+195E35cmyQ9xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ez95iMiD/M6UaPfthPd01IAQlf1kPm+DleAsFwXO+48=;
 b=DVa/Zj3JiKXMAwce2904r7B3mqTgUjB+9PkH0GCyb5I5BXroxPEeDiQLpzGMANefgsuSbfCZ3+pdOToDvT1bO5hUiznXDY28PUByQgMMnJ2A/o2XYZhcYs0YEu574JUTA3TVpjOj1BwTFtMpnW8apvE0CvtXsokomu4HTx4hz/Kd3VpiV5JeHDG4G0frJFe/XgFFWj3nsTczfniHXV82Bs2tCgZOEbHe4nKbIbU62KWkaxnXpK7j/8qqgvv/poZUgFYv+6DJEsi+xslWsGEUoicvZYdCTU3bmn5RFHLfSg1Auur2F3GRJOp6AuRaZ00FC75jS6PhwWq3pODXIjD4jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ez95iMiD/M6UaPfthPd01IAQlf1kPm+DleAsFwXO+48=;
 b=EgPbqkNNX9xy6i2hp9MTFMC6YRMHuyx0fv7zgKqtoTphQNnCmWFhTjovN3YUpaNjYrN/PPpv6f7cu1mSoK6uzgiY9ClLVpmHJWQyl8PnvOj2IPq7QCWkvd7L1gO9IAezEPL15sR76YOyTiJ7bCpmfiJphJ7J8u8Sq9N1F2irjgk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB14299.jpnprd01.prod.outlook.com
 (2603:1096:405:20d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:18:42 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:18:42 +0000
Message-ID: <87ikfh8lr2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 021/292] ASoC: codecs: adau7118: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:18:41 +0000
X-ClientProxiedBy: TYCP286CA0003.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB14299:EE_
X-MS-Office365-Filtering-Correlation-Id: 37a3d4a3-b23b-4a33-ac0c-08de20b7dea5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YiU1WWySNs3nZg9gBPk3Mg4hFgoe6YM4hRi0ZcF+4YexRUXxhiiMZkAZB7sC?=
 =?us-ascii?Q?nvPA9NNjCvVuB5vSr2pSMqmGHYv2EXkyh9f1wXqnvfo0W39KWUTBI71+BXaF?=
 =?us-ascii?Q?edzk3lZjAFGBYFQr3a0yzuQDIF4eN4HMHaXhxF4e5+ApH+4DoGXrqGQYn8qj?=
 =?us-ascii?Q?q7BjSkasSZ8cSPOrMgF1Syzu143xWf3jtN5wlhxbwnX4mO9sGi++cx5JW64V?=
 =?us-ascii?Q?FNWYdHoUxt8RU76dVV6ALSL7SaEFrO1+dIYFX2+meL4+r0DhDMgn85Unug1X?=
 =?us-ascii?Q?umbSHuFN9fXb4cO9993T2dwgkkrei64doNDEdnysc2JPXkblHzzxHwbyBQpI?=
 =?us-ascii?Q?1LCHfphDmwpLiGdJCawlAa5FM0gp//tR1HYvhTwlzGEDlu3GnBVQa4eh1HD5?=
 =?us-ascii?Q?+tFzm6mB7pNhKWi5nB8hN5QySLSNc0BD48HZpm7G5dXu55CaVDgxR1yB+c4T?=
 =?us-ascii?Q?qDe+D7sPBj6hleiXHj8fo0oxfoaQP6C6cqHNGqs1dhh5O4PmSHQbPp6rvXyy?=
 =?us-ascii?Q?ogu+sHXVhP6ttL/eoAdNKAS8q17bsKeAYKNJdwI1neTHHd+59F75becpjVLv?=
 =?us-ascii?Q?by+/8IAJ3pXce0Mp1pcnmheqQfuSQ60jKjdf7iG5HGivpcEyBq6/jKbs/Rz7?=
 =?us-ascii?Q?i/uTYRn3ibu4eTbfCZsO/9XDVQkVv4FXXpMr/C9TSc80XH9mEsFgBKF/ATOx?=
 =?us-ascii?Q?j05euPVU5WCSFruShd2xPMQcZ7jwhSqH9aLQRMTSFUs+K2PUFNjW9hMWAG5o?=
 =?us-ascii?Q?knDTRKu4vgmoVZ5dXDuotiRfBuYOIyo3xrn0OCM+O3Ar3rOUrZWYC4UWQhur?=
 =?us-ascii?Q?ojCE3OnmfpYflVe1If821Iy0uRdAVFj11ru1kCjEcbiX3b5ZcQ8oHamNbtXM?=
 =?us-ascii?Q?eVd4BktGN5ZBXo6/rqy2+RCHU8AMEdUWzahZc2bHEvx17NM+MrHeHoD/mEkL?=
 =?us-ascii?Q?pjrgWiFx7ax/HN4cteD3Xeqn8HVBgpozO4droK7vrekFQHVexSQjbl3CX+ce?=
 =?us-ascii?Q?z8vHTP/Ra4MvOjvBibB+auzwbMRMzBbHYVLyZv5F1/5Su3fDoRg8e/DgrJX3?=
 =?us-ascii?Q?x8U5RPMaSBC7zVHD76kpRucfihBgSsuIVjom295axG2VE+AnarDFdThzGhwF?=
 =?us-ascii?Q?m+S4ZGpt37+DEy9g8eQ+7XseYN5T4Fr0yZl+gPFxgI478938yazgsa18EO7v?=
 =?us-ascii?Q?yagQyCwahF11Xau57dAYQR9Bbt1PVQgtc7qSpPYJf3Oj8PdPzDVjifKpqEcw?=
 =?us-ascii?Q?qbcGz1d9LpgJwkpd1M1H09wmYk4N4eulraV9tmq5DpCqBbsARtOw8b3OcVue?=
 =?us-ascii?Q?B0g8yTcIi/+sug53oIfDJ6Ate+gLzYgMVuPC4lig3oIdG7b0FT8Dy4gbBl1O?=
 =?us-ascii?Q?JQI0F9lvQSEtVjWiX/vCXQTeBM44yG7R2VvMqOaXbz7EUowmp8a58KpPSw+L?=
 =?us-ascii?Q?9aaulJDLBw080aUzyzCuKIZ8lrwL16rEpA9Nu3XEAizTMJu+dksVkd3idfOi?=
 =?us-ascii?Q?CMfcPLvVg50gCeM456lI0Umf3nKEk4aO7pu6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CChRcCYQZXIS4laTwSZ7g/TGyuTX4ng52Czw+Iio/xLFteP/DxRiLjexyhMu?=
 =?us-ascii?Q?V/1kh8/BtySHPrC3rXIqcCzhl4fWLeZGwJ49cjJu3gHDh2qMZsCtDsWeGaSC?=
 =?us-ascii?Q?2lS6BL4zxuHyzKy3f2yrl6IvvR2Amz+2mWDK7m5t2ocTFpMgUOgmKlRr+oHD?=
 =?us-ascii?Q?NgDVY+kUiGshn0c+gU+nr6TQB27nCkgnb5OwEtFfIKFn0TKMPEWFQshccdC1?=
 =?us-ascii?Q?xFLbfDk7/oZjCIVWNt1Y7m6idCAtzC9+0o4mGzUPh7oBHrjjX5RSwv8zU3BF?=
 =?us-ascii?Q?qn1IakpAywWRXsmH4+Yc/0h2q2BaaJPIsohb1wDzP7+Cu7uZAUuA2vWttpPX?=
 =?us-ascii?Q?L3GFny0rmkjWk7AzLpGe2RWG0Vr/gyLNWNdrwPXwVQtesfsabn5TKZCys7Cb?=
 =?us-ascii?Q?44E7BJ+5oOooLwgKLmgiyp988vLsVeu4xGKszSsDY0AfT4HGysLGcnfGSB8b?=
 =?us-ascii?Q?hG78ZEV4KSovWJiTgo9pBTCVoiU+WE3Izok3k9LDvqrH3I3n4bl4Yfxt04J+?=
 =?us-ascii?Q?5ayvKXJMYLrs8fVphmvWhFGDUyvrd+YAjqPs6isEE+C0qq/y9c/TqBm7K8gE?=
 =?us-ascii?Q?QB62i7HL6TpAS+WZ6QBjKoni3gzQxOHmcBlFwC8veCq8pZPQGuCRfQwELs6A?=
 =?us-ascii?Q?FRl9uz41hE4ftv1Qu7xAwO8UgRCo39rSEHCyTRsd/7YNVp1alsO7BZvPX6wD?=
 =?us-ascii?Q?Xp08tenOncMATKh39e3MRoz/Rr3PeiFtMq8dtRKEsn1bjntoscNL1sU4fSp1?=
 =?us-ascii?Q?NQOWCRJ0Zb/7UULA1y5N/mCicSHKQLACedkvAfFHTEExGHxVOv3JqFULIlgp?=
 =?us-ascii?Q?fUfGhfrL5Qf+eeygxmDez6X3SZ7L+tzhc82BAD6TgqHpKv5kyPteQJ8+iQx2?=
 =?us-ascii?Q?5jzko9PROHHI+HYxMT7LGX210MJeodQC4C97EgrPj4MtY45uzestJFhMLBXb?=
 =?us-ascii?Q?Ohzcjxr8G7eWU3fSPn9tTr3e/tJXJ8Ny8NAP1l3BHbm3knlpRcjYPZSEJ928?=
 =?us-ascii?Q?V/Ayao0h7uJm92S4FMC633KDlc1FJle0QhD2csQJK4ttJdXDaEr7FOOHPCw3?=
 =?us-ascii?Q?pENuGOMlwCq6cu2ggvlNRS11sf25hWpRiK3bMLbaf8uWf2EaEnOaiyA3+e9l?=
 =?us-ascii?Q?YS/E4MZspf/feRqUnDiaAUbHWN8stR5oWkz8rki8mmbWOSPZ0uVUPYxGFIzC?=
 =?us-ascii?Q?h0jqpsBAinVf8zddan7ZwKUZOmm3MXWuMI2HEmnjyCtHalmKgqRXdPOxjXnG?=
 =?us-ascii?Q?JvVl5pVUOsJczT0DjE5VdATuhA43nJZ0VMGW4GTjIEMGG1zkjF//yrnYQO/u?=
 =?us-ascii?Q?yx5QzaClH/u8tyP0wqLo6Z2DHopeFqRz1+Vox4AL4XLbpuhs8lMf+0gfoOli?=
 =?us-ascii?Q?Hr9NwZTSNLYQCE61nu6w6bO16/kMt4OycbJc7sXePlXKiRz462URXf1XX/MD?=
 =?us-ascii?Q?MewL4D16dN/GXzorc6hcVHxVXUzb5iKdeOtsxkdnbxmelgutVlHDb5dcn/m0?=
 =?us-ascii?Q?s/GZIEzLKRkjddrCEeG/E2hDY7zdYfzF9CBEVBqAwcsZvjcy0cYYzVMU8u05?=
 =?us-ascii?Q?9l1QGWS/HlXmKPJvG3xKFbfxgYOXqpBe8/u0VIho1VzCm41zwk7B7u0WPwkG?=
 =?us-ascii?Q?QIm7dD1guXiApepZ3N3BHcI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37a3d4a3-b23b-4a33-ac0c-08de20b7dea5
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:18:42.1078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y9l/jLKNXi+SFugXloJFYb871ZOt/fLAvYfEC8tmBNVUAcTGZoymLU+BA9GnFDkwXhEcN7ne7GyqD1vGz0Dr2lGOuPlZ7/8qtSlYzlvYF+dlqvmpTqxpYxPh9CUS5RiD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14299

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
 sound/soc/codecs/adau7118.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/adau7118.c b/sound/soc/codecs/adau7118.c
index 14259807c8725..5ddea63a6612c 100644
--- a/sound/soc/codecs/adau7118.c
+++ b/sound/soc/codecs/adau7118.c
@@ -335,6 +335,7 @@ static int adau7118_set_bias_level(struct snd_soc_component *component,
 				   enum snd_soc_bias_level level)
 {
 	struct adau7118_data *st = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int ret = 0;
 
 	dev_dbg(st->dev, "Set bias level %d\n", level);
@@ -345,8 +346,7 @@ static int adau7118_set_bias_level(struct snd_soc_component *component,
 		break;
 
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) ==
-							SND_SOC_BIAS_OFF) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 			/* power on */
 			ret = regulator_enable(st->iovdd);
 			if (ret)
@@ -393,8 +393,7 @@ static int adau7118_set_bias_level(struct snd_soc_component *component,
 static int adau7118_component_probe(struct snd_soc_component *component)
 {
 	struct adau7118_data *st = snd_soc_component_get_drvdata(component);
-	struct snd_soc_dapm_context *dapm =
-					snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int ret = 0;
 
 	if (st->hw_mode) {
-- 
2.43.0

