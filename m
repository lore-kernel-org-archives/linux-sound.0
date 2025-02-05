Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011039.outbound.protection.outlook.com [40.107.74.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CEB88C11
	for <linux-sound@vger.kernel.org>; Wed,  5 Feb 2025 00:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738714587; cv=fail; b=E5KXSjt3DIPIwVUy1xDV4jCPhov3sHX2tg90jvRp4xXTg8MyTWRzRdN/W3R2r64RUTfN587uYTbeFnCrycca57RHyPTvXzPVDIXOCceIkJMGe4XX1DciiMUnWKDrSfNuBumGe9XQ8v9+pAETyM9sg2L/FRB/8udul1VTNxNjpMA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738714587; c=relaxed/simple;
	bh=2N7R+/1XE0pMg+3cGG7F9YaQSlyeBrfuKJCNErxAtwY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=fEfmvMUNKJI11aANQ9MPjvL/C/SoHvuVOuDviGNscPgCsEuV+NcT9NGOQRr7Qo4XI3/Zj/XVvn1/iG9oKZ9sEoc08WUbCZW9B+oIcOYg1c+f38qif6Mj37xylLi6tpvgICiYqhsR7r6iKpLoWJn1qYHifk9mr3+P3DgDF2EteuA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=E1df0Cwa; arc=fail smtp.client-ip=40.107.74.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="E1df0Cwa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eLxJGjDRmHUcJ9Q/R1ADYYCYU24qOY/91ItBkYW9wm2YBw6JkiqIUtE8rTrRYhMYKWXgH07Zc3P2u5REvnTiB7rjezvTUutZyJYjDGHb0KOk4uXZ/7Haf0FX6kYFINM10Twjc/Gd6FQfKTnp3AGnKW7M91ZjIpry2ALzL7JgokazIXdnpfA50abbETf4JJZtItJCkInnhXWUL2Y15zF7vnLLfMItgPQkxUjusPRA1MaUGN9TTZIlVmZEyGzxhtWuqsxGuZWpFFEKH5QGlL0RPYLQhVJ0x1AyI8l6yg55qoe34RBcQGUKnhD9n7ZGQN8UtBM31UbDRVOkGabrh7BpVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=45ej9izMZ7IL0v2qHPl//3PtYamrYKGW29CuNl2lVpk=;
 b=TbgiUPtDi5RsQXbRQn2/wR9Tak3DgPBbhDVTKQ0hnFBEXy+kmd/Yio8/XjFi/vmDazojr721DuEbx5XevKrnjTRjI0pSjyS9dqdMeIes9bSmO+NsQBWE3gFYaWbMr8lIxV/T0gCZzbEOnfOYgIgcG90wi00xVYN1YSTvFoa4ZVvIZAxdvUVAem7VQl1JhZF+uJiRCZFjN1noYP5mTz5r43cknrHhyP73ZSwOECuPnhphoF4I/S/74AA5/JWWXEA03jf6nkxpc/+upcHSgYQ2bEyf+aRGKo6hDRurnb50pghc7e/073TqPiieaOWTLqgDN3lLDItr3xmYa6Cbc7ZA0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=45ej9izMZ7IL0v2qHPl//3PtYamrYKGW29CuNl2lVpk=;
 b=E1df0CwaATVWHj9eRj5X7BoNBbLRAHgpKMDAsGa/KMJUYR51z42ZLBTsS/vaGrXU7dOrM0q5RrqhetIj5wf74WSGkBpbsBhcmNSnyTki0kV2BDY4rSBnwIIuELWsIOfcUcHNuudfJESudGIsVCAr7d284xJAiYrPkrn/X/qBruc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB12774.jpnprd01.prod.outlook.com
 (2603:1096:405:1b3::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Wed, 5 Feb
 2025 00:16:24 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8422.009; Wed, 5 Feb 2025
 00:16:24 +0000
Message-ID: <87bjvh2qlk.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 4/7] ASoC: simple-card: use snd_soc_ret()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87h6592qq3.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6592qq3.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 5 Feb 2025 00:16:23 +0000
X-ClientProxiedBy: TYCP301CA0026.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB12774:EE_
X-MS-Office365-Filtering-Correlation-Id: 17d89a49-1fb1-458c-7d8f-08dd457a5318
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CeaRLQpcqoq3+88dFOsSkrPkHPBLnRBw+SHxU0a2E6XIqHMViEXi7Ut9G8lh?=
 =?us-ascii?Q?omdX/QNV63UxuMZTOmRnTmsc4C2ReA1Et03SfNwf/BMNRMs8c1j5Sh6ksaWF?=
 =?us-ascii?Q?7MGjt/KGb51IZ0LIog9Ei1Y3BwgkYEb+AFzXNhs2uZyuaPVi11ff7zTI+8Df?=
 =?us-ascii?Q?vc6lYhp7B4ykagXq1mfZPzH27Lh2Z3dwSdg8GTSmxFi+H2bUjUv3+g1svFxm?=
 =?us-ascii?Q?pMoHfc0J/CAb6IFTDiPeILf82hs+zEFllweekdtcMAwJqS9tMPMo6dS9bA2e?=
 =?us-ascii?Q?BMAwL9wzixa4GW2JUr0caEBCqyXiQWtSFM3eFIIggMIDa9EZnlzbZ8FHjJU4?=
 =?us-ascii?Q?R8JDPt8FhOAOzlL2Y8gluahL/4a40qey9//iPtNlPYleclDLMgS81bwTP7HP?=
 =?us-ascii?Q?A3cxuLVG9qwZ3u0baaYq3LjwGF7bz4IraPteHJ3md3sLujebcPZVMVk7ehxu?=
 =?us-ascii?Q?qTw29HVjgMT9BLDn/6ddbR8oP0Tj/NnbLjYYeBJlIO3kVOaLmvHANNquX9p4?=
 =?us-ascii?Q?exPX7+B6k8chlrVpVspvY/UoXds27OrJLfTedxW/TPVICPms79kKI24dc7TT?=
 =?us-ascii?Q?CqSKqJtQGdmtjiaYHmXNOGecZh57xkfWLemdsTvWvow8fUCEPRtysjdGMSrr?=
 =?us-ascii?Q?XkK1GqacUVwartoRoK06WPf6yRgABtGuj96AEKlAxeEpP7X349HtDV9oXAFS?=
 =?us-ascii?Q?XURBM6KIGwPPehZlVfU6wdVBt8whphMpnRrG8OfPlFYCM64an82Y/VY5ONwI?=
 =?us-ascii?Q?eHnn9o3WYtup2xsf2gTRS7RaMuP/VylHarFT1QYEuBn/XYHrbfpqQcPnXng3?=
 =?us-ascii?Q?Fx1RtXQ2iphajpx7tktTr6UmmtBdDPBpEdcDhbIe0nzUqvE/Drj91d7vx0Rr?=
 =?us-ascii?Q?huk24Ge/Qe11s7M5qJnDhX5Bx/p9r9VncWmZJBjaeO8VUmI9O6+J0jLhVuAp?=
 =?us-ascii?Q?5zskCRDklBzU8XDaTi6q03d8eiFOnXg2zlMrSgh8vAINAvt/4bv7SHy7cwH4?=
 =?us-ascii?Q?HN10ZZlLuSGODXjG0/ybpZXPPWsPt5kqnF8M9AWZi59aiUv8uKA0QIpFERaM?=
 =?us-ascii?Q?W+9VUCMYSW6YuHbp9eTvht7SbtUqzIIQvJQ/jB2Qv46l+JCqLjrhhUWUYVUn?=
 =?us-ascii?Q?cl3jADJ5T5bGs5xEt7zjLMNODNP0R5LybJtslEWMmLl8yzauidf+3WZrYXxB?=
 =?us-ascii?Q?/E4J++iPTfUgtYqtuhVLzf8nitWlk7s7PvlQ3uFrN6QJwcrdvXLaTj+AwKLe?=
 =?us-ascii?Q?OEm1chtwPciCd1rI2karNShRrXoSX4Z39qNE4yStiAVfePZP2aLtD04IMWkS?=
 =?us-ascii?Q?mS2qPW6Wf5LwVIxplUq1wroh1YCHVT43I5TdB1GcMDEZ8997Q66OwT5tlJIR?=
 =?us-ascii?Q?+ZyJ28f+meVx8FiqhUNbi7UKSn4NupW7v3lP+M2Tad8rTe8D3Xxs8szegGH3?=
 =?us-ascii?Q?Z1cnL/HMDSrOxyBXzOZPlrtK+GTGdjt6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ec9YDcTw2sqmTe7tDtwo66k7tGaBvMERDDPYZMaLOrhm0MMIWxzoCz7ActoN?=
 =?us-ascii?Q?9MhCIOxAKxms1gpKxLxBkGBzsBzidCnVooe9w1PbdkjdAh8Khg8GIYZwoafz?=
 =?us-ascii?Q?1gNPukoSegAHP/5KrDMtaKqFeqES4HptPT5zjGUnN75KzWqUxNweWDTRLN0E?=
 =?us-ascii?Q?fWQer6IONmRfIIwhicy8z6H3VQfgVsXG8DY7LNmZzceYBiYUwVbM1kiV7Nps?=
 =?us-ascii?Q?03pUODu91pmdxLnBIi5hV9YnM0zjYv2R56Wjby5qKVo+UDXUpO2Bs4cq97UB?=
 =?us-ascii?Q?ESKOCwjMwMUafiXI/QKqVl/iA3ZJ1Ruu04ksvgj3O1ckqPT+I7FxcbL8VoWd?=
 =?us-ascii?Q?ZbnUT53kOsAjzbUo/ga2F7hPvt8toRkLUUXvIAId0VBaVCqsierBedCnH1Rj?=
 =?us-ascii?Q?DizrhhWLV2SAGV/fUzP9AE0M/wqkFIqJ3t90e3yLUDfPXErt7DZjYm8VQwUR?=
 =?us-ascii?Q?+itNMpcRB53xryxP/wUgimyx0R+8YW3za7bQd6/v2CXVpm9sXgaNJrLca2V6?=
 =?us-ascii?Q?ptVtRh7wb6cZWII/9C+mfrY0dvTHAixw360Xap+ExMpaOFv2O4BvCgN5PAq1?=
 =?us-ascii?Q?OIpv0R4EPs5VKZ+RXotbHzI0bjISZxkY8ruA7We7K6zeoDUxUqutkCBlNxDj?=
 =?us-ascii?Q?LBV2QLvHjboFdUdUbXiR27YYILhCDZMuBThlQKRQsyd1xFbgWHEz+WylA6dY?=
 =?us-ascii?Q?9oltccNUoSFBEgJadybCd1Xu+m83O/WnN/GlbVopLqkZYDNdFh+f90RRjugn?=
 =?us-ascii?Q?+3KQM1chFC5whzqfYJS2LTyOyROidgx03vve4vkT7r1o0Gmi1ycx1IUH6HVT?=
 =?us-ascii?Q?F7GsSvsgv6/CPUAmga2L9OdM590rgb6h7yHGU/Ucj/lC9HmuuPkywLQX8eTu?=
 =?us-ascii?Q?qX0PZWeeUZzgnIsV0aQOX6a8WFTA9ifeK8K0UAeLCnmGg0FNPY/7TzGUx3cN?=
 =?us-ascii?Q?JNRs/lpgqOC381RlenNgv100HiXaXUqbk6+8q2VqDdUfTH6APQ9uPnHRpQdR?=
 =?us-ascii?Q?4S68STnxNAFDRv6UIbUffU8kZdPS2N0Dbya4wiVLJaydcykgg0y4RXYLjciU?=
 =?us-ascii?Q?2ZJkkdy3/0uLvFKj3eM2BqZw2So40QU+CZy+kNf811SdW4SniiAfQ5KBfs9o?=
 =?us-ascii?Q?5bbBcTgk+3/uuPlMf7+eLiylIvvauyQBrlYIw6f/52ngfsCRd9dO12H5UUOS?=
 =?us-ascii?Q?ukBPhMWwUckA6PtYpP5uyWr4FokIlWt0MX9AJ8qwIX+pgdjmiZ/9vVCAZDeH?=
 =?us-ascii?Q?+kiON13xS6hAUNtdahb/IhcnOvglTWYEft+teQZWomsHE+DyLqAdagI2X1Xq?=
 =?us-ascii?Q?9/d7QeYSft/lqrMT0lnNtfb9kNAbyz8VJLt9vpT3lOTOoE0Q93IRWRKY6E7I?=
 =?us-ascii?Q?VUo+VObq7TpGGi/VjWaB0qzH3p2NVszkvBebhcXsMe5LyGhB/DUm2stR4eB1?=
 =?us-ascii?Q?khaAB12LHoBcy2B2hjJPYmbZCVQXlMF6WdhgHexlJyJWEWuGXz7UB0aNooM1?=
 =?us-ascii?Q?eZx4WeqziM2XBM4vi8WncGP3ULhdIwa7Un5PUAaml6LZpEH99rlRRyR81Wxz?=
 =?us-ascii?Q?JUJkZIOXakYFr3yy4TA89Xij0B2g55YY/Z7EBrL1i0LSlQNjolJe/swGGwf8?=
 =?us-ascii?Q?LB1rsyaJOsamjechxGuUbNc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17d89a49-1fb1-458c-7d8f-08dd457a5318
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 00:16:23.9787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LecFCcawbrMp+6CqEQhJRwaoJziLDOwgAMo/5pla3wz3dDQMc2rcLd6Cm2LTpXK6iJNRoEo5WdnIsDZhPaUOT5/qFkgvvS/Qhgk9yglrIvlPqEW0LYvayOsWoop071iD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12774

We can use snd_soc_ret() to indicate error message when return.
Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/simple-card.c | 130 +++++++++++++++++---------------
 1 file changed, 71 insertions(+), 59 deletions(-)

diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index afe7e79ffdbdb..004fda4504c42 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -29,7 +29,16 @@ static const struct snd_soc_ops simple_ops = {
 	.hw_params	= simple_util_hw_params,
 };
 
-static int simple_parse_platform(struct device_node *node, struct snd_soc_dai_link_component *dlc)
+#define simple_ret(priv, ret) _simple_ret(priv, __func__, ret)
+static inline int _simple_ret(struct simple_util_priv *priv,
+			      const char *func, int ret)
+{
+	return snd_soc_ret(simple_priv_to_dev(priv), ret, "at %s()\n", func);
+}
+
+static int simple_parse_platform(struct simple_util_priv *priv,
+				 struct device_node *node,
+				 struct snd_soc_dai_link_component *dlc)
 {
 	struct of_phandle_args args;
 	int ret;
@@ -43,7 +52,7 @@ static int simple_parse_platform(struct device_node *node, struct snd_soc_dai_li
 	 */
 	ret = of_parse_phandle_with_args(node, DAI, CELL, 0, &args);
 	if (ret)
-		return ret;
+		return simple_ret(priv, ret);
 
 	/* dai_name is not required and may not exist for plat component */
 
@@ -52,11 +61,12 @@ static int simple_parse_platform(struct device_node *node, struct snd_soc_dai_li
 	return 0;
 }
 
-static int simple_parse_dai(struct device *dev,
+static int simple_parse_dai(struct simple_util_priv *priv,
 			    struct device_node *node,
 			    struct snd_soc_dai_link_component *dlc,
 			    int *is_single_link)
 {
+	struct device *dev = simple_priv_to_dev(priv);
 	struct of_phandle_args args;
 	struct snd_soc_dai *dai;
 	int ret;
@@ -70,17 +80,18 @@ static int simple_parse_dai(struct device *dev,
 	 */
 	ret = of_parse_phandle_with_args(node, DAI, CELL, 0, &args);
 	if (ret)
-		return ret;
+		goto end;
 
 	/*
 	 * Try to find from DAI args
 	 */
 	dai = snd_soc_get_dai_via_args(&args);
 	if (dai) {
+		ret = -ENOMEM;
 		dlc->dai_name = snd_soc_dai_name_get(dai);
 		dlc->dai_args = snd_soc_copy_dai_args(dev, &args);
 		if (!dlc->dai_args)
-			return -ENOMEM;
+			goto end;
 
 		goto parse_dai_end;
 	}
@@ -106,13 +117,14 @@ static int simple_parse_dai(struct device *dev,
 	 */
 	ret = snd_soc_get_dlc(&args, dlc);
 	if (ret < 0)
-		return ret;
+		goto end;
 
 parse_dai_end:
 	if (is_single_link)
 		*is_single_link = !args.args_count;
-
-	return 0;
+	ret = 0;
+end:
+	return simple_ret(priv, ret);
 }
 
 static void simple_parse_convert(struct device *dev,
@@ -149,19 +161,17 @@ static int simple_parse_node(struct simple_util_priv *priv,
 		dai = simple_props_to_dai_codec(dai_props, 0);
 	}
 
-	ret = simple_parse_dai(dev, np, dlc, cpu);
+	ret = simple_parse_dai(priv, np, dlc, cpu);
 	if (ret)
-		return ret;
+		goto end;
 
 	ret = simple_util_parse_clk(dev, np, dai, dlc);
 	if (ret)
-		return ret;
+		goto end;
 
 	ret = simple_util_parse_tdm(np, dai);
-	if (ret)
-		return ret;
-
-	return 0;
+end:
+	return simple_ret(priv, ret);
 }
 
 static int simple_link_init(struct simple_util_priv *priv,
@@ -183,7 +193,7 @@ static int simple_link_init(struct simple_util_priv *priv,
 	ret = simple_util_parse_daifmt(dev, node, codec,
 				       prefix, &dai_link->dai_fmt);
 	if (ret < 0)
-		return ret;
+		goto end;
 
 	graph_util_parse_link_direction(top,	&playback_only, &capture_only);
 	graph_util_parse_link_direction(node,	&playback_only, &capture_only);
@@ -213,7 +223,9 @@ static int simple_link_init(struct simple_util_priv *priv,
 	dai_link->init			= simple_util_dai_init;
 	dai_link->ops			= &simple_ops;
 
-	return simple_util_set_dailink_name(dev, dai_link, name);
+	ret = simple_util_set_dailink_name(dev, dai_link, name);
+end:
+	return simple_ret(priv, ret);
 }
 
 static int simple_dai_link_of_dpcm(struct simple_util_priv *priv,
@@ -290,7 +302,7 @@ static int simple_dai_link_of_dpcm(struct simple_util_priv *priv,
 out_put_node:
 	li->link++;
 
-	return ret;
+	return simple_ret(priv, ret);
 }
 
 static int simple_dai_link_of(struct simple_util_priv *priv,
@@ -330,7 +342,7 @@ static int simple_dai_link_of(struct simple_util_priv *priv,
 	if (ret < 0)
 		goto dai_link_of_err;
 
-	ret = simple_parse_platform(plat, platforms);
+	ret = simple_parse_platform(priv, plat, platforms);
 	if (ret < 0)
 		goto dai_link_of_err;
 
@@ -345,7 +357,7 @@ static int simple_dai_link_of(struct simple_util_priv *priv,
 dai_link_of_err:
 	li->link++;
 
-	return ret;
+	return simple_ret(priv, ret);
 }
 
 static int __simple_for_each_link(struct simple_util_priv *priv,
@@ -443,10 +455,10 @@ static int __simple_for_each_link(struct simple_util_priv *priv,
 		node = of_get_next_child(top, node);
 	} while (!is_top && node);
 
- error:
+error:
 	of_node_put(node);
 
-	return ret;
+	return simple_ret(priv, ret);
 }
 
 static int simple_for_each_link(struct simple_util_priv *priv,
@@ -479,7 +491,7 @@ static int simple_for_each_link(struct simple_util_priv *priv,
 			break;
 	}
 
-	return ret;
+	return simple_ret(priv, ret);
 }
 
 static void simple_depopulate_aux(void *data)
@@ -500,9 +512,11 @@ static int simple_populate_aux(struct simple_util_priv *priv)
 
 	ret = of_platform_populate(node, NULL, NULL, dev);
 	if (ret)
-		return ret;
+		goto end;
 
-	return devm_add_action_or_reset(dev, simple_depopulate_aux, priv);
+	ret = devm_add_action_or_reset(dev, simple_depopulate_aux, priv);
+end:
+	return simple_ret(priv, ret);
 }
 
 static int simple_parse_of(struct simple_util_priv *priv, struct link_info *li)
@@ -512,15 +526,15 @@ static int simple_parse_of(struct simple_util_priv *priv, struct link_info *li)
 
 	ret = simple_util_parse_widgets(card, PREFIX);
 	if (ret < 0)
-		return ret;
+		goto end;
 
 	ret = simple_util_parse_routing(card, PREFIX);
 	if (ret < 0)
-		return ret;
+		goto end;
 
 	ret = simple_util_parse_pin_switches(card, PREFIX);
 	if (ret < 0)
-		return ret;
+		goto end;
 
 	/* Single/Muti DAI link(s) & New style of DT node */
 	memset(li, 0, sizeof(*li));
@@ -528,19 +542,19 @@ static int simple_parse_of(struct simple_util_priv *priv, struct link_info *li)
 				   simple_dai_link_of,
 				   simple_dai_link_of_dpcm);
 	if (ret < 0)
-		return ret;
+		goto end;
 
 	ret = simple_util_parse_card_name(card, PREFIX);
 	if (ret < 0)
-		return ret;
+		goto end;
 
 	ret = simple_populate_aux(priv);
 	if (ret < 0)
-		return ret;
+		goto end;
 
 	ret = snd_soc_of_parse_aux_devs(card, PREFIX "aux-devs");
-
-	return ret;
+end:
+	return simple_ret(priv, ret);
 }
 
 static int simple_count_noml(struct simple_util_priv *priv,
@@ -548,12 +562,10 @@ static int simple_count_noml(struct simple_util_priv *priv,
 			     struct device_node *codec,
 			     struct link_info *li, bool is_top)
 {
-	if (li->link >= SNDRV_MAX_LINKS) {
-		struct device *dev = simple_priv_to_dev(priv);
+	int ret = -EINVAL;
 
-		dev_err(dev, "too many links\n");
-		return -EINVAL;
-	}
+	if (li->link >= SNDRV_MAX_LINKS)
+		goto end;
 
 	/*
 	 * DON'T REMOVE platforms
@@ -575,8 +587,9 @@ static int simple_count_noml(struct simple_util_priv *priv,
 	li->num[li->link].codecs	= 1;
 
 	li->link += 1;
-
-	return 0;
+	ret = 0;
+end:
+	return simple_ret(priv, ret);
 }
 
 static int simple_count_dpcm(struct simple_util_priv *priv,
@@ -584,12 +597,10 @@ static int simple_count_dpcm(struct simple_util_priv *priv,
 			     struct device_node *codec,
 			     struct link_info *li, bool is_top)
 {
-	if (li->link >= SNDRV_MAX_LINKS) {
-		struct device *dev = simple_priv_to_dev(priv);
+	int ret = -EINVAL;
 
-		dev_err(dev, "too many links\n");
-		return -EINVAL;
-	}
+	if (li->link >= SNDRV_MAX_LINKS)
+		goto end;
 
 	if (li->cpu) {
 		/*
@@ -606,8 +617,9 @@ static int simple_count_dpcm(struct simple_util_priv *priv,
 
 		li->link++; /* dummy-Codec */
 	}
-
-	return 0;
+	ret = 0;
+end:
+	return simple_ret(priv, ret);
 }
 
 static int simple_get_dais_count(struct simple_util_priv *priv,
@@ -683,17 +695,15 @@ static int simple_soc_probe(struct snd_soc_card *card)
 
 	ret = simple_util_init_hp(card, &priv->hp_jack, PREFIX);
 	if (ret < 0)
-		return ret;
+		goto end;
 
 	ret = simple_util_init_mic(card, &priv->mic_jack, PREFIX);
 	if (ret < 0)
-		return ret;
+		goto end;
 
 	ret = simple_util_init_aux_jacks(priv, PREFIX);
-	if (ret < 0)
-		return ret;
-
-	return 0;
+end:
+	return simple_ret(priv, ret);
 }
 
 static int simple_probe(struct platform_device *pdev)
@@ -715,20 +725,22 @@ static int simple_probe(struct platform_device *pdev)
 	card->probe		= simple_soc_probe;
 	card->driver_name       = "simple-card";
 
+	ret = -ENOMEM;
 	struct link_info *li __free(kfree) = kzalloc(sizeof(*li), GFP_KERNEL);
 	if (!li)
-		return -ENOMEM;
+		goto end;
 
 	ret = simple_get_dais_count(priv, li);
 	if (ret < 0)
-		return ret;
+		goto end;
 
+	ret = -EINVAL;
 	if (!li->link)
-		return -EINVAL;
+		goto end;
 
 	ret = simple_util_init_priv(priv, li);
 	if (ret < 0)
-		return ret;
+		goto end;
 
 	if (np && of_device_is_available(np)) {
 
@@ -795,8 +807,8 @@ static int simple_probe(struct platform_device *pdev)
 	return 0;
 err:
 	simple_util_clean_reference(card);
-
-	return ret;
+end:
+	return dev_err_probe(dev, ret, "parse error\n");
 }
 
 static const struct of_device_id simple_of_match[] = {
-- 
2.43.0

