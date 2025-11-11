Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010048.outbound.protection.outlook.com [52.101.228.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CCD1A073F
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820624; cv=fail; b=EkvWi+Kvc3i3xiMdDSx5xPT6g3x6INZvRZuqQWzczZirqcVGMTDenffsvAe7RgfvPpATBZkfPNTmGbnxWCCXTa7M/t5fW13f8bhCfDludIjjobOfphDWx8lcnbgmMuqmOexfBnT+BQexLn3B+67J9vbEyFfB7accXiAwrW6xmJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820624; c=relaxed/simple;
	bh=lCTU/Y3q3z4qnEZ35r3IwdJuiUAQlJRsg6MSndoEMPQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=rMYl3VtHq6cN9+sklyKm30WN050gy4/rjLoBgmnXHbhRXYbU937O7M7DLT1y4D/cXvl1FLfRNMGYaDZ5Xh2wuSUzypdfX+71FdbeCIHTYNsRSLe4pcc1QiFedrRHevDpwlfWwfEj9+KPpNch3eT9gz4j8CtzAMWF3LfmIVWEKHg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=KSX0J5LE; arc=fail smtp.client-ip=52.101.228.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="KSX0J5LE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qh4oGdxO3Nvf6muKn/eJLEipTOqwJ/ghGWS28GJDMr8wE/kZ2O6jhFxVscYAVIwV/5hpl/nkQUjySZSDgfSfIjNSu5SmNb8e2W/rlJRs3trs91SEYCKppOqyAjswE/bkoPuD4ZkoI1zKthGc4Pb34eTl6UeWLHLSkkD7ig3GWp57SFwHAi73K4ldAOe4+r8+fTCPiLNfAe06WGLkUox+mhVmCbIRK/T8hNrCTuZA+MQInXxEq/c+8pLbSu9r2kk/WhF99yhX6vUAbvPM8OIqOEb1uushRDMVIq/H9+45avqE9ToJ7ssDxYafxWOSXK3nulRa7a3Ku1ssUYAaEiOMow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dtVmkYNsgpyaSiC5KBLrqPI/Ahw0yRAZgf8LDvPGG0Y=;
 b=Q8MmElXgSctBBYyEyzr0tEr0/1U/PctbZlDbu+AzS9jFyN5fsRIeF3+2L88GzIq3/qBovpHppWKpo/zDY5u0n/WMzda6cj1uo54BOIpqoGJHTMqaSCH+EXVCBrkM7cYwI8TvHs0EODJd46/VUNF7cPQjQcvKfy0frEMrYGq3QWsOVPpi11oBYmVO1SyClHXMbCAKmDfqV+yNbyKSKZGFqoHxtBXtgvqtBWYafVO+grnAG1LwaQMD+ZUn5EeDtbd6Ww1Rksb1qYMYvuK2eSl29cd2Hw70NIM3H1C3yLC93v9aZYqknG2pWm7gh7cE17GGyDCaDPs0YxUnlmpgNxGuXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dtVmkYNsgpyaSiC5KBLrqPI/Ahw0yRAZgf8LDvPGG0Y=;
 b=KSX0J5LE7ahy8nq0X5H8kXDs/nGiovzPz/pg1tgDE/Q5R93p2sCkazMGpiVEX8SOOZQfJNRto8U1mLrx3oHBihShvlgmaIXCHxIVv5ZFuqbsEtEj/P0/hLys7q8RwC86zn5l+O8oeGhMTw7K/+HhJPzJOO1ZVwo5LrF6YaDwjA0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10376.jpnprd01.prod.outlook.com
 (2603:1096:400:248::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:23:40 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:23:40 +0000
Message-ID: <87v7jh4dtf.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 086/292] ASoC: codecs: max9867: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:23:40 +0000
X-ClientProxiedBy: TYCP286CA0182.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10376:EE_
X-MS-Office365-Filtering-Correlation-Id: 02083b27-c198-4bd3-8606-08de20b8909e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9xezyNw2QNk/mIFN11reUQEYpOc97uJZfCr/oK67ye70Xe4ZHvT78eQKwV2Z?=
 =?us-ascii?Q?FWWSZkRF0KNXjdtbNpiU7tKB8k2qDYyrwBwGexVKXQQfqv8ZMJ/XsPFkw1Sc?=
 =?us-ascii?Q?Tlr4RBOQoeBPMsUaZiqqtKsSrR6eFecM8yIKbSpDGsz97P9OUQOkyj/hx7w0?=
 =?us-ascii?Q?RRP0mic2Y640QxvhNSiLc87TMfZf87lQy0M2TNrFxAFBJNxhBj6lIQeVBeYy?=
 =?us-ascii?Q?XejI4sJ4lcs19vVOiP8c3A9F+SU/tlkNIUunGUiJnf435S23DZYmFnU0KblR?=
 =?us-ascii?Q?I6Ki/wVgJKqZ6Pvgl7jp/zGxl1uh+1olbYdiD4clwLAhrshTtlqvFrqPueYt?=
 =?us-ascii?Q?JJ+TmVPJuFKBIh3GG9T9a9MCuoxRlr+8nWRPjojDgGGbiceNCbdpFVtiqrsS?=
 =?us-ascii?Q?8VwAsFF/7rDv+3t831FqJO3TuU5O7IsCr+NAB9QzVDGDn/ARfTSW4xAMDx1B?=
 =?us-ascii?Q?mkqJ0tFlBkJIc4pnhDmzh1ze+HycLTIBj14G81NDHNLLHVmJFx9kZIOxUeWx?=
 =?us-ascii?Q?B3+Zrb6ZiMgrurB49tqTKu+ksKqzmIMjq/7PQPVZ+Lgv9OL+uQg6w4E20+Bb?=
 =?us-ascii?Q?miGthA6jHHvQa5PNpm7qsXAp4pg2KambuLsc4iLukO1vBfRAmJnZ67z7Vkj5?=
 =?us-ascii?Q?6YL0R/IvmkzMt9cjLU6MqqWX6fQp12Ub6ZNr9pzQhiZQd5K1u9ObTr/E8fVH?=
 =?us-ascii?Q?74AqwoL0o0PcJjAM2+JaV9O26Pz1kufqiHyLxRygl/Ixey8QrnGFmPrHR34Y?=
 =?us-ascii?Q?uMaURkkjjJq0RQsfW9O6OYRWQdglCnI8Tlu1AR6g+FX5917H3De7zS9zw3Bq?=
 =?us-ascii?Q?A+TcKeyc/d1fvaXWVs8HvHaYoLH2kB0XajGFfymxtC1RmI5NQSFI+GRTDUmo?=
 =?us-ascii?Q?2C8vVDuB9wc0x9lu8XMmqqdHYaBmECJN+abppKcVB7cydICRpQzcY91zM1Z3?=
 =?us-ascii?Q?2otHpi2hUn+QGx9l7J+WX+tograq15PR0b0f04J1lmTsD6WTI6qBKJjCW4Ph?=
 =?us-ascii?Q?1ooSiJHang4nkgJrx+hGOhHLFu14w2SiqqYvapmH4lrXi6I8mc1ZxLTvAzSs?=
 =?us-ascii?Q?m1I76V6rJ/QjhypwdDKC14KEyoUqj9SVOwY5aIDZpxbJdziknkzI8iSnJpuZ?=
 =?us-ascii?Q?fZgLYdwQPamsi7RVHdy1QjNe0DoSfuTm2JEfMk+Cq3II6oB2DQFvigKJ+gh6?=
 =?us-ascii?Q?pjxs4MNU+Rkd4VfKJVZCzrzG/mbJlnp2I3wwHpYhMF5RBHBxIvblWsrMuq27?=
 =?us-ascii?Q?mCpb6mQLJ4k93BFEBRzoW4JNdBZxx0ZH3CdC1XpHxXF3uSLS/VrleyGzV8gN?=
 =?us-ascii?Q?HIRYQ4HYCBRn1dzNgVsONz7eeYTeMoOAqU4Qfnkrd8Rw9FQK73n4F5M6tdgO?=
 =?us-ascii?Q?4YJ2BLOmWHXSMxPSTlEsNVj7zpuD2js0eev/ewq/Fs+O8Y2LywK8t9/JfvFq?=
 =?us-ascii?Q?0Yvdv4Yw66WBpEuw+VpnRXBnBP1vVbI/Qb4BebhZ4yFU3uvomdkwJxkEOy9b?=
 =?us-ascii?Q?dPMhIKnq4oIXrEMDfE3+P5l8NlJF2MVXcFqF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?B2+KuBTKHNhhXzTKulymzKBKLtXU4QqFtTZdjB1RMaK0NUnw3PyZPadTHB/q?=
 =?us-ascii?Q?J25mhn4Riqv1f3EzZx5PNaeQcmVq5o3wLMNdrW+2Z8O3fXDEA6i9I83fgNPY?=
 =?us-ascii?Q?QfWRlLv/cGqYQ4p8LiB24WV+KVmHfw9SzppmTdOSU7itxxH6JmctgQYno62p?=
 =?us-ascii?Q?Hs+SumjiDeu1dJVKIYaEjkkgus5UgteSa+XVxlvuoRwjDpDiOlQGap/scLMj?=
 =?us-ascii?Q?8MjGoW/Ys2jx6ZMwvRMXTVSMsWbeMzFYyN0AylUhr5bOZ8hD7Ea97DR6+tjj?=
 =?us-ascii?Q?XPcyPt21FveY0JVv1/wfdgVMYgZE7mVk/MklodYQKSBkDFZ5+6LhXwSRK6pb?=
 =?us-ascii?Q?h3BrpMTgrJVns3o6zAMzWkppNaomcJ6WR8slf0nI2sv5dwvVOK80SFGkKJ6a?=
 =?us-ascii?Q?8mG0V3EEmVSf8LXUOtb8NI/4b6vw/3ABm7anr+sujlK76PZyjM9lhvMV3Aum?=
 =?us-ascii?Q?KaIXrr+cBfq6AYH/+P2x5tGC3w9wwKBckB9AkudmaElXsfdbTM3pTq04cmFK?=
 =?us-ascii?Q?keH5puoG0+CQvnyPl2NJv+RBM7ro9fcSTdDYF4ahB4rLFE0O9qSC05G3Gp6h?=
 =?us-ascii?Q?e8We38HRtrcb/yhTkqpGGS/7U8uzMRE2ESc1bS4RdyQIAbbwHVzTHtC452CE?=
 =?us-ascii?Q?KmFtiY6HmgEjWnkvFlOXzSslNg1YUtE711gCVk0uW6zUM6NqnMLCG2UJPBqF?=
 =?us-ascii?Q?TDCObke+SqjWgKF0456SE4mJSHRXDDngZZKVRSMGrt+OViXUSsucbj0HBFTR?=
 =?us-ascii?Q?qg7OHwzSgehJNlGYa6nmf6YqMt11a+1x7w8JfVn+rm9ZaBmtHG36yroqyHFH?=
 =?us-ascii?Q?sQ+9J2LWxPzODooVKYNb0wpal54oYdIiYUQG6PUgztD84F2Uu9psLn3JMRUN?=
 =?us-ascii?Q?IdQ2AQ//1zp8X5t678E4037Wf/0IGxWMzvLmFkvlyitlB8RzYIJQrHQA01aN?=
 =?us-ascii?Q?AaE3k+M4g0OaXtGBALwXoMB4lN0kaGQPrwDpxcHT+63SDor8FbBb979nM2f7?=
 =?us-ascii?Q?C+MV3sf0SeiLW7KzPenzEJWoMUyMCFBeWKbUzlrV0RxaBsS/8rEtI+MQ2Ud0?=
 =?us-ascii?Q?eHyc3p2ORd2njCfh+2CcTvhkH8FLAMoZ0J2VwT+VwkKr0tCA8UxX1PJeVAPE?=
 =?us-ascii?Q?nfMd1CvMOkQlmVdajUW24IfjlLHn+90XcNeWMwYCNCmDNbRFpzsBfmt4ZHhL?=
 =?us-ascii?Q?8Kqjn23MoCJHC/gMrnaZHWDTTwQ7PAN/v5wBzdmvEHb4u1SRo9w6tj0TxlsY?=
 =?us-ascii?Q?hrDXhmXE3IF81EWeznmphxlz0+28vPiHpzkpV5Y2zFK6skz/np5OWhfHSUA7?=
 =?us-ascii?Q?u2f/zlbZ+0QXZDBqJHxvv/Bwh+hYxZ0WvITkxjshFC40wGMHArqODGsUcrI+?=
 =?us-ascii?Q?Gs25CEfsB+0xeEGKduoTgRKoOjWMOYyZ4qz8ZFd3P9Rt+2Z/X90GE66qtU5L?=
 =?us-ascii?Q?/RYps96rL2Z8CFlFrANNBk1ocgf1XWR/O0C1PrlXiIWhmTvFcKzXUJn+sq9j?=
 =?us-ascii?Q?N75E6J0KgIeYzf+dzfCFKwiB8PTil9ayKR+CbJEqpPWCmeSuYGLu4InoAgW9?=
 =?us-ascii?Q?az8nGoMWD+EkeueONm+SCPip1RlGfpb3X2LmklQAJlCfkbpBgIM/jKfaCi/6?=
 =?us-ascii?Q?1Gbm4EQC8ZUB6h7q1huE18A=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02083b27-c198-4bd3-8606-08de20b8909e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:23:40.6993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jkCXW2wWbVD94tMvdwTkuUswiJVTklHcqa24n8i6uLktO+4gahVqbrw6HF6FUkYnh1GX412BzoPJFo4d7sFY2Zb7Wo1tD9KhLOIwE16LHKMrOPv3UzyX1MJzxvSg9967
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10376

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
 sound/soc/codecs/max9867.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/max9867.c b/sound/soc/codecs/max9867.c
index 35ec9c1b18f91..9cad9b698cf2f 100644
--- a/sound/soc/codecs/max9867.c
+++ b/sound/soc/codecs/max9867.c
@@ -556,14 +556,18 @@ static struct snd_soc_dai_driver max9867_dai[] = {
 #ifdef CONFIG_PM
 static int max9867_suspend(struct snd_soc_component *component)
 {
-	snd_soc_component_force_bias_level(component, SND_SOC_BIAS_OFF);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
+
+	snd_soc_dapm_force_bias_level(dapm, SND_SOC_BIAS_OFF);
 
 	return 0;
 }
 
 static int max9867_resume(struct snd_soc_component *component)
 {
-	snd_soc_component_force_bias_level(component, SND_SOC_BIAS_STANDBY);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
+
+	snd_soc_dapm_force_bias_level(dapm, SND_SOC_BIAS_STANDBY);
 
 	return 0;
 }
@@ -577,6 +581,7 @@ static int max9867_set_bias_level(struct snd_soc_component *component,
 {
 	int err;
 	struct max9867_priv *max9867 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	switch (level) {
 	case SND_SOC_BIAS_ON:
@@ -585,7 +590,7 @@ static int max9867_set_bias_level(struct snd_soc_component *component,
 			return err;
 		break;
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 			err = regcache_sync(max9867->regmap);
 			if (err)
 				return err;
-- 
2.43.0

