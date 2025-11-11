Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010014.outbound.protection.outlook.com [52.101.228.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3142A23A994
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821396; cv=fail; b=BVT4my1ITL2Qsa0u61eS1MEEeJbNqnU8lWgRRJffwNZrfk7sLEskLhnhZT2EMOcgGg1RfbqDKPy1pr/c+xiyfk9fO0biaCmoH1RwGiXp4A2GZ3qtW3mPqNP2w2hh1ot3jUBAyw7EmUoZqP9r81Iq/n/hkOX3H7csoDlha5nPEyY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821396; c=relaxed/simple;
	bh=NPmy6fNBCMw0ww/R11SG1qx2eGPiO9RDDr5fS2vwTt8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=i0gVQs5QpVKmF0f6r33b02id5Iu+CdUtmX+hFgIlx4daKVPqRX2eAjDmYcooYA8sLQ3j6vWpPHPxbeGLuR0eHdP2uySuXW1zFYWnIfoaMO3vqykG5AFziFoPLRL33MOYMWwAB7ooIRrWjD9eG0eW6RFiFJm0QCJB05k/kvUjT3E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ICajcQJf; arc=fail smtp.client-ip=52.101.228.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ICajcQJf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a6chiqNJtMSwZ3Jjc/DDadBCdUJg4yYNlMm3GC8o6B6UfTavo2VbjmnBVU7tkCFSTh7th8d8UFklUzr1cdKVfJdmG1Ww8Bmp646HHpB7oj3gXYO37in0Nz1ltYlKzSqREE9ubD3U3sXO58ICQp7CaIle+l4pqnLocZRGD9xszinj9xRShoBTRb92XS/hGE/TwyTWG6h8BDBzgYoGvMQVttm6Ge/hiCM2s7ADYLN2zmMqcsunWLQBBOIwkMRw9omScbI8ZEnpUhEeH4+1PKjnvjdePPjxxTjhLBVFPFg95eHjHLYZWhLRdTWaaxLjsTUGvkzwAQwPSA6UrhZ7N+Gomw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pZ+uxKscn7yfkHFcOQbtRV5VKYABasQe6SIO+uy5rRI=;
 b=IoXDpL+Kc8I8/VjShSFS/4/zDV/Y40+wvzqAj9e4m0iwJB69+c83jFepLhs8p+BamF8KpqUIwWkHtJYtw9Yrl03BswYw/9bTy+AsxjrhKZIsWvRzhkJH9EZgEDf70gCecZVh2UTM/HoLB0Ee+3Bn33u8WR5tw5xqVQ0LeqCVM9rWo4g/BCiwbbkezojzp03/uDPLKjrLultMXbm5wUciZFHSBYIOroEfauXzwiptVNLMhIZGlTvxfyHFmk215kcAF5+gAC/Nz9ltG+YgbtssDlticTyu9ZyZ2EB4y4iK+mWKztc9xZspbMV0PQLTPiugF0Wwrdko5vDvy8hiUsuFng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pZ+uxKscn7yfkHFcOQbtRV5VKYABasQe6SIO+uy5rRI=;
 b=ICajcQJfiyiC6/LhKLTCddfnd99mmB6n3xFfsy8XQMrSp/SFTmoRy/R3r3bucH8LpeBGeOvW6DcI7jpryV5kfks+VhB1dMTkpDR+l3g3zcO8XALgu0gj/JdbIh9G7oU96zSQl4QJUrrr/rfQ8FsQconojHkVOXdIFWqXCDPzM1c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB16378.jpnprd01.prod.outlook.com
 (2603:1096:604:342::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.10; Tue, 11 Nov
 2025 00:36:31 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:36:31 +0000
Message-ID: <878qgdtng0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 277/292] ASoC: sunxi: sun4i-codec: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:36:31 +0000
X-ClientProxiedBy: TYCP286CA0272.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB16378:EE_
X-MS-Office365-Filtering-Correlation-Id: 66f90f20-19d3-4dcb-cba6-08de20ba5c43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mc2piK2cKL3NOqNzcAYQdQtPuOSfMMBia9fKRWUDiRbIABn6gr8jSScnFcdN?=
 =?us-ascii?Q?aAy8zaHoWk2q1BVKAmCBuMBJk77y9FG5MFix1kOV3qlmZhN2X7AGXFLBJTBv?=
 =?us-ascii?Q?xpevmXE5ZSWFIdMLA6c4ZDve1cRQtENfySd87ScAjf6FKeCQ3FtoqBA+o1mb?=
 =?us-ascii?Q?MfYcVFx4ZwpAVRqLce+gqIDNo7/ONISVliR+YLTPZlXMT+2gdYDyVNvsmFti?=
 =?us-ascii?Q?7n4ndCoXXeFTwMF/6nByNKwPVYT3h89lbmwMzFQ6LaEOb7+fmr3mDsNByK2z?=
 =?us-ascii?Q?E2ECuyvu/mt6EmK++syeyYHwhKAqmkSmjNe8xzcvzd1DuB6FHLfrw0ccF6kf?=
 =?us-ascii?Q?dsxg8DigL5aNWuWtbsxQlmTyNWOrEN1HvyCq1QtyBntYxbrZlxExeaZyFW5E?=
 =?us-ascii?Q?C/futln6nS8Ytjf/qiqOW81kuaivo746K6fe4IP53gAlGIjf2MOuJY+yflM8?=
 =?us-ascii?Q?g83GYAX4Vb4YIIzXfjbLja4getBxabnLrEfLSDiAjuQvgqXp/MX7lZy2QLEt?=
 =?us-ascii?Q?eQ6B5FB7kbE8dHaGASgVrRw4bsLWEeb/Dx6KZuXM3XyRH9NfUD8kpZGbqaqI?=
 =?us-ascii?Q?n6FMfpu6Snh8xsPcFn8svMJWuOcKep7E1B4d3g2b5cGl2Miswti/oNsq8YZj?=
 =?us-ascii?Q?rnOm1laso5g+4HHyvUlazsCDR3ZnaVAHTOwrX0kGuHWbnmTlv5DKhJDq9nhw?=
 =?us-ascii?Q?30cYUVaRL+1LcaWYHEasNdtoq8kp7np/UyHVBSzDaqM05W9VFJyzy/MiuB7I?=
 =?us-ascii?Q?WUBttG4cBfcYVj7pqI6hjb+RkYkn5b6AuwzuDVDpRrQLin7ALX7Cg8e9guOE?=
 =?us-ascii?Q?Xwr3TrdCVWtIriTyynXkuCUGKfn2hHZeB6QsZZ8RCZpzgO2dfH0K59IBrO5K?=
 =?us-ascii?Q?jufIhXh9Yalumw4Rp5kd4e2WRhzrFfXFfG6wr6/gWBL0PLz0UU4OGfa+v8+0?=
 =?us-ascii?Q?xqOlY5B+4pv2oKGvvmTXDHhUYpC21qnsJIGBVTU9kjlCvjxaDrjUxmBxZ1Vi?=
 =?us-ascii?Q?ajLezkEZfY2miEQdeHzv+VkmYVGEBOXpGlw8vaMbUwT8iu7cn9OBkTliggBK?=
 =?us-ascii?Q?FtKuQ+rLp9sa9feTqc/M/QQVxWeobiedDEhCcBWbQFpSttsO4paMiBGgYNt9?=
 =?us-ascii?Q?4JXyODc3ceeLaGmRTCEyt65/VN5Q7qsY8Z8WYj/TZUvwH7AZTcVMmUZpKofi?=
 =?us-ascii?Q?I9mZzSurApM5XifOCZBnB5Ik2pFcTmKTs5x/OsOsjginaTT7bIPOQAlRs894?=
 =?us-ascii?Q?S/HaMKW1Wvd+drEUpY4wICX2Mh5NZplGKgiyF0XfeSuq1Wvo0vPpgxe9sGTc?=
 =?us-ascii?Q?y66zSMe88RCz2r82m4KcZoV9km5nxbWlJZjhU1jn+ZEgsrmgADpdaeN5OFIX?=
 =?us-ascii?Q?YCSdg9JZnsVLqpCsgUnc7gPJ/tdJXUjKyY7SISLXJgEaBz8JDDK8ISxI/B+Y?=
 =?us-ascii?Q?E45Rwg1JyNrlIBYtqDpjiCyjEHszyL9z1hwZ2Bfjr3kW1956LRkAEEFIV8IW?=
 =?us-ascii?Q?UvnGaCBgCgRv03I66utOkJ4fJIJIuspqaiMr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?stnr6DEHA+3dE5a+E9mcLi7jno8kOqrB9olY0SBjKFq4m7FWuXfUPFF5qzt2?=
 =?us-ascii?Q?Z14+No7eZmhIrZMIGeus3nxhphNPhDzVojZ0r+QP3rxFJhngEBAmzggwpGgX?=
 =?us-ascii?Q?yiGatho/orp1wpDsJt/4Gyonum9ImBIZzH4Yws2f4oZd3Oph9QhX2/KSquFC?=
 =?us-ascii?Q?I747IytwchVAg6gw9NOjX7Vr8EKJ0oDYcDs0grYm2TcMwn9GFx2Lx4JJ9RIH?=
 =?us-ascii?Q?7H4T8vpG8KCuevizWin955+rrDPlceRMhhk7t5l0UkPXUUcM6ObgcP5YTYcQ?=
 =?us-ascii?Q?MzndFMB0QE+l4O73smGGQbaFUdlUmk7xHay0Pcr7v9+7NqKfQTAWWn/6ffor?=
 =?us-ascii?Q?juPFS5YWFh2P0TtwYb3OA8t9dA4hV2b0frtdhuACOc4mr9d4o5/c5YK1Num/?=
 =?us-ascii?Q?UTtSANlJmFYSuJwx+jmJuLTTgF4j7v5cKGQZPJOMJ5ydFsqqnQHoklZS0T5M?=
 =?us-ascii?Q?lypGxo9R8h/3puDCaaYRj27BESRVVKkvrrBvKeTIqdWyYtNf5m4cZ3gTQCWm?=
 =?us-ascii?Q?8XEu8QCc5Iea6azM3A+uXQw/ct/Hjsx4xOHNu5qOn6efVWhTkZm3rbDwE79/?=
 =?us-ascii?Q?y+lkqOBjOQSRBNzWfF9dccA+T3Zm22Eli/0F2tDv/mEv2MEj2qLgqn0XUqh/?=
 =?us-ascii?Q?cJSbq8w+DlrJBI2ZiWQTZI3C8Ohy1u51VXbowX5Teo+RnTcHef6H5gdqiwR1?=
 =?us-ascii?Q?PfclUkEljYnKOa9VpNuW+Aly+WJwV1Ak4EKFuuFgzikiqGdUbEwRuw5TyEf5?=
 =?us-ascii?Q?H45dgINJ+kToqwxkKsyNF8NvF9YiidSZUwzMVxXAiPBbFn9tY8sdm1r20GoJ?=
 =?us-ascii?Q?bVqvG4FvuDrZ4ZcrXELACrBWXMCnhkIwB85qR/FR1qF3zTkfZxEftamcZus4?=
 =?us-ascii?Q?Mgxyn2zeQkXzvJJaLkKJRfF0ASSfAzNUIWOEsiA62RvdQxaWVf+n6Ie8+5dK?=
 =?us-ascii?Q?s/H8kIkUGVjWJ21rnMGbXMr9E89SKUFKwhsrJqlgL9x8zx8AYa10o5QOLWKh?=
 =?us-ascii?Q?zsiRO+WFxzAcLPwiklce/iyT+680T0F7t1YmQXJ2Ti48JDJ/DGE0KD1hNu7X?=
 =?us-ascii?Q?EYjuYmCL757dJy6ah0x3S4WgBDd7Y2MjaERL6nMiWQGrOw71Lvj53wcmyBOO?=
 =?us-ascii?Q?w7Va8ADrvivwz1sQ1h+X9GiLbZ/16ZKCztdLZ1HOtpR/v3m1GgtNyQq5Behj?=
 =?us-ascii?Q?HOL/7Vvioeoim7g51XTChvUvNqv3KXuw+a8+fZ60jYPaZu6ouLaVCM0W9sdU?=
 =?us-ascii?Q?z3iFIKLYZ1TyCFy24UOu1N4bqN42rThmV/omnVbGtL27Rw06ym2OBiEcgb6o?=
 =?us-ascii?Q?G4Ia/iJcf403YoOOQ/nmPxPaMB/doDuwYUICL7BcgCiUKnAU3mX6sZSeg0u6?=
 =?us-ascii?Q?IOOZj8Pj7Gv8FnKTmAKPA0RE4+TODfo7Bt28HqoIi5Jy1ccakaGa4ujcsxDQ?=
 =?us-ascii?Q?d6Gxb7HyKz+vBIR6FW4zLkXuYdpmATImtYJ1NLhzwxj+jVULEOSOfh712YdC?=
 =?us-ascii?Q?btq4E4I8g2mlvzKtGQOYizFYcGlZpGPcKiwcx12AmHRvY8arWYVfIn7V78zc?=
 =?us-ascii?Q?WSgOyqti1aUt5WWT5alUfro0UgNhnE6W+eoahSbdmUvULreCoanM/uY5aib+?=
 =?us-ascii?Q?jc7i4yAQf74Hb2T2xLdHU6c=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66f90f20-19d3-4dcb-cba6-08de20ba5c43
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:36:31.8198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zm6juNz8lPpncQ8tCW4goqxM+Ag6cXcjYgpTIZSGgajlmNDeIK+qsTSRug85NXwQhzpbKWPqWoJJXaa0wysOs8pTBVQjdAv8MqUhGzgInQ0jBYsf96/gRGF6UZYDbNSm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB16378

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
 sound/soc/sunxi/sun4i-codec.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
index 93733ff2e32a0..f4e22af594fa3 100644
--- a/sound/soc/sunxi/sun4i-codec.c
+++ b/sound/soc/sunxi/sun4i-codec.c
@@ -1663,7 +1663,8 @@ static struct snd_soc_dai_link *sun4i_codec_create_link(struct device *dev,
 static int sun4i_codec_spk_event(struct snd_soc_dapm_widget *w,
 				 struct snd_kcontrol *k, int event)
 {
-	struct sun4i_codec *scodec = snd_soc_card_get_drvdata(w->dapm->card);
+	struct snd_soc_card *card = snd_soc_dapm_to_card(w->dapm);
+	struct sun4i_codec *scodec = snd_soc_card_get_drvdata(card);
 
 	gpiod_set_value_cansleep(scodec->gpio_pa,
 				 !!SND_SOC_DAPM_EVENT_ON(event));
-- 
2.43.0

