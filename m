Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011059.outbound.protection.outlook.com [40.107.74.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4075123956E
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821293; cv=fail; b=JSBftsO1MSxeS2ZhRZVKjBc9CPMGjiEd/UN4Dtjcs7KzFRENWFFjtPGNExcxQV+W7SZfOVYhwgfcD1aikqDARJCbMko7LHfKFJ4R5SMHjowL2fjipEniP4dd0tZNzLqKedxaPbJlbV8kh+ARuOgc4o2SayjAbIlJ9nLRHvngvd4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821293; c=relaxed/simple;
	bh=biPeAwW0IoQqcUY9z0CN2hcBYByIwtMTz8JIlYy3SsQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=JV6I6FKbFNjMVeyhKGTXw087GhJpvPNTUZ7K6e1S3eICTlsQave4Rwi46G8hIsBeCakHo1O6wV84g++wOfT+QU/hwJfbRS6Th+AnSbbG1CDncViCuF95fAL3z7pN0sAUBhlevcBxnJX0jl+Uka+mDsMsdlUaZatCooJJF0VoLtQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=AHHBa3Ze; arc=fail smtp.client-ip=40.107.74.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="AHHBa3Ze"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jycynLn9vzGnwOQMWqsRnTBtXfdkJeLVytQ5X6+T3GGUxHBEPRnDgwuM6GeB0Nrt9zwyJW7SVtr7MbpO5EwmR3y/XVnu16bbb7edGE6AFWjSAw7eK3z9KK/qHrdfDhtZlmJgQZ1+1GExvSQo56GZxz6mnw6GO5xW7Tka6uqzLUoScz+nxE/fZ7CL0Lbdihr92UehkbuB9fqqWYruoFKl7tEfoKSv7Np5JmINbvko4KNdATWkwlsXJ4y2ZftNGBI/qKY870YypAqDiONsMyzTVIQDVrDNO3egjs+1YTjNTOi+qs1++6TdhU00iz3XTWovWTuSgaIK5FYr5nDUbuUgoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W9SYerBRpw849DYVmNXVpa0j+XF/G1PmKSK1BI45GVw=;
 b=hQbVa/fZ0z0fTIj7ROevk5neQn20nf5wHxdlLxDCoY0SxWsq0qhbdMMbWlAc1rvWmsSAmnIf0UZAiskh43WevjTjFtfN9qQbyFAgv84/1WajiL9p3KpepbdfzJkGVfrR4OtII9nb/+mra5lQAKfgWjUCjcv4wjNOfTE1z85447vRvK5RC7Kv6Ef14+Kq1eLpMEp94yLeCtic+5q/4yTc+lNYunU/pWM3JY9gFHjzkvh7A8/LKUumDACaFe5x6rsBTkjyEz6bWVEbs+XZGgd/3FgWAkxV8rkVB1KLEImqLLGHG8ZNrZBy6D+mBirZu30xPxtWcUyEQWD75XohZtgTmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W9SYerBRpw849DYVmNXVpa0j+XF/G1PmKSK1BI45GVw=;
 b=AHHBa3ZeY2wo2VdVqgkSVd1MQMU1fZoo0BmcW+AoRXCprEu5JJimnDk5TBHcp0c3nCpgeaXtbHKxWLUKyFLoD4KtmXxch+q/EsBgsjjRGun63lN/G4Oa6Ne2HVHJMqMe15wLZNansk472XzDXqbpFjLDyKQyWkXZw4TGlcOB2i4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB14482.jpnprd01.prod.outlook.com
 (2603:1096:405:238::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:34:48 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:34:48 +0000
Message-ID: <87bjl9v23b.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 250/292] ASoC: samsung: lowland: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:34:48 +0000
X-ClientProxiedBy: TY4PR01CA0027.jpnprd01.prod.outlook.com
 (2603:1096:405:2bf::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB14482:EE_
X-MS-Office365-Filtering-Correlation-Id: 319af6d0-c51f-4a72-5c95-08de20ba1e94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HO76lD+JBg0acMjGCAhId8Sjz84Q32F5dxQkiWf1CV8Bo98DzgcIu4P0KjlT?=
 =?us-ascii?Q?Cpdl3y6z1B0fQWMATpppHfY8AIXTqcfLuEYYP6bZGo2AZfK42ygyKh4SNfkP?=
 =?us-ascii?Q?LcHCs33Lxq/iO+qVxTqzG6UoeSw3y6HtgoIchd4mMviBXDdFvE1jprEWbbJM?=
 =?us-ascii?Q?MJ6OGx12PlfzB/yD9i29ac2c1e0pJI1H2vLdn9w3kwhvd0qx5hGnfvW2BBo+?=
 =?us-ascii?Q?MkyhoJ9T8SHrqSUOAQQPXd1eU9Fsa+NNhp7YDtbs7pPIDZTDKvNDzvKHTI+B?=
 =?us-ascii?Q?bBTVslkqKe0uudhkN1v75CdRv1OfTgYRV5hJuxpn10lWUy7AZVD9bKRd8Mn4?=
 =?us-ascii?Q?8KSwGspWZQXu+uxmIi5yA3PRrtATNwvGJoz1jkw0fzDv6Y1E0y/G9Ifp4g2P?=
 =?us-ascii?Q?1W0COdwFC3XrVEZIJ4wQpwSLR+6XmwfnphEOyd6MPbbWHL5zF5ItfPbJ5NQX?=
 =?us-ascii?Q?TZ1+AxwKtoSogEyy+d8e9xNKI611iYCosGdOjMTE/qYLm1QkzXzOrBR5qjwl?=
 =?us-ascii?Q?l+JPBYa12TDJgULby0a5wGvHMzQmpW8YSArMXCNk0GnX34sSXsNHBzJhOqjs?=
 =?us-ascii?Q?NEf7ZKT7218YMx+1mMCpsdNloYrZQKtElKKis3n745rsULWo/fivsKewl6S3?=
 =?us-ascii?Q?WN4q1/bfGDmDVlMongWWt6hGgrPp3etehELQJ+QkmUD7i/GcExY7ANUZMHlF?=
 =?us-ascii?Q?kaX4hJ0UetlBHl8VG+rTM1EFdLncxsenRobo1yd9LxKqhaXm4AocQMuA8nND?=
 =?us-ascii?Q?6zgJxosejRQ7Hpg3WXeI6+sPN2JPwCdh9DUNjRmHgtxKsdDyG6U7k/CSP28T?=
 =?us-ascii?Q?oU04uuUtBbn9SW3rK4cUUSmgLsBfnFc6xfB8WjcAYM1PKzG6PWlUDQWEdcFu?=
 =?us-ascii?Q?odlYn7yz8492x3Jh3mDbF5Byk6/nH9RQkid1Bqshsvln1U61//lw1qHwE/wj?=
 =?us-ascii?Q?RGEuY0nBRPlEY1kTvblLnssZfEblOpmphoipxuxMkQ+bbmrnZHuA3XWsXxuX?=
 =?us-ascii?Q?WR7hp4PIrS3YfRxKJII5pCWZFfBjd7czUQrzXqUdxS0NAkmeG3kYOtyddzid?=
 =?us-ascii?Q?i43L5vB2Mj/2QcANw/S/4dVlu3iKPydvdoDwFeswA9trxZtnkwVbIu6hk03C?=
 =?us-ascii?Q?up8nr3itnpkWHh9o7vTBxAj+AbLShw3xpNQJ2jmHq7PchCpGumeWOZZVSsaM?=
 =?us-ascii?Q?oyoZ5guZrgaDrQzHus6Jgg16eLNG6RegKFjwaughDN/gw3Ai8wl3Ch49Jdl0?=
 =?us-ascii?Q?xv5szTVFMBlETVyBzSLVRQ3nq0xJpQGVx61Ms+p7KisMb/RAHgThvIdmnyOu?=
 =?us-ascii?Q?OOTxY2a2Z+TnNR7m0ekxLkczonzlPOMPq6YglZ9upltIpmCuGscB6YrJvz5A?=
 =?us-ascii?Q?QUK6Qvx583DRpn64wih5+jo16RS2n7mgwKOG7ulLJfWVVSPK1kJ5dmc+tiDB?=
 =?us-ascii?Q?yrJUP2nSIFn+r3IWzd4k3zQUn2teeFDyqc0fwEszkgWdG8CuAl0VdcxfFgHg?=
 =?us-ascii?Q?NAG2ZmfB31+Xovj8EdWqhcp7xQLFtfjUJWPF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5A3+USUZ13Rt6Pw1B0uO5odzATvjzfuS0zEuhU8Q+ppnuNtaU6Lg1Zz7Bids?=
 =?us-ascii?Q?CfSkM6pXpu9AJXOqPTgqtC9daxJod0GwDPVuYyhgk0ROR90uWkqMV7PrTFoY?=
 =?us-ascii?Q?SJjkc1B+mVV6r6eQhDkNE3AvPwS71AbRdcYh4ekSJ+RdWI80bOu8fEtlD2mG?=
 =?us-ascii?Q?Hq4/ovxGrejrZpRhK8JS1BLUJaqVfdrJuHCThXnIcUc3GgQHFZcuJbp+VmNw?=
 =?us-ascii?Q?jJS95y9BKW3eP+uiGEyVR7RR9sssFSoKwOyQaJFOSYQ74c0Rj9e0RH1i3A3F?=
 =?us-ascii?Q?jg1jT6UmEUAuZU5w4EkVXPI3gAfJI2KSQBkaEqCCYZvv6r/KbdcDPRKvcRTW?=
 =?us-ascii?Q?HtlUcjeSEALVdIOQOM2fQZmmqJlmY+SNRx/pmO969lCJMl8/b+LtDUVsgU2r?=
 =?us-ascii?Q?tsPFE6mk/Qvpto53hFFC8fVrg1M0gSdlaOkgs+SvajJZyO4pTm1Q3bYt2cP3?=
 =?us-ascii?Q?CBLBvCUVu4PGaPACvIenKDGb9WEWKoKZssn2ONYch1N4GuoSDfsHVTHB+v9D?=
 =?us-ascii?Q?d9tTBDdfmA+0LHPoi8lfiDE2/XiJDhSY/BY+AdhMUaDnQAZZKT0+Fak0xgFM?=
 =?us-ascii?Q?yYTcsUcS49hur9ZsODOEXhxvdQ2Dw36z38TUFXtOPstMF0tnIgLdoCbKZYiG?=
 =?us-ascii?Q?mWiXpL1QPtdbJ0S56YUzxhuuDsgOR08IOYWF4UgYpThfD4oZB9UbXl7K/NAh?=
 =?us-ascii?Q?+EocpDR0kuEB8OvU1OxdmQHlTGNriOXZfgObBbr2Hf/GQpC5aeeiTiHFPU9v?=
 =?us-ascii?Q?9TM1dOu4OjBHsYcjstQ5XtPuycxtnU65HXfS/sLWzkMJVAlhXIAx1/TCcLew?=
 =?us-ascii?Q?dwLn9xsriVuKvMrqT08zIrz660Q9b2y6Af0GHNA7yYObIg1fMRFcqCvqMhPD?=
 =?us-ascii?Q?Om+zu9LuJF5bbnio2O5J4vAzSSVTgVlAwoai8jitnaXm0FWR2u7KogP1w9h4?=
 =?us-ascii?Q?HREyxiGN0KdXhRIHkoDP0BFJe/EVkE2D62eJBrSO9LtChbz74ZUVitJoTmhB?=
 =?us-ascii?Q?t3XSxPb/S/B9Z5h6E54N4EhvzvInZa0DMgqJJtUVWG3NudxsQsSr+SecGayA?=
 =?us-ascii?Q?TFbDKdd/G69ZEx1kkg7H2cNki/uTeQmBjKzFS1Sw7pHQzj893ECO3B+j6BLG?=
 =?us-ascii?Q?oULzHaH+0kgrTkqr1eFS9mJFu833Q97JLJEWtaCRRWPXd3f2oI0+9pJmQtLn?=
 =?us-ascii?Q?pmKSgSWiC3/9NL60uqwD2fSzMWLoOWNPsBhKh0N3+9KqVdCU02uDgauFY+k1?=
 =?us-ascii?Q?Nhkd509r3emYhHUIIp2F9qaXQGU/LgrsLghL2AUQaZMV+ZOe+hbWjabUSJ3L?=
 =?us-ascii?Q?O6FDg2VkMEYfEnSv4dRgxDn8d7h6kBeeakdaHozdaYfeCu9Hd0ew0LahoH9n?=
 =?us-ascii?Q?/JX2lx3MW79tW935vCr+nqeYlj2/TkGupZg0apYuIVJdnxAC8ayLm36qsPs6?=
 =?us-ascii?Q?tW0sCxo2gaCwF2LZ/zNcjz0CcSt2QGt83ggUU4SgFRNOSmA4c8xPuFjnyPk3?=
 =?us-ascii?Q?upWHxFTfPs7RQzZmxwyrZgVs8JF1rN0uINa9I6R3G/Ey87AlReNqg38EZ6U1?=
 =?us-ascii?Q?IMhBQial4DbiwBKtVPB4R7tU+lcmm8c8fXf+X+xdYoZUPFRa/dQ/cxQsngfN?=
 =?us-ascii?Q?+HXLk6w+dUXzFnh5br5Nn+Q=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 319af6d0-c51f-4a72-5c95-08de20ba1e94
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:34:48.3102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /v98bvcJbzNODAT59F1a0zvq1C8dy1WjJVuBKvvm+xXDxq0UMndInm6K+Y8ohTFbEF7jmMYn6ZaI0WGLKiZLROxX5qYfXRszZ3X0UDbrlizbaRLgIzcXzVCFHA4qgPaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14482

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
 sound/soc/samsung/lowland.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/samsung/lowland.c b/sound/soc/samsung/lowland.c
index 1e95a2a435d49..ca9b78007dfe7 100644
--- a/sound/soc/samsung/lowland.c
+++ b/sound/soc/samsung/lowland.c
@@ -70,8 +70,9 @@ static int lowland_wm5100_init(struct snd_soc_pcm_runtime *rtd)
 static int lowland_wm9081_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(rtd->card);
 
-	snd_soc_dapm_nc_pin(&rtd->card->dapm, "LINEOUT");
+	snd_soc_dapm_disable_pin(dapm, "LINEOUT");
 
 	/* At any time the WM9081 is active it will have this clock */
 	return snd_soc_component_set_sysclk(component, WM9081_SYSCLK_MCLK, 0,
-- 
2.43.0

