Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011071.outbound.protection.outlook.com [52.101.125.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4825B1C84A6
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820888; cv=fail; b=Oce1Hr8nP90uljcM/7kCmUIkgA/j8IJTghRxbB+cHAiCohL+KngUqbpzfD81Esuut1OCuxmXsCDrmBiGaNcorPMZi9hv4ohpnGcs6A+AMmBfodE8i0LOgANKiKZZjmGn6aYDKUyxi6MxszHwkXmK0wfuxg3GPTDVqF+WvIuGt2A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820888; c=relaxed/simple;
	bh=XLTtdkyEqpwY0Z8GrdAeRagDy/7Az6dJPKLQWA6UEUU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=MTym1FHtdFuXjm4dfcPvz1JepcaWlF3Wcrch8362Kf9FOKB9MIr5sDu/FUJ4jirHoibzKt2qpoOW36QANHmrC50WeOaAnMyyrzDUtpsOKHrTlPycNBLWwsIHWCEBr02aJSGtpkmNeUNdZ9FkbDyuqKzZ0U33T7RxdS6T4TXva9Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=PLc3KPG6; arc=fail smtp.client-ip=52.101.125.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="PLc3KPG6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GXKkjUsbNfX1K5CM6VRjNWav5Heshxm9RJeYNsxsAKsrFXvLyAf16JkSshbfT/ZptLYc8sRV0xCn+ssVn3jXRG+uIzetJsjTwegZ/8ncjgQBkUCWOXbbY54IjqYeeZF5rcE1COJzWZyOlfAZLA7/RNerpHoBnKwTzuB2x505r/9RDWjcOL8wZWQIGnN2xqQuflbjm/8gxQ68BMR7QxHMZ4zyzVFZcQanPiTmzFff7DcCrnVHqv0CniIl7eaNluKSpt1J4CXfs+a042qqLPpqhakoYyhquMU/sEYvFd6BcUSLtlG9kxxVmFvhIuuySHnxCMfEGJ/RbK8/tdrOEpi61g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8QemGWOF08SeIFSzkbvnBY7T6Vz1BDfE+s2Q6Fmzb6U=;
 b=HYlMRpiZzcsMFqoNUItfg0gf0xalNevvOMpzoauZboGkGeRcnayz78QUP5M/E0C4VCWTJnMWXLXeU0SYWVl+kW3TiEqoZKAU3nlJbF8kAlY6nN+dq97STMszUgaIy7UYLD4csJTLgnVsMy5RDCRtazDyrQxnmvv7UYEHJTTTqOe4vaBdyv5TdED9sBmpGT/Si0ZC2x8b/gVfCqNoTyLoJ+TrwtGGylJbbNc3n4SCJSiDwPg1msrlHsP39QURdKaogIfP21V0ls3vkBgJHzxwwo7wNpeuNYZXqsYC/M1rLAjKflpvL05hfads4+I3ZZCM4CnaoblIBz7HWECr3DD+PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8QemGWOF08SeIFSzkbvnBY7T6Vz1BDfE+s2Q6Fmzb6U=;
 b=PLc3KPG6YzrVVdDWc5T695WB4U/ZK1gTTXygTKnA8bSaUJT36OaL1CKh3pPwKJDNbeJCxfiUM3KPRAlZ495v5jiXotU3hxEIO2/6pSaa3VANCep/DNLTMLdvyt8fHxji8r5UJCnMAjthqbDFJrklah2tc6837tCYlwguP8ChXJQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB12798.jpnprd01.prod.outlook.com
 (2603:1096:405:1e9::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:28:02 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:28:02 +0000
Message-ID: <87a50t1kh9.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 151/292] ASoC: codecs: wm5102: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:28:02 +0000
X-ClientProxiedBy: TYCPR01CA0199.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB12798:EE_
X-MS-Office365-Filtering-Correlation-Id: 03437df7-f023-49c1-955e-08de20b92cbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?myuUf0+2KZoNx432OubQ6NIeZr9k/a5oz2d+xo7/s0MGNhE5ELFXq4yqT5s2?=
 =?us-ascii?Q?2hw0L0mVa/D5E48S0c+EtRRubGhBnSFqQPqp4ouvvlXHZ1DTavYJ4Ew/Z5jS?=
 =?us-ascii?Q?1e23bBGnZX/Sf2yQWSMGvoedsX8iPdmTGusqf7cDy5X5ADWeJzoGq3usZft6?=
 =?us-ascii?Q?fw2ZtJxl7Xy4OWiaQ3EO1wAxCoHyIodXfWAg/QQTjlt3a82y3C9fyNueYL9Y?=
 =?us-ascii?Q?UqxFX+PDnQagojiw5y+Y+JnoBUbc2+Kgz4cO6+9LVh7jatDQPdBX79x7qAWr?=
 =?us-ascii?Q?AoaEDfwCrvG+ct9MskcI8JQlJ6rkiHxnsKyadAfPqDBabvK1PuoUctJpZ3/U?=
 =?us-ascii?Q?shnaNXguulCLkaqtcd/HcGd1EFBOpytjSDjtU31i0MuQo4RIAW+BWDIIbbIh?=
 =?us-ascii?Q?pNuapMrtIZ2OgKvhBMGj2LobC1CQIGyPae3gnku+VA4toiKuhhutVaF0CS7Q?=
 =?us-ascii?Q?xyPkKb2otEGeXQG+0GezUreR/Yq7SXUOlbAlyl0XTmnWRvxXr0zluevihqcV?=
 =?us-ascii?Q?7qpg56vvY8MsA97yHLFuOc+5cEbb63P4gpvODJq04QAcscSVybzuNz3lCkNc?=
 =?us-ascii?Q?29CMpWNwW+EVJ81kEXIFmRJiLCFoiGp2Fft2fz3Za/ZVEYVyJatPk0Lu8dcu?=
 =?us-ascii?Q?M/c8V2hQxrnd3SbOU4VLEJbBHIHf65ImG6g/qkwT1dcI72vbKT/BVA40jMHD?=
 =?us-ascii?Q?GYLTtjOtjz5grbnLMSg0mOmzvqf9CIBszIV+wikwb+vt8BwobXVp5rK8heTl?=
 =?us-ascii?Q?Vx0+J/qYJ1VslUatNFBeF6kRFnAAojzPhXfwzRb8RXKxvNy2gceFAgMKuA2+?=
 =?us-ascii?Q?hkZze6rh7Noh46AeUVHrsMIv7GBngoe1HKz5LgvZIInawVfPuoi6vH8xGpDX?=
 =?us-ascii?Q?bLgGxJAfV+HRotJHxptfgjA/owoF08c/oXpwZB6wkxED/A0BuxChWVAhJs8S?=
 =?us-ascii?Q?YCRUiIzXzxtcIbvB7rOS11SRtaKFYJ5X2KdvxfK2DilVyY4igiytvl2maWGc?=
 =?us-ascii?Q?doncV+q67MGi7vZ+/kU5m0I6dgiLvOMDd/+XYpdcoryJ00ynP4xCH96WSXy6?=
 =?us-ascii?Q?TwZaDIO9C9WHb7WqECkNOkXQtBvQEuvKIxGlXUYYcDEIVLMshqez5L4Zhjnv?=
 =?us-ascii?Q?iWAdW5gm8DqBDknQwMaH0OPWDWYGp0SKVnjIr0ECKD0vOfgSlwqPw6P1Hxeu?=
 =?us-ascii?Q?qbGGihSj/bW9RUn6pREiOCvZSnso7DZtKOsdC493Iaq3pujzOYX+qhTDr6Je?=
 =?us-ascii?Q?ndvxPjFzSzOi3o7V5oVJplb8a2lbCsQgvpMTk9uxOQPeoIHbvrfVx4ot/Tog?=
 =?us-ascii?Q?popfOKS1Zj/twJxGtOBT6gS1IGh6+K/nwcFubRQsNXaYBWEde54w1i+YtxiA?=
 =?us-ascii?Q?BaGD+7fzhRYO1ij+SKKkT2ptjk9U2xJ6pivkzG1uICNmnitRMJyXvxIMvKJ/?=
 =?us-ascii?Q?1xfvoDO8e6Kw+gThW4S3zO7mnLL6O3NaWVUL1NOLw3CP9y+Cz5D3ZB5rPpk1?=
 =?us-ascii?Q?jF2OCnez/wXNJGznhLGQtphasJkIauTayLor?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YKRPRi+d06/EWKwQCk9oal8Bpi65P84f/dPh3KRUbCcESHgDeHud3S0gWyoP?=
 =?us-ascii?Q?BNcQdBpobg1TasO0W5zFxCrX2MsP9J3TrPgxgpAHVPxniv6zg1pioWme62ay?=
 =?us-ascii?Q?ah5Br07hu8GR6UMU/2aAdkcdoSs2MiftBisLot+zbo00e1HdOMoQTp9xYFrz?=
 =?us-ascii?Q?p+/MtNrUa4avmVSCoAtgLETGo8eKMsCn6Nv5A4B1d+VKfm+o6z+fhPbbhAuJ?=
 =?us-ascii?Q?8GlECip2t5TiDM0W3tyTHKHJTKMsc8Zj8d6thY8LU5l4MABsECk+BrEHyhBJ?=
 =?us-ascii?Q?iX3kLagy32loFALY/wJzIThah3vnC3jb2OIKqfjdHZniTWsNrSRDIWxmXeZd?=
 =?us-ascii?Q?Z15oIEuSjHhv3JiLcPr4o4d4b2f4s3xGHDFwP0pbMFV5mda7bH24xWjNx0fC?=
 =?us-ascii?Q?CnarggXgEDwAdgdGh1+Ddr468L5jE8g5KYXzmmS832u5RRyJREfNz2yHKptm?=
 =?us-ascii?Q?5SSymOg2kxl7ORvggs0zy0qDTy4zuhZkjXnST/HYNAdefelu9XwxHMeRqzYs?=
 =?us-ascii?Q?m8qO2kh2pmbFb4qO3mZDNdYraSN/a7KlT31menmoY22iACH/TwKYX3TAMSUk?=
 =?us-ascii?Q?cd1McQzEaNYoEMvx4y0+s0JCO/YD+V0MRpEbmhWv1xDe7RJM54vLQ3vDhygG?=
 =?us-ascii?Q?ZzywPGOYvNXVrRRUtR+cOEWh1X71KDoIFT29kJKhmdhZ4dH7rKomyjYCKXeV?=
 =?us-ascii?Q?n9UUeehVLrQRBAfoGwcFnZCHwz8oe28tZYC8dUqpCTwVWMrwivs8NjFo9+jF?=
 =?us-ascii?Q?ro2d8dzAjT79u3peMeWLL6CxUWjbpgJjls/1GnBvoNS+qbRydwH/qsn24cnG?=
 =?us-ascii?Q?HlYHpD9MHMguJmRyQCt8inNc0pjrAWjlzpENu8Jm4gaoRAqrkdKaiZyVZj1h?=
 =?us-ascii?Q?DdRQ+ABtMsRsI1hV8mQVzmp5aBOYIJN3ID8r9qzIgJNx5m/OU2W6lz9WgJmV?=
 =?us-ascii?Q?1KqcJw5nFqrLg/RPlfuctY8pvmZBSLsiN12Hd2lZcKMmyjOjIfUyt6bzCHBH?=
 =?us-ascii?Q?S9iUxBUPWoJwtDOopJQKcMcOIl5AsdHDzsstor1J3Q17sT+sdQKUcflSFSYi?=
 =?us-ascii?Q?Mi8ONYlicPYPa9BT+nYRCDEHqoLSxoNUZ8o3kQE71/pBTkDrkNGHiZNsYRkX?=
 =?us-ascii?Q?A4tZFqxxetfXCF+huMLI2ymM8nQRLwDNQZg4MvZ4qGdVcTpUm4haSG23+Jib?=
 =?us-ascii?Q?PfpztpjPIHI3Hdb/NKCCDW8sOf5a9UP1d/mhhoiWHtyByDACkft96t+ksxWQ?=
 =?us-ascii?Q?Vf2k9LLoPqcuRv6mu40jGxT0okqnKM2dlfbjaNxXzCLkIxJd+9tlPfAdCpV9?=
 =?us-ascii?Q?yRCqYFxzaOE5WkjgVMjUYKZa6R4UnrS+rcqi3lxCvQDp4GeFB/aR+srQyP1U?=
 =?us-ascii?Q?42MOsbcZSyo3+lKfBg5XLVNg8oH8jjP8ni/jKI8w1E7WwSPOPbrPgN5fZi6A?=
 =?us-ascii?Q?69XLIovdEHBn7CJtbSEJR9BcHLiNSLG0rfLIoRXsYRAwYUBZWRRaw6hZ38L1?=
 =?us-ascii?Q?1lb4frbgWTzhZ0wEgT5i1KsjBlUAlxnqcylpKqGOThgjFoeR4B1wbff4Y7sE?=
 =?us-ascii?Q?rLmB/avPUMh9TO/1kKuVPPlYXbWEJmvZhpeVilMPOmcNOkSbAA5t4zrDFGo5?=
 =?us-ascii?Q?tw66HndiC5E9RwUTpLxM4Po=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03437df7-f023-49c1-955e-08de20b92cbf
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:28:02.5839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P+/Lh6AY+Mp4wCnhTvvDYyPSueUY1YqEwDOnt+M/oVoxmFSK1t58PxWZKBPpLAG7o5Ftp9K92SVhpOKP7zItERV0HIXNFnYix8GBFK9mCYRBWuZxh10KeoiJUlTB31b4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB12798

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
 sound/soc/codecs/wm5102.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm5102.c b/sound/soc/codecs/wm5102.c
index 4f5b4b85c2fe9..b4d4137c05b4b 100644
--- a/sound/soc/codecs/wm5102.c
+++ b/sound/soc/codecs/wm5102.c
@@ -1949,7 +1949,7 @@ static irqreturn_t wm5102_adsp2_irq(int irq, void *data)
 
 static int wm5102_component_probe(struct snd_soc_component *component)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct wm5102_priv *priv = snd_soc_component_get_drvdata(component);
 	struct arizona *arizona = priv->core.arizona;
 	int ret;
@@ -1971,7 +1971,7 @@ static int wm5102_component_probe(struct snd_soc_component *component)
 
 	arizona_init_gpio(component);
 
-	snd_soc_component_disable_pin(component, "HAPTICS");
+	snd_soc_dapm_disable_pin(dapm, "HAPTICS");
 
 	priv->core.arizona->dapm = dapm;
 
-- 
2.43.0

