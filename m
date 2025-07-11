Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010020.outbound.protection.outlook.com [52.101.228.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D5B3FC7
	for <linux-sound@vger.kernel.org>; Fri, 11 Jul 2025 02:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752200819; cv=fail; b=nwNCkb6icNAglxFU0Cm+Vu+YqlSXLQPcp1fe0sZhX8zKnVNsyQUbO4QR65ACzb8X4W+ysAHjb07vImZX/H30xF41A2aFQHYqiIVTW778rk+nVAK9QIB6Opp53ia8vZe1KumxMXUjSEYgQJ3XJ0CskyOXTlh/U4pMeMfTeXAbf6Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752200819; c=relaxed/simple;
	bh=SMYORV5NgzngMujLkAlFHZJS3NbNt3bqRuq9dbv0iwg=;
	h=Message-ID:To:From:In-Reply-To:References:Subject:Content-Type:
	 Date:MIME-Version; b=E1BHcpSn8wOvZNhgGyIfqm8Wf8AlKQWEiJTod8SW75NIi302D+To5Z9Yt2j4XIYxv4AsYyGBIOyrDMqDFuAGcByI6YGFR9ZevL6u8Ek5nTex1yAromQmoipuMbdGvnInaFKUzIIl3do9p7e3riVAK/Lk1+i5LjPnj+hMofOoJ6w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=CqClZKlk; arc=fail smtp.client-ip=52.101.228.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="CqClZKlk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SIVHQ7zDS42SaoN8tKIa8lmz/yeMmsMNiZJTQCkVPxmLHQ/YAU9eRs+oXVw+mn7+2lnklgepu5dZV/7MrjDmEVWKG4hUYw2dFLx1mlSfQodPfy6h5smBiB4Q9Ci5c0mmCsTkYk/oSBAf2qo95KRDOwwyXbJbDJFFCkMux0RHW3wZpRHFDv4Uc9EHr+RpYyVRQLcE/fTLet7MZYTAsOTgKRL4EuSy0yEujMDN+Vc13tethLknJQm9mBK2vKUM6cycHTQJVO9GOcyZIY8Y95FyoLAqiryni97+2J7g0/7xGSZGpX+BUVHelOZoKC2Wy1Rdxzm1T+LY9lF/1C/hhpx5WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C6t9+JDOLD9f5d46+l5+RIwwmzzF5cWu77PTj0lNejk=;
 b=EEqUpCm1NJsWfmUD5+8K8ueNtGS92laN5p0/L8Mvv+RvRgneyzTFT4+9VrRgTOWu9tZWcBIcewmJAqPjYbkWA1SG7k5eWovVroceUEGOtg6jVec+Ic/D0WhnJwgCusZbLRFjLGP63vNGMQCHczAwIBkYSRWJc7dMYdluDpIsYX3FmIzfSK1acvDo7Eqztv9fdFxlhhHnwbZ6Utb2U2iK1xdUskR0KgIGe/LKWSzUvkm7eUkcuWF1+PgSPAzbC3msVZEE9O6mHvD79U/3bcodjG7+7P+kKtID7hIrI1Wa9J6VEaVofTTds1IbwaKUZZ7UP3KWdBZCq4k/28GmNxZNNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C6t9+JDOLD9f5d46+l5+RIwwmzzF5cWu77PTj0lNejk=;
 b=CqClZKlkI7vNZRKjxiSvgtObTk8HwFouEAF1b6WXd6ZvPiwIq8Z9OM9VKu9mDOpuvVTNPAknrDZFqmNuXu2z76x6UtIhP4Hv5Jnv1EluFXpfABvXS0F4HFFrNQMToUn+yilFOnlrGw04PT/sh2xl2nlyEeoZxb0GCQqM4MUBU38=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB13586.jpnprd01.prod.outlook.com
 (2603:1096:604:359::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Fri, 11 Jul
 2025 02:26:55 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8922.023; Fri, 11 Jul 2025
 02:26:55 +0000
Message-ID: <87ple74g47.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87sej34g5d.wl-kuninori.morimoto.gx@renesas.com>
References: <87sej34g5d.wl-kuninori.morimoto.gx@renesas.com>
Subject: [RFC][PATCH 2/5] ASoC: samsung: bell: don't set dapm->bias_level directly
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 11 Jul 2025 02:26:54 +0000
X-ClientProxiedBy: TYCP286CA0261.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB13586:EE_
X-MS-Office365-Filtering-Correlation-Id: 09d4818e-08c5-4e6f-1c99-08ddc0226750
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EbI/8PLMw86ZAhQn5k1JWH6/d8gfjo1c4zqEQssQQzKYJrfIUulhma98CVak?=
 =?us-ascii?Q?IMR3Gw9OBRJAjHIVQeXFC3Ep71v4N774SvFO6wItcwIWPpXzijtdOK3qn+6Z?=
 =?us-ascii?Q?fdnDtmRBz+mWgm4YZbuIgzNjHZD5amsMPhaV7c4vzXY2uNScEllFqNKeWIWG?=
 =?us-ascii?Q?jEWZ0O4Qkl71CGZu3XrfidSzHdPMTiZ0GdhYhzMbUgbbwA/AQupclkVzR2tE?=
 =?us-ascii?Q?qKPnGRinp0/QRj4RhE4IgdZedIPbmjn5qAwHLN1G2nawVfEQH3Y7mq6VTVAM?=
 =?us-ascii?Q?bwbLjNCd4zlQT7xaxOXdHpD//pENaTIZAjebwiLr/wAhNNtHhnrNGuZIrZ0j?=
 =?us-ascii?Q?yR+L54Cjfz3U8SnOwG6oNvYEn57VN8fX+XFNRugxOY1fGkJ3NZ+1xkdle11Y?=
 =?us-ascii?Q?6EGfo3dHGT4dadGozy96Ycf5Y+2mrrAR19pVkz71nCboGOV5CdXE7GxzzJWt?=
 =?us-ascii?Q?gzoiVLF9YGWAZp+slvLm7KLioGw3il7y//TGdfrECGuXtmOXQCpg2zcpFoAQ?=
 =?us-ascii?Q?Le92/FjSp1eQQAyCACHdqR8sXlt3sOtA69qNIBxPJD8dMas47klYZAnYVjcW?=
 =?us-ascii?Q?cfLoIgZANQ7oXxnE/yvcT0/cgtj+jJKiIVPHSX6Q2MFgOD0QRRhn5iOssuXt?=
 =?us-ascii?Q?+hteAGRifxBzlK5WZBDz27M0S/bQLw9Z/Tu1iX3M3lMrp509tV36+z8IQqIq?=
 =?us-ascii?Q?aIboMioUBsvHSn3f0RW7vtOhxDpLcYJoCx/tg4G4rHAjXum5Y2cnt1DLKEUO?=
 =?us-ascii?Q?eDVgfcg65Tum8NAMc/X/LOfTGiouZWNlFVAsuuHBrtqyHWJyUz1CeW3WqO4a?=
 =?us-ascii?Q?cGA6h4JSUf3Ah2sHwFbEHMng114PGZKx95Jofj3UWbwlU2z7rFTDdm+A7OhV?=
 =?us-ascii?Q?py7vLNrgAd0/iZC2am1tcp5+Rv9xZFZthXM6C3eopFzKCw23HUh0R+e7RNdx?=
 =?us-ascii?Q?5GMbco/891zOK8Ekk58wC2O99UhGvulNzS8N3jyoif5r7K+0o7eKwNFjPiQ1?=
 =?us-ascii?Q?pePQN8KJWWeDXv0C0zIcBGpz7BkpW0kIaK+J7NypWbeH/dBbzlTGDxLLZf84?=
 =?us-ascii?Q?a/wAYTFq9U1tQjNnw2K36H1UwF2DknRIyLbzNGk25bLZe7eL6yl8Gh7Y5G8L?=
 =?us-ascii?Q?yNNsQc+xS2GTBB9+3XTfzfukZ+El3DcjEZhEuECROjTBP1SSJ6UchaG6nf48?=
 =?us-ascii?Q?CET9hh2kVha+7WJJwVBL+6BPszsz5A161AFR8O2lfAyVXbpNnm3FZbKXBPr4?=
 =?us-ascii?Q?693j1gjnJUWzCR/IsdcG9KqEc6/o/ljy6GF0X8yfyNFFoS9xBqmyp4w57W7v?=
 =?us-ascii?Q?u7tCsJxZnno9NGfM8SzqhuuxPT58eUYQCCHQ4N+AHE3wSAXfCN0nyqhpCTlk?=
 =?us-ascii?Q?O0cfTO2izcD/XC/JM+PdesgUNw0Xan61NKlWlFX4SLHPplEahhMkNu9iiLDG?=
 =?us-ascii?Q?TtdHxu0HIiHqJWllDxTzs71yDfoXY4hqLwW4mTYfngGHapN3xtE2KWqqqZak?=
 =?us-ascii?Q?urGxTyidt9TYYsU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6SeAdUYSryf6wJNPpSeWiP1htYNth+empCoVt3Txe3EEA2/hUMuAwPXKf65c?=
 =?us-ascii?Q?PTF7s55VMYo+RgaMqZrtIFAKGKWt7j/cXzYNFApK7cTdkwslBrN0mCGYQW+m?=
 =?us-ascii?Q?LDTOUo6Delm4ibA0m2VvwpSOl7uuA2rY1Lyyya9pcGUjs4Ba7ZXQTGKva/GY?=
 =?us-ascii?Q?kppDnGJDO01CeEtAgpRELzd8vKiRuYMewHO6tPIoT73F6MUzwNamS7FCtdtD?=
 =?us-ascii?Q?hrn0PZ3z6CzfExhGbueB/VN9wgqJvdT26ml8xKLsPlqN35Uoj2s1xntsIOlt?=
 =?us-ascii?Q?UmY7qva0UpyE1haQMBW4XQTM8XjP4zkndOy1W3XXDcph+DZyme6AgEqBEVx/?=
 =?us-ascii?Q?QexqD4axhLwVN1zHlzsxjFYfjGd/5QZS6PYyk13zXcl2zW2O0MOmRbL0Zo0S?=
 =?us-ascii?Q?SQzTT1alCQEqM/gEFxG3pQX6zt0HInlZy7Ni4zgAvDLNX2Zz2HDCI2j7uoWG?=
 =?us-ascii?Q?cu1gB3uTizjFHPp+3duLQdTkw7Uy5/AHQ2U/rop6PoO/EaW5Mn6YYViiz8NX?=
 =?us-ascii?Q?Vkp/9svtTf8aNkRjzygq6uUaP5MUW8SsgLNToWkFyvQ69Ng27Me2xD8G9rr0?=
 =?us-ascii?Q?iKKSYYIwcIkQsANZ7Xzc8T156YnvpkW8aygJjxg/QpgQ88dvLx7rXsL5HVnD?=
 =?us-ascii?Q?n0nDPCTNq4uZh88jhome8tnLGG382xM/PquMnLALVZTey06xGC/GLlQB/4+B?=
 =?us-ascii?Q?0M5bt6iyFMdw84TIRKjHevqg/r5IbqYGJxTe7VBxvE4GBdwbDUPuXnw2mplG?=
 =?us-ascii?Q?c6xL7NBtUhIBJLjrhIgGUBzwKpCgZj0zo8rjEnTGdYsv4wmwx7OKCqSBy3qn?=
 =?us-ascii?Q?8CFYD+raJ4YohD9RBmkUC3n4bD1Zxc5HEbUE+wKqz92xn90Ak1EETdYpMdtr?=
 =?us-ascii?Q?+sAQesDjxiI5zC/3VGR6y7qqOI+5nJLI8LddB1DLlF+z/3zjSGW5IxrymLAh?=
 =?us-ascii?Q?tg/hKVoVwPUsptG5ec1P/OHLSURGwnIyr0ruUt1VEfpDiQ3u0YHRgb5JNuzp?=
 =?us-ascii?Q?T20ti9F0DVwIfHIBB1lCzZtsTZ6BLJ6lpHImxmVmv671fzv4G0ytjCGRdFRM?=
 =?us-ascii?Q?/Abf77/X+dKn7dCIdoR4Y9J5O3HMx3RQ8A+ZiqXqybub1K1PLCy8JslbYJD9?=
 =?us-ascii?Q?xaLYz/wEEMU1b8U80fFTd7QjfdY3MmxdCCJEnmhPC6FZZ7XyUkqy9nAFmSqs?=
 =?us-ascii?Q?gmY/yb1p11m6ajfUGxsdzVFmRwX+vNNjNMm/wWlhVufRROiJcDAMlPbntw5L?=
 =?us-ascii?Q?kNq3eLNfSyjY4X09hO+wOKLApJFFfxpnLkN9pHvHaJHPMIVkH+5aZpqCsvbj?=
 =?us-ascii?Q?qw2ESY1aaPVIKrQbn97rxHFP2XYpcBSxsoePHfjXpcSOTzeVOh3ofIOv0oBB?=
 =?us-ascii?Q?7AGG05kyYoeZ99m1QMZi/UmLyABKh93xRtit2P3KtwxMuZnLWcUc281H5NE+?=
 =?us-ascii?Q?zM91TNgjdcdK7zbf21zj1gx5KNyD4KDGC34XiZbK1pFJXNdFqIEw+t1iduTs?=
 =?us-ascii?Q?+JaWIBTk4O0P3EPaZvvC7UUoaF6LauiE/0k4BhcN1EPhVpKQIUrWzN3fVvim?=
 =?us-ascii?Q?5PEPk3J7a+dVfDaI1DiFElw+UMmmYr/A9xgsZk7sfvGq/Er3+WqxbLp6FQaO?=
 =?us-ascii?Q?655bpxIHomgJnkp1DKyRFfw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09d4818e-08c5-4e6f-1c99-08ddc0226750
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 02:26:55.2284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6+EMLRhNsMKbrhGv25g10kghnD62X+F//gsSZhqm/8c5w83j4ZBlFjurCOd2gC2mJQgVHPczQxhlEu/+sKvu21CLfZoGMc9uk8Prtf6hXIlcBGQ+G8v1xs4SteAvxNib
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB13586

snd_soc_dapm_set_bias_level() (A) will set dapm->bias_level (a) inside.
No need to set it by each callback function. Remove it.

(A)	static int snd_soc_dapm_set_bias_level(...)
	{
		...
		/* success */
		if (ret == 0)
(a)			snd_soc_dapm_init_bias_level(dapm, level);
		...
	}

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/samsung/bells.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/samsung/bells.c b/sound/soc/samsung/bells.c
index 8dc3b2da4c8f..61ed5e69391a 100644
--- a/sound/soc/samsung/bells.c
+++ b/sound/soc/samsung/bells.c
@@ -133,8 +133,6 @@ static int bells_set_bias_level_post(struct snd_soc_card *card,
 		break;
 	}
 
-	dapm->bias_level = level;
-
 	return 0;
 }
 
-- 
2.43.0

