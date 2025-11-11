Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010068.outbound.protection.outlook.com [52.101.228.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1BF1891A9
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820632; cv=fail; b=NZdye7a4a8e7yAssWCDpNwFEJ0VWpwK4hOt9c5vh2A+KE3PHoSjipNAGBYICZ9mDm0lc7B8jTJgJeCX+jD65Fv1N/Eh2aYzlVdi9VzQMRe9PRCem8JTgShRom11giGTknUelmM9zF8aXcoDjjtf9x/fgzF+2ZUU25xDzUUbQmbg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820632; c=relaxed/simple;
	bh=TL9zAS69jD3BNrA4SPv7eM2g375LuZTzCwrQ6nuA0z8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=RmfJjuMHXsOg/1biAr10M5ac5AqMevH68No0wJBSsJYa6Qx+Xc1TZ9yIJPgzyeEsgACHqyp5RCXq7vlmlyVjDtAtdeeWHNAOQt2MhJ35zPTEL9XvdbnvefWuHah70l98bqUryr5XXhlg4W/b+nfiFRVYTRMaWX2HT1J5yRLjhcU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=MyarnZQV; arc=fail smtp.client-ip=52.101.228.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="MyarnZQV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E8ZRDwLYx6++sXeKsGXEMYF6xrEVlmtTyu0/RFK/TYgGG1Qj4fk4pMQLpokHWjiFjMmZHVcYYFGwY5DP7ngkbqy8fQMlRH7w3hyDJnFXiH1+/B2fgLIWBURg0mhHzgJ+xh9j8Wirvp3U+G2esRCPF0eN8flPEQd+R11rEUdHsoxof+sLBRryXKJ2mvfS2tmFPQ1dox+hgdbYx42DpsWi4czawRkdY3w3+jlAYjePejIbNeKZFA/kCesrfoZ7pw+5zICxMGh2ec+YpDCxh89olavidYFHnoA+WLI/Ee7mMGgVxPoEyc2MRbonV/4LmbXuQxz4KiSnzNRbX33SL72d7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ACoLMZja419khemBQWCgBeJP3XG2KqQXh/L4RuWyYqw=;
 b=T1jT1S4LgiKqnzD3z8A3dv9KXKP1Z1f+pIUsfGq0sr7venZGJc8/mXXbtR2GGDNSVznXlzFse/fSVsp9L3jdOfC2KGK11IfHmElH/brLVms4crhNG60ERkGkAZU0Fgoa336xs4xnzte7WvrBGsjyw7D7SRjCveIXsougIX+VvcCeVjvmPsmrXN2NzhCSJnExlpsjRw61z23PPLgTJWUhJxiUfyyc0RJCoRq9DGV3pp3u7RxiAdBwKaxlXjZ/AZZN2N8j20Wrx3Ymo4elMQgEmuJyW5VYn7604s5Jku5I0+KwTQivOqbJLrwElIiTnqlJTFWt2xSfEZmdQdkAYM1HZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ACoLMZja419khemBQWCgBeJP3XG2KqQXh/L4RuWyYqw=;
 b=MyarnZQVwX2fxEwja2IH1W4m1+vALqRV4i4Ep36iTn2xTwnYnZ5+hbHGxG/fnK+XmYaYBHJEIPZLsDJBivK7E8zggTgpbqX0bMw131W6uE7uZs1ek/aEbtQkEoRWBN/JzIj0C/QA41hYcu6sdEkOcEmeRjjLRoMKMlRc/D1/KJI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10376.jpnprd01.prod.outlook.com
 (2603:1096:400:248::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:23:48 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:23:48 +0000
Message-ID: <87seel4dt8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 088/292] ASoC: codecs: mt6357: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:23:48 +0000
X-ClientProxiedBy: TY4PR01CA0061.jpnprd01.prod.outlook.com
 (2603:1096:405:370::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10376:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e2342bd-5b63-46b4-cd56-08de20b89521
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ywn3I6S+iDIijJAZT/8KhCZB6V/wdBS5QbkKJUupWS7Fe6PPo0qUIhJpOBpn?=
 =?us-ascii?Q?USlMpAn+KTCUScggH4Ml/9Y/O9psnDNx1WElMv2ydGCFjWujFRpXmUwSg4bw?=
 =?us-ascii?Q?1uNE/BNO+ijIH2SEuDTaqveSNVg6sDRDAG5ePPIY3FRY7+pXIGymdsZFPERT?=
 =?us-ascii?Q?Mfapxi4bT8Q4UxluaCTDAAlPN4WbXFJ1hJi27covgQs/pxNkTJC9+YfS6bxb?=
 =?us-ascii?Q?WJdSMfykkyh8KtTcbC8X4DlqFaRggjvSP9K30jfaOp69ztxB0QnVTaKEUtO4?=
 =?us-ascii?Q?FWo04N0e7sApmUMrPdp6fBS6oiRBOdrTcuZ4rycgyi9QlW5gaSK/l0UyuP6O?=
 =?us-ascii?Q?Qo4yK507sTlkjaZc4BVIHM/tUhA0eaKJ7D1kJQO2sKKrBt0Rk4hjhSsb1diJ?=
 =?us-ascii?Q?aYz7lV5R4sAgcMJ3CftTywRLeog/nWajyQIqGxdMD2GPdPJQiWD20Ovq8JcN?=
 =?us-ascii?Q?HkMF6VE5PgXwEB/2jan9oHnX57GQHI8zeqUA7THcuoUrW7k1/C9x/nAt7sMa?=
 =?us-ascii?Q?8tbPj9wxAFkNTy2IvgKznREsrMEegXwGbPCB/LRG9WBOLGTeIk7snnSRJnQq?=
 =?us-ascii?Q?rJEuVcz71mdfCZcBpdHIQ1cu/EMaYGxp3B0t+w05igsd4et/ae237uP35nnN?=
 =?us-ascii?Q?Nd5hJlX+h73LC1/UK/y58LXx4bqETGyO2tn2CN/4eB7OfLWVh18Mw9nA/b/9?=
 =?us-ascii?Q?VWgO69byzu1vh6KcZ0NCk/lQcZiMIiYpoRSCknWgr3fioW3uE59ez+j88sf9?=
 =?us-ascii?Q?f4HYPPKzzomPfgtq7LWIWo3j+F2yynA1lytxKLu3G6Itv25Ao40+NUG/sUFL?=
 =?us-ascii?Q?B3aaausk9s0W1UyCpNZrUJmXlQhHZQrr7mZ6XkGDsJgzJwVy+/QCgPInecb3?=
 =?us-ascii?Q?IBOBEHmLP8P1icf+vFvD9SfefWH5br5+fEcuNFVDWAH9USlPH6B24ejzWvqw?=
 =?us-ascii?Q?7IvapbE8Px7rr/sKP+ncEKyjbJ39xspilHZ2s7m/lK4mRSDRVqV6tOOnLz01?=
 =?us-ascii?Q?srT1+NKYzguOMjzHtPkcdGjiRzaUscN1B+/4A8zn1iB0n7bqLkQUASzZ/Ea2?=
 =?us-ascii?Q?Ti0dxCFEG8h5RasBJ94eG0RNKrYLHPxDpMDqdU8Ww27AgBCtixpJW6HzDbT2?=
 =?us-ascii?Q?APHn++eH9WN762jGctrUXyQOj1WJNBLDi5OtIsF/K/a8mUyQCqsjei4FPShN?=
 =?us-ascii?Q?RTm8qkeXt7wQvvb0RpH0+RpLCuc74dgUQWG1szI3InHkRxJ/dFi5OGSl91cf?=
 =?us-ascii?Q?8TNQIbdgRutC64ouqEwrNSkPzE3JtwalkR4fp5eTvNCrKIqfJb9k5JlUhbqv?=
 =?us-ascii?Q?ICLeYBJGgmXX5knAZCL7AetXFjB2n5C4plXCSpbqgFTT1NVPCoGZtZpjlusb?=
 =?us-ascii?Q?eKSoMEj3Glow2OXtqs50KMNjIUkn230M7cp+p/bxqH0yGOczlUwozQn/K6zf?=
 =?us-ascii?Q?KBbNhThqRGImvg5duKiOm6FQjLc2ZE4RdkHwP1Dp+F1d9JckjejgWf1jwyH4?=
 =?us-ascii?Q?hNge59dXaUljnbEx1rP0NJBXoBK88SlJvy3R?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/1gT1dSaC/Ib9Uui80bfZxo9yjy1tI7jronyoiV2iMNkdfV1Yr0++X4z66BQ?=
 =?us-ascii?Q?m3MhJvF/4wzKYXWdMFslD6SZpw9oWETxXdB4aegYdOji9vb1gGmM3Jdj+BNt?=
 =?us-ascii?Q?DC5gsfwVywxyWCOKy13l7wB0EEJi9PYmprhPxFvyZGCTxmVYlYy4sDBcG+nj?=
 =?us-ascii?Q?URU4X/PCYqxhRjifVIBVe91c8xKFFvqkCjCFkDON4MKMKi7oNQeMHQGylGjm?=
 =?us-ascii?Q?wuED3tYh+BysoiAttGQFIfUbWltWmdojLzLeka/ySUlENECDOUR9UJ8hVXkJ?=
 =?us-ascii?Q?4poxGUkZDbEr+V5Ng6fYUbHtrgVmIRdLIPOzUgXfYaYh4kK1F11rYcDXg9aK?=
 =?us-ascii?Q?9yL9uTmma6Un7WprCwdorSXofTDdxXwyCyFtxAKrNcT7s1ZXmXyyxbx8L23h?=
 =?us-ascii?Q?3y7pW6qNVCX+2SwqgVFbrFk7BxjWNdz2FsSKy0+ld+MTLZlYefLtjcNS/KdA?=
 =?us-ascii?Q?VfPR4b61ucOm3UGnHEfqaTMNBB+D06OI6/pTQoEjxoF+jAGPDzmSTzci+y/z?=
 =?us-ascii?Q?BqDq4A2cZIgV81S7dJ1Hst9XyHzN/32EjMEERDjr5NV3v+qFpJyBQdwMaLba?=
 =?us-ascii?Q?+KPw6PZ12gOVkRpJidRYJcb4/h5yVco0qHQhFD/TFwp+6e1EtKIaptOdnDRA?=
 =?us-ascii?Q?KCGTa5YgyCDfz9j/mTEEB6luZbRVlRYxGS4cLvhazmHHiugzrWYHXzswicWs?=
 =?us-ascii?Q?nBQyhhrzqShmXApc9P4gC1mFfpHqzWvUQyPNAfyBf6RrW20+1N1Aka4avNDy?=
 =?us-ascii?Q?Gq0yAnHoLI0lIGYjVI9/+jfu2F/nh+Qob2wfNRPVNX7TDdY2GAjQjSIvYvd2?=
 =?us-ascii?Q?R9vJuG/9399mOSnyJKQTfTF23MVve8fGabmk41A1CIJKM9HUgo/0zs5b8nvW?=
 =?us-ascii?Q?OXoNM9S+U5w/ydVX5fgMU4FffguHukoTE6b7OvotW9rh8hpg/CUv3aaBXLNY?=
 =?us-ascii?Q?g3GvArh8qtMvcjkqucT0PK/aNUqKRF5U16l7cd6EyGmzX4frnwCtei/EF+IM?=
 =?us-ascii?Q?JQGogPm+tkM++nNwrcp5lk2lOQJsG1omQl5xW+dI1ZnyUDRDIEv5nAYKrkM0?=
 =?us-ascii?Q?nosBj7yJ+AJrzgnHCljtFFgQZZmCI94yu0Mrt4NpZ0YI0b15NbWAp/joEZQ9?=
 =?us-ascii?Q?UScRVHjUQwTaM4Q/TOkfkqoRHNuQkinAWnLAjDriT8rXyV15q6DkkYAHfjT2?=
 =?us-ascii?Q?mbWk9FsswFmMfyTHJN6ooYT8IgNlW6G17FEcOLp5MAniFnBsTxFy9KI8RfIl?=
 =?us-ascii?Q?VVX89QDHe0ievP3VlHcMd/4yyP25+uBCCMQT2TiKFcBmyBwYWpT2ir1ilNRB?=
 =?us-ascii?Q?bPw3YPD5JeQEZqqAtt7yoRZXwVePsCDM5WXTRMW8kdOqsMOL1zDPfNUzkQ/x?=
 =?us-ascii?Q?1Ve4iPTP3pFZAysGsIJxFqbQUlMyIVmSTyDobtiMXiX+OgJPwmORFY/LATLI?=
 =?us-ascii?Q?/pbR1MbLktoj1hrQF/Id+4J9Z9UWV22ePi4s0DN0cCYbB2xwHUfjGqOP2n2n?=
 =?us-ascii?Q?pQP45VJEOiOVR6ta7mc5RiIlFUx2HQbl6G3zzmRdg/GplKPYa+9GCySFZfae?=
 =?us-ascii?Q?zqIGYujIOgTjuKkQu4/rfY+ZoWpw+payNcTUq2hj8Mzi+uJMpdCMGfudGbTF?=
 =?us-ascii?Q?JIr5Apdq4+wDX1T9vDj5t0w=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e2342bd-5b63-46b4-cd56-08de20b89521
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:23:48.2129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EpFrE86N0bkcyGRltKFErmSYSDBk5ddqPw4pZzIccvNf2oXdhSm5bipNgs8YysL6m0+9pmssRnKSy6+oThCznAa0k3heGmDG73bd78kOv4+ooh5XabyKQ8T/XlHfq0c9
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
 sound/soc/codecs/mt6357.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/mt6357.c b/sound/soc/codecs/mt6357.c
index 988728df15e4a..674cf7df9df4d 100644
--- a/sound/soc/codecs/mt6357.c
+++ b/sound/soc/codecs/mt6357.c
@@ -597,7 +597,7 @@ static int mt_mic_type_event(struct snd_soc_dapm_widget *w,
 {
 	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 	struct mt6357_priv *priv = snd_soc_component_get_drvdata(cmpnt);
-	unsigned int mic_type = dapm_kcontrol_get_value(w->kcontrols[0]);
+	unsigned int mic_type = snd_soc_dapm_kcontrol_get_value(w->kcontrols[0]);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-- 
2.43.0

