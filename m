Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010069.outbound.protection.outlook.com [52.101.229.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC8C23D7E6
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821434; cv=fail; b=OfYeuH5xPNYmfm7/Q/T1o8TfPoBtOSVAcz3Sih5TX2aKkZQ1T+8LXQuy8WRrhzdgweOehAVSddEqO4MeHIpjpBd8wrHmQM7ByZvBrUqWdX83OA0u15bcjPPXzVhwo4gEPQNlOahcz11Z4RRTGuL3obFAVRInqN8c7LBic3OHYKc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821434; c=relaxed/simple;
	bh=FWczoYWMykHF5CiHppH5qP4I7wDnrgEvL8XTyy+7sQU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=JS+IerRyb2xViLqG8kxSYQPIIeqeUPgwBzMmNhLoW/BvpRwqv5bW8zRGAKSy+u+X3PJpuGDRySF9dKg+yLlwJiXlts0VJKRh+Bz7RRu7qPc/TP0a1edJzIzgdBW/2p0XqvNkJGVCo/k915pMxafoB24h+oUlPyN7Lvm0N9EqGlM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=QrixiEBa; arc=fail smtp.client-ip=52.101.229.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="QrixiEBa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i+Te032eOTnPK4xImBLADIsKoJMwROUG5tFGcbE31JuUbQFIry/6ClW0m33pKvY2eNUpUbxhEXSsJtB85tfzb6Vk2Q/brx6X9S5mjKkK0SU5r9GMJ8vxTNf/fsmtGKfLJpCLRytboPmkf6sA6GljIfV0sK23IzQIMrqcPBl9Vcn6ugF5c8qm9vQsxALjn7NMnrTN7lmo6+FJIAoCYKBg4B32uERqrWOpGhwpjgeNEkw2N5e2mN3eiN+NIlzN57uQl+iCZST5XXONe85q2BPaAKtCvtHc/lC1xVGHBoj0Y6QANbC789SyikFUAKg9TH+elPW0b8YSR6SKnIgJa4/gdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YmT1uJI/E751SvJ+YTuaG5h/8ooXYEZbkRgPVptOKco=;
 b=ydiScxunYjHqqw3fi/kY9PNMCtjFEwlY4nlMI/HHEqlnBgmsdM8UUvYJZ30aGJZOswSqPqhJ7GsO5uf0xjxvZ8aDyz2rmczdJ98I+oTJSMu9URoGkX0o9NaxxHTAMJl2VOxQ1TLxLdmsJrR3LUMAAfRqBlTkyfHnbffewWKXK4rdNjY8c1rRx0Z7o3kUQYJNN/xAnLPvM/0j32d7ParxcCvFPP+MgpZFi3j8DxHBvgx7fBdgWdJtZ8zZds/+tfNmmnPZBZMHBRKZIqphHc9GoNadVfNPImy7eXLCGBtQ1rh3fJABR3TK+sDYAKd+3Wsu0jyWQjft8qNjZ4OMlo1etg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YmT1uJI/E751SvJ+YTuaG5h/8ooXYEZbkRgPVptOKco=;
 b=QrixiEBajZTTavi24YhuqzFJEoolIsxc7TITrO2rE67mmqvHfL1Zb6lAUSHpxt8OBXg4dPTulxegZoj2v9bj3T1euf21s+P0XUcwUANykmQ5O3mnIdUty9zY6Y7nPMDVoyauQk58wh8IBUvcL6+KZvRJxCr4kgRYN9hhAaiKZAY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB15789.jpnprd01.prod.outlook.com
 (2603:1096:405:2c6::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:37:10 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:37:10 +0000
Message-ID: <87seels8ui.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 288/292] ASoC: ti: omap-abe-twl6040: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:37:10 +0000
X-ClientProxiedBy: TYCP286CA0093.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB15789:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a90dca6-a593-4823-b2fa-08de20ba7338
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oYW58TDfba/bs78MRfUPfz4Y0vkwrnk9AMBPeJ5PVEqDIQP7WT52/4acVIMf?=
 =?us-ascii?Q?KHptGLRBScJgsVGi9rGB/U6j5nlCCqVdUOGNs29RezMki3y/rVR6maEoxcAs?=
 =?us-ascii?Q?E2d4MkyoOB8o7FY6rtaUGCe9JWEkBpl/NwXeVlXX1bWVaSGa6eJRd0evGCjw?=
 =?us-ascii?Q?8cJTqWy/wwppy4W7vJB10o+J2M3m4tsWYW0vsZYxrwdzPEqbLlHh1GmURGJO?=
 =?us-ascii?Q?XttZ0+VQ1CtdsGqegmwC4gH0oD86Qs3WYEDghCdpF5rxXvQuKP4H8T1AbWMN?=
 =?us-ascii?Q?IVLx3WMzgMtGuh2MOhNHgVSvRgXsiYI8c0xGMXOUwCaR+bPdGwaUUQujZwBb?=
 =?us-ascii?Q?pU5JjkylkITKAKuLKKzUGAAr7XvzYD0zhN6fx14jzf4fLSzKPj/HufKr9PA6?=
 =?us-ascii?Q?AtyjyxlyDMj5U8579q28zRoMOtwxXxQhaYb0moyi//A6YbvocVl1pfzFPAjz?=
 =?us-ascii?Q?hNGH3/Mz6I8ZhStq2AoZf+Z7uajD9Dsfe5LhiFLJKa8q0GnIYVznPYunnjdu?=
 =?us-ascii?Q?h/1b6lYKX7nKXDDIUfCCVVWrFnruoP9DtpNd2b7bTjKbpldrYdCtEL8E4Kx4?=
 =?us-ascii?Q?/3dPl1YHKP/IJ78pvqX/A1a7L4nWY09yrWCJ9X9+MIf6dSmFA53mV0ENY8vt?=
 =?us-ascii?Q?8NrTyTOrHloQTI8CS9xPrgesYqlOeVnrKuA4K6TJKJ8EuW9/Bq++8qc8jKdh?=
 =?us-ascii?Q?LzP7hP+LwjGPGC9humGkm7/K3JLBwxZa93z9fEXbiCwpAviAfdomGBEMN3m6?=
 =?us-ascii?Q?xYLIJcWkUBzL3mYTsctQRkV7IsZQLlBzhOjPlY1gSPt3NF3cyLxt6tsnIJi6?=
 =?us-ascii?Q?OXjrTp5sdgfgUgCinq06KfZzzRpu9LcoLF3dHahGBFE3tCwBFeTNJDofZ+cz?=
 =?us-ascii?Q?Ho9dLYq1dVMj6BxwpXdmUgDMXdTQ4Dn3uJ82tj884tR7WVAigjTKH/LOa7X3?=
 =?us-ascii?Q?grCeGFxzHwBhUOBTbQgjEiQSswbfUNB/iMhrGsQrAwbGx5TqIDx37ek7hJff?=
 =?us-ascii?Q?L/rVUbrYoDXW5I6LCglhUYweVmXJLErzZNsi2NG0/WmWtWqWi+jTKQU3Vyps?=
 =?us-ascii?Q?aRY20Ht1b/DKC4R4DQYRlIQWK7SPrkTVX07cC8VvB9EmQZxcZRydOJP68S8k?=
 =?us-ascii?Q?czu92IbQ+G7LT+qwvzUFU6EuoamzCJJDun4D7tq7Cd1CZ7SFNV/wqZ4rnzlO?=
 =?us-ascii?Q?fGphyUH3U8vNYboyEs45kniievSqpEVv0kHPgGTqOV1h3CPxtozBECGEYVA1?=
 =?us-ascii?Q?d5aQRnVYxS4NER2bopdECnSRr3CKCET8JBdYPiudBLkD1X9xTI2xwwPiKSXA?=
 =?us-ascii?Q?4kvHqnw9mW6zEXjmfibZYw16HL9GW/HP1RZ5gbdxyPxZVy+UvxXuEXVGtDl2?=
 =?us-ascii?Q?DShaAu3Y98Ys/IujFup/E+ZFmtSnujCykd5YuDtPLzUlQIbXyGmmMZfCNbe0?=
 =?us-ascii?Q?PC7J2wVpGxkpSv22QEbnr8Wm/K82oIPvzfeU353JqtdXBUuEv0wBQ9PMAMZ0?=
 =?us-ascii?Q?mvqIAqv2TjG1zqEQ3U57se7+EOu4Igl0viEM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xjnmNgQgB1p8H1K49FjaZRWePHErAPf3HvCM9SG89U8hPo2/v8LQsRliuW79?=
 =?us-ascii?Q?0cnlhEpKmSdchRp01OOHkFa4zn39D8Ox18T/zxwiOyV3eU05rvpS1EFpoMPI?=
 =?us-ascii?Q?qUVBtPFV8th+AFzc8Ln4HWnvKTObCCuaYE17zP+iAN7HVXbNdIS4ksG8VCKc?=
 =?us-ascii?Q?/gmOhmPLvP6TgaYB9WJGGPoBYDzuzPlOj6jVfVOSy68JXNekjVUXayhfoRdK?=
 =?us-ascii?Q?exXvad0nIBJCIz2HMbZ6FqBCifWYdvhd6x3fc8IqkhK3K0Kc0goVCO27FA+4?=
 =?us-ascii?Q?bECmYbSYakKnZ0teCfo+7prCP+Q6o/q53u7xgsMIqQiIOAEWUrYOIJ1loPFn?=
 =?us-ascii?Q?rVHb68YwXXpWu9af3wE1cF2Dx8eIcGH4rUKqDAYjf0pjXoXyMkqweRIP++uu?=
 =?us-ascii?Q?bygjQYvoimGTXmzNA1P/0AFDr8FEbz6WrlSX8lfxWJv9k/xb96uWe7H8fu2+?=
 =?us-ascii?Q?4WfcJ/0cXIktpApQlWnfW5oSIonLvG41YljCwebmSiTyypy7J3WlKKeH5gSc?=
 =?us-ascii?Q?GMWuRPRLPVEycM9RB2ebu+n5OLbq9OrUD2MzNxosyeb00KsDijLwz+PKZh4l?=
 =?us-ascii?Q?QkFK9tHrU7pXf6pkxBH9x7X4igcFgvNfzhhCd4fy6hXts+1YCrznWN2A6LZX?=
 =?us-ascii?Q?lCtYTaUvpfOvHD6HqRJ9Zh0ZtrtnkSPkudBEnSN8O6UcCvuSBBZgoNQJB3VI?=
 =?us-ascii?Q?s0nOMqHcKF0GGYXwAP9UrQM5kas5MyrV83WNRgi2UrFZNutXK6iYmV90E0ET?=
 =?us-ascii?Q?+IGveCQPyAG61H8kq0U0yhKgQbNmoc5Agz0aQm/vgGdKy20huDTpyHFXX74b?=
 =?us-ascii?Q?EORkngW8sLq/p+CMAG24AedpPyx5l8W8bQX6dywctEwr9gP0hCxGUmqWG3fI?=
 =?us-ascii?Q?Ww2cesLAHwh8lYH1D+TERDgH31ubT9ysXr35u0uZ/K0zFtIidIJhLBD8Nj4L?=
 =?us-ascii?Q?/Wzk6sXlL5qi2C8xWSG2HAz/DxWdopu28IDVfplm6c762hXUQc+WTC4r0xaq?=
 =?us-ascii?Q?5D+8+LnJjHy4bMZBIUOYMxxMV2nVxR7W2CIoChahGOOrJJBVMqkaAZ0ejmsg?=
 =?us-ascii?Q?PQd5w5UQ22GOitvKPPgr9DhFe9CPXWXwwQVKbARYha0YJIhqBOmdvBf0zfBI?=
 =?us-ascii?Q?FW5EGrqBbGcTzxBKjcaGpZjADWJ5/Nt3ZWeA8t50e6i2mPUe9R/ycT4QdMgd?=
 =?us-ascii?Q?HSbzcc9gFX9ZFMFwHfCS/xfJOEcf6oMvHOkwrr1iy4mGC5K5lXE81HTZJW4a?=
 =?us-ascii?Q?Rehx+sPqCAD8l4cxK1Bi4qA4hIEf1Y3bupvHQMEgGm/pHFFNJ7+4ZzmPYwzY?=
 =?us-ascii?Q?oHXJcqj6HY1e2sHmRT8CaPCBV+WQjb6MFXUR12Kr1yvWdjW+6XEw6Zq8wnm4?=
 =?us-ascii?Q?pFkGzcgZZQPePFg+zDu6WxfbapDZWvysi2Ow5nk3P5CWknT6jZbgN/6BStX6?=
 =?us-ascii?Q?IBnp3+VD54IMYBRpU6fmKNOgc7MLCkqmg6G6pOkqvvyzFBiPUd3I4oopOGxs?=
 =?us-ascii?Q?dKdsqECEEmaLyNZisrmFN1shJa3k3fCmK/BdpsCeUmeEBXd2kPL2SXR3GEcs?=
 =?us-ascii?Q?EUJhe33R1DBSy3oqK427QRgAVflnmtuTc/SG+yM+MfBmuWNE8aa7QeHCeReB?=
 =?us-ascii?Q?4NArFFtc6aGHZ43gsxpEjy4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a90dca6-a593-4823-b2fa-08de20ba7338
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:37:10.3137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6wdMefv3Sk51rFGyKCthHUlleMaSHyowRkdbJq9MOqKtjwesPT88wx5URK0XqUsTWpGOlnqbcbqCC2moggz8qMloB0AKU2Lq9ctNe4Hm69gwFIVCaNa/x1O4D13h60x0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15789

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
 sound/soc/ti/omap-abe-twl6040.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/ti/omap-abe-twl6040.c b/sound/soc/ti/omap-abe-twl6040.c
index fb8727a744362..56aa4b22083bb 100644
--- a/sound/soc/ti/omap-abe-twl6040.c
+++ b/sound/soc/ti/omap-abe-twl6040.c
@@ -202,7 +202,7 @@ static const struct snd_soc_dapm_route dmic_audio_map[] = {
 
 static int omap_abe_dmic_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_dapm_context *dapm = &rtd->card->dapm;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(rtd->card);
 
 	return snd_soc_dapm_add_routes(dapm, dmic_audio_map,
 				ARRAY_SIZE(dmic_audio_map));
-- 
2.43.0

