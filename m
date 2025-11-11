Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010043.outbound.protection.outlook.com [52.101.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0A219D074
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820656; cv=fail; b=kSbSHPCscXEBqQhGO660vOQYpncLsSo8vgHeOGiFiZnjTrBRSe2htW1Hx5TpqRhE//VyN1iL8P5goofY73dcSeImpWoQaERGKTJvkKnI7uhhYBASctUafxbBq+yALLb0+LaoDdiImsj1EBt+ycJliYYYL+F0TUIth/g1NNvf/xI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820656; c=relaxed/simple;
	bh=/icMkt0Np29rpg727aGDPbwkqSqSiHxqB6HusRcQoVs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ewWlq9zS/3JRxA9n8b3g9zGkrizO3g0pmzPzc7Kr44lextLJm6G/wV9vxnRoe8GEtMd+sGnVK4ESskf60UvafK6RkEhIlTypNFszCItOMse8KY7fxyFbTl/MMcBkRhDSpLwv/KbWpkT11OgZ5l9CHsvFe64rvCdRyfQXXtU+22Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=o1QOqkBp; arc=fail smtp.client-ip=52.101.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="o1QOqkBp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ClSaqvAeEVC8Ukk0O6F2Ecizba1yJU2V5wcHg/2cBHl+qWUIxxLTjTCBqK4mB3m/+IZhTr1d6Z67i71kQS2cJr9/3kjdEsLN4Ai2Qhd7SwJVp2uwyrMHbiDBvzCUkOW4qpNoHu6nTnS4og0quUtZdu195/vyg5eQVPCQdDDvlLGBMcYTtcmJFA9reAnol5KXsrQgIjAW2Xj5Qw0xVNX0NxwAdp6GrKiQwf+vAhMeTgmnK2lUiuGF3QWKkej1evyxYY6d/9YWIcMAwjER+WyJxnzTXkqKMVd/SB6rhMofYF95/+mQNLa89pZ48abykVL8NSYqAkyVEIPGX8d41AeYBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FFjI5Wn2oRWADVfhJ5fGRM6anc6UqzhuwZ0ngFADVfM=;
 b=A4wZwPMnmZbZ7UUBe0bX/Wz7Qgqf5nAU54XS4crJqALUedjgCmlWHl4K+E2pvLhnPv6NLQ1vOOR1gE3/V/mFHEwR1gMEZidJ5B76dr9YzWlvrJRvkDDXI6YvTy+tvpyWjkI1xBrCb87U+u9vF2FvYLmi5hopmyoB5//Up2RfTjH2VZ5TCYQT5fc6mITvPIC9P6JwAc7O4WHW9tAxPhblBXiGe8Gr8wQo8fpI5P5VRYhBjS9GSjWeXgYvlEFLYo7Imwnn/1ObINiLPT9DYUtqytw+pWJ4Er3EerJinZ4lhIob1p1HhKvxi8aQJnhNAayEEnL/4PDbRd3gIRqW6CTqkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FFjI5Wn2oRWADVfhJ5fGRM6anc6UqzhuwZ0ngFADVfM=;
 b=o1QOqkBpuukqGlw3svcLor5j5N6KQo/FlJ2jgJOoT3IPJYnBm1mIKxpuww1BCSaU50qupGkQjoLqbgFdj6N3Zc2wZ636aw09eqTKj7IQL64D+pmPdtCsjbUcNdWu/nwCuhuIY6swEw5GvvE0SWTbS1WQz24pS8HG3WvJBdG0Fx0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10376.jpnprd01.prod.outlook.com
 (2603:1096:400:248::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:24:10 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:24:10 +0000
Message-ID: <87jyzx4dsl.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 094/292] ASoC: codecs: nau8824: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:24:10 +0000
X-ClientProxiedBy: TYCPR01CA0154.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10376:EE_
X-MS-Office365-Filtering-Correlation-Id: 10ff0a98-f127-4f20-cbea-08de20b8a279
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iCHfjzKrlIsA/waToS4sco+2n1LxgqKioEmz6L0CGFrmm8Fb+Qn0AjFCSAmy?=
 =?us-ascii?Q?fThLH639RFYUsL4/mWy7ue3qFnngFPsoOMOFL0B04/Z815IOB3MP3NVJBPhT?=
 =?us-ascii?Q?MJIf3kdB3zUloDE+JVi9sjp+VBKB8d0spir5dhK1bgi+v41C+Ly74mYhambK?=
 =?us-ascii?Q?tZ5CfjjRFlUBKA3D4ZcfrZ4RQsglttoHzEUj9lJLWJYZS/94IEPIK9uCeLV7?=
 =?us-ascii?Q?Fn3H7zLT4gqfaMIWEuGMfq1FCF4LH9g31daaIv4dTlzZt162rNYyU9cUt773?=
 =?us-ascii?Q?g6M+1jh9jxXZ3Zc/AxYbWdVhA/9z64LcHUsn71xBkE3JJR2hbxLhfOjDBTfA?=
 =?us-ascii?Q?XNqyqd/AabeDGBVMayy0ltGmK7+M3PZOkwGN5/SyJ6nYX55i4N278rNNUB6Q?=
 =?us-ascii?Q?vbto/bricv///kZt0Wey9Mh1wMlJnhpW4zFLLhjOnkhjT3ZOwgUHWQfR6nKy?=
 =?us-ascii?Q?sXeJEx5K4Z/G1GVT3S2NIlAVtDAobIdD6o+vRNT7thm6rRdbujlkPzdPiao5?=
 =?us-ascii?Q?lRUf3V+ktABTSpe/+dM4QZjjvqmsypKiAu7YmWpiwVwWGFuqy+EWWC7lui/2?=
 =?us-ascii?Q?1f2M4yEwSOF8kWCmKVwuF70RerryKGBtpY3HhnmoOuUDChf9zq+5tGT+77VX?=
 =?us-ascii?Q?L2AKMoGVMGwnk8sfoglzhz+NTamHqEb4YRGscL6IjZUoeiC/xNVcPmV3C4sQ?=
 =?us-ascii?Q?h2CR9DbbLj3eOx/ZCDKlIiNU4fp2efZT37AXfV1vtAOLH+TRZECRjFQMp4Da?=
 =?us-ascii?Q?L3QzYdHz92LIL3C7z6aIe7IYhodvkgKiukcQ9uDrQu+2QX8PNsAKJmLbsSBl?=
 =?us-ascii?Q?MJWuCabjlASvZlqTqJOf3RsC1FjKhvgwfhofdE0HREJ3cvtiL6qKrKFvzfMk?=
 =?us-ascii?Q?zs98ONki38Oq/fywteOOz1DVDVZCC289O/2kdrBMoFw8uUpBwFCf5bG3UIOl?=
 =?us-ascii?Q?ZFtP02LdCLCtYKjmGSFbWaHILRbV5mMCMcRqHPtNDo/6prhw2GKbxgsCR7Yg?=
 =?us-ascii?Q?xObUIRARjOfTYZXFdMbFErKOQjQ98z9hh3ve9I9Ms9OEICXfEEUjYFfcnfh4?=
 =?us-ascii?Q?epDgema7+jvwkDU4NiHBID+CHeUL88CGSVy9/E5m96c8CmgmlnbUcLIrwhyy?=
 =?us-ascii?Q?qS/jVP1vGmJ85qrGNY+nptXzHpDr60Lb4xCsB0p+IK/RR5VXvC5h2k6n6DIl?=
 =?us-ascii?Q?WVphI2WNUh/UePiPfRrRNZB+DEzHhxJvUPBZ1CiOJW3uKQAQAZAIN7hjYjLB?=
 =?us-ascii?Q?GdoFs1sLiIPdwmrMy+AJx6wu4H5vbQRaFo6GcM0wjIweoGB2o6VvwCvgyTCn?=
 =?us-ascii?Q?ux+z3hF4GWatN6oQgfqWMVe/SBAMTZpvLlrImk22BObRqt4MKm1Y+1xBM/A8?=
 =?us-ascii?Q?BR6CTTWFXe+tc2kt7owoSNqRDyb8oYEinr2hTZALPERP5zh9BMR7dqw1Yq4B?=
 =?us-ascii?Q?/OMtV3uOovTYb+85TZPVIOQmX2IEu3Yc1KRnvxjJpozrSG49W3BO2mR3xm0p?=
 =?us-ascii?Q?9jsYM35I8TeSHVkltxcRm2zaXZcP9lWtZp2S?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IvRPq6br4NBuuLFvo7/hPNegN4CamM/APEnSROM5JisQqp3J9WJ2UhSIHI/6?=
 =?us-ascii?Q?MEGv9t/O3z/dzTv62G0DXvTMkViSCfs0LW71MQtFAjpFfJGkAJfEZqdkk9ZP?=
 =?us-ascii?Q?lz55XWDtKNrHOFBU7Dy/9tgEr9wU1xmKCIre/XwtYjCZj7MCixErGauKQLHv?=
 =?us-ascii?Q?Yk8gm2IYnK96vOkGBSggjMb55dzxbOKafCunu69z1vG/0mGZEPkwK91zn6FK?=
 =?us-ascii?Q?wbupIKHU2YGod8SW+Xl0HMEdAcqB1rVes5JFzAP0cKHNkT+d+PL7mRcy1H8B?=
 =?us-ascii?Q?ma5wrEkF+KiVpamVCy/Xx3wfmjVvdb+gT8BVfOI9HAbpedASta2lx6qTMfqx?=
 =?us-ascii?Q?Z0OHNplYWweCpKnOlHdxrlLa4k/E9nvOyk+bZE3KeC9wzpK/0WWhM96Laenr?=
 =?us-ascii?Q?wDlH8+HHlu/jISmO3cWHlxWjtkU68wcrlmzksej2xNSIj+w420YSvzEYIbz1?=
 =?us-ascii?Q?EPfxjcl5os2T9FmeI3WlGL1lRgDFGMZ1wAu1wFx9k3PZp+dpN2GoFQ7jsU5K?=
 =?us-ascii?Q?nO7MOiF4dVM1bJHpH0Othny24mliwPVq/7hkll8kx1ITRLWFcntBNDgV/xnu?=
 =?us-ascii?Q?XBOteqQy71hTVZg4RZV/x8AJ49C0rsBB38dXFjHXxfON05nlecrvprVNHTO+?=
 =?us-ascii?Q?YRjsTwnGJTy9dLSLSkhL4ZjCUWgGyvIfw3v+ERaEBP3osO3NXVNosTfHIDEw?=
 =?us-ascii?Q?NTIBnr1UP0ziXtaGnUOb0fAiedJDgWvkAjN5IbNpZ/Zz5UDOR936rGfFi/dp?=
 =?us-ascii?Q?q/H5ntD/cq9RNAyw/cCUmGOnG3+yaZMq2y1sgba2n91CyNQVIVaHUP/Vb/ZZ?=
 =?us-ascii?Q?3WBGDQiVHi1CvspAoB1UCC5d3R0W9jAO1eB5+01MZNvKyJKjn9ZP83a8hUF2?=
 =?us-ascii?Q?vxStdlRXCRgd9CGJ4J/RToVhIXyl38Dm8xgKtSLDMHX2+DA42+kE26Rz1aIw?=
 =?us-ascii?Q?rjdecjR+OY3brvdBJ/lskqdw387mLf33WeMEOrA48Le4bzZO2F8d7Y/qcQZ0?=
 =?us-ascii?Q?Poz+9oCAuzBrgVwefsZaa6KuJlUBrZV3N/l1rBZ9GomUuG0kYrJGyTfGkn/4?=
 =?us-ascii?Q?OujwhICnpQ5HbkFWCThzYaNVzcueNwYBrLRC/ncwvWRrBKAHGuBLE5PCdKSa?=
 =?us-ascii?Q?2WblBzd4vTJTYHy1F9bFD5+VFqjoYu+vMxIkDGFIcH8hVu/Hobis9VlaAqDp?=
 =?us-ascii?Q?2zL3knvGlkFN5muV0HI3xRcjMmwCCkOOBFEqXSCd6CargkwG5EIeYrFPtNzb?=
 =?us-ascii?Q?avSkNolm1ljF0FI5G43HxaKU7eiLKZna0IY1OM1xazkyOmJ9oV4rBtlfjIqJ?=
 =?us-ascii?Q?MIJDRgyTUYXT9npvTYlAj0gLxfIFyT/M3g24OeZIXfYsar1WX3YBkfhgL6T2?=
 =?us-ascii?Q?ihhGQS7A7tyPpxjHr+bFbNs09wh/qc5loDF8LpLTeqEQ0I3b4sZfuwFof43j?=
 =?us-ascii?Q?xISdn8vqf9WOc3M68h3C4rKJlw3DE06d60eC2pAWB+G9Io+2DT9l65zF6kCe?=
 =?us-ascii?Q?EnQ2Sdai4BJX/RTqT/EI1sQaPZ47ygbgLN7ytnZUuOJK1GPoLKGlffMYnImf?=
 =?us-ascii?Q?uyp1tZI3xK23CtS+ZfCu+BhUMLDblTsfMTqGQigQ91PuV9MDU8e5/HmusMte?=
 =?us-ascii?Q?kvmXXFWw235Xjvh6tZPB3uU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10ff0a98-f127-4f20-cbea-08de20b8a279
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:24:10.6909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FzEoZsovkck4CvMkmYL023Wd1GydeCW4AJNVMacnLQZxCCgoxqUjLG9fL8TNE4HjqF5df/EnfgsFMmN2E+1b7qc3ZhiEpvEGzCsEzCYd1aIMO1tKpeafpvUvxGtRIQOC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10376

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
 sound/soc/codecs/nau8824.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/nau8824.c b/sound/soc/codecs/nau8824.c
index 542bd22e61801..6ce7637624430 100644
--- a/sound/soc/codecs/nau8824.c
+++ b/sound/soc/codecs/nau8824.c
@@ -876,7 +876,7 @@ static void nau8824_eject_jack(struct nau8824 *nau8824)
 		NAU8824_JD_SLEEP_MODE, NAU8824_JD_SLEEP_MODE);
 
 	/* Close clock for jack type detection at manual mode */
-	if (dapm->bias_level < SND_SOC_BIAS_PREPARE)
+	if (snd_soc_dapm_get_bias_level(dapm) < SND_SOC_BIAS_PREPARE)
 		nau8824_config_sysclk(nau8824, NAU8824_CLK_DIS, 0);
 }
 
@@ -931,7 +931,7 @@ static void nau8824_setup_auto_irq(struct nau8824 *nau8824)
 	regmap_update_bits(regmap, NAU8824_REG_INTERRUPT_SETTING,
 		NAU8824_IRQ_EJECT_DIS, 0);
 	/* Enable internal VCO needed for interruptions */
-	if (nau8824->dapm->bias_level < SND_SOC_BIAS_PREPARE)
+	if (snd_soc_dapm_get_bias_level(nau8824->dapm) < SND_SOC_BIAS_PREPARE)
 		nau8824_config_sysclk(nau8824, NAU8824_CLK_INTERNAL, 0);
 	regmap_update_bits(regmap, NAU8824_REG_ENA_CTRL,
 		NAU8824_JD_SLEEP_MODE, 0);
@@ -1498,7 +1498,7 @@ static int nau8824_set_bias_level(struct snd_soc_component *component,
 		break;
 
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+		if (snd_soc_dapm_get_bias_level(nau8824->dapm) == SND_SOC_BIAS_OFF) {
 			/* Setup codec configuration after resume */
 			nau8824_resume_setup(nau8824);
 		}
@@ -1519,7 +1519,7 @@ static int nau8824_set_bias_level(struct snd_soc_component *component,
 static int nau8824_component_probe(struct snd_soc_component *component)
 {
 	struct nau8824 *nau8824 = snd_soc_component_get_drvdata(component);
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	nau8824->dapm = dapm;
 
@@ -1532,7 +1532,7 @@ static int __maybe_unused nau8824_suspend(struct snd_soc_component *component)
 
 	if (nau8824->irq) {
 		disable_irq(nau8824->irq);
-		snd_soc_component_force_bias_level(component, SND_SOC_BIAS_OFF);
+		snd_soc_dapm_force_bias_level(nau8824->dapm, SND_SOC_BIAS_OFF);
 	}
 	regcache_cache_only(nau8824->regmap, true);
 	regcache_mark_dirty(nau8824->regmap);
-- 
2.43.0

