Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010050.outbound.protection.outlook.com [52.101.228.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DF01C84A6
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820882; cv=fail; b=fYp4twEt5Lt+3c6ABwtdmavgxSziXdWUtt2RmMiLibN+MBQ8LbzSoxGulpNBezBagHNFQq+2r/hSM2S5aCzCpptTQrUsuUm1gqGajJk/goATR7f5Vgqk2EzrIvegSdk5sUlj8AgSw0B1/IzA8buMpM0fiEEajVWsFrcKy2UASkI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820882; c=relaxed/simple;
	bh=SpSQurqdqXWMyD67n90xlMT/yV0b5RCMyBy68AzimNE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=rhMmREgKBNvL1cbxwrxEleUtWsYfMvFJoG7CDXrSI1P/4QJUwDiEUItfv6gjp3au5qU26zAx622KI5RTb1oGe00E8HrnRUUieJmINaPvi/URXCFpeiCkM2EfF9Nv4ZztSVLxSNJQaTydX5lFZNGml0gW2YYPOM/IINOqNzjGe0Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=nahgliJx; arc=fail smtp.client-ip=52.101.228.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="nahgliJx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kV9/9T3itdX0jtVlHnWuHgFl+8mZOY4Dp1JyhFqwJi7zt9G1uSCCC30NQJgn1RDU0rSuzR/MmVbxkZELiGmJF/MHZ2ge8VwuoBAl4Kz4lNJ1q336kqS/GBKBhvWU7CYv2U/xIFDLR0ZawwC2cM4puvF7sUiSD9Y9gIyyC9fFZ2kXfAASnKgDazvFq9W3jd4OK0JwrRbmOYy+oIZeqOOBEIX13gWQ9BDTS7dBIOiBuhO3g4UwKSovl7onzfpwoYjoq/M0B+cOBtn/hP4nrx+y0sCVsfVfHL46gB2MajZTV12lWVAcVs9UzlFtIPiTLBmIf/uxgkkYUXgrFk3wJHwXZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TvLUnbwM34OJsJbnBDeknb9R+OZvkHpSiyqCyqdlE7U=;
 b=bOYYQ0FPCqhXz+meITURhnYRvKtv785yqkoAI+NpZqTDNGrJkM98pOb6tozCNdra8ssp7uAeNt/jMp8ox/lkjLYX4j0YnlysH/dG7lY6H9kP/2NCSzHU6tub2qyH492dYIspd2PEiZAsrhLHX3pI9H70SRtudH2+LJTGEZq5tkHB0+PB1YdN9IMSGO32vyQZn8EvE9RjakJGtRpBRu6RBvx57/sRXGUJQ6VLvYmWz+EqyDNZ2ISsjwsRBEmrdGdseAJBUK4M2pGrnJXE1ioSfbtR3YwIfbNNpiS1+iQtxAY0VSnsmmIZjcKWepWHzhyA1Vh3DSIL4HNOEjoF5YDgJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TvLUnbwM34OJsJbnBDeknb9R+OZvkHpSiyqCyqdlE7U=;
 b=nahgliJxLE9e8cueyFsU/Um4FsLusfzLIbm9U7IUQnKNCgZbK0cJJE7BDVxd847FRGuG2RROcOGLMfwGysGhAfu+USSmYcj+MPZ9pt29kvmY4eMOMmGOuYEV3YpJVrWk5M/fpHDbYEDhMAhhDUjMd4CPxQZePK57p5bX1P7WknU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB12798.jpnprd01.prod.outlook.com
 (2603:1096:405:1e9::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:27:58 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:27:58 +0000
Message-ID: <87bjl91khd.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 150/292] ASoC: codecs: wm5100: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:27:58 +0000
X-ClientProxiedBy: TYCP286CA0208.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB12798:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f832712-23f7-41ee-835d-08de20b92a73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iBq005Rgee5EnMliktAdymnBfxTvdgDqFHQ1yyqNTFGt5qfU5ODP/PHfjk4w?=
 =?us-ascii?Q?xDOI4tR+1GUsr+bCyQGAoizlTFHSSZmUGt+iDxdEKZT+8RcnXHN+QfApA3u/?=
 =?us-ascii?Q?f8nifUeFHzny0ZSDf0U9gdlqqCK/iLztiDZ90/AZUl9OObjZTUGwk/xO2WBy?=
 =?us-ascii?Q?hQ3WdnceuT976AVtfzrin3Fue+fGvT7P73jDkmlCyd8HdzhGmnatXQamU8/u?=
 =?us-ascii?Q?9AU44km17A4oGODZbpi9shC0r8v9Oxl4HkHbOu0qq/0RlflzSwD6BcE8UYd5?=
 =?us-ascii?Q?0quC5VnG0gjTqElqhnfRVIEy+G8/1pWNX0bEf4r1S3/t0MUFo5noAWnDKqv9?=
 =?us-ascii?Q?gU2lIygSTzhICdxwrC8+PTVyTp4JSs1Zv7hMGZkKnUSsOk4I82nwaTARg8DU?=
 =?us-ascii?Q?qyQTy5ptGGnwjiw3Ortbi/SOy7Fz6ZvqHVFKzNaq8YApJV/KG7LwgNd8fxE8?=
 =?us-ascii?Q?n7CZfKjPe/zotpYsnK/7Qm2DwtFLgoAcS8RVf+j4qLMgsa8LfNsTESMtCjWi?=
 =?us-ascii?Q?gFQYcIdHK2Sq+J0+Mgfvllw3ylPverjcWSCAunpIjWShxHwuAN7smbSrjiHm?=
 =?us-ascii?Q?65o0fkxug1W+m3nuFJQ6+iaQjBf0SW0lU8zlaFM/MRvtr5EnEOG3Y3fJkvkl?=
 =?us-ascii?Q?EOl7k72FxwfmD6mUMeu049hxHOGl8wERKi09ZlC/iyK4hZsLdJg4kATsG8BD?=
 =?us-ascii?Q?8NDE3JDdcWYr0cj31YRduehv8QKByZmMbMzL4XX3jcX3HEDg0q/OhyaSszrC?=
 =?us-ascii?Q?D9ipR63HLsshbfOPC8ae4L2ZiqYZdprKuBAeiE7dmAfE35R26ztTKT5qMOcm?=
 =?us-ascii?Q?DPwzKErzeVb0XCdl275vdD/qwcCoMOycNP6HYTmnrrSWlxsfQyQT+hajRbnR?=
 =?us-ascii?Q?PUpIO+Fg3zI2sGVxFLq0BV37eMuaLrdIM69fNm4Pk1FQEUm0QBXAShLEJJTk?=
 =?us-ascii?Q?EpKT0n69WwsKlpAUczJ8o4ZQOlxVCBG/IBVhUweShGHBAMc0tYRPRVvXdgKL?=
 =?us-ascii?Q?7CIX3G2yihoibJz4IUaGLMTPlk4Zlj4s/fjEYUB3hywZhy75164N/Z/2j+W5?=
 =?us-ascii?Q?R0Xg7wMUdh/c1LCoXTCDxjMpZl1ZK86U2dD9HaKmFeLjejXV/O5cez9W/sRV?=
 =?us-ascii?Q?JEEFe4EwT5qdoxl9vQPxVsa6JzI8Z2gXu9e+nexiNsq+FXf9KumwiDzzOmN4?=
 =?us-ascii?Q?PKtGsZEl75v/3ur7Vlg9gApHNI2k1OZz+P+wJX4/mvAeIkahnypkadjDKHKG?=
 =?us-ascii?Q?rm3UhMwyDBCfQR4ZfKAfyyMMCAEHaZkJRxgid4i3DimmUWRCR9vWokph6xUq?=
 =?us-ascii?Q?B2ZB0ls2zquVOjc08sZGKMpAZLhJIsXm4ZzW0aT0PewhI3QEq8nZep9KFHuA?=
 =?us-ascii?Q?OoNQjCc98vE1jjfu23gNN5SjRGstwPPTLPQMCkg0zhG4WS2tyKVGwKN5PnPF?=
 =?us-ascii?Q?8kqBIqVnbEHdcjFMjJfkWDzI8Abgue45z8teljC6hj+6eRzFBUK1rxMmnvhJ?=
 =?us-ascii?Q?CL5d7qsz7pRj0ok6Gimc/FV27KyUpp5N9IVE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BrDiCLTV3OCF/K1x6dzs4bANZ3Xxn9/X65UHNAX9WQ70Hcd2kKZhJLpmWZct?=
 =?us-ascii?Q?iogQx0mCtk8utsvxEVGsBiGe2Hy6qieZhIGVaJJzINfH5Jna4gVIDYFT/WH1?=
 =?us-ascii?Q?uz4QWGGzrguHD0GNfYu8ZovW0Bxws+JvNVG91akqpH2dyNHi1K+BG5bxD3RE?=
 =?us-ascii?Q?1v92OXl4EDLOGFT5Fjv7ca7jKEp1cUa5qJ1z+Gi6XFkyUaNJKWYEVW0wxm4H?=
 =?us-ascii?Q?dNR8xTmTtlPVoV1rM1tjC6yW1/R+zSI2fpc0/OZdaQYqCkA6ReNvRZRwGxgS?=
 =?us-ascii?Q?qhqVD3kS1XypivOw6Qntk2DsLvsFj4TNwMRaJ3Ipj3Uay5JC9vrhiHigZUEQ?=
 =?us-ascii?Q?rGAMNxMmifi/vIv7AuV/Nlar2mqNLMtY8Kq/C7qPtPZoF/8VzjW4FP4+gin/?=
 =?us-ascii?Q?Uolv9bI74KdBzuYDsJUHsZ1Rc6OTDcSwI0ExTbvQ0FS4qBWESKe+pT1Czqag?=
 =?us-ascii?Q?cOvturWjv/J9iWvUlm75rBQmzlucwx+AuhwhoVck0O3GMEvrNKISdYqqs70K?=
 =?us-ascii?Q?6gJBBk9kXkTyDwy7xKz2KW7xNSBG4YOIv1xw+5n0nVWtVYq5EFSDaYLB1hpT?=
 =?us-ascii?Q?iPnZjpfJe5RuatKRaBsfGSg1KRaoM04FDwYrHfjrWVYNKolrOL/dknr+DaXu?=
 =?us-ascii?Q?0/hVnLLVmWSQDFoTBYnN31vhVB+DCPx/jpbKKufLQD0HsJvITJkWJh0M+kAz?=
 =?us-ascii?Q?KneltfbeXOgTr2hoLJKav7omKzPozksVezgn6Bfdtj+4odibHUCn41y1IAF4?=
 =?us-ascii?Q?9nBOKOVrGrLFmuLrpxuNcBZxReNpgGY8IQquPxgBwBWg45Qde6sgLYiaz6HL?=
 =?us-ascii?Q?o6E8cyh8t70XJXMZHheSFBB3ma+VMNSeRimXWPgOY6F6/VQmMkk3uLeE1aSY?=
 =?us-ascii?Q?vsPV1GSIxx0eKkZ8dALyEXRnQg1Q3JbCGn/lCRkE9FKHvjTEWNb1OI1ad0te?=
 =?us-ascii?Q?Ml/hw0KdoVTnUZUoYVlMSMTe26djvHJL+Df+4wLofp1eutiHMcG6R9taWfZr?=
 =?us-ascii?Q?nbFfNIpDUL70o6AoLmfC/D1HKFXiyM08Bw1kMoMgiuEnorjm94DIvod8cIOw?=
 =?us-ascii?Q?k3BQkzayGXtrB7rvQLm7UVRYKYprL0XC9bembqqJtOEpVABmR59ALRBeGGWu?=
 =?us-ascii?Q?ZaPT3S9nThUsaotpUf77AsD5DpslWBkUyuxmzIt0QeL+w3fxyCJPMU7AJaqG?=
 =?us-ascii?Q?9PIRWCiT8DvlTH0VqRplu1hqAKzQbedE5Jgdy/PD/MUwctWAdKQ/Y6iCG4Zt?=
 =?us-ascii?Q?BUvdnWAuecYJNJbQfyVo9/71u1NBhFiVCPnZ0ZKZ8o8CY9zw15YmTUH4kPAR?=
 =?us-ascii?Q?UwogayK7EByX/fWZDWFLfMnkymLQX0N6Atd8+D7l/QGMBKHZbnvTcrTPYQzv?=
 =?us-ascii?Q?BKCukSgl4y67hvDkezf0MkZ2k/a8yMnrk4F+8OszWnVZsRqblQV7Tx++gGyK?=
 =?us-ascii?Q?+w5PWtYLnVUN+2AnfulJYxiDPU+wY3WSE4yJExe34PEg6adw+pcCQ8NjGrQ9?=
 =?us-ascii?Q?4sjyPollIIXXzjmTJT1hVIC5hTfWTEdTJB2ajG82wGzmcPql3WqtMcHhZLfI?=
 =?us-ascii?Q?s8I5fmgJ0zslPqiydGliMJZ0yzkQ4d8eexRDALpubZIeVK8WbZ1Ht9ni1o+7?=
 =?us-ascii?Q?PA8JUZhlvSB4gx74tNQB2K0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f832712-23f7-41ee-835d-08de20b92a73
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:27:58.8092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S4HSMZrYmjuLjK9lrnx9D//fRbS3sBzrpZSp6tE8ofgcZ6LzFwFQYvQ3hbAfeOkrwdIR72jvCaw3MSnJZvF2dQwJLT0E06SodJ+61GFGUtYmEBlzwEE4fkn1VENSdaVl
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
 sound/soc/codecs/wm5100.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm5100.c b/sound/soc/codecs/wm5100.c
index 2d0a20f2fd8c2..96fd098a9d362 100644
--- a/sound/soc/codecs/wm5100.c
+++ b/sound/soc/codecs/wm5100.c
@@ -2101,7 +2101,7 @@ static void wm5100_micd_irq(struct wm5100_priv *wm5100)
 int wm5100_detect(struct snd_soc_component *component, struct snd_soc_jack *jack)
 {
 	struct wm5100_priv *wm5100 = snd_soc_component_get_drvdata(component);
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	if (jack) {
 		wm5100->jack = jack;
@@ -2329,7 +2329,7 @@ static void wm5100_free_gpio(struct i2c_client *i2c)
 
 static int wm5100_probe(struct snd_soc_component *component)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct i2c_client *i2c = to_i2c_client(component->dev);
 	struct wm5100_priv *wm5100 = snd_soc_component_get_drvdata(component);
 	int ret, i;
-- 
2.43.0

