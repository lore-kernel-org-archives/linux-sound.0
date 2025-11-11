Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011005.outbound.protection.outlook.com [40.107.74.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5A71A0BE0
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820613; cv=fail; b=n9Gy2E2/P0UGivC2Q3xSlc75LA396r2BOHPj4l70EAR/g+3y5IIBlSyvJnjuBCzaYPvh4ks85nve6FmAcc7xrK0gaS5QFw7pE5eVWewOYUdpErOeVyXpMiVEXbqjCJYdyswU2IG9IKko6gxM8HVCTM/Zo6z6mv1e7dP2PYa+QFc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820613; c=relaxed/simple;
	bh=SEtaVeLJcsWBHRJf9TTgA8r9HJEMFIXb/OaDkZeWhMQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=luRSZY/nAY1cofRopA+AfnoHFhVMO4jpC6yQ9VyiTvJTRJuKAGCYgiw4gXIY2zHUaK7iw2CQttQHTJzfuPHvYjAwaDyEynT7Dj55ANHImgRb9vH60qhlWQBXSoQa7lQ8goe1e8OWrTu9qdbFdT8jQGkUtuHVNi0tCVzEDhGw7I8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=hK2i0Vd7; arc=fail smtp.client-ip=40.107.74.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="hK2i0Vd7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kPIFdK0udXIUJeQuBvADKTmQu12xsjNOF4rbBDyVR9/o+2OxH4RoCa3hda89yFYfZEFMRucysUAFOreRJfYTj5r4QYWbSynB1EDkzKiNaLqUtNBsqQeQxWpqBDy90AyGG105EtSC0Wsq6V0Kg551Y5tr2qhvdnk8+ORM4kK1tYCU9AZiY3FyPgpA3SZIBEgsZz3LggtG1C7yfgZXYbk1coBSaUWWQ+u+gmaIcbMUcfF1avYl5hd2m3pQadn/4kvKe0tf+uw1Y6XVVghlKhP3zdQvrS7w2shOtl4A1OF283Vws/jZuCJ5Ch80kfLTekWvowshHg2ygdJzka+V5d84uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QrmMdJGbSo0DX9C19TsBy9G/f22vwIEwkBKwqv8HZFg=;
 b=hazvnTAP+KfUZCd2rTbrXqaGNwuSom7Ihas8iGRdg5gcCKuK3EKro1QfRPhgWKMnqXvbZMashKg0bBKbd1YRQn8X0wwMxdloq1x5MHhrG3XVzqKUAA2kX3mbjQ3uctl/ZG2cIYFDC4Qdth3Y6bXFX0DYFZy9EtUhSOBhj0p5NrAeSlNyIhQP5Nucah2OB4W6aEEFfD/RDF5qg/DsJjQuNRba5zQSaqNgoVB0L2hu7KG4RNs5UDZ8Ayw7hjRhQCeVRseOjCchEK9cC3NyUOuPsArBwBL2Lo+bv18u89z6KY2CXZHD9T5zqvY69M8RommDarMc0A6YZvdGFX8hCFLxNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QrmMdJGbSo0DX9C19TsBy9G/f22vwIEwkBKwqv8HZFg=;
 b=hK2i0Vd7XXytBgLNa/VR9vzx4TFhoop0ud7Sd0/GdCIdeAm/mKHwKphWHzFo5ESrO2p4VEvi4owfMFeJPS0sva4v9Vd3OqpX+D0KhSfktdgjx9WzGHsLKoxceTVdnflLLHoy8eRmFO0r/r0abaNSzSRtoFkYydjsKtRIyWyZHAE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB16404.jpnprd01.prod.outlook.com
 (2603:1096:604:2be::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:23:30 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:23:30 +0000
Message-ID: <87zf8t4dtr.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 083/292] ASoC: codecs: max98390: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:23:30 +0000
X-ClientProxiedBy: TYCP286CA0006.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB16404:EE_
X-MS-Office365-Filtering-Correlation-Id: fa709381-4ed4-445c-ec19-08de20b88a5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QUw2BRGh0zD/lnLh0UNptVW2x/mk66KbRRH6pgMWT5looWAT2SI01LUf5Rjl?=
 =?us-ascii?Q?Pb6P9AVQlTohaFsD2o//MqgQnFoYhyAj30sKxfxRDUxnOgeNk6Uqth6rb3tl?=
 =?us-ascii?Q?ylEYRCqa61bA7vJerwMv8bgqaoHTh1j3qr6cX5p+WDKnTOKZeuX029kxSQ57?=
 =?us-ascii?Q?/Yzw3FBgjahnQprJ2ubPxvjG6NutxdWMN4VgRqc+oD6heY7pprLbyrU4Snz1?=
 =?us-ascii?Q?3YGFIteiU3s1QBELbwadVZkXCFpRCX+f7ffmYlpAgqxOYENkstnfH2ovA87t?=
 =?us-ascii?Q?0vt7O0lAW8tXLTBbWz/ZKj909hj7Ou6Hgfe37/+6lyF3XnASTiOOCqUZX8y6?=
 =?us-ascii?Q?L+AJhQyqXrTI0xACko5GKu5cD506Ik/tafeE5ZgzHJGV5PnYwxHIrMXKtRiP?=
 =?us-ascii?Q?NbxfSDBZqGVKtTW7Y/UIFnrAV6d6wsICHQYFzikaHXaWqB78vtMSf9VM6aTl?=
 =?us-ascii?Q?RvN67mikzgpV9t7lCeDdd58wYIrX9kEfTwgXRRPr8GDML0u5FZVG2TKfFoey?=
 =?us-ascii?Q?IV8BfVFHKMLml4zBxY02+mh5N6qM/14qR7B6jYZoqO8GxX5hPdgVG6fdL6Y0?=
 =?us-ascii?Q?9bWJ1GzAAGybaT/ZTMLdvAfd+FVvR9gIQAVPwF1VgJQuVWUU5MzgsEl0XZOB?=
 =?us-ascii?Q?XRw7d46fdRn/RcauDCgyhudRPj0Ot3exgTmhgiBn3/BeQMm/xv1ajPxg7wUQ?=
 =?us-ascii?Q?s3bbxtp6TaX6O3ynuX7K9GC/DY4uSJn7z2JcRGcY4Xntg886L5HqREY65ZLi?=
 =?us-ascii?Q?RiQZUZeyfwIoaPftKkFba/4U2miobZrC+Ri2+mvisQtNLw7ZGhKPyG2H9MOS?=
 =?us-ascii?Q?oE2t0NmrWZPZcsixh7ikX3bjY10AnImtOrw2guSXyz/FuWdteWytUoPHlpS8?=
 =?us-ascii?Q?fxu8OBU+sMhtg5bEo1xLDcCtyrkZg+Ad0OTPOHTvQ3Tn1k2ZQ+/zsZ1oXKlC?=
 =?us-ascii?Q?Tu5vodj4IH+L2oaR9LmK2MN4ef0zi62Yizlz1toB6+bkzhyU9cVSdIH6fuUA?=
 =?us-ascii?Q?zdhJwitgENXWa+TQ/dcjdRU1iFmQbzHYxWMhy5HTIyzGBf522rlKF6dL491I?=
 =?us-ascii?Q?qfjauGYp0i80CJHsFplVTe8JqnU9gF1eZlbXwGBhjtCOehOo000vtzD4c6Fu?=
 =?us-ascii?Q?1W3itD90922xbAIBZPXOUn4QWbldpmsTuWfxHPYdEobaxPBZpHzySZpVTl3G?=
 =?us-ascii?Q?32VWazFJ9dlFYKUaLLwffITv2MxdxYWelcFvSWo212IoTeIkJ3LAynM9YRMl?=
 =?us-ascii?Q?gDezwx4G0XFPkvnYbCG2VmBmciK/Jnjs6wZShz8mE1mL/fMQu0VIy+y+zAK0?=
 =?us-ascii?Q?tSwC0ZfFZVwKqoYmG9KEqmxhqnhGMNvgrGdHZ07Ywdo4RB0bQQ1EIxrRO2Mq?=
 =?us-ascii?Q?c3BUpUdmW/zR7dg2M7gbyiV60ge1fTZNUtiJZgTOk3nZl+6dt1Z01WlanYJq?=
 =?us-ascii?Q?jcBtyMGp73ryXRdLiEV/7XOYMpti1Qaw66V+5hcRPof7/CfVDJPZ9ZUCAp2C?=
 =?us-ascii?Q?NDiNCoDfrJ38zY20HI/bth6JKJQsAS2KbTxE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OGbTQ3pR1dvzV8awc+rRE7EJhAdzcvMrnQI6jg+2uB6ImkQAZc+fwMGXT54H?=
 =?us-ascii?Q?OtTodztLWLepSZlg2qOiZy/+/o1teYBb9hKpzfb/LjBgvuqqCnUpX+Mpf1CG?=
 =?us-ascii?Q?+8iJQBeuX77p2JpDsJKea/y04p0A7sI3SpyEES3oqSGWf3lOcme+BJD2XIRX?=
 =?us-ascii?Q?j+7Hrs3qEDI4bt644vmPGNufJI8NTFZVIHlr9qqepumoYsLadamvLDGBLIHx?=
 =?us-ascii?Q?QxWRWm+rYLBKQSOOUFtcPJyY/IQHcoZ8xNMFXow87CS53NRC3PkeJp7tl8R0?=
 =?us-ascii?Q?GlcMe8wg0ip8cGkOm85bI6kjvCYtciA5rBqrjDQxsy0q+EQ6EEzYHVyUYdp4?=
 =?us-ascii?Q?gT4zUvdbWaMNQQPEFJIYLABLA79HZCs4+4/YGpMfdijDnngaiQwxoBnma4ld?=
 =?us-ascii?Q?4TApy9LItVFuqBDrelmP8PtZvciP4Ca6gnjJxhHvFgSicBkEu+0AWwYcyYmL?=
 =?us-ascii?Q?+lryJCnY/5yIJuTfc/UXzrlMdnedcKWMeArybMwFRKhsJfTepcUKtLZaU1RL?=
 =?us-ascii?Q?Uurdlp1Ka/aUM2E/+/LDkO2ZOMcCTi1LIceemAG0uMQmaiY5eSYX8H2OVTxY?=
 =?us-ascii?Q?4fiEhxSMdityU5scXnZO7EYe1KWtjNhtkFwS+SC8CE8HCXElJST/Gu3m2INc?=
 =?us-ascii?Q?muVE+K34xCfTey9GydVdS48o2DDderuwD/df4swjMPzDRQ8a7cHfbMrOFX6q?=
 =?us-ascii?Q?/8skm/pYZf7xNOXMjFqFlP1dGjMaztFPoI/9RcKeCmTWXB1JXepfqFWEVNnA?=
 =?us-ascii?Q?QXP15wUwN0m7zZ1Be+iej0YRg10ZTivTsVadyAUgNEC6tjbAe1NZhNxDnxSw?=
 =?us-ascii?Q?zfZE4nSL5Xd5r6cNIbLX5YFJhDSBbkLYEv4fL7xnCJGixKU7Q6fR1aDhgTP4?=
 =?us-ascii?Q?+KDosV8kLpw+wDngGQI+VsPH6GBLGojThPbcIho3Q6Fm7OhSlOWwdF/NihRe?=
 =?us-ascii?Q?AZzpporUI+QSOYF2wKYYGkp0ma6Ca/EfOEtbwlfX/rxW5wQdLtFOFrqA0BKO?=
 =?us-ascii?Q?1lZYrAiEuROwyQb26MiVnsLTyMf6IqE19rQTYKEN+cusj3veVbVIyEjwbFtW?=
 =?us-ascii?Q?HV0sqhmPuy0JF+IRL+9hb0JQo8+1GVQH1j+cb2JZLUuSDeTbumSnJMoP4sBA?=
 =?us-ascii?Q?4GKC1P7wDjPom850VmY6kqxeNsbLeBSP7rGMN1ep7YmcMwRnXMpvOKdd+a/q?=
 =?us-ascii?Q?+ilyD26TwemX+YbVHKWFhPahdOB5gBjgJl/EQVbjKW6wTLogie5whW02t8as?=
 =?us-ascii?Q?JUHn+hUovazVtgAS7M5htxaTL/v/E6aRti7xC+1pxkjfFeuDuZfkhAlCZfTp?=
 =?us-ascii?Q?ByN5A+YvaszeLKbywvK76ZjzeIOkOEsjh9w3YYySILrO6+kZuXl90ZSpR3va?=
 =?us-ascii?Q?Tjceaw2dkCrpumSncQh8N4c7K8vrgn34o2NtcSAGAlyBWM7NIRJ9svpqY9ZU?=
 =?us-ascii?Q?UMh+0JDrvWHRDpArUh3J+iIYGPRNRqVdCOpw6hUf8ewpGRr9G9rsLWEfvs/1?=
 =?us-ascii?Q?oBOEaZBV+3nD93z2ZYrXKPaKvKU2XiVZhSB5jnTDg3pXnS+MN30UeyWgleep?=
 =?us-ascii?Q?TyIQeuJm2Ofkzq1h7K9TxoPuur928AAEqx6ODxNhFVTdo0Vi4SbAGgeEMdkh?=
 =?us-ascii?Q?i1fihWYbhof16Z/wZZBIUfE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa709381-4ed4-445c-ec19-08de20b88a5c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:23:30.1981
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FLIUAU9lcqH3e2IrY87ZGHnAY6O3R+QN4uyNNbouPpD9HWwgCAaT2DRwNOtLW6jLIFwm23icQWlpAVfGLWZWbu96SYAbptj28CnNAEz2jRjmqox2eeLQop/f8KJSmvTC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB16404

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
 sound/soc/codecs/max98390.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/max98390.c b/sound/soc/codecs/max98390.c
index fabc8e212370b..3dd4dd94bc371 100644
--- a/sound/soc/codecs/max98390.c
+++ b/sound/soc/codecs/max98390.c
@@ -628,7 +628,7 @@ static int max98390_dsm_calib_put(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct max98390_priv *max98390 = snd_soc_component_get_drvdata(component);
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	unsigned int rdc, rdc_cal_result, rdc_integer, rdc_factor, temp, val;
 
 	snd_soc_dapm_mutex_lock(dapm);
-- 
2.43.0

