Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011010.outbound.protection.outlook.com [40.107.74.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F642288C6
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821254; cv=fail; b=W1+R5K6gq9TdRcFodaUsJcVYo32P+aKqy6cGL9SNAsqMbSpnD40odLE4q6Bv3d+RF1THw2A6PJO8eqr8qvfJOp8aO9zkFGOT+XUE0eXvt76J7Aeg4jtFyA/+MetvszU+yX3svQaLt70lEsdAINyO5pj6lS3AFY0bII4uvhpuUws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821254; c=relaxed/simple;
	bh=zhuXnp/AKCghC60HHalV9rJNW/sDG4LE+6l6+YifY9A=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=aVQiVYPRpMnrrWb2vrK5NSOVKhLnU/nnYmM0iq70c3oQ4H3fAhN5f1lC5j2sRXIpkNj0D0x0Nh2imhjj54f8IJ0Reox2Uqz5FN4IKO1A/8nnDutZnCijvn93j98K0I2E7F1ln/rfDpyu/eyZuEpwQrdlcRTffQzDpb7zk+ZC4DY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=hctFLMty; arc=fail smtp.client-ip=40.107.74.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="hctFLMty"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kmTqEt/r0JkCiYmczj1dM52WjMcoI2rKW5SE0lH3DkBrI7h828jyxAHsikRJiwCZyzDk6C6RV7mEmTPKrPdRA0LpTtEb6uzicRy7P6q/gAvv6ALplsp4F0Pdqz3OcEw+gf+ZFsS402APmbBLEgUZqc1v/ewCNjkCM3HcT7iWZ045JErvsgVhencHD/MWfgXZKwnLRjMR7/bYOW2D67yOHtGogINbCcrYOMczGogzHcNsCy+Vy77fSLaAZrFqStkwL69BA/qmYpaMW9uzSKcFx/yrdzm90hlx0LImYoqyD0keaxLwFBEaNlGWPfe3iTJTU1hBL3pdtS5xqEyqYFLVbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AVkMXB4tXWhKexNHA0/A7hnQi7WouF+3a7mj2NmXirI=;
 b=eEaLQX1/uJH4AOOl/EPIT1FBSBu3E+v7HMtojpIl2GABCDXIcWaFZMGW/osanMwhyQMFQKVT0zj61DASJvyP5EyA2BdFZTLIZv2coa1mkpMfTZVa3ze7P2MFt06XorvvguGmKGbkANMzDiK4yVmGX02eVb2XhuDnz2kHWszWm/H4WTfEOAuTZAOFkCkMyd1AgN/TEnW6qE2uH3qeoQYKGAGEv/ZOr49t21FO8B+Rcrz4YInBEtPV2JvYEUSYG6psdSlk0T7m3KUCgxihTVRcn4Zqgx+g/nlzD9HoQpdPZJ44Iqp7dP5rymFOIfMg9efxNJzmQlgvRzRANozpyXTF3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AVkMXB4tXWhKexNHA0/A7hnQi7WouF+3a7mj2NmXirI=;
 b=hctFLMtyrz1n51KRSFdUQxMs6C3a7vLQamkpGRsnBHz7uPddDu3iZl80usJhwHZWiAOm5t5KMl61wgwp9FvMVIBFjRHkwjjNfUY1feYkSvAaFPcaw5EHfx2ka6weM5o8a1G9G4MCUufXDaIBSy1C+FzHuuCaggmW7T+2hgEcpv8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB12531.jpnprd01.prod.outlook.com
 (2603:1096:405:19c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Tue, 11 Nov
 2025 00:34:00 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:34:00 +0000
Message-ID: <87v7jhv24n.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 236/292] ASoC: meson: axg-tdm-interface: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:34:00 +0000
X-ClientProxiedBy: TY4P301CA0065.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36a::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB12531:EE_
X-MS-Office365-Filtering-Correlation-Id: 4755fbeb-2b61-40c0-5e0c-08de20ba023c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VSzvj21HrDnWB26OAYImSvaHug/VY3Ntow2utmVTH6MAskkHaL6tYFQmddiK?=
 =?us-ascii?Q?/QGZsnDi/idkQYR7UADOJ7P3+1mXCV+6USVfO/dERRZzZCgZbg4nqz5i68Mb?=
 =?us-ascii?Q?RRBmpf+uOlHmSoDDdl49MpAYFOX8frLBJi5+g3vafzhreOLWvwqtBWJPUazF?=
 =?us-ascii?Q?V5PJsZc50jSH62x+MtznsPcNvIb4bDVTd6mkANNOpnGgAv9UW85si+dyM4cH?=
 =?us-ascii?Q?OeDeZAHrLbp7XMmojRtRl4G1Ms98wycAr9fXuzNhFDEUlhydfAYIJPXazFrO?=
 =?us-ascii?Q?VtNsNUYDAou2zc0GTZzy+8Xp1l/XJN431fPOL5VrgodUiBQzTRuXzMElWKWY?=
 =?us-ascii?Q?yqfoeayTpzB2Sl3i/Vb3CnhB4ZlhLrt+aDYMXW28a4XD3ZzQjPQjnpWJWltM?=
 =?us-ascii?Q?YgXpJC6U4rbDnpfivYSXrmQnMPhq8hQUpuAOyRZJmHtz6vjhkEpqE1+nmdMI?=
 =?us-ascii?Q?CxaArDGsK4APDPb/9nZCXwaqj+EVjIRLZwknWglpuMQCqQY9coNS6lhepmMd?=
 =?us-ascii?Q?iWwY0VTFZtL14/MmCq2/zEtonJzgFbb9Kz4gLXvJOvQtYFsmB+b9pan04QYK?=
 =?us-ascii?Q?WjP9B/3GYTU3dAboS17kpJeN3MiEqZdpo76f+y4u84V3rwSfEJRF9fbCzGO+?=
 =?us-ascii?Q?7w4GN5KpYU33pT6f77HZrERdNsGX0BatleCWeIq3xZawkFL+4uORCklyf+nI?=
 =?us-ascii?Q?vDAQ6kgi9P9670nvfIF/ezLsQDeU7VWjJWpBlDFyCT2/UBlZmG1QLZhcmPei?=
 =?us-ascii?Q?nSIxgLPrG31kvWhQdPCqubUWsLNaW1OBtFkrwcLm/BOyD6U5SJpvKSog5UpR?=
 =?us-ascii?Q?XKfjvlsV67dFWzM+d0hdUb4M2fem1Mm7J7p3zCNf18XU5lWnhh/SMj8WRl+8?=
 =?us-ascii?Q?ItyS1w/0gwEtn/Qn0Q2QlHfDkK8mgiNeHl2iA7Z+NyZOuOgTV+w7f9vyu2yx?=
 =?us-ascii?Q?1a4uY+bAPaTHOP5VPvcOgEu0zsVXvXIFxL1U2ypNsD4lzIZcfOVn28l/Gw7q?=
 =?us-ascii?Q?UWTIGxF5jRnjCFb1H1TkxCKEut1VXCq3HOFMbmrhnapN3f5RT5qMbMdtZ9O+?=
 =?us-ascii?Q?CmBHgmzbA5gZvESzbhQ5PMFCuHrPy9ErWjkzwJC6+XcNMSIZ6OYNGQ84wa1l?=
 =?us-ascii?Q?JtcUZKrmuv19R3bsA+O4uDt5uppg+nX/Ju8jED2zAC+UU/2F7B9rMKfpDnES?=
 =?us-ascii?Q?0I7jIe6VZo4kU9iunT8ndUenkKPqO1bSYJP73pHGZgkvqbPd+5+mZONO0woG?=
 =?us-ascii?Q?oAzphYei+MqdP4abNY9div0Ti6s98eo4tPv2dObta43B1oDPR703MbF/5daL?=
 =?us-ascii?Q?xzejTskeUZjYVURznaVsAN14nYWE7IieTkNYS1lIVKVEvcRMBQrthrCLtBgs?=
 =?us-ascii?Q?V1FUd4y/2M0XqeF6mUM70tWQ1IVlS33TA1TGjbxi8RPopko6Gpm9i1FQh0EL?=
 =?us-ascii?Q?8NOGq1+8IWcerptncN/Jlwu3LsdXKXsmLfSRIdI3Zc3GvU9hChwtkjXiEHbP?=
 =?us-ascii?Q?mksW6TMWq4VSluTp4zzyUsyTjlJLs78UsU2v?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nzuVq8DVSAA06oKRAt5tkr1HRT/2nrEEQYbF0z6CrHuaK8XZsTBbH7k/1mE6?=
 =?us-ascii?Q?lKKHDWxUQ7IEXlbk2UvYkX+xLmHVlTLv7hF4A6/TVCC1vHohc1iZZN4/bDqW?=
 =?us-ascii?Q?I2Dx4Rny3Mm64Y4KjeSiMM+7+SoeE2bh6cLMd6Sttc8bX8r1c16j2TQ9F4A9?=
 =?us-ascii?Q?T6d+Q6duaPGY4lisMBYtRZ8FydYJmBhkrvH6hYe1zHERSwM0UBeU327JmczD?=
 =?us-ascii?Q?PVSeSjnSYHTyzujqBnqxfyzYeAVqSxXzOwwKyjvayHq/6Hvd5oS95jWIo4+I?=
 =?us-ascii?Q?3CZuT2UQ+hoYZnyeEXmbNpr/4ICd243RlhaKSL1uPoYkwMZhnd8Wz9RRMGuR?=
 =?us-ascii?Q?blZLwU7UAnjzeQkfvFTflHKHNcS4zOVy7IRMB3qos3QOHBo8M/+A389IjelQ?=
 =?us-ascii?Q?HkXHRbewMGveehg1+7nM5IGxMy2bl+6OBdMVp0+NzYafAh7iH3KbUH72G+9x?=
 =?us-ascii?Q?G9j4jb/bVtrOHiBcDZlqPd14cRmjuq3tAVXh/OoDv3x7RdZB+YwSSABvW3F5?=
 =?us-ascii?Q?Mqb6tIk7ZzQAPRDkwgAHlC5LQlmivogB9RUKBcoesHdhUDwbiQN3bMG1idKD?=
 =?us-ascii?Q?c+Zx/WG1OHbU2rGpBJXnDu+ifTnxeWJL4ZhARl3vB4rqynY5aFj6IiUZtDjB?=
 =?us-ascii?Q?y7of7IRB8pRJZZiXIs7+l4rMLjHJSfzZUjjbkpXwXnvJ/vd24f9Yg6kaj9tz?=
 =?us-ascii?Q?Rv6Jzuh0GOPHGK46oAeTznOrnkIeD4jw/1JOfUTzUWdqzjmjzFCRPpf6pw1D?=
 =?us-ascii?Q?yQUzZ8sYlBCNgnOMFsBUefaTCE4zlTSWaM93VVenfhndwRi7CoV/KhCIG1e+?=
 =?us-ascii?Q?1p8zNSwOusVQmBNTU5PmeWiQshU5fCKeGW8ar+KMzkqIwzMQv3Yh3uiekhZR?=
 =?us-ascii?Q?IXSA3fVaO/9TXexIQD350n2kPzUquk+JVhx+rfZ5405uQnGC2LKwjKsi35Fn?=
 =?us-ascii?Q?HJTGJXJ3vT15+XXIZm0ueOoo49PLphr+TOgg+uTlkNITNcjw4FXTIekM0Rzs?=
 =?us-ascii?Q?lsPoKFmyQywDP71cLZSVo73+dmGJ4QixtET8jDFbrQ1Xj9M0QkDn55bMw9rt?=
 =?us-ascii?Q?NwgMODrqUBC1k1J9OB17LRpuWOtXELx/hn+7l7bJLzFIvBUShO4tsPmTOvqq?=
 =?us-ascii?Q?moYhD9H0is2No/9jNO26ucrWCtLBVuseS34SgYGrw57glC5ThslG/fwXnRD+?=
 =?us-ascii?Q?pUZZ3FQQreBEXmc1++bCe/VhdTUChyw+ztAsI/Jy+25JRN6/5p4wHxfAqIVQ?=
 =?us-ascii?Q?UcKEq+RlKX//XpBCId++1slHnWaaIMB6MoUm5FimPUWyp0G6zWqv6daXqmQZ?=
 =?us-ascii?Q?1XTnzNnoD4lGsPU4XjVOO6eZHH89vgn+lvFlEoTKxMc7V7sI6uPRz8JR0KmI?=
 =?us-ascii?Q?gaFFu489XzNgBzC4oimT6Q1W0iSNDK/w1DmyN2RQFTDMkzxlzZwJDLrk8T6k?=
 =?us-ascii?Q?B/mc2wtw7lgN7QpICy5yvxfTTmXBbLnJU5djoJXyMRIOmpro3xdCgZNCPpnz?=
 =?us-ascii?Q?j3W8CyAxbzNhg/UUAdlPFQ0L/IyV3j1S87U2Ja16FxZcPBkZFUEVp5qRYr4P?=
 =?us-ascii?Q?JucaDx1H19i55KIH87SzeyCw6KazNZk8nPzramVx8FM28hMICa3PVuqAUZFf?=
 =?us-ascii?Q?/WGt3gR+tFR3wDsuyIEJVhE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4755fbeb-2b61-40c0-5e0c-08de20ba023c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:34:00.7912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ic2rTg+MqWn8z/o3uv2fpklr6t52tOdMdk11s+EWq/EW7lri1Jcj4vfmAmqYMfqd6GLXtde6gZNPR0K9fAUsBYOSPNk7mb7FQlcnnRTHJeIQ3w/I2LZAtKZq/9jOERFJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12531

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
 sound/soc/meson/axg-tdm-interface.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/meson/axg-tdm-interface.c b/sound/soc/meson/axg-tdm-interface.c
index 421b5d719fb3d..d5287d78f53b8 100644
--- a/sound/soc/meson/axg-tdm-interface.c
+++ b/sound/soc/meson/axg-tdm-interface.c
@@ -479,8 +479,8 @@ static int axg_tdm_iface_set_bias_level(struct snd_soc_component *component,
 					enum snd_soc_bias_level level)
 {
 	struct axg_tdm_iface *iface = snd_soc_component_get_drvdata(component);
-	enum snd_soc_bias_level now =
-		snd_soc_component_get_bias_level(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
+	enum snd_soc_bias_level now = snd_soc_dapm_get_bias_level(dapm);
 	int ret = 0;
 
 	switch (level) {
-- 
2.43.0

