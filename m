Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010003.outbound.protection.outlook.com [52.101.229.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C9033C192
	for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 01:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782179638; cv=fail; b=kLqq+eSD2XOM2nymiMFuSQVn3lBCN9H4fGtvf8Xp4ucOxAXeZfm+n8VLTNPisZklFU7IiU0vr65sdRTZc6K2TLzl8aDf06zjM89sV71cXt4M1qIQnqQqd+BjTHNna525/8Y5KG/xc0tDdv3bPi2Nq3B8HKWv9fu4BffSkBPKRzA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782179638; c=relaxed/simple;
	bh=oj3sBLUEAgPWMK9j7cmk2h4T4FSn3gwO6dRwek8h3YU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=kUjNAL+Ai/rG9EEKud0sGGUqkWn2vJlvssxCVccZfrBryEGhj5SzMe1CE+jrWzFdQTPDDK0ng1X65nFbpCDzejHf0tpziU7rWtg41BNuqldmStdlP5+VZzD89dlwP0JOwBipKSfPgO8BjfCWmJbcEtHozo0V/Rks+SoJlo8MFmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ab2ls8h2; arc=fail smtp.client-ip=52.101.229.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ab2ls8h2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D7Ce+I+y2qyR+BwA7JJ7md1qviuDLfqNbhaF5Iopn9Praqr1WWmXCfzr98M4e08l2Sb8vSGuS4DkaXdpU7BK+Ev/C0Wj5zzWJyoO86e6f34UHyULpxP8qMmRqJ+jRCdBCcuteDxwu4l7w9a2Mr74nqFg7RRSQnJ7uF8FyC1byU/Sxw6Nn47yfftJBAX+TKLU269jfP5wPBZJZ7yfsW32FEbi/Qhom6iBd7XX0UV9YnOqPJBKMhApLsUkhkGLBKDLeqwT5HEFjNUxvLP8zdHksiBttaqpCwfAtLmSHbbIal5p1NhsFAJY+6GWiN+eC8SQZz6g2zkRldQgkVgGhZKqrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6HYZCAuFYh8GmvgLqLl/i3C0L/fWxxJnuj8pmaFQYhk=;
 b=U69QFTOC4Ru2zvQTXf2sE/1uWFsuFNbjMlpByc7lrZZc9/9ujC5X1GC1DUDD+fSjdRFVXCqTnU7FlUBkck6wefwAEuVTrNCdaxGytk5pY654iNxfnrgdx1qLpnhbs/S0QtY5vuEnqd2iGH8SuUQtXFQIZd48dA37E0cyb9Eh7J6/8I5Bu9PVd2M6WHkMJ0DJUBNF+PSpXR+Fvww7cQBB81Q1wDcRK4nf3z1im3l78u2DtqbBQr2y0O6h2dDIz2qD8zebmYYtDW3mylsFV009p1tiOmtdrUAigWPofwaIRXM8gAGZxtnpiR0unroXnj3KdsCWto3/wDHget8FF95yXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6HYZCAuFYh8GmvgLqLl/i3C0L/fWxxJnuj8pmaFQYhk=;
 b=ab2ls8h2h2MTErlWv8lstEek7oQNKMhDvT6UAUNCB+3DemZVDDPnB8Rh52Ngq74YATJtNh8L1hIZ6+wlq+VLTm+jiJZfSiZ56IecxkemFZ0WGMiDnUlLv9UUl5QJdPjKpoiEoSdxmqF43Ltb5Bqh4/uH1XZCQ7EDoBzLrAtGvG0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS9PR01MB17101.jpnprd01.prod.outlook.com (2603:1096:604:459::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Tue, 23 Jun
 2026 01:53:55 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 01:53:55 +0000
Message-ID: <87ldc6hvil.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 1/4] ASoC: amd: use .auto_selectable_formats
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Kirill Marinushkin <k.marinushkin@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
In-Reply-To: <87mrwmhvjd.wl-kuninori.morimoto.gx@renesas.com>
References: <87mrwmhvjd.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 23 Jun 2026 01:53:55 +0000
X-ClientProxiedBy: TYCPR01CA0133.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::14) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS9PR01MB17101:EE_
X-MS-Office365-Filtering-Correlation-Id: d9e56ea1-b4c0-4d18-d1ac-08ded0ca4878
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|23010399003|376014|1800799024|22082099003|38350700014|18002099003|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	P2M91FT+aUId6oXlqlrcSch3h4Vv/LIFJUNmAKbQ5YcaX0WBE1q1XAe7Ld8aPd0v4zdo8xo3dO7qE+86NxH7jxRxZfWKF9w0wjBiPFOfE0p6jwkueJ5N2+HwOgYh04JpM9E2HUXEGXEkqCMCoQzUwOxMmWXCHNZzl3uLxr6Q/3vP/Krbk9bChOptEDUTMZENK3ggNijR5lmrhVCTtr4QbIMovjJFpMjJzlac/mBT7dh3zZzE8Kn4jZlp1dDVxzSoEOqcnr0DhxyO2PWLGvdOhBGoz2crTdZgoZU/QBZRfc9a2U9bZQP4fxheKuFTH/DU/Wr8kZKF1pgmHV3TjJ1zJ9LRtHQKzN4T1bC/aqEiT2pVixyFNuBN/zOOTLmxoSGmoVQlIhtv48Cd6hUklwy9geJqzqxfFFhP9NKDFn2sdrdnlk1hAUgCNjgqQP0m9n2erEKjttnrCt17rrHLVYYBqAjPF6F0mCi7+hlxQ+cFXkGtlCGCYZPWV2gmvTBxpFU/dpj6bpVUGGx+7MpvfBLvYzrpXmgBS+Ja2QwwZeJ7GQFSUQg471/2NgIi/UXjp6EbhkOglw3xMOw2p643McQxNX0l6h+uE/rryohSfpfqYUnCh8NeNsZ3SFvP1U+rr8+ojR4T4HBTNfVGOw65d8xymmgbVJ+JVBPr20T0UKKsjipOlZ/hxSZiWtMdsrpqTOfHJ6qN9Pn3jfw42c0HFiU+oWB0jFmCbuSi0FTJW4+h2es=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(23010399003)(376014)(1800799024)(22082099003)(38350700014)(18002099003)(6133799003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mh2gCsNUXaucxmrH4H2vVXIe+ZwbhCauG7FIIDZvS4mMqMajb4Az+EImH/7I?=
 =?us-ascii?Q?CBKoVX/NVMZDwpcPKHmcSgwbPA02vscv4NqhsIA7pblqp5khP3SSp8bODYZ6?=
 =?us-ascii?Q?xKchRSfxV0rLIFBMOzf4gVFBUHclu3bNmTarsst8TH4PQzRbb3dwOllnXY2M?=
 =?us-ascii?Q?0pTiAWveX4cct4hDConobKicqAH6RgyyfS8pfggBDwXAtQ4G6K0kFySTIe1X?=
 =?us-ascii?Q?FbMZJY+N+foEElh0dM+kZljWgecM/i8GzgTWYh275UZPOqPpz4yc9VDh049n?=
 =?us-ascii?Q?IxseWT7+L9r1xZAi/6nQKCIRG9bfJTYQMRrtWR205KkurMtKhkISuuE/aAB/?=
 =?us-ascii?Q?VIkCHvln9qgGMzeNpx47ZjDKgLB9dfwCL8UCH7ngf5RSO8BbzY53JvHUAlpf?=
 =?us-ascii?Q?uppkDVpxoKg9trPvUV/ZpLYnynAM3cNGHIpWujvR1uBcPcOKaaMJX6BbIrl7?=
 =?us-ascii?Q?ls+zZBP5lyMuiU5MAztAZAEoKBMTevFcsA65WOIz53bn5BXSvycYHFwyuLeC?=
 =?us-ascii?Q?5lf/zqj26WqLz28TTwls3xvZIsIoYoVfaV0CwW1qn+S9DdXDedejEkmZChmR?=
 =?us-ascii?Q?8cHqHf3Y0wGp0WnPu2BtCiFoQawh2NjrHJfX2327d1jS+wlnXKoLl2qL4VSJ?=
 =?us-ascii?Q?15eD0PXoXRaCsDVWLnSFSV1rQU/dENShfv7GZtXSAWATCuCLngvsv+qfszXL?=
 =?us-ascii?Q?NYjD2s6sOTJtFIYVTHPn8y1Jo3FhCUBYTfiEghDZE07XkNPQq6iRC2OTkaem?=
 =?us-ascii?Q?kU3GuF/6PrYkaQ0T65SM+LCQTdFKbxTIHBdr8HEhgtlIzJXLHAe+swARDJ4f?=
 =?us-ascii?Q?2PIeckWlJTCjm2aoGs3v7HprZvjYQ0BegK0rtwF7N7huFqZiVAbNmrsLLjwg?=
 =?us-ascii?Q?YxsepSiQBYcrO7l4Adi/RS8sC1vqq56OxLvv/Nhtq+FImFrJhDLgPzmV7o2S?=
 =?us-ascii?Q?Lby8db0boBtoXx8TAGbAdxKo4nwo+urQruVgzOz+afnEVB9UPNCyWWj+OYBJ?=
 =?us-ascii?Q?bMSkbtZFrOsb8Rp+g6sHL4AwA73wQ+K5bpkSWLg3saRGBfgwfwHAgHmdYQW3?=
 =?us-ascii?Q?tO8hlDFci8irUIoCS6ZAcIS+UCzeSWngSuOaM0VWLILHtGefL7Ep70Cp39RL?=
 =?us-ascii?Q?jYV9E2IRm4NK242SYwjpav5ziGZdWNBVVn7ooH5Z8NinEw8/0eSPtQYviPYJ?=
 =?us-ascii?Q?Pz63fkytfFMXnTGUL4GNV6JBMlqUzUgAtyxmYI5tg1hPwS3HSjHt9sTYeLI7?=
 =?us-ascii?Q?jQ+d8d2xaRns8j6KBc9fLFrSvauXDJLPjF62K4PxZTxCSj2QavOG4pZAMgVb?=
 =?us-ascii?Q?+1EauKDuMcmgVqCMjLeCkHDEuNSNoYbRJEHtw5B3fm57fOxY66vDrsKhL9Qp?=
 =?us-ascii?Q?FlgIFruYFX5fROuzWFx7V7fawAg9PHQVFSM0DWFB3NQ1UqcJE4tcQSzY/MVM?=
 =?us-ascii?Q?ulzXGHY5rfFEWFGuGDYkDdja2aKWWG6QcdAOOXCz8yNVVUPEJWuLqPaoaSY0?=
 =?us-ascii?Q?9s03PCCcRFhk9BYUYz3y5qsAph2MbYHamBn6+nruN9YsuDYbNsGqwJm3fFwx?=
 =?us-ascii?Q?FBwa8MYGkSFijLCDBlQNSSKJfl1aOGAghkAxUbdqjBCD2t1KnUMuVwylMMUL?=
 =?us-ascii?Q?KCQyn09lyKQICBBMvbuiX1Ke+r1yAGDsvLroodbEPprPLFnl61JtOEe83PKs?=
 =?us-ascii?Q?QaqwzMQBBXIu7doMZF2PzZoL2NB7hkJ+cPXO7euQEUZ5JTGZYrNjCWRsJfQG?=
 =?us-ascii?Q?Wh87x4CCeMSp0Tm1XBwadBQs2ZC1sm4l9/Atx/gvi70pMcABlkQo?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9e56ea1-b4c0-4d18-d1ac-08ded0ca4878
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 01:53:55.2637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6tSoEkJuP+b9Uqv82y2+I01nW+zkLCb+0yeHCaPBWDgP2B7jx8VPt+AoSgzJndo3ZxMen32rMEI15Su7ou5JdBt0BP9reTsFKPpCVqE0iMkdVLKcUHrUeElDx/7I2e05
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB17101

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/acp-i2s.c       | 6 ++++++
 sound/soc/amd/raven/acp3x-i2s.c   | 6 ++++++
 sound/soc/amd/vangogh/acp5x-i2s.c | 6 ++++++
 3 files changed, 18 insertions(+)

diff --git a/sound/soc/amd/acp/acp-i2s.c b/sound/soc/amd/acp/acp-i2s.c
index 283a674c7e2c3..bb58a9d34993b 100644
--- a/sound/soc/amd/acp/acp-i2s.c
+++ b/sound/soc/amd/acp/acp-i2s.c
@@ -686,6 +686,10 @@ static int acp_i2s_startup(struct snd_pcm_substream *substream, struct snd_soc_d
 	return 0;
 }
 
+static const u64 acp_i2s_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A;
+
 const struct snd_soc_dai_ops asoc_acp_cpu_dai_ops = {
 	.startup	= acp_i2s_startup,
 	.hw_params	= acp_i2s_hwparams,
@@ -693,6 +697,8 @@ const struct snd_soc_dai_ops asoc_acp_cpu_dai_ops = {
 	.trigger	= acp_i2s_trigger,
 	.set_fmt	= acp_i2s_set_fmt,
 	.set_tdm_slot	= acp_i2s_set_tdm_slot,
+	.auto_selectable_formats	= &acp_i2s_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 EXPORT_SYMBOL_NS_GPL(asoc_acp_cpu_dai_ops, "SND_SOC_ACP_COMMON");
 
diff --git a/sound/soc/amd/raven/acp3x-i2s.c b/sound/soc/amd/raven/acp3x-i2s.c
index 352485dd98b14..b0147e88ba54c 100644
--- a/sound/soc/amd/raven/acp3x-i2s.c
+++ b/sound/soc/amd/raven/acp3x-i2s.c
@@ -250,11 +250,17 @@ static int acp3x_i2s_trigger(struct snd_pcm_substream *substream,
 	return ret;
 }
 
+static const u64 acp3x_i2s_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A;
+
 static const struct snd_soc_dai_ops acp3x_i2s_dai_ops = {
 	.hw_params = acp3x_i2s_hwparams,
 	.trigger = acp3x_i2s_trigger,
 	.set_fmt = acp3x_i2s_set_fmt,
 	.set_tdm_slot = acp3x_i2s_set_tdm_slot,
+	.auto_selectable_formats = &acp3x_i2s_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static const struct snd_soc_component_driver acp3x_dai_component = {
diff --git a/sound/soc/amd/vangogh/acp5x-i2s.c b/sound/soc/amd/vangogh/acp5x-i2s.c
index bf719f6286174..dbfb87e2fe929 100644
--- a/sound/soc/amd/vangogh/acp5x-i2s.c
+++ b/sound/soc/amd/vangogh/acp5x-i2s.c
@@ -337,11 +337,17 @@ static int acp5x_i2s_trigger(struct snd_pcm_substream *substream,
 	return ret;
 }
 
+static const u64 acp5x_i2s_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A;
+
 static const struct snd_soc_dai_ops acp5x_i2s_dai_ops = {
 	.hw_params = acp5x_i2s_hwparams,
 	.trigger = acp5x_i2s_trigger,
 	.set_fmt = acp5x_i2s_set_fmt,
 	.set_tdm_slot = acp5x_i2s_set_tdm_slot,
+	.auto_selectable_formats = &acp5x_i2s_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static const struct snd_soc_component_driver acp5x_dai_component = {
-- 
2.53.0

