Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011029.outbound.protection.outlook.com [52.101.125.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA49188CC9
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820596; cv=fail; b=SON/xD2yV2Im2iKjyop16E3+4FZAtHpMMNMvAMVdmE2ZfWbs7q2Vb1F2NceaEFUKi71DbpkJzwf7gIi1HhljnEH40PkK3wleoMFrg/Oy4NofuDFMhyJopG821g2HUVSyHEH+NF3W2EidFhlQQfHpBlZa95YhiTtH5wfWefURDNU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820596; c=relaxed/simple;
	bh=7ZPT7JYSfDfIVrdt5765RMl4fAU1C7env4NqqmOIKaI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=tgI/tUXXs/0o80Y123LIh7Y0UkG4h83HAfhcaX71RwUiV6HSc7ChN5SY+MIWLN4LtR485lKxULIzTYbQIqTofYQHDJrPy3oFa8b+hfoi7ONRcRDol5npeuOxikZiBxt9rH2fY/U06BVfaEHUSIiMI3CotdkAwQcFpQP/yNcfgbw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=oQImM2mq; arc=fail smtp.client-ip=52.101.125.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="oQImM2mq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sD7/a3OZ/etJrcYZsJbv6UHIxfBOjGdwd5vHL7H/K6SwampbGntGbn7W+bugoLDISWoprHheMhU1Pn0m3ogkasClxdT87Mwg9/ZuPJ8IKUAQjFBUuyE8XIwOCJe0ZIB8/Ri/sSna6eDrlaiIC0PBwlgH6DzuM4utzx4e/MA8yWAsJYe2WlAp9EjEtWxXOS2LWLcqCeFsiGK15PMdmDpQ63dTfcXZFJrYHwkMOqwctB54xYvuGejGOKpUkcR0qYVVdiG5auOyqe2SRSrX2OPYy68+haW65hgLyBSHFVjVZX3/EbSdDplrohP92LyLBRfla01XFEIXrsLMX8uJ69ZZ/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FHXFa7NOIJWqmnhi5IYkQ0c/O6pKK4cA/ER6RgRNPcg=;
 b=JT8WnT1GugT5XTJ2t4y72KGWBcnrRGkojxEFpXuW5iQ+w5nsGTaZ7bB8UdOs6KqUa6bXx0zyjYkH2EuT2h3g0uptRZzyn24zKJMzEYJqfjUrSkAHBb4uxZ7aOF2imrCTFsJ01NKT2/6YKKJkrmWbFUlKo7Nj95LrlCMEJlfMVWCsvyKZ+Og2Fh47OCgUWRk6e6dNaoCVaBw6TSIGgex78mD/m5RbIUM4s26srvaS13zYkRzeFXFodEYEyjDfCZFMzaVZ06IOEvjuKnEdDpUtm5m0L4du2R/g/B6SDJL1TbQ/t/j51LE1aJqMWa85fJ3rxaFoQHN5N18sMovcKDg42Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FHXFa7NOIJWqmnhi5IYkQ0c/O6pKK4cA/ER6RgRNPcg=;
 b=oQImM2mqRSqPffsI3OEkHOn18DclKp43m8hE2cjirYNw4Tfv1fY0OKyh8eCMEZkImc5OLr5H5GItlBdg/tIa4NXC0bRjENrSRGxawY8tiM5Cbh5dVJyYFP8ix0f2OPN1DDWIXfem7+4fYMIS5K+gdSaIWtuj19xhgkpPCjVlLHA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB16404.jpnprd01.prod.outlook.com
 (2603:1096:604:2be::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:23:12 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:23:12 +0000
Message-ID: <877bvx5seo.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 078/292] ASoC: codecs: madera: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:23:11 +0000
X-ClientProxiedBy: TYCP286CA0331.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB16404:EE_
X-MS-Office365-Filtering-Correlation-Id: f2210701-567c-44ef-8242-08de20b87f85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MVlvznrZnUnE6xz3NYbpI6jcoP138+WCKZnvRHC5R/L5IeurzZR/acQFFxPt?=
 =?us-ascii?Q?gNVqAt7kGBLHtmr1DlTVS/iHj8FUqwiulhOX+XQLGItJPXHX4bABslmDbB6x?=
 =?us-ascii?Q?bta5mfN65peVqr5WFplFLIq7zKbO+8bhPFLyMA0H0ryivu7LwAOkQ3BXKtMD?=
 =?us-ascii?Q?GywFZSGL68PsfbT4WZrKYxRqW4YuIg6a0UsYSAOYn4RW47+YrpKnZEq8m0DM?=
 =?us-ascii?Q?7igikIt1QcnJmWY/2Hlspg0GTHZTeleLuMOUnAT2JUKOQusKqJgzIQjS9r4N?=
 =?us-ascii?Q?QoSQXZzGKRT1lj902Il274F0Q0wknGgxJ2isGvRC/9i4f+WMCrR6ilvJL6HP?=
 =?us-ascii?Q?M9X4+gfOblDqRFBTkPtOBnTHlh+CIUpz7tDHvofAq7sHREXMXVy0pq5Ktd16?=
 =?us-ascii?Q?5NyIadDMgQuL4QAGd1Tt4Bxt+vtLqW+bJvAyNiwWyD62/mT+/ENMzFbbp3Lg?=
 =?us-ascii?Q?dvNeksAK0xj2M36aVaXDlqZSjvmlU+kGX+UDhhHEwJOFucsJm+la60Aa7+BU?=
 =?us-ascii?Q?qcza65t+KH+V+OHZBrwyTmUSrvbnueLEgi83IS65FFitsAs4KxrUdkg6o0UT?=
 =?us-ascii?Q?iIn5drwBwnEnFXOE6zdYCdcPvU+lIIlimeYdmcJZAQkuPmicwuQhgN/JT8pL?=
 =?us-ascii?Q?vIY5oLyD+UPS6rADNRt8TixXMtpJLc2i7xkzIJuXvGpdGzBj9QtyhegR+SF3?=
 =?us-ascii?Q?WLAHLMq8r53WaZK6nCyiwmkSmGSO4OoB2qGxYBi7UKHvC2kBQrCa3a3+WsMG?=
 =?us-ascii?Q?XJwk7S0MCZ0juQ/SkOOFlpPomNBXwIA8u6RMgvrJHuGdyCBBH66nC+pSaZld?=
 =?us-ascii?Q?qamBhAkul5wrw4ddG7zBTlmZiMuasUfxBDvpYOFm2lRPLk/XmnZGMKyI6XtT?=
 =?us-ascii?Q?e0cskhqaBvcr58jvt5vqyr0v2kkmjAlDczLoy+CCTdFKFBTwcgv7Ppc10Zku?=
 =?us-ascii?Q?uMJvun5ERHvZFTHYVWkrRrK/aMC39yr0vveAmQqDvvUv0a6ICqyLrgUWf+JA?=
 =?us-ascii?Q?xvIUTbbce0JGpSacrvXquBrqWJ8oVz3qGAIplEiUPPqmuXJUJCpTNCHIfBct?=
 =?us-ascii?Q?0LoD4WRYA5WGMZGVsLLqOzG/1T0Jbovb1aH0UXVlJ8wJKYtlS2GIsFop3XJl?=
 =?us-ascii?Q?HQfYsggUhwOVTx4eeet/kkHVd7U04OYQuOvMKsVcGZa+PuUeESsANQ5TIrkt?=
 =?us-ascii?Q?+E2fq25t9+n1sK2sM81sB9w9PT5ma8p71riV19n3HA24qxHGZvxFntoB1lxH?=
 =?us-ascii?Q?b7FCHJ2PJtO+ARE+k5J8ayCFx5qHg5W1YyDBlODLRF6fRouExLzqpBe7cH19?=
 =?us-ascii?Q?35bdXMtbM/F37U7g2AcaUjNqy/GQpRy+/Ko1ab3f2+HHUmIhrUCCC8gnjMNe?=
 =?us-ascii?Q?gL0Amk8ifRc4kqj0ykWbeAbdqODbaktE0W9g1JbKF6Yv6Nk34VkDQgNECn2R?=
 =?us-ascii?Q?IOEdYQC9RnWDK2Gepm50GFrCXvMQXcqioi4WiA9qwhojd1uKQZ0W0kf/kKqf?=
 =?us-ascii?Q?mFhalHvwq6qvrbEyzPzPl9mF16/fENC/d3Zn?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uMHRrpHQbwbkbKfniNLPnFRyJk5iz1T8VfhRiY0PP50QMcnNO30rhUXRg/+u?=
 =?us-ascii?Q?r9ubFygzoCcFQwJWdWxiAVlJcXGIeD47/nnExwfBfull3P5M7C1pI4Ps9VwA?=
 =?us-ascii?Q?noQ6A+2a5nG1KljYwJJHvm3QMDo/VF/y07xDfI+CaY/QqoKEwyxRomG2b8cK?=
 =?us-ascii?Q?2iaUZUOYebWP+WLTVHjHxTkbIUp9ZQfIcGDTVL6hQbm2JefslcXfzS0b5w9b?=
 =?us-ascii?Q?+El+WW6HnXI+Colr2rwFNQ7QD6xC+n39wpWfe47yN2YdpIh4TUUzXSIcYeXI?=
 =?us-ascii?Q?qyRAzAhtzTTeYdqExqBAseI8nxsyY/lN7tQZkLwkv4BOQAJM+XFSvhknb3EI?=
 =?us-ascii?Q?8lTs2gf1BXYr4V2y0PURyLTjqL/uFxCQiYP8pwumohxrttnNYUVg9t+JgNEB?=
 =?us-ascii?Q?K+5J7GIRtAhXEII3PEVFYnpRw/10IL9/R0uUsbGqh+DAafEEO0knjEfbBTQv?=
 =?us-ascii?Q?rWLJVA1ecKCjqqFnSVexOaZ3WWFe8QZJeXFmZSEhTRw25waaVTi30E9Ym7wP?=
 =?us-ascii?Q?EyKYYsPdbkXYGqIy6QIuianlFy1eqRVWHyKQ1ngnhLaeTfAuO7vyI9bJdsOd?=
 =?us-ascii?Q?1EQjhPK2ABYPueJzr/0+dI4nNBwOTmQnrWfRW4FgkHHyRtXUaF+cn8AzdBL3?=
 =?us-ascii?Q?pPxZwl/0bwpJY2c+OCmoKIMUirrvu0RSdt17DSoKUzENYiuxT0Ek582hBEsj?=
 =?us-ascii?Q?L3n6kVCGzCPjBKxGE6jvVno/ZvYwEjf/H88IXyiqg7f4WCk4XsvJY7fLmLfi?=
 =?us-ascii?Q?88ESNcDt8wYIZVhHV/jyRIsBIO00u/nY+pRd+xJz7DWvHXamWkVswmKsgAZR?=
 =?us-ascii?Q?9y/25BxudhnPKR1h8M+ynCDOZy5CkI/em68isqC9zqTjVM6wmmoXNsawDmps?=
 =?us-ascii?Q?dHoBBioMFhv7kyDXv6YtAE+eSFJFw0B1bVNtP9jdMRz3N07dLU8kPLxqaoyF?=
 =?us-ascii?Q?Ydfel4wDGb/Y/ujq5WD0+yE0+sf27IL8XPivzKzO5K8eLVWorW3y/AgBK5vE?=
 =?us-ascii?Q?Mi2hIrXV80dQJJr+wV0xKBLh80jUSAREVHJKdjEshpi2XfusJGw2wehWk2AT?=
 =?us-ascii?Q?G98Vw+ZsGoO/ilkMNDLVASM683WQla1wcnAAzHSkfTpeoU8HB5agw8/qfbDg?=
 =?us-ascii?Q?MvbpBaiI8pQQjFmV59ZGIWujwfRo5QR0oRUdOHxmcqQ8m9NPXJcPxgia/IB5?=
 =?us-ascii?Q?NEmLkqj9f/gO/MuXBI1wFSR+RF4luRCDl+3RpmhHZT+rMa1EzPr6Z8LIyWv+?=
 =?us-ascii?Q?dP+fRhhWx/yuxojyiGqRkndXDcLGezTk+I/lTqrMt79arDZuc/+9SGQXjK9m?=
 =?us-ascii?Q?icsAd3yyLq53sklOpVXxTy1ImtSoF+yfcdWaOHjijanyXIaZjNhHr+rUOQh8?=
 =?us-ascii?Q?PSGul2gNgocRFnWW6G5e073gYE4OPBIPXGbaTZPcItk8Bucq3QfRIoYrvXsC?=
 =?us-ascii?Q?xhL78pR+nhv/uREctKZXxxnxN3FDT7ss/s+alwYZQ+79shqDoLQgAv5aw5Kb?=
 =?us-ascii?Q?/4sEE3K6hA6qfhsbfTrMZqWGZmcNeyukTTrVLBWjrPWPeTY4qZrTs8fFzNAC?=
 =?us-ascii?Q?RMcYnVLqbcgctnYIhaJTLjeVOl+HgJ0s5plG+rQeDAQV0nIXSgX34QhVmLGU?=
 =?us-ascii?Q?ZNORVDAJjqRh7osK9hY0raA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2210701-567c-44ef-8242-08de20b87f85
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:23:11.9815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k/IRlMmNfQkM/ZTCEe5NFW/7Me5q8QX0P+jSQTuUYONT95OPsBdvLZj1r3/jB8NJkr79vUsIQai77hUrvt+reaniqgS02xQeRUSaNdwE67k6j1EOK0TQg9XC8Xzv+ZFy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB16404

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
 sound/soc/codecs/madera.c | 27 +++++++++------------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/sound/soc/codecs/madera.c b/sound/soc/codecs/madera.c
index 057f75bf0053b..98d72db599d8a 100644
--- a/sound/soc/codecs/madera.c
+++ b/sound/soc/codecs/madera.c
@@ -541,10 +541,8 @@ EXPORT_SYMBOL_GPL(madera_domain_clk_ev);
 int madera_out1_demux_put(struct snd_kcontrol *kcontrol,
 			  struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_dapm_kcontrol_component(kcontrol);
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_kcontrol_to_component(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
 	struct madera_priv *priv = snd_soc_component_get_drvdata(component);
 	struct madera *madera = priv->madera;
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
@@ -632,8 +630,7 @@ EXPORT_SYMBOL_GPL(madera_out1_demux_put);
 int madera_out1_demux_get(struct snd_kcontrol *kcontrol,
 			  struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_dapm_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_kcontrol_to_component(kcontrol);
 	unsigned int val;
 
 	val = snd_soc_component_read(component, MADERA_OUTPUT_ENABLES_1);
@@ -648,10 +645,8 @@ EXPORT_SYMBOL_GPL(madera_out1_demux_get);
 static int madera_inmux_put(struct snd_kcontrol *kcontrol,
 			    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_dapm_kcontrol_component(kcontrol);
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_kcontrol_to_component(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
 	struct madera_priv *priv = snd_soc_component_get_drvdata(component);
 	struct madera *madera = priv->madera;
 	struct regmap *regmap = madera->regmap;
@@ -1211,8 +1206,7 @@ int madera_init_outputs(struct snd_soc_component *component,
 			const struct snd_soc_dapm_route *routes,
 			int n_mono_routes, int n_real)
 {
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct madera_priv *priv = snd_soc_component_get_drvdata(component);
 	struct madera *madera = priv->madera;
 	const struct madera_codec_pdata *pdata = &madera->pdata.codec;
@@ -2161,8 +2155,7 @@ int madera_dfc_put(struct snd_kcontrol *kcontrol,
 		   struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	unsigned int reg = e->reg;
 	unsigned int val;
@@ -2193,8 +2186,7 @@ int madera_lp_mode_put(struct snd_kcontrol *kcontrol,
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	unsigned int val, mask;
 	int ret;
 
@@ -3236,8 +3228,7 @@ static int madera_dai_set_sysclk(struct snd_soc_dai *dai,
 				 int clk_id, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = dai->component;
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct madera_priv *priv = snd_soc_component_get_drvdata(component);
 	struct madera_dai_priv *dai_priv = &priv->dai[dai->id - 1];
 	struct snd_soc_dapm_route routes[2];
-- 
2.43.0

