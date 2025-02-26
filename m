Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010065.outbound.protection.outlook.com [52.101.229.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7FA267AF7
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 06:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740551385; cv=fail; b=PIUvPQJ9OiHFkIB/2pyf+jdIM9nbaaEena3HfwUkTA1RbeKfub6q5dgNRUydQVQzyJQOxblpyXNA9NaZTLE3sky1J87vjqJ2BeNXiTBf50N/cV6PzyeHEqcvLlLH9BUSvHwkaB+4Bv65tryRRUgfyHeU9eU7LFiiGx/RJ0FxIAU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740551385; c=relaxed/simple;
	bh=dv/PKhvhObDsuhYjgUqBSAMTfG7z6EaNB+Kl9Jufw5k=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=pMasOW66BmHw0urFRBqvsOvA9/hXkKJnu9RjoEPDFSTSkOONUPjGijarIrsnJfxZUdAlM7JBuD46d5Laf9BG8CPMGg+Ahbx95MfXs7rN1Aam/B1C7Ksq8jRAawayn9rIOu4q4uazEMTlvH99xrjsATP8SCqM+hMDy9f5tm6Omfw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=e10ybtIi; arc=fail smtp.client-ip=52.101.229.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="e10ybtIi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NTF4N7IzUCD+VzneFXzd5Ht1RVPy8CbqS7V9gajoBLYXUsG1ML2XQ1k5YtrpkJOCbbeeOf4G1rE/gvNCvRA87pxmh93a7rVW+rSOC9yzA011z+GpiFwKunhb6zjAAOA1jB5ytjX6+HHmqu+1SnulkEK1Z1LLbSEAnhBd+QgieH7eUGXmsAI+UMN5aSHkBQ670S00omTK4UmunvlRASKt9TUMerMtUB3fH5gr+7DCy1mLFdQADqi9mY9NGaC/VymJW+Vu940DiG7GxFbG6/49EFQwH/GmVJslPW1oI/LdPrOXRiCtfyCGr/CW6P00+FZ90s0KrqlKytOD2JxbZ4Ua+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/qyOTGaKxbR9fGJohqcDj3axmOswyYNX0vz9S1noWPw=;
 b=u5QRiW6Ws8nNiyyxatwjCz+Gvb9yrZx2x17K983OlwxeUfQyErKvanUH9mDDQH4nmvKkRiIrI/FM2DqTBSPFsUQOVR5rc+YZ9Wjezn4CGGdpQm+/3+ptBBaVXfi25vIzB7euu0Q3LffeLhE2KTnjzFQr5IqulpZpDum7f7biQMbyTvkZoE/d1U6zvuGBBbaVpttLuOPeDR+lX9gqmgrf95gZ79pUcwFZLs4QLmosuxsh8Q/HP3mOSb/sO342vDhuy+al7n4mPi+hTyZH0zH57U66SkFQXWkNIjeejnlqOlOfXUM4kr4+/vvE/xbXge2MoHYxbHFFzs9Ak7Tkt9u30w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/qyOTGaKxbR9fGJohqcDj3axmOswyYNX0vz9S1noWPw=;
 b=e10ybtIiWu7GoUUqiuJUJermZGDPZTIetPkZTwE2BMUiE+inh1AkgUpEBF6XR8qt1vK9VYjZQoxsgLiw10l8YVKnHG9uusNTklmy1vpSbzIl/APjcRXWtT6V+WcnUOFtDmZXBdB5g/goFWs8p3FATaG3NkJsUAmV8xsOV0zLFS4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB7993.jpnprd01.prod.outlook.com
 (2603:1096:604:162::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.22; Wed, 26 Feb
 2025 06:29:40 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 06:29:40 +0000
Message-ID: <87cyf56wx8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/3] ASoC: simple-card-utils: fixup dlc->xxx handling for error case
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, Thuan Nguyen <thuan.nguyen-hong@banvien.com.vn>, Detlev Casanova <detlev.casanova@collabora.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <87frk16wxt.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk16wxt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 06:29:40 +0000
X-ClientProxiedBy: TYCPR01CA0165.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB7993:EE_
X-MS-Office365-Filtering-Correlation-Id: 1859b66b-ef16-4138-de20-08dd562ef301
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?46gpKOH6u30Jw/QImlJtVJ2KLTXdDRmfrQM8c/TJup2NKqDSsYyoEvHFEwmz?=
 =?us-ascii?Q?XBPhLZF3qfi0rxdROxxx41I6R2UChfSGulp+bheXz9t/jikhaLZC0XqdHdPn?=
 =?us-ascii?Q?/ZkXeXAVZwvEPvyNG/2Hte3xfh7VnwHeRyDJCBwbixFB11MtNdFitHM+lLwn?=
 =?us-ascii?Q?B5TuyWCCmetV0z8WWlGmgEsfMyAfMFdS0X4HigwgYBp9vUQ+q06ni+kPtscc?=
 =?us-ascii?Q?2s5/4Olv4UpL2rnA63u0YHblJPfQgVvZppLFDcOzk6RRCtUn+2Jm+B0nhP3A?=
 =?us-ascii?Q?UiMx0WAn0NlkdgAqqHtmiW+K8QMzkxZxaTfHapb86t8+507+EIXtGAzdgTPB?=
 =?us-ascii?Q?GbRgN1oh7yNaEYW7CnhaluWf1TmNCJPTT52diXfvRzgeGMnfpFW2xWYOS57X?=
 =?us-ascii?Q?KLy6lGQXsIkTDZUgGvBpBrzUEuXF/kDTiPOROWsBy9BGzuNPRSANqv8rJxtI?=
 =?us-ascii?Q?oS2iyl1AjMmQJI1rlfpyyAWaI1GgP7zA5L3T+iV8yP9lws6+jv5K4MDHPiZA?=
 =?us-ascii?Q?kvT0ep6g+Hd8NX98zqOOi5dDq2qXdJdt8zpc7iCE8nPnYWT6f6zcIvFoMrsk?=
 =?us-ascii?Q?h2i/e/GpReVEitYPyTUJfISJrhGfvz7vvugEuIYfvfPfsXdwWW0WPSkDnohB?=
 =?us-ascii?Q?jB9ZwG2E4t1N67AujOvaqsM/N4gE78Uhywj4RU3p49S9HPaozlunTge1wguV?=
 =?us-ascii?Q?VGdWB+UMqextDI6/hWk9fpS2fr+J/3Aryl+Hstev/YLA8e7XJme3HzofFKfq?=
 =?us-ascii?Q?xRvkEuKAz/mr3zhns1YgLoRjw4hseFe6e5xBkrGNt8X7HoT9If9HCchuBecl?=
 =?us-ascii?Q?kSRw2jEA/pGM+tNDls08m/2X9ty+xGtChG5YCR67lr2wIJT1sdqH+oGk/A0l?=
 =?us-ascii?Q?xXPP7GkxqUf48uy6NPjNgZMW5/esdjIG7p1vXzNYV2v6t90BLgbWWeA88qTy?=
 =?us-ascii?Q?YgtbHV/it5TjvQiYVfVfYOUA4F14ETgCZk782FdQ1Yt6pmtGjS6ItLfyO2/f?=
 =?us-ascii?Q?FTdcgVTKp4HJVQVKKYKPEhChq08ArVyv68aqRKocYV2m4p/NJ62mbLxvjPg2?=
 =?us-ascii?Q?cA//NUDIExPXmywlVm1qbamUy79RyRkCQ0eE/Zv/yomEs3dkXf5bJm2pzmEW?=
 =?us-ascii?Q?c/hHupUYiEXWTGz/5LBhPyKBmVFa07OiUrFSUbK8QITtOSRb4JKg5NN4T4S5?=
 =?us-ascii?Q?d8JZ1w9y10KA48PTxqb9O+Hku+xwZSF0FmkJkEzI+JujHa7qlxJYVjnS4680?=
 =?us-ascii?Q?VFnKWx70l0/eHQ95zRCgThOtMFwW/k4MIDOiE7YU1G6HWWiLj9/4IjkQJYyy?=
 =?us-ascii?Q?rbcjyA5L6TNABl8bViiJV2Iy+jhXv8tp3yaXkts59nR+e5M4yRO/JsR1I7a1?=
 =?us-ascii?Q?Yr3yCyebXLwwLeAOJZe1djBxiSNTN9wAL5kl1wZqYQesIntRwslL1n7c0fSQ?=
 =?us-ascii?Q?a97Xuctb1Do4brHY3w9FKcpI9A6nCXzK?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?aeMtyFo+IDsksRGVLe3+PxUpNO7seeFEIDeX/68M6s4Tp3Jw2ID4xxUOT0e8?=
 =?us-ascii?Q?4S59qd0zU8DWjIYvdpb+NKApItnak9cq2mpvfz51gb/QxI4JiyzfB8GxED3N?=
 =?us-ascii?Q?W5BQ96kajTH5fXSrfcljUhy0dwSvomh1oLYSYyR6GoEahLcQc/76vR+xFm6Y?=
 =?us-ascii?Q?C1NfsVN5gV8xjTKHQdHxOxXeabVfkFxBQbhmCS+9mf2RZLzGMnb2cE+ot4GK?=
 =?us-ascii?Q?Jc8rqlfRxDY071CwyzXgN5WdbOlDrnNAGYtgxQrzeKHIufNFmlV+n+UzHIoD?=
 =?us-ascii?Q?4IG1QDN2byKL2qedh1qhVcxG7rKTrgRc0O3b41vQLxLohtUDxjKqPX0s6ipZ?=
 =?us-ascii?Q?4y1zqU7h7xRSnYd3egx3Rgz6vJKCY/M0cCX0rLrGBC++Xe0r9saF14b7ilZb?=
 =?us-ascii?Q?lbwn5pGamFa4C2FLIK11OtRYZKbfOekYqYvwp8XUDFjxgOJ+stdu88iAVEXK?=
 =?us-ascii?Q?eIvWubBQ8gEq1z8Xf8fQ4hn6PM/0YFICdcGG7tY3Abln2H9UKtRNqIg4ioYh?=
 =?us-ascii?Q?gExPyK5GB8i4jZ8s7XzEL+9EGXb3njkndJMUSYNzzoSaKPsYcj7z5rywNffF?=
 =?us-ascii?Q?d1t/bA+nN4rBs5zsRWm0JrAHxU4SF0rRQSeka8uGjUIsCnwWcVZ11VqtbYBr?=
 =?us-ascii?Q?vvcU1o4PCBuiidiehMtu2xiBl3It1F091bguilKb7Nz76FsURsU2NwCrmoQE?=
 =?us-ascii?Q?egW5Pniab0Jhim8uMS3sHoUhSRlwTHlVO2ccHVtvK8oumhqFPBnCr7ZR6tRb?=
 =?us-ascii?Q?eXH7zwWhUt5VodHavQZEcWGEkiaeJ2kPGuzZc95Jk2QLYyuIIpgzZEe3dQP2?=
 =?us-ascii?Q?Ue8Fo0pYPqvAJ9ubnuANjF97gJFjVP8cD3/uehQi8Qg3RuWFqhPKN86aVewY?=
 =?us-ascii?Q?nfAhsauAvWdtls9BP9RG4lLdUy1zRhOJWSN39B8bgcYWrhs1QuAW9S4xIip0?=
 =?us-ascii?Q?FkEGr0gqAxPDyhq0k9EOQ/QeEmPrhDV0s7+8MYCDGCi8TIF0TM5SsoS0VgjQ?=
 =?us-ascii?Q?+wWcCRCOJQK8QS2VEXrv52e1EChjOxlhl9KJ09UqvNQfSqzScWn+9n9XgSoT?=
 =?us-ascii?Q?2KhKRctVWlcHh/owYsVnEVmCH1sS8Wjm3OQlKavEfsen+hY+z7PZwex6hd/v?=
 =?us-ascii?Q?Hlzh3vfviDRshencTT89/WKCphlJLq1AeYOjgdvaXujUVfzTx7GNmueBQyor?=
 =?us-ascii?Q?Z0EUkmnBV5AyIq6GLQwf3YuvGfJqI0nBLR6pHv6N/lnV8FHrIy19VS6h28TX?=
 =?us-ascii?Q?Wfk6WWsw8c5CsX8xPbzJCPBydSLdc6p+3mR141SLxYDBFlSp+e8GrvQRheJA?=
 =?us-ascii?Q?Q9tfAsAuA3DRRDtWEe4qPvNNlzK4kBIKY+CbsZhSrYjY9q8W3OHhv0eP1VzS?=
 =?us-ascii?Q?DAMFVXGup1m4effUi5vkzFI3WTXZ9866uEM1jJZkJ123Hsb73Y0QH+wiuQlE?=
 =?us-ascii?Q?/vteH4qy05ighc1WD5BjVCFEB8ygiozy8jyTFpnnscnuP0CCAk0P+1a+nmgD?=
 =?us-ascii?Q?pZH2B3o3G0iAabI/HF/zSI0fN76A3ka2Y20o7TCpJ2VBcODVk//b9Se8R5lB?=
 =?us-ascii?Q?K45OAResPAZFOy9P1W9LBMbM0SgB908K25PncmmI6mXSuwAaCR0ySSZNWnxC?=
 =?us-ascii?Q?K+9WbkvC0T/d62It3cDBoGQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1859b66b-ef16-4138-de20-08dd562ef301
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 06:29:40.3193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HUjGJM2Og8pEkYJ7mg7HPRO32NM1h6cGhf6mioJj0huGfSo1cdLwkvMUY9Rm08A+bKyFn1ITjCOBvOt07J+2uvXsqXIxfFB5EFGJ9ciKBHA168bVBRB1IAFpm94fMVRl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7993

Current graph_util_parse_dai() has 2 issue for dlc->xxx handling.

1) dlc->xxx might be filled if snd_soc_get_dai_via_args() (A) works.
   In such case it will fill dlc->xxx first (B), and detect error
   after that (C). We need to fill dlc->xxx in success case only.

(A)	dai = snd_soc_get_dai_via_args(&args);
	if (dai) {
		ret = -ENOMEM;
 ^		dlc->of_node  = ...
(B)		dlc->dai_name = ...
 v		dlc->dai_args = ...
(C)		if (!dlc->dai_args)
			goto end;
		...
	}

2) graph_util_parse_dai() itself has 2 patterns (X)(Y) to fill dlc->xxx.
   Both case, we need to call of_node_put(node) in error case, but we
   are calling it only in (Y) case.

	int graph_util_parse_dai(...)
	{
		...
		dai = snd_soc_get_dai_via_args(&args);
		if (dai) {
			...
 ^			dlc->of_node  = ...
(X)			dlc->dai_name = ...
 v			dlc->dai_args = ...
			...
		}
		...
(Y)		ret = snd_soc_get_dlc(&args, dlc);
		if (ret < 0) {
			of_node_put(node);
			...
		}
		...
	}

This patch fixup both case. Make it easy to understand, update
lavel "end" to "err", too.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/simple-card-utils.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 79fdd57a470c..692bafca55af 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -1119,12 +1119,16 @@ int graph_util_parse_dai(struct simple_util_priv *priv, struct device_node *ep,
 	args.np = ep;
 	dai = snd_soc_get_dai_via_args(&args);
 	if (dai) {
+		const char *dai_name = snd_soc_dai_name_get(dai);
+		const struct of_phandle_args *dai_args = snd_soc_copy_dai_args(dev, &args);
+
 		ret = -ENOMEM;
+		if (!dai_args)
+			goto err;
+
 		dlc->of_node  = node;
-		dlc->dai_name = snd_soc_dai_name_get(dai);
-		dlc->dai_args = snd_soc_copy_dai_args(dev, &args);
-		if (!dlc->dai_args)
-			goto end;
+		dlc->dai_name = dai_name;
+		dlc->dai_args = dai_args;
 
 		goto parse_dai_end;
 	}
@@ -1154,16 +1158,17 @@ int graph_util_parse_dai(struct simple_util_priv *priv, struct device_node *ep,
 	 *    if he unbinded CPU or Codec.
 	 */
 	ret = snd_soc_get_dlc(&args, dlc);
-	if (ret < 0) {
-		of_node_put(node);
-		goto end;
-	}
+	if (ret < 0)
+		goto err;
 
 parse_dai_end:
 	if (is_single_link)
 		*is_single_link = of_graph_get_endpoint_count(node) == 1;
 	ret = 0;
-end:
+err:
+	if (ret < 0)
+		of_node_put(node);
+
 	return simple_ret(priv, ret);
 }
 EXPORT_SYMBOL_GPL(graph_util_parse_dai);
-- 
2.43.0

