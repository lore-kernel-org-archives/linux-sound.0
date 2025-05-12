Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010021.outbound.protection.outlook.com [52.101.228.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4F61E87B
	for <linux-sound@vger.kernel.org>; Mon, 12 May 2025 02:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747017217; cv=fail; b=K/RVdkN219xwx0YX36pRtKLL9CHCfkCbsunPBXxu9szuTZxZl6T0YbeJyXnh9HDCHY/m4iaOzflzhUa4+jO3ADeUiy+Gf4AOvgzQJ1QOHjDDCy8VES8BmMftnD1fMeUKXyTmrXnNQkrUBOQRLXTHyqFbRl/hS3B7v4hJJAujtP8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747017217; c=relaxed/simple;
	bh=+WeAFqW4164WeR5PT2HE0CKPwNY6dCC1oRhmV+ta7/4=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=b5FhRDziitAc1VggCjMaK0q6yjO3yT0F68ZEofJDQq6Ig86PW+Yo8oBZdWCgduVBwijVLAI9cCcXvTVV3mBOlk4cOdRuTBmd/Tx/uK0TtS3zL7/irbleFItFiNPwZb+oFKl85Mtp9s/bPm9gO4huVmWdhHQGK752a/dvq7tbstw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=a75Fh8bU; arc=fail smtp.client-ip=52.101.228.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="a75Fh8bU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FK+CGSnZX6rvxLCyJYhWlXwi3dF4ZgNbuioJsv0teezKO/Iir1EeYoDKavcVvf886Dlk1L/rIaOku39nJSfhK9bWzCuyskXLqLG653H60nWVHFhVRFS99MUqyw7QVflR3d3c2S/8XHPoOnIgPGGp7sTrKHKqXaXGGPU2FbJseehsrx0hYOAd+kcNsckScyXiwV+nwUTjpmv2IMBtNB4mwNw1G0iywjU5yOsdf9MQF+HvZTIDDd3b3kwEv2wgyrn24DTT0ebVPV7HHPZRMsYz34iSOVnhsGYpLSU5CiXkEbouo218CP8PQWOi1swF8faoun94IcaI5xTUnQXooBcYQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JI16Y55FwxEet6Xd0vkhR49el9u+l3q82In4yLF6oN8=;
 b=gQe4CuSruUe/U+uHToH2wiEqCsbfNMgkaHSVUK9x1KRjZh7dSQkLZAi9Z+F933fwpQnBFAO0Ir3S/z3o+j6vdfH1WhJLknAG43tafsPHBxtGrdvyPDZ9YVBoTpeYOWWb/UHPaT5H+mtHR8fY5l0nMh62R17SejRLIoFxrAi075+cxMTBkschM/zoBbWmen3cTuxECv6UzgDLPneMyRiULqleurJXOktaZkAPaP/uKByjdH2gF52gh6iC1SKPKAmMDy4fCO5tWgRphsspx+reVlYfnu6r6rI5KE+UzNOtydESEww/K3+JiGwRAqca5JjgbKxnCQ8kXXilCldlvAydHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JI16Y55FwxEet6Xd0vkhR49el9u+l3q82In4yLF6oN8=;
 b=a75Fh8bUCcGnsgtlbjtZ7DuQUlF1I9HL0GWkrlJffgnC9z/KP9c5sPP93/WObD9VPtbA0sPPR8RjPerp52mm8zClUpBcP8LONYOAxSqcMcFfUvlBewxHAJoUrGrz4be6nY5auHqVCELhVsvFOv+SsXnenZLXc4kwGiyROB5RkQE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10948.jpnprd01.prod.outlook.com
 (2603:1096:400:394::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Mon, 12 May
 2025 02:33:30 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 02:33:30 +0000
Message-ID: <87frhay2va.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: dt-bindings: audio-graph-card2: add missing {hp/mic}-det-gpios
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 12 May 2025 02:33:30 +0000
X-ClientProxiedBy: TYCPR01CA0177.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10948:EE_
X-MS-Office365-Filtering-Correlation-Id: d3468c91-fbed-42f5-cd4b-08dd90fd61fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SwtC9cWchnQp7sDNV5PRNqgBESZtt7KATxEGfxH8Ro1Xf59qaoRniPNBlbuj?=
 =?us-ascii?Q?KPwKfCcTqXPqTIoMNd0pWVgsUtQfLxhJKlCVHwTGWo16ticA26qvZ1eX+YvC?=
 =?us-ascii?Q?AuLlk/HwMRoGuSvLaB2EebGaD9unl6wRa2KLqtOq62QSqEa9Z0Xm+VDF1+ik?=
 =?us-ascii?Q?efTOEPf44/4SRGyl0SlRvyW+aCcSo/UfX3L8toJsjxHtMQgCLHH4okjspsSw?=
 =?us-ascii?Q?cf8uTZ9qKV3IAE9dH7x3lg0gMnqPMrpTJ3pGO1z8z1AfSZpQM6mMdafYJqPM?=
 =?us-ascii?Q?GkBm85RLsAOZcYLmobLyv2otnfglxzVXQ7XHm7px3d805+1UojxqfSYGlvus?=
 =?us-ascii?Q?kG7Ikp8nHollw6kDRtuz0iuAaumWZbwz2YQYXut8QvNIR4dd/uMoLNpRgSll?=
 =?us-ascii?Q?g77fMpbeREWLZfdoObC/w4C341fyiaS7lWJFZroK+4I3nVZfCHIHQu8NoBnf?=
 =?us-ascii?Q?2pqVfjFZkaKOHAFOHEiW08u0gLG5nvfQSaumeXoyEpkZiuBAkjck5b9cImXm?=
 =?us-ascii?Q?LLpSwga5VPEifo8GQCW4SGX9hhGLg7pq5NyfQelmpnLUFVt8+iWoB2Qps1ZF?=
 =?us-ascii?Q?YQ1TeiRyXak/s8+Dx0d4mI0i/YxrYWy60XPVWdXOVl/E/UiNT8uIlh1zqQiG?=
 =?us-ascii?Q?72c4VYDJoN7wIaicdms2mmEPxKSpFqV4uurnjsBVBgorPdfp4xnotgpo6VWY?=
 =?us-ascii?Q?6+rLVWcY0Mwq6X+RdAbP2g/CrE19mEvO5Gn+XdFX7cM/Gio4zjamUx5FC2dm?=
 =?us-ascii?Q?hpPWGu+GoulDfjMgy0mFPWQNoSk/VjO4ltSdny4G8IJBo1lw9R4o/rmC/DKw?=
 =?us-ascii?Q?UR303GfskS51Atx8ERbTI9F64u2xaNq4VMG6iBaroOWFBbmEmQeSF+I2tJa2?=
 =?us-ascii?Q?BpJ8YPEb+/WljJm3o5SWVf+9gAunObMj7u290/sNeUv2dDCIvXgOtByx9mhB?=
 =?us-ascii?Q?n8rQfGWKcf7qYkpia2PswBWqIEAExW/pGZ68tjfz8elEX+XscKjGJRUETCE3?=
 =?us-ascii?Q?+zX9yA/Ya0rtut0Lb0zL8zEFnHIpEGRhWJwGArph0bivY4UrcpadJ7RTDlGx?=
 =?us-ascii?Q?4Kviz43dLZpBHMaI+N43/hmqBo2oKxNytz4xLg9Myq6xupy7pTwonDsMhWNH?=
 =?us-ascii?Q?4TNW9PhsjGIlYgY8jwrJoUdYtL7+kBq2CFb4Ln9grSy8Yt8W30Sjkbgcj1zA?=
 =?us-ascii?Q?Jps2XEJ0fJCe+37E3nHgJ0ENY6aTxmgRNElUTHEZe8GrLyiXWT7/4T+QYruA?=
 =?us-ascii?Q?RJhDNEYUiDdlOG7Vq+ZgzB+XKEIbhbOoFTo1T2LdOfDjbRTbZgIXpIeNC0Lr?=
 =?us-ascii?Q?M8cDDPYCxdldSVXzmi6Zf6L9jk79qJ77NTw+8IjKcTEzU2/nJWY9Q5tplwjz?=
 =?us-ascii?Q?UMWsCekJBOKJExl2uW+28N04JWTxiOoWFeJBIdP1qeKrwt78Gr7iR8zVwrv1?=
 =?us-ascii?Q?rXcW3aLkbr11ec8IWJI5Uv+g6d1OBUCRLlkNs2Pyi+K95RQ7Yf9g3Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6RzLTqgtULhzwHo8RtyMTtg3WWvZnpC8KjMqNrLgDykP0n0WfvfF68NCKP1m?=
 =?us-ascii?Q?9vWGeArMEyjcN1WkzQAk4ET8kJFGW/n46xUXtCKeY+wtKcK1XzQ/tdNJi/vf?=
 =?us-ascii?Q?auDOu4ZP+bwWrWy3jxaY8jZ7ADgi17htclBpcKpLMmooat8oUGO1oHmz7HKW?=
 =?us-ascii?Q?NQnG/IZLjpNgDnMYKEAlb9QUXmZtdbeUY3/13k4BdPB3223FGgGK3rHvsf5p?=
 =?us-ascii?Q?t/LQfzoLM9t5z1X8n5MEeIM+g8sqM2kjpej5KZ2Z3QiUMyLBbgDnYZ4DmKTh?=
 =?us-ascii?Q?VAkeknzPywG9srZPr7L/qES8tFMG+BfupClM4B7xMiX8fvavcmBMCAKh9VlH?=
 =?us-ascii?Q?YYFCyevtgzUyyLi9cVfxmiyWVxwEpGcKPPhyMIfgvC/L69H/ho3IVqCBkOCT?=
 =?us-ascii?Q?IG9SGl7cez9uMY/3wseC4zLZKZgRErDwzOXY11geeec4qRUfUiFl9otllvVh?=
 =?us-ascii?Q?ibQJy13XQ5QMedSrR4NMz+7sr4gNMCUwD9UNMkV8x+d/4iKznw8ZBopH0oN7?=
 =?us-ascii?Q?3N+isYtmQY36YcjO7brj9gNuT56FIk+Fts1g8+J0tzc6Y2huRFIqTFQ2ClVC?=
 =?us-ascii?Q?Bur/ydjYg87+NH7tzdt/GaQC1037TiRWg5u2D0xYzJNUK8TMsUxpsoYS2R99?=
 =?us-ascii?Q?DQ5h6e619Qqyi1hZrDNnnwhE35Y2cxZKwBr+zgEYiausyjTXgBXJrs4DKg2p?=
 =?us-ascii?Q?pk7EwB4GqMJFpnO6MauxQjKmQx/THTGBhLyh0CcEUpUPQv6+mYJu1+cHvw2X?=
 =?us-ascii?Q?EC1+wZiH4uXyrgIFalFe8jNi2m93zzbmBvx4zEttV2BoGbujJkwU9KuqcrC2?=
 =?us-ascii?Q?GO38upCOzCPHaDjT50vud4AHopNB/IYentqRP/jhBQFC2bau8yCtCpZ2Hl9y?=
 =?us-ascii?Q?3Fc5E1uMidCGAt6i+mlmIueAtT2DUZNhEmaKhkI9xGO4O6K2d3bf4oiyzGU6?=
 =?us-ascii?Q?9lUIJqFy4rpxo2ssPJ4IGMKFGa1+e8aQRVMuYPfu/zydDKtNZNZE5CHn+aHX?=
 =?us-ascii?Q?P2DfdzdtdUL0HuV2+z0Lb6gn71S7rDYOUTH6Oc2c9P3uKixMSFSJy1v0szgL?=
 =?us-ascii?Q?P+UCqsiHMC+mok3Ud29UJM4oiY+gGkrsnyLjs5Yb62i4TbCh/lrUa/u08KNw?=
 =?us-ascii?Q?T8BFfKypg4PtLL1odoN+fUVu24Rj15uVmIhEnnHEXIdCO3UJZ/bWpSthWSyi?=
 =?us-ascii?Q?Jn5eKRknaE4JxnSJA0zZD4l7uVdyghDIicnykMK+b0hKPf58av75lLwWUqWO?=
 =?us-ascii?Q?THZb3GuCVp6h5Nmg29t5ZboAwUj7Y398xfso66tyY7trdPK2FAhS91yLfDnV?=
 =?us-ascii?Q?c0sZAiA4cxlWNvnR06nA6AO9IGFYWtV8P9WcHKtDKhfTSbG0moEvXUHIzDJ0?=
 =?us-ascii?Q?fl6e8NTTE3vdiv84ihTius2GmxIV0b4ZbFnYh1cZqUta9vh/POz/dmCxAkvb?=
 =?us-ascii?Q?2ldM8Ibo6lA//8atmIgYKaORJg9iYWWG11uRwmmYfwnZXE6xCMa93d6F3gkA?=
 =?us-ascii?Q?drhY8flXFWqHR8hzOJxtUPsxXLIKxSLEULRRjc0v27UkMLwDCz+OtxbmGkrz?=
 =?us-ascii?Q?S+gDi5oW/AKuk42QbKZrehj6dkGoir0msmHTBpjnaYJvVKSsN3o7n2o4UOtR?=
 =?us-ascii?Q?1OK7GMkd67hpucTd21cmMOc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3468c91-fbed-42f5-cd4b-08dd90fd61fb
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 02:33:30.2654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vmCEmHIbrqK37I8aFABSjGdBeiRYnTeXTUWmuhAAmLYmiq8WRzv3DaW1Iry0s2sbzJv7hxMFrcMN9MT4A3aoaRElYCIXxrkwVrF9A9Xy5vZoGltbyCvtNBxedVgWjtNF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10948

The yaml has "hp-det-gpios" property, but Audio-Graph-Card2 can handle
"hp-det-gpio", "mic-det-gpios", "mic-det-gpio" too.
Add these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../devicetree/bindings/sound/audio-graph-card2.yaml        | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml b/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
index 94588353f852a..77c21733f9e63 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
@@ -39,6 +39,12 @@ properties:
     description: Codec to Codec node
   hp-det-gpios:
     $ref: audio-graph.yaml#/properties/hp-det-gpios
+  hp-det-gpio:
+    $ref: audio-graph.yaml#/properties/hp-det-gpio
+  mic-det-gpios:
+    $ref: audio-graph.yaml#/properties/mic-det-gpios
+  mic-det-gpio:
+    $ref: audio-graph.yaml#/properties/mic-det-gpio
   widgets:
     $ref: audio-graph.yaml#/properties/widgets
 
-- 
2.43.0

