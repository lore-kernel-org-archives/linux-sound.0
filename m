Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011035.outbound.protection.outlook.com [40.107.74.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57363309F13
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415879; cv=fail; b=m3vmMYbPRmSdeY/TvervrWAs9ActKiVSg3SS8DAW+w4njwd/KmupmOG8f2sB3Q2bwtHucAmW5lUSjfno102rD0rp3lpqQAMZHwVnF3TkE/Ud8Yi9HR3b2VODStYeSIx2IS5sHD2ZzNIFu8Q71ORHtoKiEzwI9eR9PakRruEF8iU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415879; c=relaxed/simple;
	bh=1eZSa6MX/vQdibe6jo0ES5So0Pnb/5qUX/WqiXlA6zo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=pQGAQFIx7UEMaUrcyBUr//QKhA+heiaaE5ymoZjDL/WpWKwawY9OSmRkSXbp+3lxYzgSZdNhB4Gi4SbPqRd1UOQloMG37zVNr5vkFS009Y95pa7eunOVWDEGEyLz0hSmQ00Bdnna8Mq2lX5R4Ruj2dntW0OP9h3elPPXKBefwmM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=gVkGZfrg; arc=fail smtp.client-ip=40.107.74.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="gVkGZfrg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gceQr+wlOTRuNEk+nF8NLx8gxG1OZaJSDBoOonCX3//gp3MPehflh5jihuexcToBDfwdbDyRJ8qq+f15Pt1lgYP8p9MZd8OpTW5zkw/DDv1esTqPI7CqM9JQlLd0ZII5Ct1yrKCtgZ0Z8hb93mRb/UzhU3KOqrjzqLEK+ka7KYeudIBhawwOLJKzrN0X3TOqTHejiBiKk21X8438RuEyfKoNf0zT8z718lS2hsAcdfgu5z+jiXVnvCxfgj7emxK/uQgFvUbpeQhuHpE2UCeCSlIOE2mEwK7Fb39pbj3nbf48/z+KaDkhyXirNVjHF2J26pfuIm4Xe8DJaC6HBqr5MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oz6etTsSqhX1Bn5emEhGO0KMeTrWm2Kwktqzq7/Uqf8=;
 b=UILuOgXNNZzvu0cjlj7OP43H6OkzKmOgABQTHmB7M+gmW87Jkw+pboGvFKYsqQtCQgErzF26gS6B5HnWH4p7hoG0lwvopAf1txYtPqI7P7aon18XmimM2byp64u0z7CTaMtby3O8/HDsv5tVHH7yE0Mn8XhbzjE8sfgdCvnPWXG0xlcC/PASKL/dBksjCFQmAAsy3uU/R6CO9XYSTVn5Gywvl/Wld5TVJMNJnHEBMOeDmEMJLPJVu0o/QK/4BM4LgTkmMLt6MBIS8GKuoTrc479JER6veNCaljJzgG9ZKmFBQNjx0PqMvhkWP7QHJmcIi8qAoIDCJbn3H3DZWiaq0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oz6etTsSqhX1Bn5emEhGO0KMeTrWm2Kwktqzq7/Uqf8=;
 b=gVkGZfrgX154qFPPLS0Q1Yj20lIeu9oReLfOAWcmAWJC2vnPRlUukwQiC3WFzzVV3gvP/OgwsvNnobP6qhu3QXUEt59V7WwOCTFAxGSnLohbEJARvaS5vWcNaAyvqRDcgyjAUbnIATqLVOIaHOwGl9f9HD4TBC3XahLGhhCQJ+U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9449.jpnprd01.prod.outlook.com
 (2603:1096:400:199::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:24:33 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:24:33 +0000
Message-ID: <87ms5up0u6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 081/139] ASoC: codecs: tas5086: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:24:33 +0000
X-ClientProxiedBy: TYCPR01CA0052.jpnprd01.prod.outlook.com
 (2603:1096:405:2::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9449:EE_
X-MS-Office365-Filtering-Correlation-Id: 868535c9-7b67-478c-75cf-08de0ad993c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?msCw5h1jzYLUKjQ6odsd6nhA1Rggic039s1+s6xGQBL5oQKroG8XxnvGRNq/?=
 =?us-ascii?Q?KNeUUsjrKU0R+dnhH0JpwpIjqk2vS3dC85EArRGep1B6uPSoLSiZ9pJ0DhTa?=
 =?us-ascii?Q?BriA0vr8yi/RE/trCBFkW1xbmZsRux2HYdLgZCtER8cAKe1VP7GsTi3tIxFf?=
 =?us-ascii?Q?gXpTjm7ebCcGwBbLYzpN+ppdPrqb3RgE8cnh0JZaIdrdl0vaA1/HF/ki7xXo?=
 =?us-ascii?Q?PBx3XjhCUGRbe5auanMKCISLrsGgZt+MyTaKu2au3RfaPzj5StWjtBA9/AC/?=
 =?us-ascii?Q?sektsM00yom4xfEzRQMOsnNh9GzFQarl3VKVfKYfRkgsVk9MO7iiVuahDW36?=
 =?us-ascii?Q?5wPIErnDxyhlSdOdcHYzxvBeX3l5zw7UzWwRLy5V7IHJ8Ld6NtjuPnw+/k+v?=
 =?us-ascii?Q?APJ6K/s1anh0znuHZEeImc0Y7A/nVWBVwkbV/aaOyFRQTElMLjsZPhrB/psV?=
 =?us-ascii?Q?pIXi7PKvBV/+tk++sGYRRezAJMGktQEX58ymuwygp7ZjIhClXhypgH9fke/0?=
 =?us-ascii?Q?tWTC13Lmwq3l4dYj1EN28MdseT5uFpH0ZWU6boELw+0fnDn2A0a2Iaz7O0Cs?=
 =?us-ascii?Q?MEu6Q6pcib/x9OzXUfHaPjkD6iyZujhE/1Pz4gqtQDkVL/l/8+Fe2++jFYwX?=
 =?us-ascii?Q?iPMVRMGSjJq9uCFU505jE/yDBje58l2WMJpXywLcDl5eFLM+t8lVHCZAqcyw?=
 =?us-ascii?Q?JgefN7fcHZg+G4rR8uhy4dl54XzccEsg5vju85er94TVHLu8t2UV9fbXFhvt?=
 =?us-ascii?Q?izFxPvSIM0Odwkmc6bM5Q8alHazhCKmUhN/Jz2ntsDrDEOAtfzpswIWuiMgy?=
 =?us-ascii?Q?fKJwaq4NyuKzFoxN19ZeFIWyDe/ChpMNxq/mbGUB+djbcZizv5xYfjvaZZHe?=
 =?us-ascii?Q?QP8dUKUOwIQ+DIjRi9CY16YeAoSSBym8rvXfMPdv74P5GvyEdGes22bUw4HT?=
 =?us-ascii?Q?D9hPcLm8YN7+UudiWGcgmeRhfwcuCCdPCfolkp+NuyWuP+tT1h2I+USufQ3H?=
 =?us-ascii?Q?S64FOUKe+u/0v29cyTjnKhhHx78HQis94iyLOzRBibN4U/utJebIKc1u/nuk?=
 =?us-ascii?Q?0rtYMys5+8yCaqO+bfmu5kWxjWBeDy3w3mJi7SXFIdkrMMyXLH6dD90dUZKP?=
 =?us-ascii?Q?s7pQAMPhKGh/UmHrqOby/AOYwW4abRd5JTP6NYa3EjvTiV4hj81bAGE0rSOk?=
 =?us-ascii?Q?Yi2/3wdvAsBYp7drC/F/03GM+xnYGE3TsfNHszYxVukkCtt7x0eEGFefStxM?=
 =?us-ascii?Q?3PvfpMRjRbF2GrnqOTQVeUxR9UNvV1ZqCoEtvZ+RoU0wOitGWdJSdR30O5tu?=
 =?us-ascii?Q?8m+o+IH+TNG6qv2+u3Ns5MPR9u7tWadzx6S77Z1wmpn53y5vUpAsyBHfMWqI?=
 =?us-ascii?Q?4v08+DJdYJ/CJQ41jG+lYNBtQjIM+q+9BpQGPtXCiWwchWBnwI30nyViq70q?=
 =?us-ascii?Q?8idv7X+DDHwznjfvOgS+g1OlyUZo9jKGgt/VnMrnk/vpsY04ChRsZgYuxSe8?=
 =?us-ascii?Q?trRHwjtagNUNS+xJgO+CPdlZjVi/cGdGgIT6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UvUcVzZuccwC5X7+o+hEgXbtAsHHCIOvumVxGejIg0z1IEt+yqfe+Dj0qCIW?=
 =?us-ascii?Q?JJYIXW3UahfVaeqQ8jthxj0UJifyHCMYfemOIiJ/eYmr2FAz90I7aBfH7cy2?=
 =?us-ascii?Q?yAaQSwMah+wdM45BDq6f0y1TezM6GI+DYgs1TOizTG9QXHsfko4A9SUuqftM?=
 =?us-ascii?Q?BUM27fgOYEp7fI3TexMm9MzvvNhXOcbvIf3FuyXqkX5zQNg2513F1TDHxxpB?=
 =?us-ascii?Q?gbgWdXUQQfXi1wvA0GWFrFcGkLqNweIyeue6r85pPBEA4jeVC/T4xclXJBHV?=
 =?us-ascii?Q?K1LgGpYUGCKM0Gc1hh0HpF7lWaDYIKx5ktZV3WH3s0flwzO121wHS/7miZrx?=
 =?us-ascii?Q?1m95Cji4OlQ/j7DuQeJzuqGv+u1XscJsOmKlzoMOrEUmwZYyxptcRvG7Wz/H?=
 =?us-ascii?Q?FcIngY3Fe8D0rdWGUbGKHNWMDceahBA+YyU6deggDWfBy69YjCB0aNnRTIEy?=
 =?us-ascii?Q?FoXpzHamGCSr+HaKasmHYOOP5FbuHwYqiHYvmYsu4Gv6evleOd8VUFBxINgB?=
 =?us-ascii?Q?beZpQ8T3J9QmiY4HlRHAIjMBqRe/jYb9+KyX41v1ewzqNJwvaijKS5lWVS8W?=
 =?us-ascii?Q?x6DxpPHOX2Te7BtsDJZoqoIxMxXuD0Y/q57K0pi/MR+fKPKCJH1k2Jk5e6vp?=
 =?us-ascii?Q?BSXOAdFjWx9Wf9pVvQeRiyTqxxwp3HcRKrccRb3WsLuna9Drq7lPuXRk6RH3?=
 =?us-ascii?Q?oHD2jQnnKQj3AhME87vx1NxiR4+vg4cjfBt3hkmHsMoXHSnKrCJ46XWw2Foe?=
 =?us-ascii?Q?3S5IX6I/GIuytDy9TCNkMWVZfb8TukrfMNj3mANXdMuJMPoiOCBZOYsCFH5c?=
 =?us-ascii?Q?KXNA8Xc/N0mTccMTrWOb/bpNeJdaWikk0hT6zdVSAjr/8tWzjhFu8vAwKSup?=
 =?us-ascii?Q?fvD2nv0menhlf6wFF9Hm2xC9nvVDDwKIDwBnFbrScyjwgf1vGnTzcav1BZZL?=
 =?us-ascii?Q?HSVVN34BLBFa1XdleXRZ3eJoYIST2JMd1909b7HBkZzFpWj6Mlj7PUW6hJjj?=
 =?us-ascii?Q?BLQxgNrHlI5MSmIkdF0Q1bK2D6Vy63Q70fN6Y65S7qiyakqt/+RdGgNG/xCV?=
 =?us-ascii?Q?OR9XZzoT/uDSxgyUZBQtGWPWpZ1Pk1IKQ65U1y5P2vV0czbcthYUt9litlSV?=
 =?us-ascii?Q?JGaxrdvuK3n5Ys5P9OK1nrEwQ3VhngzxzdW6fNTyis5FvdAV4VSkedRclvDx?=
 =?us-ascii?Q?pKDxchZ16+uP8zhnO9GEhJFanfNUsMgQz0LibLANx0kxCbI8uy8GMYQfC91v?=
 =?us-ascii?Q?aaHT5t7NjwddPL0Jh8B2EHuusNBpdmpRWmVJ3t4gZArKDXiMrnNLLazGekO+?=
 =?us-ascii?Q?wcQ1xJykyM6FyPSlTrH75l0LCf4iqks13wEWNm/O23ByECXkXCup2eF4Cm0m?=
 =?us-ascii?Q?OTYMp/sOSVU0RHKDoOD+sl380eWrj6qpMX5aCUWpKxIchcsWR/aLAG4MUJ9t?=
 =?us-ascii?Q?zg1xR+png6j8RkjKDfd0CIoBbdFLmPG4UZMTV56FXkPsxpikELNEZaBOyTl3?=
 =?us-ascii?Q?DoOFBX2skdpln7yiGQjD76XMvmg8Sa1yxhKRZtyk8l7dM0tfJnr7PaR/aRrK?=
 =?us-ascii?Q?xtZ1xfz2KvnWudS/3w941+v3qX3mLwKUeMCZM1Lp+bERtb4wBftPSgMXMA8M?=
 =?us-ascii?Q?uDkJJQe2anHtTUea+nuq2lY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 868535c9-7b67-478c-75cf-08de0ad993c9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:24:33.8263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kTSICuxbCc0xD1QITwErLDOBSH8AWCHs99qivgbTQ9hEHZVd7G3lhndAgu/++y0Qmv7ZIBRFNbbvULgYFGVOofQGhJ7xRjQ4ekOk/HoAEHMMH68pe1pVWG03vi0/3Gbd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9449

We have very similar name functions (A)(B). Both gets component from
snd_kcontrol, but (A) is used in callback functions which is registered
through snd_soc_add_component_controls(), (B) is used through
snd_soc_dapm_new_widgets().

	(A) snd_soc_kcontrol_component()
	(B) snd_soc_dapm_kcontrol_component()

(B) is using very picky way to get component but using it is necessary in
ASoC. But (A) is just wrapper function to snd_kcontrol_chip(), and directly
using it without wrapper is very common way on ALSA.
To reduce confusions of similar function, let's use common way on (A).

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/tas5086.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tas5086.c b/sound/soc/codecs/tas5086.c
index b97c0e8857138..12bf6a89dbd86 100644
--- a/sound/soc/codecs/tas5086.c
+++ b/sound/soc/codecs/tas5086.c
@@ -272,7 +272,7 @@ static int tas5086_set_deemph(struct snd_soc_component *component)
 static int tas5086_get_deemph(struct snd_kcontrol *kcontrol,
 			      struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct tas5086_private *priv = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.integer.value[0] = priv->deemph;
@@ -283,7 +283,7 @@ static int tas5086_get_deemph(struct snd_kcontrol *kcontrol,
 static int tas5086_put_deemph(struct snd_kcontrol *kcontrol,
 			      struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct tas5086_private *priv = snd_soc_component_get_drvdata(component);
 
 	priv->deemph = ucontrol->value.integer.value[0];
-- 
2.43.0

