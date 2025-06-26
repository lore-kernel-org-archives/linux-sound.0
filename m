Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010044.outbound.protection.outlook.com [52.101.229.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E9419F421
	for <linux-sound@vger.kernel.org>; Thu, 26 Jun 2025 02:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750903950; cv=fail; b=GeD1IXyQGJsYr2Ah7azf9VEONypFQWunSUQkQLcto2iiN1IlVmZ+xA3pJVTN/frSwjmlK4O5653gIXRgRbNl+FsiSlqpT55HaiIsP7OPDjsrzDtLPyLW4+fSCe3Y+Gtsm4fctpsre2mej1/u17EQq8dSWjM0lUgbKKenXAR2sIU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750903950; c=relaxed/simple;
	bh=niF27ZbwQD4VnM7r5QI4MxeO2rc5VAoHhdBJOEgHfoo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=OZLFWW6SlAVg5fujFe2RIHLpFWY/OtBPTfR5jsoWfEBeRj7/rPLTacOfFbT9n8+5KaSedow1xOaKh1oRYMcgVjWD/Bv9kgQ9cR56qUmFaNPDEYBzNDS/xSqnj11ulKGJQnRiAXwXLXGzICq539RSZQvAkMPssGmPg1aijjhcgOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=DUFu/w0D; arc=fail smtp.client-ip=52.101.229.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="DUFu/w0D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M9XVYswfSp4r9rY70OFIGonOpLJENmgjzZvCOmgaEqPUIJ4KkovW35cUB0qL1TJWOSXt3grZ9I+HUtXwwYCf1y+J/tnzUJozUVRzQ+nICVzQFn9Rsj3wnf9iJwGAl+uYYN5IY7kyHa4SV93W/2ZWHZHroSuiwMCvvTCEFzWgycXbfOGWLBoT8yfDPf4yyIzmGz0WJlMnScOqF2T2jwpj54HVbAIpxXF2v2iYOc936bHNPElHYMe1Dd4cs7fq+MRT9ELSNW4rYTj0M18V7E++WmA1RV+pEGGtH0f3FbBeWELVagD3P5m5IYmLtJVsOK736xd9TFqm6wEN/FNJp0JW4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=78Mu8RNVF+z6RheEMvwZlo97uXop/IVSTaRyYv3x9zY=;
 b=jbYYy+Zaf6RkCMY6XEIOTGueN/mohusuKTOzvbcbnftnwKpApBMDmiI7ydP4C4YlmdeTR1JV2nA36uV5GBAdgn+dAc11amQXZQg1QT4CT4tWOtkuSIbf5hitYK9gysL2Z/DvYmLu3bPtdE0sia9JbZyFANPD17PTi6LTsAeQDwn3nnMx/rpYaF8JVF2TjMZ8Epih9NOtrkwDAI/VDB1LdQutdhlEGPmFwFP8+vMCvNOSlFRToplYcsUO0QoziEJJ1gf/qvnX+lqCepB8OUO788l6g11phDGcgER8tQ7gu0o/vvxIm1DO8vwQIOg6fbxfq5MgsXDE7zcj9OiZMkvhgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=78Mu8RNVF+z6RheEMvwZlo97uXop/IVSTaRyYv3x9zY=;
 b=DUFu/w0DowSEq0XhNV8Xkq/51PI8Yc9qgRbt+qX8/zZBhQrwaG5kRM21C6U3IqEKD4iurm5ILNhQP+djXbC3N5Vgp85wTJgSU19j9f7ZYw9gBV9AAf12C8k3WbR4B04PTUbSNOErzzNKsJt0WfzlCkxKh1/WvL9OSJ83nM6YjUU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14) by TY4PR01MB13972.jpnprd01.prod.outlook.com
 (2603:1096:405:20a::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Thu, 26 Jun
 2025 02:12:27 +0000
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8]) by TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8%4]) with mapi id 15.20.8880.015; Thu, 26 Jun 2025
 02:12:27 +0000
Message-ID: <87tt431cad.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 03/11] ASoC: soc-dapm: remove snd_soc_dapm_nc_pin[_unlocked]()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87y0tf1cb6.wl-kuninori.morimoto.gx@renesas.com>
References: <87y0tf1cb6.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 26 Jun 2025 02:12:26 +0000
X-ClientProxiedBy: TYCPR01CA0201.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::18) To TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB10906:EE_|TY4PR01MB13972:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a40e9fb-d598-4439-efd4-08ddb456e58f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UCD5HtTn77qbuCIsvAAozvKZqrOpayk4bwfWqoWyPp+cq2D8Gsn1ZYl/AY32?=
 =?us-ascii?Q?rCMEoXUS6CpQUWY+CSdC4B6ngotlStbPsry/9+4bJZKd4/X29q3UqEa349Gm?=
 =?us-ascii?Q?bD1EEK77VkEBswicbmqz0Ql+WZZ6jlZhzePg3ykW5k8St16QGs5ST4AgJXkr?=
 =?us-ascii?Q?PYiT39GkXMziuAcnDAQVO/IJhTXeuAfN4u2lhBCcSJtpAhVGhyfjD8X+iWuT?=
 =?us-ascii?Q?FbyjHkwDDtgu79vI9SDLpBS24R0YCpTqLGDhwBXhrkkVF6XlED7RjV8BvdZN?=
 =?us-ascii?Q?i+FQe50mFM4U/D/tMCPYur6KPft7n/Mlxbin41mRZpAhpWgmtwWnZj3FVY7O?=
 =?us-ascii?Q?5ItUGCWUvjNtVuE/gWFqxmxYfv1uZSy6MkjVRcarnepgN9peB0lMtqj7TQjy?=
 =?us-ascii?Q?fe1r143AdBeLzO/i+wOk4xegj71gr+XBkzeYaIBVtr4ISH67uKrQQCn0Z1mN?=
 =?us-ascii?Q?sXGzPwetcOKLoWeI5Je+DfIIHRK1CEeA1Gg20hU3tKh3jqARFktp4FvqR9en?=
 =?us-ascii?Q?5/odch8IFa9J1I/DxxCIcuCNuijSBGRjM5xSoDVFVdiIBntvMgzYqs3LqEyj?=
 =?us-ascii?Q?L7pSSZzyO7bGrpA79CvVx7VePElrTg3+99AV2HxzDNzUjxmI6YnQ2Q7pFERn?=
 =?us-ascii?Q?CZvKwXoIh1oKfjQpA0M5Aby4M7ZGjcJbkrynKED9XZn4vTsvohk1OGq8QMnW?=
 =?us-ascii?Q?l0/+cu26ckhYs3pne7dg+Lx8OvkjwftyO+IUN2OLzkHCIyD/TUEYI8T2UKGS?=
 =?us-ascii?Q?rW+DFphgc7FGoL/+YLtnCZD+vleR9Tn6ztqkv+Ml1nBd+0u70PdWDG5RzBuu?=
 =?us-ascii?Q?FK6pOPk9knnFFfovK+RIa33AhI+HGp3J88U9vjQj/oyxphOyfTHP4oR+lfF+?=
 =?us-ascii?Q?7tGfedd43gv7ED1hKPs0GSkwcyWw3ouTGshj4e0Ir/wQnPfNwfk7KnPXQuEn?=
 =?us-ascii?Q?95TseqsPKJOBnRHW4U6t8L4MyFf93s4VXqhhMCzu3HZ2jlSK3quR5CChZorr?=
 =?us-ascii?Q?mzrvM3K2d1SDAE+DysvKQvooTTWFHZlylmNtdXDeT9O7R6fTPz/ZtDE10lUS?=
 =?us-ascii?Q?3P4RYVJwkDBZYn7oZ0fK14D45TcexlXQH2f4tND5IcK2mTMf1k+/BwgOWnhO?=
 =?us-ascii?Q?HbHhOFXWZqpL4CzOTmGycmzis3N1BtJ/3t5iU4HC1Bqy1N7w+JTBBiXvOuw/?=
 =?us-ascii?Q?r46mI4d5wvk0D/Arb9EXzug8MgbXzFphFTL6cXr8Kp7p4Q8vntAGRHrOyk7K?=
 =?us-ascii?Q?LhvGoN3mSI++jNwvFAqlqjoGemHBf9JxEhW338tpBnJYzHviNJyveh8aPqnC?=
 =?us-ascii?Q?ifT6DRHEoD0E8aRmMrXzW8BJRX9/YGIkCL15YD8VEKwxjX3aOK5zt/yFjuZr?=
 =?us-ascii?Q?erc2sEGFSru2hmXNqwFBbe29x2jeaEvxj1rk0Kcn5A5xZU1H57D2oQtj8+Qy?=
 =?us-ascii?Q?rA1Ur3zDyUU30lk1SMbKyO5KukEEAjnVNvaXJMQb+sd8p7htQ1VB8A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB10906.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IO2jfAFP/KGLJ7bEfJvkwAk41Z7+1rVpPqGawN9l6JRXbse6Sgv5zIN55boH?=
 =?us-ascii?Q?+csXC/LRDJVturrso+L6NscEVJ4m039lHXaFIbh3+Cg0uM4g7FU/dwCxyUPu?=
 =?us-ascii?Q?w3TyS9j70jpGWZkEqQrHVoRp/WnJHsUmh6cjtOE3q9PMBtNv1dFueyTUeAvP?=
 =?us-ascii?Q?9e2CR32skU1PUEnhmeRDbvk5GLUM4KYlbs1Hk2cBYBasAEbzoW8cdJGldfL8?=
 =?us-ascii?Q?J+0vAWZzc0ie33I6R5UzTKfw1LIKOelSJDWb105VZs6FP3eyL0TQYAh3/lOH?=
 =?us-ascii?Q?FO7SGWP1xO6sgmOsTvJlcE1UH+m6OaXMjUohMX1pPvMVHXbLr1fi50FIVjKJ?=
 =?us-ascii?Q?7cTHKkSsVG9k0sj6nmPx6ktHMIU9+2Mb64hjM+UQGPfoZxpk6nUyR9w54m2L?=
 =?us-ascii?Q?UtUzuxxXpc6YzGnGmhtMyMrOs1RrVTIXNlQO10AIb4vFqonGPFT03g7PVyf0?=
 =?us-ascii?Q?jwIwBEfLI2HC4oBXG4Nm3Ii/NL2jRXMZvG8pK8uXmU91OjjhRnE9JYlFEMib?=
 =?us-ascii?Q?ORKCpG2OlL4wNctjMPiYY1qwZBDiG1ZaCseaLYl+0it3jHkn5KdxgbxwojEb?=
 =?us-ascii?Q?KTgYBSIJrkNYf+rDPUeHL2TneBLeIpN9SsLnqHH2q8cXV0zI6eYP+HIT7+5P?=
 =?us-ascii?Q?AwxPKY91UD4apLSz6OLHtyzToMbOpt3cGEaUdEYtPE4h1vUuIKTKZmjQlr2x?=
 =?us-ascii?Q?NcIOXlYevophoRQ8Op0mJv+4hWCWZnJc09ub7FIDK4g7nY1PeimNt29DeaqM?=
 =?us-ascii?Q?dU8qMLG4k8FCaT60suBCtN4ABhl0hd5MN2lUWv7IYhsWpckq7IHSmubn+/JL?=
 =?us-ascii?Q?2D7pbTgu2CYNNnxcdVCoSaqk7Q3f1A+vZeGaaaPxvpePEKBsCTl3epKLaKT6?=
 =?us-ascii?Q?O0phM+Dja5dsi3Tyl81Kgo8Y695d+UDS22YskouI8Kj9QBBIMU1WjR/qi4jT?=
 =?us-ascii?Q?n24LaMm5DSvqOFsjSiqKp03QgiQWH9g9UZ6uNz1dS/pDrXV6xNezegGIPtQP?=
 =?us-ascii?Q?nKTHkGV2UcRE+dZp9e4qHlfu7rhmi0hwQ8E2pWHNguFrEqsOvhpnefaLIhVb?=
 =?us-ascii?Q?CSrNnhYTalKBNnIKYzAewXGgFZ3DGEno4f1WPiQVEmsAEQWMAm0RRllp07pN?=
 =?us-ascii?Q?rgwlqPVgeibydfs5/zhPlbevWslQBE/aVElYwu9QyHhfw03SJ/Vbi7X2QASu?=
 =?us-ascii?Q?gE1LkjQKGZLViu8ITbQchLflNygZMsK5mtFEayuSCUQiePv07+SsB567WPX7?=
 =?us-ascii?Q?L6GBaN8Sty/VAXfd4saFfkgMX2CPlHW8as9i+ehgt55apG1tzQtEdZ75RgES?=
 =?us-ascii?Q?MYDicBZca3uZDIx7n+mJsSNotW2BeLrxiZzUwiDPZsxGaMW7l5u/huPj2mvW?=
 =?us-ascii?Q?+7uHOciGPgDHZO1+4Kuhy6wvwHZTB2NuQfWtAAYAJtEoChWhfbEQDXXgKy/a?=
 =?us-ascii?Q?8Q4IqGPwvdO9QCbvunIfZTgw85vCCSCJkTuJjPibCmHroOUeK7UB3SgmPEz9?=
 =?us-ascii?Q?XKKQ71i4eNx/KWzb7+5qSuD+tEuwboWtoHF2eEAUgCmTvMP+3aaBRJ6ph6Qz?=
 =?us-ascii?Q?BOhqUK3fVHGjtZ2J5mEahzg/BdF0p5k2Q1W8rtR/aFSQa40uev9qUennLrsI?=
 =?us-ascii?Q?aW5jjFU153l/oYlThPOisv0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a40e9fb-d598-4439-efd4-08ddb456e58f
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB10906.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 02:12:26.9457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7W5FgeKSvP6g5EFCZI4uneIGlgdK30HQW+6aX/kFuwc/wSKJXisP/uZTaGzyrg8TNZLSv6RpxKJD+aJqSqeaLtvi6cyYAgcrbX+JIonphyZc9X7+udv/DzTwP1jv4HxH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13972

snd_soc_dapm_nc_pin() was added in commit 5817b52a298a ("ALSA: ASoC: Allow
machine drivers to mark pins as not connected") at 2008.
It is identical to snd_soc_dapm_disable_pin[_unlocked](). It was expected
to be updated, but were enough as-is for this 17 years.

We might update these, but renaming function name by define is enough
for now. We can re-create these if needed in the future. Let's remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dapm.h | 12 ++++++++--
 sound/soc/soc-dapm.c     | 51 ----------------------------------------
 2 files changed, 10 insertions(+), 53 deletions(-)

diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index 400584474bc8..2a0250fff9ba 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -498,8 +498,6 @@ int snd_soc_dapm_enable_pin(struct snd_soc_dapm_context *dapm, const char *pin);
 int snd_soc_dapm_enable_pin_unlocked(struct snd_soc_dapm_context *dapm, const char *pin);
 int snd_soc_dapm_disable_pin(struct snd_soc_dapm_context *dapm, const char *pin);
 int snd_soc_dapm_disable_pin_unlocked(struct snd_soc_dapm_context *dapm, const char *pin);
-int snd_soc_dapm_nc_pin(struct snd_soc_dapm_context *dapm, const char *pin);
-int snd_soc_dapm_nc_pin_unlocked(struct snd_soc_dapm_context *dapm, const char *pin);
 int snd_soc_dapm_get_pin_status(struct snd_soc_dapm_context *dapm, const char *pin);
 int snd_soc_dapm_sync(struct snd_soc_dapm_context *dapm);
 int snd_soc_dapm_sync_unlocked(struct snd_soc_dapm_context *dapm);
@@ -509,6 +507,16 @@ int snd_soc_dapm_ignore_suspend(struct snd_soc_dapm_context *dapm, const char *p
 unsigned int dapm_kcontrol_get_value(const struct snd_kcontrol *kcontrol);
 void dapm_mark_endpoints_dirty(struct snd_soc_card *card);
 
+/*
+ * Marks the specified pin as being not connected, disabling it along
+ * any parent or child widgets.  At present this is identical to
+ * snd_soc_dapm_disable_pin[_unlocked]() but in future it will be extended to do
+ * additional things such as disabling controls which only affect
+ * paths through the pin.
+ */
+#define snd_soc_dapm_nc_pin		snd_soc_dapm_disable_pin
+#define snd_soc_dapm_nc_pin_unlocked	snd_soc_dapm_disable_pin_unlocked
+
 /* dapm path query */
 int snd_soc_dapm_dai_get_connected_widgets(struct snd_soc_dai *dai, int stream,
 	struct snd_soc_dapm_widget_list **list,
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 752e8fa8ec52..1d7457368a82 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -4771,57 +4771,6 @@ int snd_soc_dapm_disable_pin(struct snd_soc_dapm_context *dapm,
 }
 EXPORT_SYMBOL_GPL(snd_soc_dapm_disable_pin);
 
-/**
- * snd_soc_dapm_nc_pin_unlocked - permanently disable pin.
- * @dapm: DAPM context
- * @pin: pin name
- *
- * Marks the specified pin as being not connected, disabling it along
- * any parent or child widgets.  At present this is identical to
- * snd_soc_dapm_disable_pin() but in future it will be extended to do
- * additional things such as disabling controls which only affect
- * paths through the pin.
- *
- * Requires external locking.
- *
- * NOTE: snd_soc_dapm_sync() needs to be called after this for DAPM to
- * do any widget power switching.
- */
-int snd_soc_dapm_nc_pin_unlocked(struct snd_soc_dapm_context *dapm,
-			       const char *pin)
-{
-	return snd_soc_dapm_set_pin(dapm, pin, 0);
-}
-EXPORT_SYMBOL_GPL(snd_soc_dapm_nc_pin_unlocked);
-
-/**
- * snd_soc_dapm_nc_pin - permanently disable pin.
- * @dapm: DAPM context
- * @pin: pin name
- *
- * Marks the specified pin as being not connected, disabling it along
- * any parent or child widgets.  At present this is identical to
- * snd_soc_dapm_disable_pin() but in future it will be extended to do
- * additional things such as disabling controls which only affect
- * paths through the pin.
- *
- * NOTE: snd_soc_dapm_sync() needs to be called after this for DAPM to
- * do any widget power switching.
- */
-int snd_soc_dapm_nc_pin(struct snd_soc_dapm_context *dapm, const char *pin)
-{
-	int ret;
-
-	snd_soc_dapm_mutex_lock(dapm);
-
-	ret = snd_soc_dapm_set_pin(dapm, pin, 0);
-
-	snd_soc_dapm_mutex_unlock(dapm);
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(snd_soc_dapm_nc_pin);
-
 /**
  * snd_soc_dapm_get_pin_status - get audio pin status
  * @dapm: DAPM context
-- 
2.43.0

