Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010064.outbound.protection.outlook.com [52.101.228.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E991B394F
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820753; cv=fail; b=Ww3//1QTkSMjY7H1K3cYPb+jGzZJ9niCPmP6qn1OS85BVen9770ArNEIwlm0Yi1vNduVfvQrsP3UU3Y6X2FIaWGGlu7X/jzJOIYcLkbm8UzIQ6XtVEiQOZ/6BvagB29YTqZ1bqZ9aVZ2Eq+inLH4Zn/QQxi4dkTfgVqxvUJHojk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820753; c=relaxed/simple;
	bh=a1/T7QMgeeQScTDRq5kguAx5+CR8VemKbngese+xQEk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=nu6bBAi7uOJjH2e1UkMjnDE6y6xSZUGmWIkzEtwq1wOMLLXiA3kne9PMyg7ldgLrwu9ASkhMUvwsz4XveoT+fg4Y5cxGSm04lCjbh55XhdtoPXemoJHC1gv778X5ITKEFT00UWF+6miRUanDNVdrtS14Nnf2Ml82NO/E/TvQVeI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=nbnOFT2E; arc=fail smtp.client-ip=52.101.228.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="nbnOFT2E"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QUO2O0QCm/hhor1Xk6ITDzoQklBe+t4vnidzQxCU/cF8zKXdOCx+Z/JaEcqxvV6UO9yV/KonwhI96m6DyDKX7K2R9sLjiZVvZldC+K4ITMlTGvoPfCuzFHNY508Bg+wozyWywiWZyPBbduE5rfwwVyGuaNSBsTmheJuhMI8jB8lCK5HIQRq2nWwIA0KZzT6jrqwZurx9zqPWfSBzKqZPIexa4h6XSCGwt3r6XO8AKTQcQOQg7jrtN+Du1k8Z5h4v+fVFH7THtZHjFrioSL01mx4Ie7GbktLiuMb2BNoo4ikA8jeZQzOILab7Oi+oAPdpmn9BpDTVwXYZCgm4675dKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ISZe0z5yrfni1QZOBwAeWuHRDM3fBBHesunLtId0mz0=;
 b=a416idTUYfVPxvLJJj0HGokhVYi5o8zBjGXekbwMHunuLgcKxqLfXwG59yDVDxm9ealEoTuT+k01k3VyEIm5SEpHP7C0fr4zFLDzJm9XB9XA4kM3t7+kaLlLW+yJ7baaOz6NS6NDD9KYUhJ+cnTx793FKTBsIsj/K0jRDgEz6Pfrupt+hIYy+ez/Urv2aldGGmheiUiyTVtPQYRfJfUrgXad8I313+Eftlgv8U9t90x3Jq405CoLKSF9mpWK5pD0axS1ctn4iLWIW1q0nq2y+DdG5S1LsPhheR5Dpnrwhkdu58HM/2Jv5bYgYwMQiLivKYsaIlRTS2HNr3Xfh4drww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ISZe0z5yrfni1QZOBwAeWuHRDM3fBBHesunLtId0mz0=;
 b=nbnOFT2E4Xwu1HGnLtU/bJbEq3MbhFF+TgN8t++yzmHdrJ6+tX8ZLP+onDcN4v4copyYasQrN7f6DGmFyEK6StJKdS6jXMNegr3dM0B/QRz2S53cWlpmJzi6VvUoc8uRCdhUA88gfu3dF5R2qusUTuA+yAEpl16Ea823WYzKTB4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB14439.jpnprd01.prod.outlook.com
 (2603:1096:604:3a6::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:25:50 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:25:50 +0000
Message-ID: <87h5v12z5e.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 121/292] ASoC: codecs: rt711: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:25:49 +0000
X-ClientProxiedBy: TY4P286CA0004.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB14439:EE_
X-MS-Office365-Filtering-Correlation-Id: bc9f5751-72c0-4260-33cf-08de20b8dde0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ihrIZo75A8lu7vzXkpA+OfJI1C/J5QFGPaMh2as0RHg0dRX8yDijbf8v+PUd?=
 =?us-ascii?Q?Iv/dXjmoDxoFmuHb3nqrnKnNVSMGj2hTniZnAGU+38GYFB7vOFiWN1Wbk2ZE?=
 =?us-ascii?Q?Y7svgwhDtP8ScJz9k17A8ShCdBxZhFfueqUzkbM0NMrZyrdgqKor8Qm1KMUL?=
 =?us-ascii?Q?lRN82fd6ZTXLu5OPGzFmqmExNZLXNVGC6usOZEYIxJevjqXdbDerseN9Hhc2?=
 =?us-ascii?Q?n16uQ2j/DjFxfvD18GesrQoZyn/BqfjUFWgeGHM6IO1gDWsn7f445ierjgGi?=
 =?us-ascii?Q?kKb9EWFXC3nGssfUwW+q516EFZfukxaisPUcsVFkVs7YwAeFZFeqZfUUAvU/?=
 =?us-ascii?Q?zoJXytTSxwyOyDM5Dp7sE1BivA2F7yLvPOi+phZFdFNS+qMMHvqGdTuau1WT?=
 =?us-ascii?Q?AI4fgU2fTnaylg+zxS2IEHHG6LDIKQsaDGCgh3KTsKN+MosMVA14WHoXpzfG?=
 =?us-ascii?Q?3Ux24F4Mvro5yV/NbY2wFnipEOCon4Kf/xd2mXcZf1eEgWTpV5hD36qUE16I?=
 =?us-ascii?Q?AwB2gEAdUe+LTCYm2jiJxk9G7TENasYnIZ5fyJDSbmLxOQZK90GWvhiboV3f?=
 =?us-ascii?Q?9Tv34QvrAg9HvpeQUBxqZl2OXxpMExzyRcwYBn2JYE+wjd7E6ZFnR6fy4CSh?=
 =?us-ascii?Q?dQoD1FwprGHQ0pEggDPtJY4N8XQqhQ2Pz6jVn962dQ+nZR0jinby7GNjox51?=
 =?us-ascii?Q?vR9bzY0kjgH2GjFHftoOlLicB5p5u4F1Dk3lqlIX7v97UAtzH1Dt1NbFBN/N?=
 =?us-ascii?Q?kBTq7R6kzrbHBFF26Y+cBAz4azAt6fhqnoSHTFllDiL+PagwLM27hf4M2vwB?=
 =?us-ascii?Q?IiBDH6OVeFyZUstm+7VBKDc0xRgDwV1UQWEP88Y7oyXTskhaM7VEFcr4vDkk?=
 =?us-ascii?Q?lfHKLq5mk7RMsNQ3tjJJ6TAhadWzBGnHFUoScmP/TCV+fBIGHHZuPFnnN94W?=
 =?us-ascii?Q?Gg+VpXnDTOG855h+b1l8lyod5epkQunaLZKRuIPlGN3fPJldCEmiSMX5H8Om?=
 =?us-ascii?Q?KJIZxobs4Ks4WziJW7yaPoN0yO2dJgDBbd2ME3tBhi/f8Eeq/BZieC7GFfK/?=
 =?us-ascii?Q?llkzTe+ceTEAu2hR8UqSz+A+3Te/3LSO8UoIga+dHteB6FdNnA4K3NOj08YR?=
 =?us-ascii?Q?/2NpisHGLR1uKzmS+chk0lJ7j5adWD6qpE35yKF/T6EerwF2i+ZbNADOv+T1?=
 =?us-ascii?Q?j47yCg4NmioXcJf3nMrE/U2orVTRGWu5l0ALmU/Xy0v222wBQo+OdVGgO9qV?=
 =?us-ascii?Q?fh1jhtFWuK5H1I8PkWhojIzFxp6Ox2ZO26c/+8Yax3bhbJAzXJWnmzy6HZdY?=
 =?us-ascii?Q?JbeyR392Uev8QKt+KYVJi0FPH/utl0rECRzJePWidPFdsU76sJ4a0TNwh+vY?=
 =?us-ascii?Q?1ZMdM8GtoN2reXeoebRCKWrpEaJ8LbP3sUspEqyM0fPaVwtpBZNsNrYMJQ5P?=
 =?us-ascii?Q?I14NPQOjMBrA6mtqW7Oc1SPV2RoXH5lZOmfrRpbbMp1E27wmX2ENDKJ2CZuz?=
 =?us-ascii?Q?47Nmp1UP0vW1CdGxPfz6KFGq7kxuVLHTcke1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zVJU0e5wBXUoUqd/FnUTo/3jCrgulNqVluRDwz/Mx8VuRaIYygIegWYCidzA?=
 =?us-ascii?Q?1+EyGtIrA3Hb3UlK5w/SoSy8HlUEu05nQ6GLuToLQd0wmaNhGUigIzlneGFI?=
 =?us-ascii?Q?6U2jXfp8g9O2ym8Sw1m8RrbjrciN2lV2G6OjymcIEpl74ZQQpsac6/+ahwYm?=
 =?us-ascii?Q?O3ajF3BCOV5ukzpZQHy60yxFNCDtS03u8JFCvEpPLkXUKCVvrhLEA4P2TwyO?=
 =?us-ascii?Q?uuvbDBf+9T4o94DaInr2sQt6utwwA2USe+eYB3nVYvyyq8YJr1+MOxyJLYre?=
 =?us-ascii?Q?sDZNZIMNR0AsYPQSFmH5iKBQ0nniM46AT6wyeMF/kDyFDDRPpuJiJJcYOfsx?=
 =?us-ascii?Q?fQ6M5ej2o/5rXSclp1llLMMGvJh6CNlgbTOoVfn9nF4Pb6Qm/an5b6u5IwGE?=
 =?us-ascii?Q?Kv11LBDBcBmP7jQ1pZemkCcLcFHySQl4G8JaJ+Zx60d0uejQ7zSUvlfy9hUZ?=
 =?us-ascii?Q?/B5JHJl1Nl1Oh5RL2HknHePf+ENK20/STMJPEF4dSU03hd9rJk2JR5phol67?=
 =?us-ascii?Q?miT6tJzrSFvRD0AMvnBcSlxPvajS/34nD/cU+FsWnczSe/+zqN12k9SiBBgX?=
 =?us-ascii?Q?xUtBe5c9rG451GqwRbwMi50cQOna0PWaHULmh7/2LRn5KWhf6PYmfQL9aFgu?=
 =?us-ascii?Q?Y8PAALm/gELjxtQ4dLKg7Oj7kx9XnbfIoZdXAkFdpAeFVWSo+K64RzkX5HUA?=
 =?us-ascii?Q?BDSR0Oko2xKzpvlV2+tf6xvyKKEVzmt8qyVYv9g5+C/pIktlc2lNyLusttO1?=
 =?us-ascii?Q?D85/46BjNjYgMXJ31IPWj6nri+aehAvHbHuYAeqgGcibsI2S0SiPP8St3yEz?=
 =?us-ascii?Q?M/eqV2dhWbNTylhGDuSGEE8RNY7seqgjun7L3NDVzuw5uOEMNLyqqxNct6DY?=
 =?us-ascii?Q?YmEm+Ewtb0UcFU6Qi0ahp2lsxsEaN+uoSFVjP2td/fcZmyWP8g/dgacXwBX6?=
 =?us-ascii?Q?jP+Rm7x/PJPX4ev+jttBqOzpxy3zQ66mWVSyYeaqDiuAVvHNx/+Z85vSi9xk?=
 =?us-ascii?Q?wjUaFuiEbWKjN9ltzotHBcdBYbu5VQi0qanOh0v+fXVxDAR5o62hkcq9HM9x?=
 =?us-ascii?Q?jDjq73WNTeXNLQjfOoSKJn33MgH+HWSVQi4ZQ4Fg7ZWtPYL9RfE9jcfrDT44?=
 =?us-ascii?Q?fLPt2OBbv64V2Pt/rML8QUqLMMw4hyKPcQTArPPfvrnbdEcF8l0NJm1uTcV8?=
 =?us-ascii?Q?lSqKcLjn6V/6OWfyyhQXJxMQiP1uyWS2gyvpHA2gxHZBkOZXe0h/Tz47PIqF?=
 =?us-ascii?Q?APdQPcm4VTegiPNEpWKVlrqrBjqDmEwHMGvrlwQo7iDhKUuyOuP8FkskyYoo?=
 =?us-ascii?Q?baQNAk8pQ4Ac4JSEwIX0Sy/b+cv9zn4+9GxLRZ+4V5XpjW7uWndZdFofCLa1?=
 =?us-ascii?Q?uX/RGqpxnQFg4jxTPalIK8k50tgEDispRXqLqVZ57vN0ykx3ZYbYB/jd0SwN?=
 =?us-ascii?Q?BKIz+GAw8huAoEcvCCrODeZsSMo5OP0q/VbN0g3aF/WvrGm0HfInELQp+ixI?=
 =?us-ascii?Q?4XhNCj759K4s8Rpu7DjMxdiUgW+aqRlAh2J0YcWTNDaI4TrCnsZXQTL2b20G?=
 =?us-ascii?Q?mwX9UEpT8qVzCE5+MgDM1DLewhGNS3BhGbsjzEZqRGX88rHRsgA2+x7BTL0j?=
 =?us-ascii?Q?dUHD+uEya/NNFD4VRvblXXo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc9f5751-72c0-4260-33cf-08de20b8dde0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:25:50.2742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ekS8HPNz4L/dpLPNLBUqRFOdwCOP6fC4ZWlgiOy0E1veRYiY1nt3cUBIsYUvfUW5Kgt+UJkPPNWtJcVq7iPqfBD8GciP2KDEvjYQdvGslbBbsSGXEPC/ip+kCJRYIESV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14439

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
 sound/soc/codecs/rt711.c | 28 +++++++++++-----------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/rt711.c b/sound/soc/codecs/rt711.c
index af3a49aee618a..5dbe9b67703e2 100644
--- a/sound/soc/codecs/rt711.c
+++ b/sound/soc/codecs/rt711.c
@@ -360,12 +360,11 @@ static void rt711_btn_check_handler(struct work_struct *work)
 
 static void rt711_jack_init(struct rt711_priv *rt711)
 {
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_component_get_dapm(rt711->component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(rt711->component);
 
 	mutex_lock(&rt711->calibrate_mutex);
 	/* power on */
-	if (dapm->bias_level <= SND_SOC_BIAS_STANDBY)
+	if (snd_soc_dapm_get_bias_level(dapm) <= SND_SOC_BIAS_STANDBY)
 		regmap_write(rt711->regmap,
 			RT711_SET_AUDIO_POWER_STATE, AC_PWRST_D0);
 
@@ -448,7 +447,7 @@ static void rt711_jack_init(struct rt711_priv *rt711)
 	}
 
 	/* power off */
-	if (dapm->bias_level <= SND_SOC_BIAS_STANDBY)
+	if (snd_soc_dapm_get_bias_level(dapm) <= SND_SOC_BIAS_STANDBY)
 		regmap_write(rt711->regmap,
 			RT711_SET_AUDIO_POWER_STATE, AC_PWRST_D3);
 	mutex_unlock(&rt711->calibrate_mutex);
@@ -504,8 +503,7 @@ static int rt711_set_amp_gain_put(struct snd_kcontrol *kcontrol,
 		struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
 	struct rt711_priv *rt711 = snd_soc_component_get_drvdata(component);
@@ -543,7 +541,7 @@ static int rt711_set_amp_gain_put(struct snd_kcontrol *kcontrol,
 		val_ll |= read_ll;
 	}
 
-	if (dapm->bias_level <= SND_SOC_BIAS_STANDBY)
+	if (snd_soc_dapm_get_bias_level(dapm) <= SND_SOC_BIAS_STANDBY)
 		regmap_write(rt711->regmap,
 				RT711_SET_AUDIO_POWER_STATE, AC_PWRST_D0);
 
@@ -597,7 +595,7 @@ static int rt711_set_amp_gain_put(struct snd_kcontrol *kcontrol,
 			break;
 	}
 
-	if (dapm->bias_level <= SND_SOC_BIAS_STANDBY)
+	if (snd_soc_dapm_get_bias_level(dapm) <= SND_SOC_BIAS_STANDBY)
 		regmap_write(rt711->regmap,
 				RT711_SET_AUDIO_POWER_STATE, AC_PWRST_D3);
 
@@ -682,8 +680,7 @@ static const struct snd_kcontrol_new rt711_snd_controls[] = {
 static int rt711_mux_get(struct snd_kcontrol *kcontrol,
 			struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_dapm_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_kcontrol_to_component(kcontrol);
 	struct rt711_priv *rt711 = snd_soc_component_get_drvdata(component);
 	unsigned int reg, val = 0, nid;
 	int ret;
@@ -712,10 +709,8 @@ static int rt711_mux_get(struct snd_kcontrol *kcontrol,
 static int rt711_mux_put(struct snd_kcontrol *kcontrol,
 			struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_dapm_kcontrol_component(kcontrol);
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_kcontrol_to_component(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
 	struct rt711_priv *rt711 = snd_soc_component_get_drvdata(component);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	unsigned int *item = ucontrol->value.enumerated.item;
@@ -900,13 +895,12 @@ static const struct snd_soc_dapm_route rt711_audio_map[] = {
 static int rt711_set_bias_level(struct snd_soc_component *component,
 				enum snd_soc_bias_level level)
 {
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct rt711_priv *rt711 = snd_soc_component_get_drvdata(component);
 
 	switch (level) {
 	case SND_SOC_BIAS_PREPARE:
-		if (dapm->bias_level == SND_SOC_BIAS_STANDBY) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_STANDBY) {
 			regmap_write(rt711->regmap,
 				RT711_SET_AUDIO_POWER_STATE,
 				AC_PWRST_D0);
-- 
2.43.0

