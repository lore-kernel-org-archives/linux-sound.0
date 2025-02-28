Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010068.outbound.protection.outlook.com [52.101.228.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF46918C31
	for <linux-sound@vger.kernel.org>; Fri, 28 Feb 2025 00:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740702577; cv=fail; b=GwVBNHye9389A/7+pMzESs08Qrjp/STf1tGjNbJNRURK9I1LWzVPH5mBWLLjXvhOdK1J1VSbUbwhxPoTM9g+KrZM7X6mVtc2ns8O4gK+JznStU7xZA/8I2DWC778yURnEpsrPaUFakIMHMcPplB7+VkWGk8gde1HTe6FXgCgReY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740702577; c=relaxed/simple;
	bh=sDZ1y9bmZ2zu7ggOApPNyn8hmlmZF9ZJ1+h5Wr/pn/c=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=VPX4kby/yc9XBhsuZOGZhCvbHw9eYTa1fvO19zEUOlNg35vfJTuWIvW3jSfg7ssix9GYlKw9yiqFPFf+JyXo1S1f4b9FKno25Kv+7/LOtfqGrfab7quDST+wdFKUFdiXVGjFbYsL0Zvw23vrrgLeCtIC2JqynHXImm1f4oxejzA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=WH2N2l8P; arc=fail smtp.client-ip=52.101.228.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="WH2N2l8P"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qz2w1exJc0BZoqfHNSacHsEkTJRR7DumNiTkSvvgmlXtXenBTUOwg/ce9jq4jnkhVHVnOX4BIVP5FvvcYGfR/yx79pezg+SpybeakiNC4OiUDiq9vyTML/05R61KV3hGvgk1VG8b0YDygK5fIVfNCsmQujPkgG9RFnrefOMHUnRldrDg7kKzJ94xtE6lsw1BAvhFdCtrfSwPSIJHqXQYM2SpInvnzwQkIlCOMyeYYR/pzKvcaNTSxfp6OBaYhH4v/N4StcNXjLEH8BXOqBDRejQuaYP/SKBskPxXjCZBNRIXmgUJT/sPX/zZ2UXP0DPs9QLs25pfnN3OItJXwgoiAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xtKQLJtQF83vy9HdgsIvwagSaCDv0I1Y5ez8E8fs/GI=;
 b=wJuIiTbLphMDE1+cP0W818kIEPdVxhsCAZOvn80qEX5x7Ku10rv63dd6IfoZrsrgzOc1OvGXKzyKHgwWSKYPsUEfExPbZg7F/Y3iwzM215lQ45Ru/WhXyOtINsbgPpHsSZCT7NHHgsCPgiNmcnPkzQWAzNuPA/O2OYwtK5xZdhfti0ayqma+UR6AT17vwwuTibHI/zLd0of3FCyqfuSF77FO+OnVeRn9faeVGMUfEVSiU86uLHeRDZ4Bg2LKr8ojAeeT7wHCKwd+FQKp+KztjpNfTlxE3bIn1cLQm3tB4s8exid+3Jmb4a7WUU9OZGK/v4t9nX+FuLcNQ7o5suWn2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xtKQLJtQF83vy9HdgsIvwagSaCDv0I1Y5ez8E8fs/GI=;
 b=WH2N2l8Pla4I+2znNY19uDhWU10tYnoWkKiBLUUIbUbKKNu1M9mn5zaWH/NlpvB7Bel8WkdRbOUHcY8fnsOtNKHVEWxwC1PAcleCG1vipUZJZaN/yLTMhbba+e2DMfMTIo9hb2grTeLaDys6LFojEbFfKT44ytRo0meubfNGaOs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10257.jpnprd01.prod.outlook.com
 (2603:1096:400:1e0::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Fri, 28 Feb
 2025 00:29:31 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Fri, 28 Feb 2025
 00:29:31 +0000
Message-ID: <87eczisyhh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 1/2] ASoC: simple-card-utils: Don't use __free(device_node) at graph_util_parse_dai()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frjysyig.wl-kuninori.morimoto.gx@renesas.com>
References: <87frjysyig.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 28 Feb 2025 00:29:30 +0000
X-ClientProxiedBy: TYCP286CA0049.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10257:EE_
X-MS-Office365-Filtering-Correlation-Id: 070fe334-17f0-40a9-7b64-08dd578ef7ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MIaqQGIG7C7mJ2AmpLQfoGCP0ZPJH2VojR89DgX2IBKFz/ti21MahXYHKOs5?=
 =?us-ascii?Q?OgVUdCerawztGdRgiinELTkCcUdsqBZPSXsP9/FlLueKh7t2bEDuigj2xGg+?=
 =?us-ascii?Q?9TLagUY2plfwAPjiyjYZvt0v9bWPNAGn8w1zgW7REZGuryO9WZHtjwwvwU+G?=
 =?us-ascii?Q?y20CiyCUs5ht9VkjraAIaTYNsz+Eyr16R6qBqVsabRCRcMrJMX5COZIM9EvS?=
 =?us-ascii?Q?OPbai4TylhBkMhOAWNlXJLYDPhCQtJYTg0rS7JJBkZ50jHjZ3bTGL/Rz9m3i?=
 =?us-ascii?Q?ETcd9vVXw8KRmzC2AFU0Zb35NTTBb8NiRpRckAJcORl1TCnR366RkP2nJFSV?=
 =?us-ascii?Q?3x3e3eFUM1wITylF6ZHSLzNh0wSR/lv/V3UsVZ36W3EN0kWRG8D/FpwLJQTk?=
 =?us-ascii?Q?2raaWfs3xPJ9hjVzueNCk+6vqEmLmlgj19qutZ5Jdu4C61kbXsfwr/UWy7ou?=
 =?us-ascii?Q?/uOzTIVBLcN4Wwhr89fghr0Zz9idhCdHjOQiqlMMz9/VG3Nhkg6ei5OchL9g?=
 =?us-ascii?Q?pagqrfWD3QJ1eOjaPe4oaOPPOSp9CZ4GvNksO2E5u/o+7MeRTFtkyMlx+M3o?=
 =?us-ascii?Q?dTZlrPgJOf2I1XCul6M1P/iyJDiu2tp+rsyWbpiJIbHboOwY1XUGJd8TfxKo?=
 =?us-ascii?Q?B7ZtUD/n/DCTtm6RLJWl4Gzd+b1jOKus0GbbFalsFPC8q5WPwM+zT5xjcxJo?=
 =?us-ascii?Q?4hWC0tpkKsearjp+JyTRFH4cJ/rUMysCYykw54tNTMPyzRmNriyOvKTY9DWn?=
 =?us-ascii?Q?KoCoXaqJq0At1/EzhGFuyvo1u33e6AvMaooN5t1x7OqrhbKjNDMJg+LbOotS?=
 =?us-ascii?Q?4GxHzANtfMXwt0JOwRvPhBDmfnE5oBUpH9xl/QiW1sXmEa17DDfshGoLu0IW?=
 =?us-ascii?Q?0jwpUQ91dP7krU+wZgkKRIJH7MhWnz25wX5Zex4BsggZwmY35S0zw3xzF5gV?=
 =?us-ascii?Q?Tsgt5zbIyDwYDq4e49Ry1xAJRs218N+lEfkXWxjNdY4oIKi6LsU/EEnzCN05?=
 =?us-ascii?Q?691gjlPnlcoGZa/ES1L+K2fyJajggGcBz2Tjunr3zPmAn7oaEWU/CfW2FGv6?=
 =?us-ascii?Q?SnR1kpfIyrB3JnxQ8qiMQ81C7NKhg6Av7E6Yu6mLISwmlkkaRmrY1wevX+S1?=
 =?us-ascii?Q?KI1o6XatLQmNFDk8dc0KfFAIQzUG3E96ldqErkeDwqeaSMSIbm9fBz3RX10l?=
 =?us-ascii?Q?vrjDezyugh7WXLPLMScqahq7X9vc/n/cPkMGppktlMM9Q3EjP2nWbSMZgt1C?=
 =?us-ascii?Q?LqijPQk96Yszi9jhIBRm2oKpjgx7a7hjJeEWunOPEmAbM8+73GYA8uGu4SiH?=
 =?us-ascii?Q?rPP7T/owJvZPWS9z65PayIemewanKg7yjnbhc184nAilHvVO7AI669BFBdw9?=
 =?us-ascii?Q?MB2pP3gFHzSt3iYHkNGsBspiJjy+tPZL9phsj6xCFo9vKx6ZTJ8Qf7XN5Lru?=
 =?us-ascii?Q?oL1+l/In9Z8lWAY2vVWxzAHo6cWlQRQy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YqvvIgT201VeHb0OxPA/e1j/hTtdc7BbdMElnTM/lFXFM1B+lw6BTTXNxtBj?=
 =?us-ascii?Q?WGLLHB+8OMNwmo8adZSCQpNBCHava7uJFtUtf9V1dUnXTR283htOQiF8CVwg?=
 =?us-ascii?Q?bIH94j4GPDuMZx3cp2OVDoYx8sqMUhMRv44w9Sl4GoIZJ3Uih44/SydNNrZA?=
 =?us-ascii?Q?Oj4CuDx8uVarqgWZE5JgK2xmt460y0VX00eStA1X1e6e5dUK4ALHlla85MLL?=
 =?us-ascii?Q?k0aZef6WjLM/lyHi9udt6RBrMhM8GlZCu9MB0tB/j4ulPpUWxW45dEqogR6w?=
 =?us-ascii?Q?DzCw94MqqkJ3WXy7teKcZRvPqJemIbjiP8Q3hZbUYjQFIJxQBrcByA5wTca9?=
 =?us-ascii?Q?IMlxj58xD8t32x3dBbFVopJWlnuxWS6Hqkvd9jEMeNnUbuhmpVcyl0/eQ86O?=
 =?us-ascii?Q?HSEAuiTp5TMEEOm+8R92QhJOgLt6AjSJ2WjpuLqgEi2QFhf3bvPocthfEAYw?=
 =?us-ascii?Q?cbRVpbNXy/Vjg/B73jUZ+ruKjWYlxGW4al2t3/OQVXXn6NGWjragC04uJMJ/?=
 =?us-ascii?Q?O/8SUzdIs3vU36hCd7hSRHNOWCtveIwMbyLBsN0Do0OP7hEqsyyHtA63xtbd?=
 =?us-ascii?Q?lGmu4M/Ofem1jrkKLixOgR9odc2fH9vq4LrNURx+O8pztZ7Vq6eezsSEvcOC?=
 =?us-ascii?Q?JkMmqrxBhAbrIKryqo5Q4UoqpsbwIUYmr4npjIgmMrDl/6WIEuUWnWsICch0?=
 =?us-ascii?Q?uh5XCxjDEtin2SX/cSki1Nyh8o6gOJMD6vT/CNBKjA45B5r5pWeJZheXPObi?=
 =?us-ascii?Q?C8DkAlJdoWVMi6mPBNq43uCpn/h+exBb3EtIrBOcHacyKGRS1TE/r+cugA+T?=
 =?us-ascii?Q?RzhT18RJjjzLDSaeBSikX4Og7y7y5q16DDG683qXewKpCthcDcNQhadJA9qw?=
 =?us-ascii?Q?03PjNkmHXAZlLvFCc6tkxks0Erw7XQQqu6a6Yfq8pEVWIx7iSg+eWDO5pNX9?=
 =?us-ascii?Q?Xwy0j11TxquWk59IPjwlIFpYdXYm4U2UXBW8jWdkTMlGdU5xp8QxQroe1OVJ?=
 =?us-ascii?Q?g389EG2sF6iEhFg9MbATGY19Dxw3BecxcqRy0cfQLy4zn8wuQU90j9vqqA6v?=
 =?us-ascii?Q?Tb4rMXvzU5NW8oAKyl2prEjkS74anf0gnIey74RgrQwg7OWCwE2NGGWR+zlO?=
 =?us-ascii?Q?Qb239T0S5o33UVsnADRzQBSk186mAl1X06y9tlVy59iDo1WLfUhvqPsDLbMW?=
 =?us-ascii?Q?gTBr5Ni8lWeZ0ELr+TXEAafiaix+d4Ge5ITbhRierVzWE4w9jfFGxEYezzrl?=
 =?us-ascii?Q?mCK6hEQLHdekZIHlyOCac+7+TkTNELD/fcf5JCnrwIwV0eHWXeIsaV9slrig?=
 =?us-ascii?Q?1AbZngN77hE3ZsGK7caDhGkotqRAhCzG2XGvt/JgCMS2bsNIMh3rWLjLq0RD?=
 =?us-ascii?Q?2eIskDvOtOE8aw2X605zpa1f+vCNoTK98qJJZmIqOa6OYT3o3eeiKMlvR5Xm?=
 =?us-ascii?Q?oJmtqbUfUWC1HnY5CtuTYCzJgZFTHkhCbIE1/YSRB7dyBv8BRTek7S9uNpLA?=
 =?us-ascii?Q?XyemrAH9nHrhGtdiECo38e9v7Yf6SGM2GaMRT/CYGWpAsF2MmAPlQQG3LtMw?=
 =?us-ascii?Q?Wf/4sjoGILM2sOQxM7K94HRFxCFI7dxk3jzD0fVZ3YRMxxGSlOHj63KxJYtm?=
 =?us-ascii?Q?tUOziDxA5dMJG7WXpRkcxgg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 070fe334-17f0-40a9-7b64-08dd578ef7ab
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 00:29:30.9783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2U9OzqqJWl+0v4LP6WfnKZQi+Q1BA/cElBvC1y4hMwkQcVU5xItiBi2Qf1a7+yc30rwMr8wSkx/glmfB73iuI2DbvHOGIbktUARuAUcC7B2pV8tOQdC20tf+U6Hio2m5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10257

commit 419d1918105e ("ASoC: simple-card-utils: use __free(device_node) for
device node") uses __free(device_node) for dlc->of_node, but we need to
keep it while driver is in use.

Don't use __free(device_node) in graph_util_parse_dai().

Fixes: 419d1918105e ("ASoC: simple-card-utils: use __free(device_node) for device node")
Reported-by: Thuan Nguyen <thuan.nguyen-hong@banvien.com.vn>
Reported-by: Detlev Casanova <detlev.casanova@collabora.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Thuan Nguyen <thuan.nguyen-hong@banvien.com.vn>
Tested-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 sound/soc/generic/simple-card-utils.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index c2445c5ccd84..32efb30c55d6 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -1077,6 +1077,7 @@ static int graph_get_dai_id(struct device_node *ep)
 int graph_util_parse_dai(struct device *dev, struct device_node *ep,
 			 struct snd_soc_dai_link_component *dlc, int *is_single_link)
 {
+	struct device_node *node;
 	struct of_phandle_args args = {};
 	struct snd_soc_dai *dai;
 	int ret;
@@ -1084,7 +1085,7 @@ int graph_util_parse_dai(struct device *dev, struct device_node *ep,
 	if (!ep)
 		return 0;
 
-	struct device_node *node __free(device_node) = of_graph_get_port_parent(ep);
+	node = of_graph_get_port_parent(ep);
 
 	/*
 	 * Try to find from DAI node
@@ -1126,8 +1127,10 @@ int graph_util_parse_dai(struct device *dev, struct device_node *ep,
 	 *    if he unbinded CPU or Codec.
 	 */
 	ret = snd_soc_get_dlc(&args, dlc);
-	if (ret < 0)
+	if (ret < 0) {
+		of_node_put(node);
 		return ret;
+	}
 
 parse_dai_end:
 	if (is_single_link)
-- 
2.43.0

