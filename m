Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010013.outbound.protection.outlook.com [52.101.228.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DC21D63C2
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820805; cv=fail; b=R3qBW23HTQl9/bLdm9jxlUZecXW/idqOFnZ+4Zs79WF0DLnYgWg7ZebVHVvR4UyDnvLrRZMrdF6TXYWyuX82ZcdLEkvaRRSiCtdXT1t1sciEnVKa0yr4/qJOn6JY04kXcOMFWttnxNRcoWQAqYekuw6BcUNvSmaEi8taYwgUeJo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820805; c=relaxed/simple;
	bh=aUnGOF6THwhHXZov9sA/VDqgbXlVUp1zvYUYv/vqWCk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=n9/MqFg0Xd+hmodUirqkRd87PPvCZAWUfgK9y2iDCW8ZLtI1TYWzLr0pjp6sHIh5DcsiPw1Zj6nBr5IhyS+8yp4A1y7QO1TN6XjCF7ecr5ZULJimMLosiuqaVpceTRsJiPiGKEl3dVHAdWqQKJjYq9yWTLM4WvBfJr7mloGG+DA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=bLHmFbdw; arc=fail smtp.client-ip=52.101.228.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="bLHmFbdw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZaGSGt6tZ7zrK+vnSMfC0/KiYtY1+2V0b4YrlUEZrB//R7BWHI5nWqRMPgh+fv3AFzrfATkBgg3EtAGN6JIBdAKMwrY0Vwk7n9D58YsQFRlpo3X5/GViAkR/lMa9kVENZ9yzbHAXFh6w2gEXQWCH15zyxDwXvbvG6pFM+00AN7UgZzRZhlgMdonRDEopQx7XGeCpBCkiphdsfwZlKeKr68W/hV99HrMdQhbfihN6Blu+o3mjN4tVMggjgR2q0E5ZCiGi0UJgS3F/q69ZZ6ClQLI7Uulppwb7+msc7HkieP1VG2dmi/wZPcjPXW3C91bEteiWPTNtSvqHDmW8zMOfDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d3xg5KBKprVeBi0ISUwanva54hHUc0AlB+xyYgzenL4=;
 b=umhrb5pJjOiQaH+QuCdX2MG6N4DH/3556YadNxYsXacdmqx8nQl/ii8xL6x6P1lsb9ZI5nuR+rExD9/fCKBsxI5YHX9dDTAyDlqvCHEqrNwA4FEPjoanuEnz0Hz4LGbEZJMWNmPCmtbBRjuAjMuhDPrBknyifHeIGBbK1slX/8sTTY2m6FVdcv6wG9P2dRlyVj31wou65GyE3jaL6MPKLFRN68BuLwrlc1O9dEMdDmfn07tdT2MIVllfaBdvq+LFPWizEosMPoKs0NCynXHlz/Pyr/30KtAVEMZJv3NwnZ+it+K5o4pUdk4USKePCjFR7RCbmx1OhFgYrxx9Lb7LSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d3xg5KBKprVeBi0ISUwanva54hHUc0AlB+xyYgzenL4=;
 b=bLHmFbdwMfeezkWyLRCVfDXZ7/2JsZbsh3q2IFo4t0BNI/WLv7hUf4lK8BmpfaxSlTO+Rn9IW8EzG22zzkHodX4R4B5RULQeId6+1YyE4IYKDz/e/twtv1EbIQeo+Ls5tbv7LzOVPSok+EPxkT0+ftBDM6VtGP/93oI2kzrGZ20=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB13460.jpnprd01.prod.outlook.com
 (2603:1096:405:1d7::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:26:41 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:26:41 +0000
Message-ID: <87wm3x1kji.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 135/292] ASoC: codecs: sta529: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:26:41 +0000
X-ClientProxiedBy: TYCP286CA0217.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB13460:EE_
X-MS-Office365-Filtering-Correlation-Id: 536ef2dd-c461-4ec0-4c4b-08de20b8fc5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kkX85coRk72LzBY630A9AgqECACXrRoVJvQYEjClUQ/r3RPkAkiDoGKYf3Tg?=
 =?us-ascii?Q?wPw8xIWSOtzkJnW0k1pVJ2hApkxCxjA1ZpsSNguDb0dXJ8GxGOLc9+CbBEVE?=
 =?us-ascii?Q?Ln4cjjYXsVzreY1D1hKbvgGRpBH3K1RFnAgInWq058CxYhdojdgTi5tOirv+?=
 =?us-ascii?Q?SlwnNcuPUUWImxzKhlaSamwKZXXRhWyerVVNN2ewqcxf2mDUxPvGxfHglydA?=
 =?us-ascii?Q?IVwNTbsRxmCGn2V0oNyntltzL7NnN413yHvWxK+YYu1PGOF8q3o1Fk01RvHn?=
 =?us-ascii?Q?CvFPTW7ZKJqHXYo56TUtQm3x+Eor7+XhN/t+uBaW0F81AFdiWLa175EZ+Oot?=
 =?us-ascii?Q?bSlKsx/irlGy/yKk3S9cbogZtghFjWbEw5dpHdrfxvlIMdxmeI7m8fGv+m2m?=
 =?us-ascii?Q?lAxZRz/dVNGzymmyscx1ihb7YxcvLnsjP967aVo1rhF2kNsH7kgByrz5drse?=
 =?us-ascii?Q?CRz4Ia/Af1OflA3GNxG4c5K1MZ64CAE21LLaGuUbhNvb7sGS8M+yRbfkMdqY?=
 =?us-ascii?Q?HxhYmQgSm2aAwMilDBli4R9QLONq9gfKb4PWX6VO2v4G13m3hWRcZtJWqk8q?=
 =?us-ascii?Q?7keF38hmh97kByaRnRaRh5emd2Sh76oeX4qmPNqO3S5Rq909gewN6Wc2pOu7?=
 =?us-ascii?Q?hr5CQpVzLv7pEYqOj8zb56Av3FEzpUGGbt2nEqoib4JXGEtTu5875jLYDzb+?=
 =?us-ascii?Q?0jQ/olqTgwNtCCspRXvNDFrtMBpG4qlXeI1xZcUvyyQn3eb+gHIfRPcWFKJC?=
 =?us-ascii?Q?KXQ8YewqN7UqjIuELOJygamWp5alKsSwQBv0eu5IDk4pniT4QephpXvJGxoe?=
 =?us-ascii?Q?v1ps5a+20I9XLKMrZh+zmRIam1xid5PTKbpkqkMLzVKODFJPQdwPsLoXusov?=
 =?us-ascii?Q?xcOvut//vCAm9Sm0HcwgqXGtQfqoS4ZvSwM3BqZXHeryj+NtVXwDcC8G1nFo?=
 =?us-ascii?Q?2W2j9eFohLQ5f2MPkRilndauz1GaHLVGr/H57K7BbQCzoVFF48zZVHbYH5s/?=
 =?us-ascii?Q?4cZ98dBXbYahsFDcNS10OeRAxMB9vhAekZPLyy90wnj+P+cFQIsG0ygJsR82?=
 =?us-ascii?Q?cdyj6haQ78rKUTbh306ctvy9ScnqBBeg6uaTAZRyf4cOFiasP1Y+f5TpNHEI?=
 =?us-ascii?Q?j28/8JY95B1ZNSyZuQcsvPosPRpkmwbBw/xLZoyD/qpGWhw4YvEuPPWgA2FS?=
 =?us-ascii?Q?T8aeF5T8gXWXpwIpOD0lH376HrzPS1S/UuoVtQwCV8z7ruocuisxVvJ2QLbb?=
 =?us-ascii?Q?uwf9pZzurjTMS/dQJZ801LORpg82x2EnweNUfk9vSYZTEe5YbmF3EIzUnsVQ?=
 =?us-ascii?Q?baH9Itv1zQ+/t4ioPdqwqW7yZWRx4KU9Df4/8/F3lD7GBGSx5iaBBWD2MJha?=
 =?us-ascii?Q?rCv1ITIE6fs1Dj8H+vMof9Vqav8rzj+XXKru/eePmFYhUjd3C2XmBONLz7vC?=
 =?us-ascii?Q?ZmSWuXO4bdg0YAp7pXO1FbtyvS9DAS6o/6Ds7Ld90C7Sxn6VH5+JBcqvwY0c?=
 =?us-ascii?Q?JpS7wObfSjynAnEdmLlEFQsnkMuePCeZhEwN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6DTiVoqOMmQ6vSJJbq4MhyDZT7sWOUoBE4oonWGRmvmPAGO/vCEkcGlxs4MP?=
 =?us-ascii?Q?Fgv84GzasP0NO1s4WTvjVecD1H55NjNo9sweXl5l/Gq6//JV8qkjAxj3kBZX?=
 =?us-ascii?Q?qIdl+6B2THaExJT3NK8cYEMpZhdLver2kFM/T4hOHmUEJ/KH+SAxe9F0ovRt?=
 =?us-ascii?Q?NKFKI/U1uWiluswmXkFTXgAuwZk9j0WjHXfadSSX6aKKe5Mi5j1lrNfBokwk?=
 =?us-ascii?Q?jHwfcxxrNNPVswtBXhWsXuIUFlaXowJ1mwxMbVz70nG0ynCne1qE1ESv2epG?=
 =?us-ascii?Q?VnVHiw86yjULdxpgjUmg6BuaNomTmpR6MYtkflc/2xWbB/jwBc4fsVner4hH?=
 =?us-ascii?Q?CHHkuApCbs064UDUYOJw3kepDqOeeo0xjYDPnymA5KKQzKZaxmY89FrtEiia?=
 =?us-ascii?Q?hilvEqr52yKhNEvElTr8nZayQWwqeV5+e0E431TM0PtV0xx0rR4lgnuhg0lJ?=
 =?us-ascii?Q?1+BzBQaffzL4n7QSGQdLJfDixaVSo26+Jyl9TeVvYeNbw7JNVzlQH1ZFHhi0?=
 =?us-ascii?Q?gSM881Lz2mKlHI4hsaWepLEMWBxoLoWyR/7UVkIrcICmQJF8txnMFp0FJghJ?=
 =?us-ascii?Q?Lc6D7rFKAoPtUtcM5pDuVIpCdAfSEKhUAd55LJfn0oUs1uMt4GydOA2U3GfB?=
 =?us-ascii?Q?PWoBhVffp7vqh2rmQKE4BG8oORDr2pwuiuHzlxh9d/Ntb1aN1yFwdS+bn9k1?=
 =?us-ascii?Q?a49u4qUYn+0EqsF2nF6dZGRSFNBc55BOSgQF4H9TvJKr8xIG3ziHwZBB0qeC?=
 =?us-ascii?Q?QBjJev+MPun+FmVpHhuRZQx97ghBVIMXZ6E2qshHBCoZfR80D08uifjlT8xe?=
 =?us-ascii?Q?gxYpAXF+8K4wUhfsy1a30Q5Gly7qp/yE51a1SPAhA5WxoxMXsVcwTO5hCRWr?=
 =?us-ascii?Q?OzXGRwjCwM7CceC+TUdYDyMH2rC6mPHsv/hx0Tr42AH0ioB+lgqc1tw1/d1E?=
 =?us-ascii?Q?DvmRfcpeEimonsVcEryHZLrkmN3np4muyyO1PzqVJNSjDny8IMOSt9b4Y3XD?=
 =?us-ascii?Q?D9mFJD4rfxPeIPLIZXkUPCl2Y70JUJZcJIK5p3Lb+f7XUW12Qof6I4roL51O?=
 =?us-ascii?Q?RZqZEkJ5YO+G5vVtKPZI3q5t6vl/p0Bl96IyxEvNpaDv9PyK4EiJdviWhrIC?=
 =?us-ascii?Q?zsvwtMvp8rtVSpBjSgkJiQJJ2GnyMtYHh5soyPKPQ+ePsMOTUiZn1DDVtrrW?=
 =?us-ascii?Q?etgtXnISFQ3BaYyG+b3TocMRi382eLtLxcIwos8a6o8NkQGY+6miVJ9j3746?=
 =?us-ascii?Q?9UasJclfrAQJAJ9PIGVmk6XMD9dzgzTnQiitUylPfW9oKFHq+7qs0zubL5gp?=
 =?us-ascii?Q?qA3Y0goi+1R7IkVjqqIMByAXx9lTerpueeuc4I2tQ1JI/exGmJTzMPPBkTn+?=
 =?us-ascii?Q?ZKkSMp8OR5QA27El/TshHXzsNkSsSPq8Bz/3skgwOSXirONuSPi0CC/8609o?=
 =?us-ascii?Q?itREn2uTMmOtewHyuuwd7StUZXj0Tzl+ZDVW/J1cFFLx6wRIizTTJ+B1aqP9?=
 =?us-ascii?Q?xIAAvjn8PhTs+y1vw5mFr6tiQYC8pFBjn3yRoxHBHx3krNBUkFkjyeWs73Wz?=
 =?us-ascii?Q?BaABWRhXM/ROkuSvynVQap6/gbkudk/da6910X4ka4c1fnvax71BlW47ZA/V?=
 =?us-ascii?Q?rLRpm2BtnkXyBHPGRcxZJfE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 536ef2dd-c461-4ec0-4c4b-08de20b8fc5c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:26:41.4179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A4RLEuMbY+hOlAj/obSwJ/a9m6DlQQmFAxu82+gwRr1xizJKwUKIs88i52hufYb43eXl+665i/jDUfb3iSjF55VEURb08ektxNLvE7Oj/DE/MK0QnauaE7psivc8sOyb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13460

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
 sound/soc/codecs/sta529.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/sta529.c b/sound/soc/codecs/sta529.c
index f7718491c8996..8c3b2652b02e2 100644
--- a/sound/soc/codecs/sta529.c
+++ b/sound/soc/codecs/sta529.c
@@ -155,6 +155,7 @@ static int sta529_set_bias_level(struct snd_soc_component *component, enum
 		snd_soc_bias_level level)
 {
 	struct sta529 *sta529 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	switch (level) {
 	case SND_SOC_BIAS_ON:
@@ -165,7 +166,7 @@ static int sta529_set_bias_level(struct snd_soc_component *component, enum
 				FFX_CLK_ENB);
 		break;
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF)
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF)
 			regcache_sync(sta529->regmap);
 		snd_soc_component_update_bits(component, STA529_FFXCFG0,
 					POWER_CNTLMSAK, POWER_STDBY);
-- 
2.43.0

