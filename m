Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011055.outbound.protection.outlook.com [52.101.125.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F2A223DDF
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821278; cv=fail; b=Gv/e83iwwVzP5LL26pfVjQOuJGAJUnqM3Q+aWDp36tKGVaXz5A3knxL9awnPR8FhC8EFHLzWoIvdnP5JZWc9AJVHTRLMZ7d2nFEPh86iEm4IqyQ5t18q+9twAs/Qscujs4+QWJRU17LRgHruiArr2D5nDizqwC/rfqVKv3zgnIg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821278; c=relaxed/simple;
	bh=FupwmjyKKZe9hqUIXgCdcBnXP+XxXxM4qhKsmkCLZGk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ryzqyqvAyKAVPzIJjhcsZIafK5XHM0O2qiUONz3TVOb7zso8I7NsyTnejXkCFUXPBC/hlH96cotPnbOkVHivqyYsHS9PDyd+PogIswlR1lrJ65zAKBg/6LG1DSit/tMUUrr59zWjYZwrMZwFckIvW22WU3tTvBsAsZWY3w92uQc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=nH3NV53P; arc=fail smtp.client-ip=52.101.125.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="nH3NV53P"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D96O61rNoYd4EjmKRgxTkWnRIHpLMuJ7Xi+8nbGqoQe+6DjkddN9l0d5zABGeYliPNcb0FXd+4FnOSVjKb3SqmOI3G84+YQB3c4cVE2KU4TnqBhXtM+caRIaZARONH237CrY3LD1ISzoYPH+MiExjlklSvq7m21tZeyMI1Ixtu6Hn0O6Wpo33/Ki7aqj6aGbQzkE53N7wDvEFyXoxOtosjvsjhYvizjvpZxh8CErsZZok/ayJwMIOMZWcdq/6aNbWN9K8A+RThSV9uwSFKiV/EUxV6fMvKI3+jHZ2ppimWn02Oi4DPunU/ELESkiTumh44IDzmVfxRjXTCTvlUYQqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7tu49qBKwb3/8DTYFf9QQjEMSNsINAOiqYZKcjMfGyE=;
 b=vFb/2MVqSffE4CBvp2pAtT4o+qBQiJ9ZbdaNULj/cPxZ7ORuo9phM8BMlEbcUJxNJYXV9NzikU44CjgSsVVEnO0HACqrOf7qB1pz5gS+mh+X8HcE1tH5y1Ylh5k1Wy7h52s0b0c+IMg4Jeq7uy7ZkkqON1CArLT911ZczPFvRZkDt0D7suLh4O6JV0uihZMWKiOy+qA+djQo4w5V0Gz/AuQzLwvEOSUxWLZwwj8HmRSt+W6fMIl4UCa6hzlgZf6RQoKKgK3eeSbmXoK7+eZN+kBLduKEycH+oo1nwu/EjeWzH8ERKWMpibs03CguLFiNmscAGquQ2mwj4MkxTiQROA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7tu49qBKwb3/8DTYFf9QQjEMSNsINAOiqYZKcjMfGyE=;
 b=nH3NV53PaUs1r7hiz1Y+pSG2hZ2bG3Ulkv7mK68NOf8m5VP4pDZ2hDq9MuBU+T3PoO3BFaYigprMtBLb9hDlIxVlFzsVeVZwh/oYe6t8dXIbthMp1Oix5ayOOrOxqSQaeKeFjZV9rgMiDcB3sjTVweyvfmgCQniEydz3Ceg7RNs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB12531.jpnprd01.prod.outlook.com
 (2603:1096:405:19c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Tue, 11 Nov
 2025 00:34:35 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:34:35 +0000
Message-ID: <87h5v1v23p.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 246/292] ASoC: rockchip: rockchip_max98090: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:34:35 +0000
X-ClientProxiedBy: TY4P286CA0112.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:380::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB12531:EE_
X-MS-Office365-Filtering-Correlation-Id: d364c6b3-739c-42ed-7d39-08de20ba16cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?i4nHCUdc/Z7NErpqtpXYvkj8hQBivBNZvvF2gGKgKjiE9Ru151XjRqbSCV3k?=
 =?us-ascii?Q?6Ct5ZLYnMZsscfXZKZZTbrbH3AiX5Pohap4EOFtRFYeX+3AeofUJnYBd8Erz?=
 =?us-ascii?Q?Nvjaj+FmExg4BjGGBj1MRu5p9UBi+b5rvUqYsIPSdTg0nlZl6IkjhiNjYhTq?=
 =?us-ascii?Q?fBPVXCV4MjBNIw69UOxe4idqccJMHL39s6OoUM4Ai4P/OumdIdub9DpmC+Wj?=
 =?us-ascii?Q?+m0YqJBt0tBFYl47OLcWlFrX4r4aFG1qmd4o4kkaFez0gOSmyOGAawPrWF7g?=
 =?us-ascii?Q?5kehoUkN/gHAIEE6kjTAgSTfeGOI9JC8/B91ygMqUEQ5Lw05Rj8lX5jxuyDs?=
 =?us-ascii?Q?Fgfk2yrkfutyHww0IiADaLZy6cLJIL/wzw02ZsI2aSUwqyb2LXC7/IXahd1l?=
 =?us-ascii?Q?Uq/JrZn96b3NwT/1MdxOGesfnnZotRbw7THrujbGb3D3hzoMG4Q/bJFabb2w?=
 =?us-ascii?Q?v55Wri6Tj/kWbWUJ0L2geDjejIFasihylnhpWy1l/Yy3ko89Y3F/v6fC+MiA?=
 =?us-ascii?Q?TnStIsyHuB3Hlu2YA30RSaBJk3vMwa4kBdzm1uaGoK91qsG8ljPgt2/B7ZRw?=
 =?us-ascii?Q?l5O/oDZ6JRLnTUf3P53mKwjqBaVZp0h9eP5NO1F3Fvb6LhaZBFT8UA5ututj?=
 =?us-ascii?Q?/u1oBsbFh7A8TzqWufz7QS7zONnLnZzBSTE9u9Gk3ZCRxTeqMjZC/Du9ULsG?=
 =?us-ascii?Q?u5NtISmlVrL8RD8J5yUomJK1o1MFFnwag0w1vSJTxW+TXrwO44vO4ac6xaMy?=
 =?us-ascii?Q?AOAmawKRYhJr4GpL+faPWaFSDEhpqXL1NgyDy7v9mtQo2k1RVDub1BODp6BK?=
 =?us-ascii?Q?m5dzeVo1UxaXiiiEYgcVWr490/uTqv2MnX1ZtePUVwJ3ngK8PIkpp2ol/8BI?=
 =?us-ascii?Q?HQKFIDHlLarc1ydh65ZCQIBXISUX5fmUnX34owNztXEidhxNifawSlJAUbKG?=
 =?us-ascii?Q?yR45SeBHdfLjh5biV1s16s7lP5U1gCNJgqrDz1ympVj7nxI3UgTXxRHSkaZG?=
 =?us-ascii?Q?c8Mki17rNZMWlD/xPFss70ggiQIJHlrVqHbzpElH1lmUyH3w04yQeRGp6BXH?=
 =?us-ascii?Q?6480KNFjGR6RItdkcNlg/w8XzxdEgWe0VQTFIvSv8kppldds7gWtPbXlEAai?=
 =?us-ascii?Q?UDccY6qzXXfdZQjSzxF09Q3jK3mXOLW/K/NniUCCZonKzh1Zrc7BYZO8KGEj?=
 =?us-ascii?Q?h1zDKTvVSxRjmHmPYIO5plXExDTb36Z+/UKWZNB/UgjiALuHHHYelTUhb0rf?=
 =?us-ascii?Q?LPgPNLg5I/I7kYkwU65CX3xNlCWuzdalFM6GsXrsEg779tNpYe/Yw+ZIJf4S?=
 =?us-ascii?Q?ZPNap/j1r7MepGnMru447CAhuXw0xtk6Z4W2DhOaClcVkxJFK6t7J1dhZTuE?=
 =?us-ascii?Q?9ghR4BZzQApPhCbh3fYoRfYp9AcbJMiq8/bA9v9cMydkh72Ik9prE7BTMFCr?=
 =?us-ascii?Q?oeh1wFPiJpNJu8OKkWa+oGMhUGsN7sjNzIuFngzCcuYLh1QmbpGWdmnkgECR?=
 =?us-ascii?Q?26VEJ3nLOWsA4CeGKtbWSJBJ8gMC3lIPJt9E?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?H5wJ1ZWFUPYu1hST4RpgcjwfolI3nsxQn/mRYV2UOx/mtJd3ojRoT3pmAj40?=
 =?us-ascii?Q?Md/9PXzDYEtzLq9ebCSBgszZIYSl65PySH+Cauci7LAxdxHR/xzxobqMLtpW?=
 =?us-ascii?Q?j3AdEPSSVoYzwoQlasYpq1HtYf+BkfUKAgbwwzy0lykB8Hm4B2WALWxZs0BG?=
 =?us-ascii?Q?t6IhKsyw2+vYMu/16Lk1eeUrqsjN9c2wbuk85HEc5pOrPA3etfkOmOejGSPd?=
 =?us-ascii?Q?bFBwrglAioTerBtANs27/EiZYuFJ8KAJ7kcYokpXwVd+XcOSkYaC8sZsP9Ku?=
 =?us-ascii?Q?tdRQ1gz0ccqJkwRrtTZdCrl0OMx1Wv7aL3Xb84O8jfTzWyy8ct7RmLiN5Gsq?=
 =?us-ascii?Q?6ry7bkziWMemcw4AwCRMYp++/Yxws0Ztio+sCOm2qfO11rY/v1nhSZ/YFOoW?=
 =?us-ascii?Q?8aVzUqWKsFSNPWucOOIJttudbR0ggTcYJoNRwDdGc7PBK1UxgS42akuE1UZD?=
 =?us-ascii?Q?tKeqPhR4cmpuMThtW7C/8dRmTlg/3uhn+A6jQBrLRHN/ANCgw4SodiFwmrXV?=
 =?us-ascii?Q?x+e0vGLx3QY++XlN/tUfXW7rS0h7oxoDF+VnTJQ5qdVRHd2e9gdjhbwzm56n?=
 =?us-ascii?Q?q1CMTQwGcsQ4zRNqb3z6i2HTebiRD9ZtXNj9kyKfl8UDBUeVK34n4YlsIdU6?=
 =?us-ascii?Q?yvJDRuSVMv9tAJRG7Z0I4v518CHBJto6hJrSFw+wmIA2FP59BVNgv06wz2jW?=
 =?us-ascii?Q?+/TrFX+EP9I6qkIO/KyfrBwGSaODzfCRHI/8lfBef98/Q/7PvQyaoihJX5lZ?=
 =?us-ascii?Q?hw6pXkVEmXEaANoLpVvoKFL4cs+Xm1XGh6mTKt4iHeKtVfTxtZ5EimtdUrcj?=
 =?us-ascii?Q?sNZSPelwUn1GpzpBnSenUrkayt8/BFYrgavaJKd70C5OjVzMjDkugNl+GyDh?=
 =?us-ascii?Q?49+ZhqcGJU/yCeTSpx+NQMf5Hv83lhbRR5uCRVt/Wg67AnlwFFDW27njQlKL?=
 =?us-ascii?Q?xQ6Ou4B0zRagyockcbk/emkVteOzvrgmTW5XDKah3APQxAcALkfa0zAa74db?=
 =?us-ascii?Q?p9WKRj+bd5suDAiC6lhuYIdUi0y9E/uAKkifeHG3wiTceLSLwcZIiNUv2jNR?=
 =?us-ascii?Q?FXlb+77DXKmSj+uiO45F/rHRyMfVPoXS0BYHNN+32klWT7uX5DTXB/4BBNJt?=
 =?us-ascii?Q?sLdijd425W2+qnuGmlpIHlukNv7iOu+naac8cIP7ClyLVzRFLA2k5jVBfRm4?=
 =?us-ascii?Q?50QLIgzj9AQNeD/M/aNpm32AjfOcbHDLw+Qhe8b3cUV1DIjLJ6ZBy+RMV43z?=
 =?us-ascii?Q?XSKddzRZ+P+q36FqiVdR6UDt5G5TpvpJEqOaB2gPtkg76NOKG9r1dRqE7GTL?=
 =?us-ascii?Q?WoKVtYDAK/BKvXyj5sIV3WFEhFk8fC0IrYxyDJXw8lfs+02bUQWLolcamwiJ?=
 =?us-ascii?Q?hULR8+dd2pbFQbhzrIekVQSPxGJZHCYnSdI1FnAFnKLARNVWMtytKjDLm1jM?=
 =?us-ascii?Q?WlYLicxuKCOoobKT7SpQub5iNmwBWcsFynWRrkNFK2X+ck17Iu+hH1EfYZzR?=
 =?us-ascii?Q?gs0qxTtO66rhyy8HMPHwE6VDENDl1WtMDPIMsJq/PqJgvx0NTuRXjCJl3waz?=
 =?us-ascii?Q?p3oxjWNJ0tyYNX9DACD28rcRI3vXNPI9Am+ol/amrJc3mlTbCCfOrz9IlqQd?=
 =?us-ascii?Q?YhYN0fvqfSN2rwtzrsl5plg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d364c6b3-739c-42ed-7d39-08de20ba16cf
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:34:35.2978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JAp0esnJqM9wrPjXXoVjCPSMtdkwWrAKrP8BG/F491/GBALM8OX3+Bu0BoLyXPy8GLgtxpnHPS4ycElOToVjclDC47blL/a/KJylYaul4DCAJ0DP93IZlaNe9KP3Eilu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12531

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
 sound/soc/rockchip/rockchip_max98090.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/rockchip/rockchip_max98090.c b/sound/soc/rockchip/rockchip_max98090.c
index b8326e9143b6c..075d0990a1266 100644
--- a/sound/soc/rockchip/rockchip_max98090.c
+++ b/sound/soc/rockchip/rockchip_max98090.c
@@ -108,7 +108,7 @@ static int rk_jack_event(struct notifier_block *nb, unsigned long event,
 			 void *data)
 {
 	struct snd_soc_jack *jack = (struct snd_soc_jack *)data;
-	struct snd_soc_dapm_context *dapm = &jack->card->dapm;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(jack->card);
 
 	if (event & SND_JACK_MICROPHONE) {
 		snd_soc_dapm_force_enable_pin(dapm, "MICBIAS");
-- 
2.43.0

