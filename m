Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010053.outbound.protection.outlook.com [52.101.229.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C362C1F4CBB
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821012; cv=fail; b=ak8hIKo1xPjnQ4//xVlUK24sw212bW45x+zYzbHeUmaNNjbIrxyUVQEVSK0pWDFzeLkzDGCPJlOgtC00HAQu2cZMXZg8gQCN3ESr/AE/0kLtI+HhE6/wx89L9wU6PEJ1IXU0+NEfeKlHQp1jy+VIE0INDqdSjmPjxFz22Uo5u2k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821012; c=relaxed/simple;
	bh=gYYkULNJK72Oi8TYFw+zAF3q66YsZipYLi1s8OgpBsU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=nkDyA6KjRu+LBzewUWEPnMYo+tPUmUmxJfkbml0GubapzZz7Ro0emnYPI+Z5+/nqvceGb8tVEwHi2STRcujTKK1mIBxAQwOi/IdGe9KaaUs8y24nX1eb8mfCFByzeEz8qPIPd3/HyFwGs8HoGWY6Vn4QemHMx9+AmGmGe54X/gc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=TEk3EU3h; arc=fail smtp.client-ip=52.101.229.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="TEk3EU3h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S/UUBEOuCOjuYsILAGFs6x6Jis01bq8jDxjT7GW8MAP2x7gnol4vm+9TXmsRYghPYa7wHDK+kDsZWg0sx4LrDEXFqoTibABn6LWWAu8IsIotSa9XmSi+FGN8lV2aQ3by3WIzzgGeCuETOGksRSUzCyT5ZyCXyTsN39YhE3me+/qm2ainXfgsrfAg7jvjzYSzkkF9jOi3MI28BGI4GS86QuP4jdU/uPCv8jfd0g1n5S7KLmrLGP1WxzgeCFUvudFFqCF7e6pXha2OPbYnUgRQt0JZXNVz2MDEuuhbz794gMFvazU1BVbtVu1Ae6ABifsMsZXDEPiO3/ssPpgC7D6BIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BSbhUVX+v5bcxtLfQz3H+0xdSUgU35SOG4xFD/tO3p8=;
 b=yBJm/bS7W+TjyawlzNwQhOPOrtIrsAYV4+GGgB07l9ABjuM78uU5HJJeGMgm36wmSZp853XqOfxM1RrNQNTPSBXLXiQZKZWh3izn3j/bsxDOd3qND4X0aqf3UEk88L+naEzU0Xv6i4yh2/sg+oTlGcaKJaE5UxOAkP3KnmA5SPEZ7TUFbLiicAwH/Nn+d3iGQv79li2mrtBALsmdUOlvoClwUKr3YtgZSrJ6akoIhCazLZ0L+A0ZhVrtLbCFcE9MRCoEWcqjvygwX2ygIXvL9CPctYm2/dUXsc6j+s5mUED4n73/SnLL2OyChHr8yoojs73panSbeQzT15lhbhU6yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BSbhUVX+v5bcxtLfQz3H+0xdSUgU35SOG4xFD/tO3p8=;
 b=TEk3EU3hrJRvsyeynKNtNtGG4Q+rbYpZnWnYfUt/Ex4JX8U6p51E4yRcVIctWbH+yJTnY3cLlbXL7A5mqCeHpcJPlkulZWE9vVU263JdleAkpHCxm/KMagtVHUaJvWmBxxtg+M6gzQuKnItWS5t7e1drnliiqYoIsathOm/mlqY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB16440.jpnprd01.prod.outlook.com
 (2603:1096:405:147::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.11; Tue, 11 Nov
 2025 00:30:08 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:30:08 +0000
Message-ID: <87v7jhxvg0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 186/292] ASoC: codecs: wm8996: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:30:07 +0000
X-ClientProxiedBy: TY4P301CA0078.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36f::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB16440:EE_
X-MS-Office365-Filtering-Correlation-Id: a45bb2ab-4b7c-4ba7-d7cb-08de20b97785
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?n7egGJxdP+Yy1Mr0FVK6P+aE75kJI5XHT0kGfBUEhmW6vT8KimMDydotEhR+?=
 =?us-ascii?Q?N0jO9RvoP3PEfpnArooit7/+IOPNHlQst0120OEtBGrxudq6Yxx3ARPkfbnP?=
 =?us-ascii?Q?zPZS0T2ZeOHNj+7F5WBo95evRYeLGq79uXIBRKMS7PLK4yHY03I3HKK+dPaL?=
 =?us-ascii?Q?Hgm6S+pXYG/4LEmFknDqJODYIb8lbAb10JgBUWzV+l4n/1p3ENpFdLlsYzG0?=
 =?us-ascii?Q?Y3p1jYvKPTUmZ45soMsQYlnAe7PWjxsI2oZnwBoTam7dacw9AX9n0D7khlug?=
 =?us-ascii?Q?6hpipFx+1gOxZ5ce1G9nGUMr9sf3e1UfZ+PinkbC/y+DICc1OX5WAE7st0LZ?=
 =?us-ascii?Q?qifrMkce099ByA+mpCiLGCnkg69CCwDUmKYTHUICWw3AJKbHSle2Q94m+ZDE?=
 =?us-ascii?Q?+Zp4L6puKHZP8NUh5kjG9pgZY4gyIKCL/2iqJtSzdA/XNvdGtsY34yGUejp7?=
 =?us-ascii?Q?AMKgXuq7L70CAOJqBynDNNApV4NjG7KDXvW1XEZwdZbKw2gxLx3/XoT8FQny?=
 =?us-ascii?Q?zZrHrvBpO9ZJk94r1qvrgor4Abfz0Amh9lgihl4r6S8ZNcssR1EYE96Iv6Pt?=
 =?us-ascii?Q?ENRGbyizNJ6Ip/RakpavgDH1L85+O3Id5/lM9m/HonYFF66LJV7sXh84BLjy?=
 =?us-ascii?Q?GU8FKFISav4/kcAC9S5GB7vMZz5bmInVO8IvXub9fmGK1iq8arVQZb0s0dEe?=
 =?us-ascii?Q?AyV6+T1f5IcbbEJ6/cpSpVgcTedEwiOSag9rBhYHvv0qSGVdvYHCZ0l3BLn/?=
 =?us-ascii?Q?TPzKNjvCPmatBqtYbxQuYQAUyGhPFkeyatukLa2r7vB1SbElfZ/Nx1S+YFYy?=
 =?us-ascii?Q?3CvKoLB4MYmx5P1JVOf97mJ1ga2/ZYxl8x/JeUGKTSChnvzEWHC0DFYSQwGR?=
 =?us-ascii?Q?Jeoc32BS9WYFqk0yA4vSGHJsU0KKvStduSJc/gyAOEpteqchXEhEm2N39y11?=
 =?us-ascii?Q?Gb7twJ35QOdmGHIQ5ejQb1Nb0JiQRcOC5ltoNwbwbSitbc+HO7j3dLhHtMCm?=
 =?us-ascii?Q?cq3dzIgCWnJj9hbjmz4YE0yh3vbE2BmOqUVvsQqbNQvf9locbvOwu0BwrzB0?=
 =?us-ascii?Q?rpWPEZeG0M3UXVW81JdLIdBpJriElq+zNmvX4ytUYoNzON3qbBA7AFtSc1q5?=
 =?us-ascii?Q?AkhrWnYOArMiM5VimRSuld6gF3iVaIl7saMmhCXoZepaxwzXq1BaqezF86Lv?=
 =?us-ascii?Q?R/U7n1JeRJeusEkKnEURibh/nYbO0fNFGBjplS+riCaaTNUbHqULo7dM2aS6?=
 =?us-ascii?Q?l4I6lBJ/hLttH+FT9+1VH6hNd4v/ykakv1eZKR4rQJRsvX8voNDBbAPbSzed?=
 =?us-ascii?Q?mHh3CTfA80updl94OHn4+eC9ji6izL4lCp3MVPLCrbDXNpyCGPsIikWXGmdW?=
 =?us-ascii?Q?PgTjvH8GjctpIcVw2M73rr9bJkB34nDQngt7VazaxhrZ7HSAbqHAI4xxZesC?=
 =?us-ascii?Q?6cl7o7Lb2+FYzp0wDPXuBckyyi1EiHJSjVA2FBlmDl+dOtRJl/HIniCni1oz?=
 =?us-ascii?Q?GFTyFV/+glBfS0agcXeKHoXY0fg9YSDlo0q+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?o0a1IcanuenPLP9XkMIXvkVTFrEJK/9F76kg1mYvivU6HKZk5Iq+MpvNyGy/?=
 =?us-ascii?Q?obyJBzqoEQHn7/wexhnEcrClQxixOLoOAMvtDvvikY47AMLuiC2lk8Gn6+Wj?=
 =?us-ascii?Q?+0KiraEq+eZLfj1aBSitHXgEJFLSjRi3Q7soV30vjWF6B7v4c9bmUagWKgjD?=
 =?us-ascii?Q?7NRfSQWUUsV8VpSeT/Hh9Ch8zk1QEdi+T8C/hDFkJFHK94hPTINBEW+EyubG?=
 =?us-ascii?Q?StsJGD9pDqz8yxkq/PG1amoOctlj9Ix2Wm6nRHGIcHYilQX3D2vx5XT2Xxyp?=
 =?us-ascii?Q?9yXzGQyWsD57TIHZGdLPeDuVgBCxI/rhlJjw3/MrtomUtgYFjYv3/0Epvesj?=
 =?us-ascii?Q?BwduivxHeonuzKHBUigaaE/RJj6luK3NSQ1SfX2ixY5A04gkl5qwFK3Lz1qe?=
 =?us-ascii?Q?DHpdPDQzAXCgiFAMMBaPWKHvrGLLXUWE+mfIEyiJ0J1fu0XDLu81r4EFsiST?=
 =?us-ascii?Q?5TTzJcyft+sj6C7bkZHL5VRuNhsmTP0b1it0vB3GIen157wuSqYxE6x6lnAb?=
 =?us-ascii?Q?2ceDJcaulpulPmPVuO689iWMTyNnEA+SDdodvwABooyTyQIkq1x+Isf5bKWR?=
 =?us-ascii?Q?krsuuVo/WpWzjR7bGowbwl0T9M8RJ0WNvVmOGvPkcJIYH6dNi5mJVtY/Vjq/?=
 =?us-ascii?Q?5UoLLcLXku8QEb491oY9gjF7LVqAiyTXxQWqUVD9SqINuWUoMC+/Pw4O2xfs?=
 =?us-ascii?Q?W7qhiLmmGRdTWyWdiA4w1koP5U35WnODxGGUYABkmQBy+Ck28atgjZ7FYNBb?=
 =?us-ascii?Q?pKDpqJ9G4AgXPPAQCs9d0gE+6ctnIYYDRl/7gw2XzEXx17Ab94irheCkOiXT?=
 =?us-ascii?Q?LEHdgF4zlMM/OpHMJ0A9XqrijAJatlRHlFnqgSWH68tCudiaJUCBZggiYmgi?=
 =?us-ascii?Q?P33C2ODMkjGd7tAGZ69mueatvhg45If3R/97iwAl05MqtlNQcK/pTZuWaeMZ?=
 =?us-ascii?Q?hZ8YT+t1+lvRa4qC7FalBJn3a9oR8ve3Eo+wAJfv3jh5TzBJSX40+QXo2b/A?=
 =?us-ascii?Q?zPBVEtCP3K/RbQU49CNLsAqT1YPayAbop4v8A2RTJYl/MwbvGgmzXZlKx+Xx?=
 =?us-ascii?Q?B51PUvwVpczGXLw+alFIDF/wTveA05BDPQfIqRyzAkusLesffpancahAo2hL?=
 =?us-ascii?Q?DfgjTAsv5sw+Q7XU80ellfiSPWfFj2htA4ac9InevigEYO97sJLImWMb71Yf?=
 =?us-ascii?Q?u7CLtkyT3Q9i41u7RF4ghzddrE7FGm0Zq3zYTVe0oBQZwVU9gpJHYv3E9SSR?=
 =?us-ascii?Q?VyDjTSBJ4+5I0q8NGweGHXNHgyQq59tWcYkixA3vry2szZmWPhtNZy8DQc6i?=
 =?us-ascii?Q?VeczT31yN2dXXbi0cVmntCH5JhUw3Kwnjosv7VKxNSHQ9+Zcyv8HFjOQCPyR?=
 =?us-ascii?Q?UChdj9XrgtdSZ9Pj/DYcdfoKLAVIDZPoTBS/E1GARDfth8i/PQfnth4xs3xP?=
 =?us-ascii?Q?NiqYgNyYu9IWRqej6O4tVrEXNF8AR+mnjV0YhF2NER0x0U7QK8v51YCw0/Cv?=
 =?us-ascii?Q?cjGZW1LNgzygB1akoSWYTS+0v49yUfGFbvfpgx813NTUAc/agOIwZjXdopdK?=
 =?us-ascii?Q?L12QaBvz+2Z67h00vDJBU94kW8vIJfhJqQjLT5oK/oDAwjZOxgUyEvzP0NuH?=
 =?us-ascii?Q?MLov3k3h/Ooy+35oDE1Q/o0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a45bb2ab-4b7c-4ba7-d7cb-08de20b97785
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:30:08.0435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qCBnpOF1GibPs3wZ0R8Es+zw0Zc24nUcoBfIC1KE9IG4k+unGokHEKwMBy79wpgg3vgno4wS3BeVxIenyiXffCBDUYhZwVqUC7Lzl7pi0HQp1czA9RbH/fqLenXbjU2n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB16440

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
 sound/soc/codecs/wm8996.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wm8996.c b/sound/soc/codecs/wm8996.c
index 7cc2fb5b811e2..2d9cbf66f7d40 100644
--- a/sound/soc/codecs/wm8996.c
+++ b/sound/soc/codecs/wm8996.c
@@ -1572,6 +1572,7 @@ static int wm8996_set_bias_level(struct snd_soc_component *component,
 				 enum snd_soc_bias_level level)
 {
 	struct wm8996_priv *wm8996 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int ret;
 
 	switch (level) {
@@ -1586,7 +1587,7 @@ static int wm8996_set_bias_level(struct snd_soc_component *component,
 		break;
 
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 			ret = regulator_bulk_enable(ARRAY_SIZE(wm8996->supplies),
 						    wm8996->supplies);
 			if (ret != 0) {
@@ -2238,7 +2239,7 @@ int wm8996_detect(struct snd_soc_component *component, struct snd_soc_jack *jack
 		  wm8996_polarity_fn polarity_cb)
 {
 	struct wm8996_priv *wm8996 = snd_soc_component_get_drvdata(component);
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	wm8996->jack = jack;
 	wm8996->detecting = true;
@@ -2283,7 +2284,7 @@ EXPORT_SYMBOL_GPL(wm8996_detect);
 
 static void wm8996_hpdet_irq(struct snd_soc_component *component)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct wm8996_priv *wm8996 = snd_soc_component_get_drvdata(component);
 	int val, reg, report;
 
@@ -2343,7 +2344,7 @@ static void wm8996_hpdet_irq(struct snd_soc_component *component)
 
 static void wm8996_hpdet_start(struct snd_soc_component *component)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	/* Unclamp the output, we can't measure while we're shorting it */
 	snd_soc_component_update_bits(component, WM8996_ANALOGUE_HP_1,
-- 
2.43.0

