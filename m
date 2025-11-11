Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010046.outbound.protection.outlook.com [52.101.229.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F2C233140
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821338; cv=fail; b=upYQX2nQBV5xq6+ydVLEkj1CugkC4uL6LV0l2oOnEdVk2Hb0wG6Go/T+WIP6JBnyQmKTUNbyHy1cNXErUcUOsOLerYZlfqc2aAf/5qQBoeWeg9xPIokTCxo6HGMdichhPbjqWP1Rmmy6vdStlVaaxJ4G+nRyAzdyq/uKEFw7gbU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821338; c=relaxed/simple;
	bh=EIYudQ1WG6/KoXeXCWQGXMmQwc2CcmRTe0sapWLSKyQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=hoAUtsugvZyvEVJ5s5tIErDk3GMLfXh9MK7s/A5JZ9kJ3ttTRjvXWkxC+N5vamjzQetAn1+h2xjIq8ZyiVQCalZu8I1fnhlL/jZC+ZY+aN7zF+InCpoeFgrh1XzifgzojaLp/6QKtmq16zCqRz6N368xzeltea5DcB6yZM0qDZw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=AsRlnwpn; arc=fail smtp.client-ip=52.101.229.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="AsRlnwpn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KWIrw/6uQ3k/YafTEyd1mdE25PcZih05rLGOLWNhQoHxG0oeIDgu0pYZkjexUx8ud0C09JnEpgHn9yKJlqc9rkSr4eUur8G7SnT+12tcI3NEGGrE5mKcKeCvuQgSSVFHiVGiYz0TL2zkGC5PsmNScjoYAMtdXuRlKaZ34oZkkyooAW3MAIcI5UWk/KVJuxknnpMaRrf0Zw6EFHkEzXJKNI8gO3v6j3/c0aMlisrR9BBeh40pA3XSkHh1I5RLXLm2Qk+e1ms84mURXav4LdZmpbszDrtVyFr8Hp/sj/kOamRTpOxtj9gnIr1J/sfyuoGeUxy+SkjA7EDSvbyLrXOspw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xyy3vhsu6ydLYFH3rcOotuI6oyZOhbwW2fCpQiQAqHw=;
 b=tmBRPiJASSI+yMz4Hxskz5LZ8gG/mK7FbRPC88VL1JnCyu5jFfzqgHOY1zPfiQnHFtkC3PU8WUMu08vzO4VhGGPQagm6taYk7ZuTcQ2ueDqGEIDhkQE8gZLlBJ7+1R/jzI4zS+2AX+yGv0kWFF6a/I72eD94EGqWnIvDdcswg6F4nbwn/rlQtixrFj0fvgrdjEF3GU1YiQrTekbU7PReRBWv0trOhU6e9jp0K5VLYuvCxacinufuX17alji+OaziLVTrJ19nxRp0LRfDRoA2BZbShDa/3Y5TxtrlHJ/Ue7aTVY4U/xjOhx6kcp/03oH04sOr+ohe6jFFh/EnXLQmnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xyy3vhsu6ydLYFH3rcOotuI6oyZOhbwW2fCpQiQAqHw=;
 b=AsRlnwpn5iSUemM/pryjs1dXVvDoc3D9MsWV7l6yv89osROOtRz5LZ6js74SwHgjgYXHZ2wW1dsMCAI4sU6m1exiNxgYuiTkqktUnh6IZZBJsop1i20C6ecvPL3AKQ9f2nI+sbYPUAn0HIY65dZxgrJA9WqltKmHTwmEV0Ec30I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB14482.jpnprd01.prod.outlook.com
 (2603:1096:405:238::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:35:34 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:35:34 +0000
Message-ID: <87seeltnhl.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 263/292] ASoC: sdw_utils: soc_sdw_rt5682: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:35:34 +0000
X-ClientProxiedBy: TY4P286CA0039.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b2::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB14482:EE_
X-MS-Office365-Filtering-Correlation-Id: cea6df64-d169-43b1-aca2-08de20ba3a1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MO1o2Yc3ZleFBd1f5C7Fwz5LbG9coy7aRAUJUx2WplbcQAsjJzloTRl0fXIL?=
 =?us-ascii?Q?EI2TiYXOwnvRL4BZdecK+BjcL1RxYTluIHyUJ5mscKWREqJVfBFCVUucAr/X?=
 =?us-ascii?Q?ovQ8mEFL2fYoK5BYlHOJwM4IU1oB1HO9CO90afHfD9BJiyv0nTGAIFVzjAjQ?=
 =?us-ascii?Q?gfefx23ja6qXpjCRAkNH/29SkH8UCUku58Go9oQB7huyMxeqHpokVOeGhJwj?=
 =?us-ascii?Q?F+Rx/pY6rud8VyYonYt1ZvcfmndU6oSpAwYkZjcNjx1foisbjqqJ2gEFQW84?=
 =?us-ascii?Q?+XIXig74eJ6B3dLpRVijEMbTFVzADyRzwmqOT/CQ4KbqTYBJsgtXNn06Oo5z?=
 =?us-ascii?Q?Jjk7zl+GDTqYoicpScySTAdFLH3OLjm8BjvUIFo4Uxy1lmfmpeWRa6/DDs89?=
 =?us-ascii?Q?QGXsa33N22XjJLkr7WQfGGTSzFB+HRcJaTqqtGBOBa/AE/GN2FeEq2nTN+jz?=
 =?us-ascii?Q?RDVjySXKI2pW+55C+eN6oLY71IHDqaRCWD4jW4ivkYUY5YHQMQ3NhCAQT8YA?=
 =?us-ascii?Q?Jq6wEW/+GghQAg3uAkh1LoPStkmcuXho5i2wS5+BCJFuFpX7hkntk8mcMlHT?=
 =?us-ascii?Q?T28w7lcOSprm+2BQt0QkNP5DtUV45KCmvDjtM2zVU4MzLiZUFOqR1u47l5XF?=
 =?us-ascii?Q?vuwCoA3YYj80N4akt1TWxUaNxedTMSqEsn1e1QLzLP/n+/TpT8XFlqdMJP7r?=
 =?us-ascii?Q?UZYpFdoJxncf0aVMcZ1P3pgEbhKCdY3HcoipcLNqTe8JukMWlnUJ1oECdkdx?=
 =?us-ascii?Q?hoNRajQ20/UAu5QIsvsuMOq88NCv8ar9lrb9G0oV8EtdPpHcF6ZUTIVaWHgu?=
 =?us-ascii?Q?aJYVJGiix7usyOoQ2yYQUca5zsqB4pPOwFjtSXmhc1ll4dfmjNIoxIdswTDv?=
 =?us-ascii?Q?FXRpbsYpAf0faGh5+65ljZPRfygh0KF80CL1j1eMBf0X/xbJt2vVJOSYAtqJ?=
 =?us-ascii?Q?uiWaUNronPuvfAtNnb+N/Ygb38j4oDUguTKSKEEWWUmBS9vX7kpPjz2OZtZH?=
 =?us-ascii?Q?GL2m/vF+L0YaiFAsvK2C3fsTta04LGznjR2+l6aPPFQXxqOpGZM2VPCmZ3XP?=
 =?us-ascii?Q?pANFcDYebYsyydjU76XaQgqCrytoFFCye29sTiNcqyuRUaoLHGI9L3/fA/UL?=
 =?us-ascii?Q?SVgWnF5fpbHUQ8+ih3wQUWy5w7u1DTdwWXdAT0hX+iQYNJblwaBGVJcdzy2I?=
 =?us-ascii?Q?XgJ3Jd95jGMN8v8PO5ny+4spPmdnTu5s9MRPg29ZDmqLlGxyZc4b5550sEYB?=
 =?us-ascii?Q?C1AD2dDYT94umk8LjX6cCoDe812IK8cDNcI0LR5Gly34GrZVyriJY2fBr486?=
 =?us-ascii?Q?H6wu3hJzT7XUibNy5RTlqd2GgU9T3GkjyOCmne8tF6c97kSucFcmLBgBbUFk?=
 =?us-ascii?Q?lCy5k56qVFRdCvYRcYCxY8wp6v6WEIH2cyCkqxWbf/KAF1jY68xSPW2KCqpc?=
 =?us-ascii?Q?0uprkdrE1c/CwcZkcZpTW3ueRzOjlcHZofjVCNkqyYfj7PAGbDfQfGL+Fbk0?=
 =?us-ascii?Q?pMZVFyJDbSAeCTqrkNMK3LmjW1KQhe8TN3wD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BgTi4ruoId3njzoaaOtFqsKi2zEJSiU5ss53tkk2iLn6Rmue6Tkg2j1T8oVe?=
 =?us-ascii?Q?LCAS4RDwUevN7xRGviGVMpgTci+UPebHUUfc1hI9g1OEQouENjuugOwCH/13?=
 =?us-ascii?Q?DTxW3hdWU1ALMK0isid6+fFwwnScE/+mm6OrNiHKmt4GMcceebQLfaYsvQ0I?=
 =?us-ascii?Q?Nn2415TzF8gq9DR9NqRCElomzZR0No/dZQfX/Fotlw2PvR/Wb40yC4PDPq9V?=
 =?us-ascii?Q?iEbW/TBhrdCxqKhUL5+5sBalutJ8HiBxb6k1w+hPjs8iXvDiydFk+SDjcY5t?=
 =?us-ascii?Q?UaJhr1ClRbRP7xc0g8WwfF16FmT/WNQhA5VWg+v2IsJawMi0dURJNuEx6inZ?=
 =?us-ascii?Q?qkAjzv1fDUTIM6MMrwAoAxjeGIWAP3FrN3QYAZqTA2GMOxEjmevVdqUT6+3K?=
 =?us-ascii?Q?TJl8oTvTlAguuc+4cyvd4eEh1TScnV1nYcAVuSjiKomHBwHGiK4FO2vPXWBX?=
 =?us-ascii?Q?9b+NH2fp1QQKz2agSOc7GhDOZBwQxqLgD4oML7DUEG+Fxu2+dottzMp/Uw0N?=
 =?us-ascii?Q?K66SM6MjMhLuvHyeKPS/HB5n4XmZeia1Ns0QJ2TPP5EErg4M4Lq3GyfYlaED?=
 =?us-ascii?Q?4i5K9ExvdbBGhOakgkXl92Xxpx4NQ/Kgvot/Cmb8aT1ih9CcWQbsP47/M3d2?=
 =?us-ascii?Q?gxeBpxElDjBto3vwAlPUdvUKJDDZhpeRmWmoz79qX2NaSdPahOzlP3wWS59F?=
 =?us-ascii?Q?h8wLe0rjRXqE9FF45+PeKgDQCeXzVnf0zw1Q6KX7MRzpdB5pnwM3XdTglOiQ?=
 =?us-ascii?Q?fwB9ezocbEWn0jCw/xxu+3AXEQxt7hrVsZIaOZ2YgYTjItFpyRHYAuZ9oavq?=
 =?us-ascii?Q?ruHGuZR0/yx8BbNOVmzbV1sBZKbDRBMyMM4tgqDtp/wPd2aaRVAYty2TYZLd?=
 =?us-ascii?Q?2ka1eeBBO7t0mhZedc71G0zRi7rjFbNT0CBejHANnNnFMAeJtfID7ELTWWcU?=
 =?us-ascii?Q?zmPu7URMVNm8HcrFosrv9iYXrmk5P3EPgpYVc/VFx+XN/Rp0+6qAugkM8v/C?=
 =?us-ascii?Q?MBvsN5+UffWmvI2V/+phRIWW6diRE5HZ5HaYvZvOL0pLeVDNSiCtsOje7QCw?=
 =?us-ascii?Q?Vn+8ts6Ke3HN9fkY9Vf7E3zR41b+QO7eWf7bx1bBlCFr34+xT2KcjAgFlV96?=
 =?us-ascii?Q?Ybz1kwLKAyDJI7nbIW2S3aRpyV9f6VWvvk1Iskp+EGbD/Z9aM1lRid0WhSur?=
 =?us-ascii?Q?NwmV8z9T0y6WOLQ2skAj0jfMKN2wGMCuh5uoiSkpS6x51iT4krGBHtnhzkwH?=
 =?us-ascii?Q?HhS6hN36g93xQZC01I2V25k9m13EUo75FlTVuiACl6llyuTN4cCnboEa/oNx?=
 =?us-ascii?Q?j2Np6m7i+tmQvqerqwNY/jqJB97J1F3SKE7zr2BTXgNC+sgSQXmYjswMLe3y?=
 =?us-ascii?Q?uZP53/zYahZz36L2tsU/WmzlqvBU9znvbyhGpmgy8QdDVpIPAxJlV8Nwn3jJ?=
 =?us-ascii?Q?STgoG8uto/0UZDwFElkh8K9VvMBgGWZATQcwhXTOIBmUS4dbX53iDrUNgSqP?=
 =?us-ascii?Q?gml/NsiKU2LS9UgnHuQWyPB9rdIWjIn19aLL6BB7oq/VszQcUp6C0iHmt/fG?=
 =?us-ascii?Q?7n0tr7sYyxahv3vV/Nxr/aDUPdVIWIN4s6EIIzPfSkCtdy8fEmHAz3MAlBrK?=
 =?us-ascii?Q?ZBj+4Pm46kzWDJju49DC3EE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cea6df64-d169-43b1-aca2-08de20ba3a1b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:35:34.5409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CXgIIFSRSVQYeIdh90/lYPed9CuGTF3EukwrTuTtSksgtaL1ajOh7tGAP/1IylSIsQynulp4YKwBxcYmXwDL5E5suid4BO2jd2FBjnHrFEDDitLzpxBa9xFZf3UzJ/60
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
 sound/soc/sdw_utils/soc_sdw_rt5682.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sdw_utils/soc_sdw_rt5682.c b/sound/soc/sdw_utils/soc_sdw_rt5682.c
index 8c86254cbaf64..641362835b4eb 100644
--- a/sound/soc/sdw_utils/soc_sdw_rt5682.c
+++ b/sound/soc/sdw_utils/soc_sdw_rt5682.c
@@ -40,6 +40,7 @@ static struct snd_soc_jack_pin rt5682_jack_pins[] = {
 int asoc_sdw_rt5682_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
 	struct snd_soc_component *component;
 	struct snd_soc_jack *jack;
@@ -52,7 +53,7 @@ int asoc_sdw_rt5682_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai
 	if (!card->components)
 		return -ENOMEM;
 
-	ret = snd_soc_dapm_add_routes(&card->dapm, rt5682_map,
+	ret = snd_soc_dapm_add_routes(dapm, rt5682_map,
 				      ARRAY_SIZE(rt5682_map));
 
 	if (ret) {
-- 
2.43.0

