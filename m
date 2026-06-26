Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010023.outbound.protection.outlook.com [52.101.229.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C082580CF
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 06:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782454203; cv=fail; b=j8yxga6aQv75atOe/PXA0Oyu3xtHD1CXJkCFRXM82tZjBoNP7DYIIpaAmpTAcmBMPYJQKGRfULDp9+K+c/34WKZt5oI3XPKb9Ed76+Xa2apY2kZAqEltfGEVtMLyGzoFlw2nKW5BmztL/oVi9BRwx7Zouhesff36nUOIugbNp9A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782454203; c=relaxed/simple;
	bh=4/eXvnX8mp/kJUe1/cSTnKVCdRy6xWF+aNcYSF/0Siw=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=bWoeb2bjfU7mTveVCUyoSeN5zlm9HyZYrXaD8WpcVcYH+/3XVyfZNNZke6h23f0B+/NH7XRmc/7bj797IVJu9w7FeRTHPkHTsSsPTbLV1R22GAFeecvj3WXW6agD2skffz5I8D+OVGjoPM50jSqDmjXn0hoZiE/E1unOU7D24B0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=o+uUTZ8k; arc=fail smtp.client-ip=52.101.229.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="o+uUTZ8k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KigDq3OkyXElXbq++gEtwKx68uRlucjDr+w8iH0HMIwuoFmdH/JakDL+Rji1AuV8E7fZfAv81oKEUX63eYh2wEnZwLFN8rhUJ40ze4u2pzo4CnPd2s1VoBQnceo8lcX+UwDWWwYvTr+PxzJeNplzjF8Ycp1lQN9YDmOE3fq2MGNiRcllhRMjT9Lcpw6NXVvqInbvkYqJwl7CgCXYeXnRNNG3YTxhIgQGyuA74GRPeUABFgrS7QWp8EOW6l+jKkCChtGzfYdTP1ayaYl7KDyAgZ6XtS7bJFo2pMi0IgOR3k1M1Cx8JZ1hhby/msw45glggVPSNfIR6R5Wp+x1GjhVNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jbUFYdg5OxBR6Nm4QGp+jJHO9paP+pFupM++QwrOFks=;
 b=Li0SVFenRgFpOQXw19CEqErOJ4eYiJyhwFOhSKjQniOzgIHQenfzShRJkjpgJvviAJlf8xtL90+V5VeTn5r2Tg1hsfPrsZUfLEk9k/9uYuXyVvMYHaQBbkz/VUtgaQHL9GNKWRci0e7SbZ/9QXqPBNxcDfYtQ0T42AcbmVs6cZXkZe6RLVAYbaTRjE/UUoHjBPIFtSVOgpi59H87jfHjXTgoe2wyD8Lz6EFhOmhm9XFf6UnoaZR/VRhOELZPDyN1/vWlxdPvyOfqrQ7mBaT+VBpVtxnHq+lxQPBdpuy2y+uq1SclizpQwWCgrbeifsWRtmevWImx16Ha0tyis9EGDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jbUFYdg5OxBR6Nm4QGp+jJHO9paP+pFupM++QwrOFks=;
 b=o+uUTZ8ktQsz6o5ESmliS5hGoiQKHjQvFmJvOdTcrrFLeQgILVrHviG4aRYCNHMIUR6QS5bSA5ttfiITecddwZaGJVfmSlVaNDHRhNjuIeu7bEvoqjTqdHLLxulsHnSMfqedouC5dwrPafqeTguN1fYZOvkJumX23jELErd28TM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY7PR01MB16025.jpnprd01.prod.outlook.com (2603:1096:405:2a9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Fri, 26 Jun
 2026 06:10:00 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0159.015; Fri, 26 Jun 2026
 06:10:00 +0000
Message-ID: <87bjcxessn.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 3/5] ASoC: intel: avs: pcm: use component_name for Component name
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Takashi Iwai <tiwai@suse.com>
In-Reply-To: <87fr29esth.wl-kuninori.morimoto.gx@renesas.com>
References: <87fr29esth.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 26 Jun 2026 06:10:00 +0000
X-ClientProxiedBy: TY4P301CA0045.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36b::13) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY7PR01MB16025:EE_
X-MS-Office365-Filtering-Correlation-Id: a430674c-cdfc-47aa-bf71-08ded3498e18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|1800799024|376014|23010399003|38350700014|921020|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	6bd01JAFcN+LdgBN7dR4eYg/ypEyLmn9uCMTaJop2tNJoxg3/0f3UMF/IDQxVtR2Xn40C7jX3zSYSLuJWNEZjbr+AjXW90zpl6cANJIUQsOXX1QM8z+iARySn2O8xf8xpePDkf44VhrVfqPkbpGlANHbEaR1KPZaHeR8leg0EEtn1v3+DH5sV6qh+nHxi/FL4xKUtYN0CdbD3cPgQ3dw/OcDmsEc0MYS1fU0hLVEs5fF/o/G5oOq0uh6oYjhXn2jyD4FICJa7bYgFbmWGk4QuaHdnCv3dhlEi1/r0v1wNGnMf2f5J0RK37SpmszV0OcrsByqvHrWNW6RLSHnospajUWLhcSTaFU8IdNLtojQa9sXjEu+WxO3zdda33oRVYKFWXV7ZsMv6ipH2DXOgJ3tPyEAmF2229F8fjPSSOJFo2u4Bt8ekJX7ClPA+z1havedBrnBXFeumOv9UoGdBabc8r4sMRAHjjYKpZwUG6nUWzzYdF8oh5noaST1xQ6Ob5C8kyGsx/uFv4hE/Y2j8EqJXjviay/nZ3rB+vzTnii3kgHqznMVfP3P0FR3jQyVjFZ+d+MJAqnBMooaqoRkIYaM93vK+FWmIQaO7gdtHmEkeg5t4++fd+Xe5HzfapoBZ3Uu72+ANAJvsW2H87Dc3gpxg1B6AvK69JSHfa8epOyE0yngwM2lQ+XFLvfepO2MOEYVZ8RFo2l9UmdUhHwHGdwwVZpFZqoSFGmfGdIw34XZ3IQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(1800799024)(376014)(23010399003)(38350700014)(921020)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?y0XzM7Ilm3d62wm0uN7Cl+X54AMxO/pyJ1rbZPtOCtbHgauXBHGPxXbo29eg?=
 =?us-ascii?Q?mLSvI/RtVh0k1LEDzU08siRt4eCEsPoS85hwGwB070r604f6/xO0MTQLDw/q?=
 =?us-ascii?Q?u23SOdnGXjKhZjptyBiYQwRpH6jTlQY4Zx+Kb+UqWvVN9j6MpJMhQQlV30h0?=
 =?us-ascii?Q?Q7qpGo6TFPcCEYVBPV7JlKdjJNK70EM1QqEBD2Q0zeWwFLiMJ4V6M36AIl+8?=
 =?us-ascii?Q?QybAwixpRBIiXKgLpW0tYvePkNzF/skbifT7z1Q0VPx2Tonr9IQqAJJiXj1m?=
 =?us-ascii?Q?HW6tlfEJ98Lt9O040I8rD6qIi6iU4dJYBCP2A1e0+D9HR3tlSlF+xbSOzWy1?=
 =?us-ascii?Q?i3ECbcQr/K2uh6WJutrMLgDL+fB/sRVCJVLJBP0UhK9qUzBAD9fs6ozIwyrE?=
 =?us-ascii?Q?dREGN8ehV+bdSyDUWB2ZDKVGZLySOJt8k22Kk9D06/1nGef5wURHhC3X4wS/?=
 =?us-ascii?Q?1lOofsrjxwayw9LgOWbL8FYnDcMAeemUp4hq/vBX6Lo5LdRjauzMgBfsiFrA?=
 =?us-ascii?Q?QC+YeXZGL2x0ZJTJ25Hmqb3Y4iP4pm3AB2WTGg0dd6h3GzNW6hMlTcJxiKoN?=
 =?us-ascii?Q?j5GCnQKW1lXqvzoRQZ8Yx4YTIiPsb3MpTt+eRD/+cE2ea/s87pERKa2e4FQ3?=
 =?us-ascii?Q?YgmISoVrqNGU7JXb6RaSzodDTg8GVg7tcyx1vx892KAM/z+331pH/Wh6pQEy?=
 =?us-ascii?Q?mxya/OtuH752ZBDwiKNyAdMs103yDrmmNNHORQ5ba1prXVBGCkptcNvuVJcH?=
 =?us-ascii?Q?a9LpZJnyX2obimOeGGPPfhlYzJ9OGLBU27FUvza0jGxG2wc7L1dUZBFLpaqD?=
 =?us-ascii?Q?b0C8YsAG8rJL9LW6R7pJsIRVcuO7Rlhinbf9CPJXiuBMaYC+vKKHAcy7paJU?=
 =?us-ascii?Q?vFawf1Y9WNwZt9/S1vsk2xpomyKIt8lzzAxhEY5bg0GdBFHsCCCslSFv/S5P?=
 =?us-ascii?Q?wvZwgdMeSd1/6+DNu9BDwYwg3jKvez5j0b9XiCbGgC1mk/3BhhZ11mAW0aYw?=
 =?us-ascii?Q?rY7OPrzboaTU8+v71JYPGySYT2JclxaGzVE+ozYMPkCSLjbw5wWhpaONRMhO?=
 =?us-ascii?Q?oaPxpKfgZeAv1Xgj6cPoA7jZeRhqtM4gquYtVtgCDcfg9INdcJEZnAumr3H5?=
 =?us-ascii?Q?HD911fdElwDXmwc+3xOaaHK9F6J3f12NmveZFMF94mkltcdB18SM+ybQbR8V?=
 =?us-ascii?Q?5pWfZzvZSBYQAOzP/fQBZmwnoxVS9LRxS1lLdpUUWQoaxgssXiKU6XX64INZ?=
 =?us-ascii?Q?sfq5CaAorAKJD8LEE4budVWnUsVwygQFQdqeVkv5/8+jGAbjooeECRudDuQ6?=
 =?us-ascii?Q?pdPWfRqsdoUVnRbO67Nhb8hJh7LuIMnTtGsAlxvnb1vGU5Cz6warXayWhvn9?=
 =?us-ascii?Q?FFA/KAwQau1sZV/EZ51MIQkfvsHblMh5xpRgPn5DG1S+rtbLggIboL+PdOft?=
 =?us-ascii?Q?xWzMzDMujKUr4SOgUcqRTuVWBmto2XD9t5UcAzB1PD5xMtRrBy6/Z9Ro9965?=
 =?us-ascii?Q?FWrjBBPIkzW48H5eiJ/+y7zpWC/ZZJ0wgSgeB82ziNfIzrIRmZ1BzRLf6fcC?=
 =?us-ascii?Q?ni4HHXHaueJyp6UebxFPxx4fvcMyeMQwawCL45pafFr37Y1RlsgwTOmacQ0z?=
 =?us-ascii?Q?Vje0GjDlKRz0b4H823K18ALkaSIk+/bTexNeJqwc6uDiLmH1HrPh4BxTDNbE?=
 =?us-ascii?Q?/7rz4zP16oXMiNbyQV/WSuNkTEKsge4+P8tTHn3Kejd01rZO8RZHZQEdfrsX?=
 =?us-ascii?Q?0jlRMJATcOBIyaJ6Y1aggtChKZUNETq6UMbvJN0eVfPonMHU/YTB?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a430674c-cdfc-47aa-bf71-08ded3498e18
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 06:10:00.4791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QUSOK1QoiNQqGT38FPctN6GZh2t6TKe1+AE1sf0QeifeHDGw1aK/v8CfdwK+6EWsjNnjB5ujxfZlELl/nAjewf44Pl+JVV8jkVN2eYNUAkMiZ76ah9UezPw3eiMRXSjL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB16025

We can set component->name via component_driver->component_name.
Use it

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/intel/avs/pcm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 797b9c9163b49..1a0b7cd26d9f1 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -1393,8 +1393,8 @@ int avs_register_component(struct device *dev, const char *name,
 	if (!acomp)
 		return -ENOMEM;
 
-	acomp->base.name = devm_kstrdup(dev, name, GFP_KERNEL);
-	if (!acomp->base.name)
+	drv->component_name = devm_kstrdup(dev, name, GFP_KERNEL);
+	if (!drv->component_name)
 		return -ENOMEM;
 
 	INIT_LIST_HEAD(&acomp->node);
-- 
2.53.0

