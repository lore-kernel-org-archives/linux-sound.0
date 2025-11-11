Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010043.outbound.protection.outlook.com [52.101.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C69A1C84BC
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820812; cv=fail; b=agwCuJLuT2oP1K8zw2AOm6JVcwifTpRNxuD3gFvM3BdQTotQ9rXrGFjWQF4n4i4xfbrRdR5U7zIZbjkO+6X2pNDFB2rLl80LlSVkm4XnvgTOfNma74NqSIBMhfaZiWjmBLvRyWJMp+xezIiiRv2vFKW6hDUdAaT0nMRKPrm2T/Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820812; c=relaxed/simple;
	bh=GmSVG8sTUsACoIh5bOPezVfzu8B3rhDRTBdsPZt4YKk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Re3RprJafNlAdUg+J98lXB1Kr3i8g0IMiXufkKs1YoVjc3fktCJ8L8ZLpfs1Vwab27TJePBD6t1BJjonni+Ns82AgeTl4KmeyZxFDaYuVzlcQbVoOHLiVo8aNe6fk+XjcxiyqVfTU7ENgncLk3Mnat1K3/hy07X1oxRDGQsBChc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=TNMoshNc; arc=fail smtp.client-ip=52.101.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="TNMoshNc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lkuA/QxuMYMsa3qhFkCQv94i6fEYyn2PMeL1h/Hc2zFJfq7BMxokcuNKB1492+xgh+lAj5zYJcBoIwLh17cseoKdXyc40dfYyoZZo1PDLSsGnIpkqGrJngMi65cwxvbcCyy+VuyKDCJIq6j2s/59Qx+xgVkdowqnAIYCP7gfMoLzLJFCENLjukNliQ96SBwysKlk7IjhvucgEcGR0W1QRSEYqM1YZKSxDaFqPCaJilmWDmPArRPR4GMFphKz3UZpJePVKsnoVHfpJUmUXtdP7hcz3ls3Ijx90qpy7GN1UqNTIQg4Qy6gNlomKtIa5jZDSGIf7ZguYEnJvlqb4BY5iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ttnpnBVTNr5QbGIhB5YXiL0rUuNKQX4D/mXjDxjVIKY=;
 b=mfdvSE34nQZtwSuD4yRIbR2P12GgZvIBEKG+TnqyJLypzw6/7WweZt6h+S071Ff4K+EJLQhNQ0/RkLUK+LC4ypMhB/W1fGKI1n5YZB1NG2XBrLVt6qMjphNgSSH2ebORzzC2AZckONa2OWzdQTiY87SSubNFtzslyYbmjvAleycREd16Lk+8IsHk3/KyEQf9hUDHUmVFoWZMSmpg0Ww4miXwABrX7uiScjj+cZr6qCRlOZVOQLET0UXnNpwGxViggXP7O1TGKcLCHU6htVJkowLzpI4bMF29dBAeyL2Pk5cFYADfKnapPpGZq0tnqAyojrKclj7SWi2Dmk0z+OIwQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ttnpnBVTNr5QbGIhB5YXiL0rUuNKQX4D/mXjDxjVIKY=;
 b=TNMoshNcU2XCvGtF+qO+ARWVjIaAx1sRoJCPE5B9AxXqu4X9vfenLA3zZm704t0J8cBm/rpsQkwO47iZ0tO03VqyYFiHs6xc8A1A1yuy1Ze+GgUIDxtn75Xwdh9Nezefc+ZbIHlg5dva1r4wsLdDemNVBsnQUzWEf/YaK3rtej8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB13460.jpnprd01.prod.outlook.com
 (2603:1096:405:1d7::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:26:48 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:26:48 +0000
Message-ID: <87tsz11kjb.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 137/292] ASoC: codecs: tas6424: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:26:48 +0000
X-ClientProxiedBy: TYCP301CA0002.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB13460:EE_
X-MS-Office365-Filtering-Correlation-Id: 10f98196-498f-4051-383a-08de20b900b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?j6Y/nff2aql7fAFgjiApMz9YevnzBWBT2BoZTr/r5gA7SrWPxTc8ZbP2H6fE?=
 =?us-ascii?Q?GBOOYqYIc7ftKyQ4r5hsWFSM83MoeksrYgelR9OoNqs7zP4/tJJJg2990gHU?=
 =?us-ascii?Q?EIFOsqelGOZkK2O3/42FceXgHw9+I9bJP1AyXVc1f6x+UZNI8P5PLhfEp79m?=
 =?us-ascii?Q?vjmX57rimhoLT03ZHf9lMkd5nJnAUOvuHc4VNQ+0UdxCvrUA0BXgdrjv4eON?=
 =?us-ascii?Q?fxpJyJJVkxpixcGWsY0uOHVa1u8E+gFKDi+j/1VNsRQ+hqtJX2a+rFiScCGZ?=
 =?us-ascii?Q?GUmlUAU1tpuU47Wbg+FhYH80NINDtSJYzdg2zHBoXXVrm7267hX20u8jJ128?=
 =?us-ascii?Q?47Ay+fk2/Z7PEaWvrM7+2JuXuIlbDK3aXq9Kq+7IqrMn5dNY9e7pMCVCNwXZ?=
 =?us-ascii?Q?dkR4rlQglPTmJJ59yPnNTI4Yvf3IukY69AyTs+oFV77OOP6js3OyZy1lLcVr?=
 =?us-ascii?Q?cr8vF3lcLqZksSeSE177dNNSSkGoO5DERRxwhQbU0jzrwPfm2YJpjaIsHres?=
 =?us-ascii?Q?0pMVfDXkrgXjJHapB+PzzN+vrJOJPAlj2MUNVOIDYH54OTWlLi9OaEZWY3hm?=
 =?us-ascii?Q?+z503BdR/YGzTaCjV3LL2833rI3tAUrCRladsk8zuV39+c8we0kX9u7y9vno?=
 =?us-ascii?Q?PBWCnnxZMYZYXo58+arxvgzNuXu0JvUUlojcpp0RBtsTnSh6LmlNkeCaSvb6?=
 =?us-ascii?Q?oSQB0mbz71OTK4+a5Gl5QIsgrcS3qidzgXfI7KVqy0m9gDMfsaTxC+igHOjY?=
 =?us-ascii?Q?FdPKDF+OMoSk+VklYiFBH7a5tAa0dUXSRkc9dZwuwlLuuMUoW7j/ZPJMNw4O?=
 =?us-ascii?Q?viqIQ5pocjnPzUAQ9IS1+6K4OkFM+vUEkfzcH6WsqXfxYnfHSarzeCdsbylm?=
 =?us-ascii?Q?EqybjO6ZbIbbUtre1pxycWEb8AD+n5ZhEhc/n1Qq5R8V3xcks32z1xSbYQzU?=
 =?us-ascii?Q?j09XWVp5IGfYjIgq5qdb2ikMMffG5DIia3dXT3mYqsuJbaQ2EVYklJUM4zwL?=
 =?us-ascii?Q?sS+HG7U4DYvRrNfP5bWaV4018BInrbw2zGI2kfh+zSDi3ey5HrUWpqS6OtAT?=
 =?us-ascii?Q?DHalCQTyGWTzP8so4qF5L/MOH/oPJ0Al5+wqB+Y06098jlXgiSgRK8xWNkPm?=
 =?us-ascii?Q?hCFSiA5VhbkP6bJSCWq2chNW4aoxFuXVh4eyNEMVOk9bgVZaHR89YonOAsi7?=
 =?us-ascii?Q?1vYlf3K7DbQ9uzypj5e9hcD5yRvBndeo489h0mvX/Mki5UdltxA6+i8v/GY8?=
 =?us-ascii?Q?WlMhEfYQl0tYbgyfbPZZLr7UfbiftAlIyRZX9yayALQpmB1uPdAd5kGkM50y?=
 =?us-ascii?Q?68xADFM9Rd3gL6qQKy0kYE3ipXDC5wG/un8VzFc0HadlkLNEob9Onh8CeDvM?=
 =?us-ascii?Q?MhzwXNAjx7fb14xUPpTAtITz7kgZk3UyUbSBMkQEaAQBOx7qfdGEO8mhY3An?=
 =?us-ascii?Q?BwMKbNGYYypiFGfMyPTpWjssM8PVOR4g+4eiqR1bUid7KzamKgSKj5z4j3zi?=
 =?us-ascii?Q?feX3C4M/WAH8hPWCbUokUHpSO1A/S+PZH6Bu?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?837E452iIhuoXVz+b6YNmaRiFcfyfW5xi+41Bplw6D/shX3b0mUZ+GM3L5NI?=
 =?us-ascii?Q?1HjVsev4g7w8wnc/7Y1LjjK5hyWQ4CO9ZRVqhcBnuRJlS5EMSlo24E2K2TEA?=
 =?us-ascii?Q?kVRgCf3JJP/1xv3z2PLlRBrnh1UggRfXuwaG8ZhdHS9qNdNzwmqIy1/l25d/?=
 =?us-ascii?Q?1+ZNDvfkuI9fBxL1xfjx8bSf7isPBDRF/HPQLKUo43ddELLPP0wlLVXIwYPu?=
 =?us-ascii?Q?2EJEEd7efkGmv/nKkZqj958GIQeQ7ozPCUFl/it+/JMRGyNibZxHL0saKZb3?=
 =?us-ascii?Q?V+x5l4e9GIH3u/FSe3BVA2Nkaj8UH9iUSpgfZz3/yB3egMESKbW7PfiIFKQF?=
 =?us-ascii?Q?7R1BOda9w4WWGeE6sVU12jjNxV0q9AamXxL1zMuQ7P+msazgC2pokX0ulFxn?=
 =?us-ascii?Q?UumlsnCRHDMEvLrYuMZWdlMTOcSwHiqmP1iM7fRt3UIDOmhsHwFfvPeRVgxD?=
 =?us-ascii?Q?YoAtFPhHAQKS9mz3q5x9XItzGRXg7ll1KALJNsXlc5iF3a4hlyoWFAmdXTqt?=
 =?us-ascii?Q?HFy3iqGDGQEvrIBXTHhx/7UbUw477guEn6hFOGoD8+tBEIlVwiB1ztnxrLoU?=
 =?us-ascii?Q?oZk3wl/q2mTmbOGpL20xWtsE6dpwuYaiwKG+qHea/YvPlcC5Er/ml38AmEdm?=
 =?us-ascii?Q?44NXsF+eL3dekdNbYxYjHiZAErfXBGJvRDw38IOh/DstubzMFiY7ICjtkwXf?=
 =?us-ascii?Q?4eEIjrJ15OQ1q6fnTFB69Mf4DuXL7VpLhyGmptZAY/MNEt7gScXhCikUNurD?=
 =?us-ascii?Q?vBF0W4T9ebALGO1RVNUeaLXwVNIvr+l309f7Gc1pxtjM2frNvY4ZJUb4SzO3?=
 =?us-ascii?Q?ErYCp61IQUwkDErbyGiaulobIxDkKkZCwM5pnsX83lMx14by2/U72Kclr+IZ?=
 =?us-ascii?Q?+p2kS1nUnwWgt2ZChj4ovTFExab2uMGRCE48bAAa6DDAo6t2MVXNCmNe6mZ5?=
 =?us-ascii?Q?9/KWl+EFOvBjRnFnYtlvyKRQacW0I4I51wOplRcPACfZAdw8fsHZ8N+pQgex?=
 =?us-ascii?Q?+s+z+aq7+08zRZZnrknnNWxPiEisqF8NfiffUSto5OhXI59iOFshXP0+luP8?=
 =?us-ascii?Q?vA4JTS6whvzgkZDF7qVSv7Ri1D2kxRIRu3yTRpZZ23ZjcthK6hp7AwYBG+0E?=
 =?us-ascii?Q?hMYlLlbX+v2kAHVInQ29OS/Hlvzfg5T1TKnMSJk+s81fvPXyFmvrG17ajVHT?=
 =?us-ascii?Q?w7ANXuvNIbhCjPYX0S7/BrT7A4yrjijU66OOTA1M7IRbcyia2aJOtUiObuc/?=
 =?us-ascii?Q?ek3l3KOdg/HiXl3VqoCy1UAZXCKnmrwkSJaL5eRFC3zIWTZeEH1rRaXntXmq?=
 =?us-ascii?Q?dEcujOot/mVOywkE/9Ij2XFOYwj2ddfXgK0LNK1fSGJ+hsDePqPBOOXRQ4dv?=
 =?us-ascii?Q?BHJPrXesUIZTYqkYi6APk073ft3LQ+ic79fN1sRYb2H153WrcrWi+ThrEcpz?=
 =?us-ascii?Q?8NUN/njEFelTSQgMs0RVnCBYHUoKeGb9rTmy5XM2ZiBC8pnYZHXXeHIfqNlF?=
 =?us-ascii?Q?qa9mHpguymHpderquqkXj+jqA5Hzly8H0ooa3O+XlkMXUQwGKWhmwd4cQRiI?=
 =?us-ascii?Q?RvLOCsOaLfeSo7aYjIpsxbn5W7j44DyuYc3oQ7FYJQAL+wQPLYkeb4OlX8AL?=
 =?us-ascii?Q?W/7qNip3q8WwZUIgnPTVH5w=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10f98196-498f-4051-383a-08de20b900b1
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:26:48.7137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nkSPwO5/jd56ispxrUAvnNdlfdb1EGkT495AKtrpIYMO044RyK2gfmj8D5FBm46nmSu5NuidDOVZkXmCCfORcc0iy0nMyay40QGlNB2Vl2iJuAoBbCqFShQbsxdnOeO/
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
 sound/soc/codecs/tas6424.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas6424.c b/sound/soc/codecs/tas6424.c
index 9be054837f68e..85ecc246896fb 100644
--- a/sound/soc/codecs/tas6424.c
+++ b/sound/soc/codecs/tas6424.c
@@ -346,6 +346,8 @@ static int tas6424_power_on(struct snd_soc_component *component)
 static int tas6424_set_bias_level(struct snd_soc_component *component,
 				  enum snd_soc_bias_level level)
 {
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
+
 	dev_dbg(component->dev, "%s() level=%d\n", __func__, level);
 
 	switch (level) {
@@ -353,7 +355,7 @@ static int tas6424_set_bias_level(struct snd_soc_component *component,
 	case SND_SOC_BIAS_PREPARE:
 		break;
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF)
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF)
 			tas6424_power_on(component);
 		break;
 	case SND_SOC_BIAS_OFF:
-- 
2.43.0

