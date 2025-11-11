Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010019.outbound.protection.outlook.com [52.101.229.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809771C6FF5
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820796; cv=fail; b=lQ7K3O9ddHRF0dJl4xAaTsKxVEHC40nBteURXe41sVSUFT80Lmq5hsl4TTK/ZY+pVP/N8+u6aqUHWIkwcJmZkLnPSKGLu/HZPsMQiAuFptwgU3lK/qBFZayHKkKc0SUo5OnR09mpPjaxVX1RRmpsXJ8GHISvR/4dmEO8PJMZfMw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820796; c=relaxed/simple;
	bh=eFzmZ2gyhyRXEBX/Gi1UEm0U0Rx01gihA6C5GzSP/78=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ur7zetmlFKkaRxAH7dyocn0GeEWcOV9V4DgKCL8ClhV2Brnnjy17LcRsV6LBlK3Ozzzaj1bA/B9vwtBUIXM+aQxK6mRm0fmipaEVWoJr7w/XrbwVflNJFVJpqh5H2EnJ/Cg0YwpMeIBwwtw+6VsMmaqwkB6u/0IxK6KBcz83JnU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Uq1AaXjp; arc=fail smtp.client-ip=52.101.229.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Uq1AaXjp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZmsBoYAdyYz0BmmxiOT8dgfEErEhUzeyJExpkOtNUfrFeCGXo6yoqN3VzaIHyilqokr6Feq5MFiPgTj6g9xTCLRtKymoZfHPXqxtPt4rmbnRkK3RvARM6GOkouZGTuCXJo80TUbf95MzPiPAmP4bepX3i1x1Vn/LAm/WPge6hfEznsoBe05y0iNS4/dAh7QVwMCIPgaSaCyW7kmK/G9dVtvDCzE1NthW3i65ekp6jCTjPxGjx8EKpZGYf7cwJgaijCuA+RRtvxLSzJX+KUf37RnH3j0hWzg4jOEIuYNiqJxVJgjo9RViGTNB4U44BCX8kqPRVBOFHq+12/MDwz6aNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cqt6SfPYCN7RmUa0JTbAgcJo3WrU7EaVGU6tpcnSuN0=;
 b=pVoU9YDpnQi1fBiJlFe7ogz1x3tTJEWIgXC5Sno/51AD7mFv2Y/D4nrLlEelXZu7UPXKGRr46u6MLnCvYoEL8BR4W0F+CWvhVMKPtQNEf2zve8f6DCFzpskUT9S3/UivTN4e4J7Kh4396caZepOV+OLV9jX7f7mnImYHboQN3gbkFhkIzXqYsqig+GvXMqOWQI/CARGSS/R6Pk1SGB1oEMhS87th0hFh0SvSAyNyLQKTjyRurLuFkyXYDe16Np8wVoRAHKSwRvT3GvX5LCVTnGcInCd1aeCRi1JI8Eq7YJO0uIpyvk2iAjkubm08VKFszgBLicivLpFkmqdw3H9WWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cqt6SfPYCN7RmUa0JTbAgcJo3WrU7EaVGU6tpcnSuN0=;
 b=Uq1AaXjptysIvwo3tQgo439xRNzsGQDVcrC+sOHIpppzGk49xPkyfO+ZOXuWyK5DX3S8U69S06/bPAMWSXM2538vwFUZY/2xNKNCxfi2jAp0/+Bba4qiy8wl8iI+ZJe2OC3J/0UIjrsFoK9FmGMJxY9EGbk+q+ur+BpHTeBpD7E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB13460.jpnprd01.prod.outlook.com
 (2603:1096:405:1d7::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:26:31 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:26:31 +0000
Message-ID: <871pm52z48.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 132/292] ASoC: codecs: ssm4567: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:26:31 +0000
X-ClientProxiedBy: TYCP286CA0042.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB13460:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fe75291-da33-484d-7044-08de20b8f662
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YknY24n5fg2MTcH0LuFdYVpdpMlQwOuv31XElKWfs4zcj2qkJvCLKS96Zf0N?=
 =?us-ascii?Q?m4fc1pEEXnBvo7qZVC2RTrjSBASRs6Wd/SJXY9QZmPV91ILxFZjiZ3M2c0IL?=
 =?us-ascii?Q?IEvMAKwv1BT/wMhoiZ4580/rLqZDXkwZAhW8Fm+LIvYJ+3A3MgWmyNqU2gKk?=
 =?us-ascii?Q?fDKouUAAEj9/JROBHYqep0veXoPCeBEGRT9L0Pv7mccx2UewCFgWHM4ImUJh?=
 =?us-ascii?Q?mtWhDZEqSdtQmGKlw8jEbZvlVrcX9A6HbgNJHAm/UF57/CXL5OiKXjurxoPQ?=
 =?us-ascii?Q?9qnKEYtqh2Uvo4x5321pWVs6gLH9ozUlOZej8ug5YEFhcujXfYf//85Ojb64?=
 =?us-ascii?Q?a5MJDzP2X9RyqH+n5BAQA1AQ8Bl5pwG47OdVLW2jrqv4jpG7HF6bmqSmDNMd?=
 =?us-ascii?Q?E/JvuzlTXapKfQV9i0JNecdhOaydCF5ipjLjQgcVmTAVrZ026GpUROEouHLv?=
 =?us-ascii?Q?cAX9WvIaOF5NxrnJzYx2MZWf+zDcv5wgaOhugi3pugdd8Yc0qU+Yy/faLUed?=
 =?us-ascii?Q?Ubk1MH8e7AlXKe96bmXj7GO3oFMa80ni4w5yOVI9UHmOSMgeLc4NmPhnO3L6?=
 =?us-ascii?Q?Up6yNzNb85aUh5Uj2G7nkS2rECxWyk57WOapWi0ZoCY7Cjt9SgwG6SS3WtGn?=
 =?us-ascii?Q?erI7puDhWuSHzFqkv4hpAcTR7XKDrKJjf8jxwXUpqQ705pNQ+E5LbEw8c1IA?=
 =?us-ascii?Q?+8Fq3bzV9DpgwndEB6+PYBr9rY0lTyLGAaG05VKx2bkdJkOYjy1wb51ALTvX?=
 =?us-ascii?Q?RHcBtMEeX2SjUCIfpRx/ywWMHcJu34uGO9p+Dt3RlLHFi2bkr5/MkiMlnhd5?=
 =?us-ascii?Q?3Xm9sej8F9iTuO3mR6cv5ta3HCnobVaseLduFiIP41Ey00iKoYm/SPTcgDrA?=
 =?us-ascii?Q?4F4S++sgPxsxgSkAQjtLN+5ouiLUSOTE5Kux/gqQA28dgop1ylfuX01BTlsg?=
 =?us-ascii?Q?uvTPwT6nG2iS0Q3jBToKvQnnfFUtAAtGVfvlN9Zgx6uSmINL1s2pTriakh7Y?=
 =?us-ascii?Q?kqdJjejZ+l/KNGZ1IGITSDKcDwyh+G7+76ESdoo3s3F10YikBE8zjfS6dJOD?=
 =?us-ascii?Q?8HvC6rF+3hkpflNqX85D0px8qNm8JAOfNA8UHlGF6PzvRoPOxMF7XbIMLrC+?=
 =?us-ascii?Q?K4GZANS8ltVkbffazVq2GM0ImleSOr37jcJO3+fCLLcGFm4t19FXiKwvQcVh?=
 =?us-ascii?Q?tFppjQ+YuPrc1E6fPdazzYBtHJS/xInTZU4/8f0SFIshp4/rqhw4tbbDb8u9?=
 =?us-ascii?Q?1U3Gl1dr0SOSskkTUEvfv/BwrPof53mYLghRSIuPtaO5CLL5h6EypGETd0Zr?=
 =?us-ascii?Q?+nBRr9m1ivG2/+/N6Y4apif1M1bQNWP8gcHIEzcoLuFzE/Met2vMru/31xfy?=
 =?us-ascii?Q?t5jbSAKEtO+ASQJefpUbbsYjsR6lROXRqAEOs5z7s8ULKU1VPJwNYC11HV/U?=
 =?us-ascii?Q?u4CwRPibRNRoTyuyTpMMQNB1y/s4oyKymgv6masX5ywu1F6KXYrMcJJvYyop?=
 =?us-ascii?Q?N8r26VTBmKo6FMpe/QeWjJnes6xSVff0AoR9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Qp+9rffr4kJ0jfjjzNMdVvqp8I98ykea710cJDn0RzW1/nAur4XJf4NQfjh7?=
 =?us-ascii?Q?73nYWJvfp82kbyqtu/NCv3XRN7ZGRf2jvJT4VxMz5DvOU1QlRJigqaAQPqz9?=
 =?us-ascii?Q?u8OSEnppS3uyt9tjIwiBNyET3TKoI9jZLCJGtQ4Y3MJu/z890eGnyaROYCLd?=
 =?us-ascii?Q?SYAXYQ+SgaTVjILd9BAL1EtINfY0SuxetKprHScYdYfx9JNsvDbcyDvVD3gD?=
 =?us-ascii?Q?IJum/5FOwDP97BG3Z2xb3Dp7Q91j72KU71kH7VhGxqM4Ye1U/KerrWU3qXZN?=
 =?us-ascii?Q?eVK7d+BZl2vzWjEz7M7R6rMUDII3o42A4JrWlVW5bJoGQqIwgRdiGH2uEC/S?=
 =?us-ascii?Q?hgWdxeYEhyTxUiR7uiY+XN/EKbNPsXKGEi4IK0tILXiwjlqg9DVSYpHNYMoA?=
 =?us-ascii?Q?+S4Rcaji/HslJhJ0CdP0wfY2Vd0bk5VQVoUkV+QjtyiPIGLTcl6xNG2clyPm?=
 =?us-ascii?Q?dohPFx3S3oPJXci8zQxEcVCRdnol3bUz57Tgep3seeDVy9Mr7ResdhENZSLE?=
 =?us-ascii?Q?jp/aGJ5hVRxtdzK7xDTZhVcCJ7WLBh2BI8LM+o8r3fBMwXUs6VyeKJsdj40J?=
 =?us-ascii?Q?yuPxkhoDLkCmjS8tuSZuVtRwuTAyRGTrTj1/LMmVBl+wuUavonIzPk3CMkvg?=
 =?us-ascii?Q?V2Sgs7mnnk39QJtg4pGUrEWBkrGuAKIvLTItwh+q1eZOPyrq4PUNSyMzPZ8J?=
 =?us-ascii?Q?fPRFyyXoH9i8b+3NfW36haAYo7qmZL11qe3gsJsicCk4T4P2AH+1XKeeSlK9?=
 =?us-ascii?Q?+n+k8JfSX55Qe4JCcZBF5VYrVuNTLCNjXKUWK7CRsCMhtHmCajD9k/Bf2M+S?=
 =?us-ascii?Q?wxhJjJ6pQnd5CTI5am+kI/3284U+cd0ngRtrftnrsRuMrGVPKmILiWzRBf8v?=
 =?us-ascii?Q?TaZ2kC0sD3UFuCYY+ghBVtOA+A0VhP0hV+3l/2C1BBbHaEt5ZU/1yusXzNVe?=
 =?us-ascii?Q?lm6esw1flVA3jFrTaG4Z1bKM+osYSmXyUv2d1O/gPc5jegULKj8OuPX/7nTl?=
 =?us-ascii?Q?4NHuDS6SpmErrAyLSG3JOVrMpFeYa9RcD+Hfsa0PYMNHlpJOBlprgkVzHKWR?=
 =?us-ascii?Q?tT51lTGOsOC8CiGQfRZ1ODTk2mOqa0iPLrdYZhMzfO8APvwDVMHl7tABwJ7M?=
 =?us-ascii?Q?KHnjIpnpBFMOZ201UIin5L2FpVS9O6nV+IxGr7+l2sNiEflOlTFsyE8+u6nM?=
 =?us-ascii?Q?gM2808xAF2NQDxJIlxQxVJcmyFDtAiKiGYhWaYTM161oMGK3LB2+TDbNQigO?=
 =?us-ascii?Q?7ziQbvONgtvO+8IPhQ4mj5p2VyjVEo/5OH6YelYoKi2P3cBpgH4P9itk4iqv?=
 =?us-ascii?Q?HUa7DpzwhV4pGkMdIL2F5EJ0JnvTZPSpNaVfN9FrzIIqehfhsBhYKJOLLHSi?=
 =?us-ascii?Q?UGdCvkfvq4/wqb6IotoTuec+OOIqnnmESm537OOduPDbYVDhd4vxg4gRFmwT?=
 =?us-ascii?Q?ULkbuGS0DsdhU2cb/7xs6wHEtboBHzULeMSmqjTWWRukcuDXANGdGtmly/4c?=
 =?us-ascii?Q?1UcaKPHV7vtuYxqg4YiDq1zw9cRSe56R/ILg9GIV7Ff4ReLZsJBmZhWNsSQH?=
 =?us-ascii?Q?Vex0WDvHgU5Eds5Bd7CZTWqWtWT50q5qRQrnyumQNMPKqTPFsV5md3bquJpI?=
 =?us-ascii?Q?EDnkoKOqYTuD+J1NQNmmTLs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fe75291-da33-484d-7044-08de20b8f662
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:26:31.4009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zX/O6z9DbMjmfFixPl2PsQvz4IIkPT/ozbZpBqsTae6SE6rQhXGb8m4wSPaHEgjeQvyuRQwy1NnefGmFUJVWBpPOK8RYDFaIgxqq4lG4tFozaSiWtc0fpXOrjltSpfYe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13460

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
 sound/soc/codecs/ssm4567.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/ssm4567.c b/sound/soc/codecs/ssm4567.c
index 3e09c85abedbd..15f88624faebb 100644
--- a/sound/soc/codecs/ssm4567.c
+++ b/sound/soc/codecs/ssm4567.c
@@ -369,6 +369,7 @@ static int ssm4567_set_bias_level(struct snd_soc_component *component,
 	enum snd_soc_bias_level level)
 {
 	struct ssm4567 *ssm4567 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int ret = 0;
 
 	switch (level) {
@@ -377,7 +378,7 @@ static int ssm4567_set_bias_level(struct snd_soc_component *component,
 	case SND_SOC_BIAS_PREPARE:
 		break;
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF)
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF)
 			ret = ssm4567_set_power(ssm4567, true);
 		break;
 	case SND_SOC_BIAS_OFF:
-- 
2.43.0

