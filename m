Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010005.outbound.protection.outlook.com [52.101.228.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5535E2DF128
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 05:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788152818; cv=fail; b=e2z5i+x7MITF72hhPAc2yvv4fthA+C42kTsFnAoyFdJEpbuynpq2bnMjWql75o0w/ECXAGK8V8vfs2UXw4BPKXyERHkjGXmcs+2LO4xFLy891thyuFKl9gvFgfqoHUZABXqKvbZ7dSHDz2kqb9j/NYf9JZAtYZVukR94ETdtsfM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788152818; c=relaxed/simple;
	bh=qhlUkQh22Hr+S+oHpolK7MfNWlOBhkYckaOi4J+Sk18=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=t3m8LJ93bsf/nCOlpURYqphZ3M4hlTSjTMOyQpYTromkpzgM383OkWIjZGS7JMcdtu/o0Dszt3h+xhzvFEftK9D4HJxrkVTlCx/dFrkSPMEPRVDJ3SkOihdlVEZqRn6eUs5BXbRPAWGxQmJqsKj2zOJFfW0rsYkS83dkCKpQCBs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=icJLs3Ix; arc=fail smtp.client-ip=52.101.228.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="icJLs3Ix"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lxzn1g+sC5BBf74XJ5tg4E2VvECDXQ8L+ihL2zi8Be2nEgdfde4AaXsJfxdQ01czTzDH4AvVT8buQ+gm9ebGsRrY1opfslzgVrEU1B0S/lJgHsQnaydbD4/Em6ZVrKI8gmP9uL5toPXQWllEAwbbPWCZ5ylouesPXGAqcS81aA/wp/7C8rKOBY5+qHliBD4bSAOSD5vpeZRYmxfk6HlSrR55Ene7JpNAeYxBgNtamNZKH6tQeONBqA4E22rWxMFuCM5p0twx6S3dngUcYN45/6Z0k+2JFqE+7QHMqdJ0fOErBAY+aBllkshgJE4Py90TEQF4xjEdxhjjEHOZvCMt2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Wq4B3C8SONeoK20bTARxUC89uOYYGER3xuTsEA2QSU=;
 b=obpAG0Hi9+7oDxyU5cjHDLnM5+65SsJ4sqzGtKd2Yq3SxembUJg1QnmCytM7w5qdfjEZZaHeFc6nyOc/wefZUfIxihJAPJRjo+efgNWj5DsKNbjkZOZh1Ie5DwCTs77o6pZj6E9/xcH8isRH1uTXaOme+oGGgnQ5yQaFQWD96ldeKO5XNJV7O/rD1pDr4MK0hAtkCuVsmZxM+LYiKx364b7fIsJ787GBOVWYZlRfq2VSinJtVL11TZEHnlB4OiRFl/kGQRef3KJXen+Eb9bB6tbfH/zCRK50UvyGTvfDkcdHu+P6pPqCvf0HhiTUvRB9xWuPrQvYFlVECKU9fbtaKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Wq4B3C8SONeoK20bTARxUC89uOYYGER3xuTsEA2QSU=;
 b=icJLs3IxWi2/X8UbcLL6OUy0tZIFLxTcjDOOGvMUaJ9VEGs157+ZKD9oqnD0abgZV5hdY5OHV0YOQrBRhUlnW83F4x6G6737gvX2I0sSANi7AI2C1n1WtLhSjxHSxlgoDSISK7+0owTZzdhpTHC6xcPTR1lHAN0QT8tr2wZHEuY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by OS3PR01MB9785.jpnprd01.prod.outlook.com
 (2603:1096:604:1eb::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 05:06:55 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 05:06:55 +0000
Message-ID: <87ld9mvpxt.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 =?ISO-8859-1?Q?=22Uwe_Kleine-K=F6nig_=28The_Capable_Hub=29=22?=
 <u.kleine-koenig@baylibre.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 02/39] ASoC: codecs: ab8500: use .auto_selectable_formats
In-Reply-To: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
References: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 31 Aug 2026 05:06:54 +0000
X-ClientProxiedBy: TY4P286CA0025.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b0::7) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|OS3PR01MB9785:EE_
X-MS-Office365-Filtering-Correlation-Id: b26d8c1c-069d-4d9e-b6e5-08df071dad08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|52116014|18002099003|22082099003|56012099006|11063799006|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	AgA5t/W158goOcYWbhG+Lk9eVK8rZSUFyy0SussQrhc24edMf+NuC7VwGbxyMD7ptA6/PxFU7yaFCKgYJZWYWmmnEKeB0F2zfotPdHnPXPfO5A7Ux3CAUf2D0S7SYnIZxUOz9otBbXimMdPeSatN2GxIC2rG47FaFi1rN/zLyeBGym1cmHl+ZaJSAu7sLSuNZQcsWy7lZ2ETph4/e1nOEvLA9Vo8Ltl6e4VBcWf/QPPaZpXljWHpdHQF9N7peqndLkM3B0m0/qPqbUgVRBcflVB8SW7uWsx5t6BWQcgUMgAGGpAbMBCh83xoRVoaB0moyn5B3Rnol54oKVrpE/PHKFwhZpMY5sA5Xv+u5qKk11uGvwItEAjzaKp9VEev828O0cwGFD3TX6TpMlSdQniWokG4H0GkKD8khgWnhoaGgUY4q5ylbHclMoUIY0E87W465NSwLgpOdvA4ki1UQp2p6HoUSC7WBeTHJMq5LFCfOc3YGqH7AlJs9oWrfGzvn1ubXpr7Dl1Y4+TMTGvO9tTSEJMRlEg/BjRZhP04vN444yUoH9oLuZIykiN0gURo0/AFztTsD26yXSxxbJI4eW1eKxdMLVXtEzPv5jQf8DGB3NwU5KSohH30YOPsxuVHbD9n4NMcpOg5xbRiuIE6CF3D/HWFtwlg/p3IGafWqVlnvRXoy78Y4ElXMVZBwKUqhb5dRPX3nUW7X/USCoFcy67O1OPFWAhB8nIDFGqAVKwB7KA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(52116014)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8HmoqiY0IR1ReGVTIg0rSkoXrPpOCB6qzbOAeY1Hcie1Y27+FUvWADN+VzPK?=
 =?us-ascii?Q?IUMWLRbsgaqFArvGIwaLyGFY6vqHMpLq/LuLPfb3dXyR7hukc3XC0Y4xdWZP?=
 =?us-ascii?Q?HymcZi4cQNgohIK4F5d6wJ8aSwTi3xyuzXl/f3fwpJLNR2jlbDui1Kb5pve/?=
 =?us-ascii?Q?/uI3r6p5q5/EQFtn4469KGtcV98zkB8lT/WFEOpu4paIXpACcM346vgQSACr?=
 =?us-ascii?Q?qaIB5W/GWmU/reIhURzc4vEtNV7qVpqC/TqCzQrmo+ixs2cdOaVCSOmwgweI?=
 =?us-ascii?Q?EI3Se64B45oLcsHYvD7wYP8NWDdK75ido+TssAC0AAe399q+x8JaSS2Eoh2E?=
 =?us-ascii?Q?1cKlDTmq8hCRLBIATbX7KxvE9YV+pe6lngg+CD4DJu8v3mBe+TpFxiVd5UWx?=
 =?us-ascii?Q?IPS92N90twdulpkUyLjfdmTk5BoDNC3hFrfp7sWAQYNhMZFjunEsUZq80W2l?=
 =?us-ascii?Q?GM4oVL04+A4SVDlVuaQ+mljrpoc8KB6XjEje1QEqTrp7kD9ltXxs06PkTZ5c?=
 =?us-ascii?Q?73XRGbtmW/7eNhHQG2blPAl/TFANYUuBBFsVDP2Vwp7NqnXIwckc/+OV9O3W?=
 =?us-ascii?Q?Eyrl1rPz3Y+rTqH9t6M2ltlcB2cPv0LhPHwMZSm2kOqObtHW5tgZxmD8s1XY?=
 =?us-ascii?Q?04EOmhN0ufglzjIt1k13/t5MhWaDITzGI8DHAo7p6EUaT6GC59txbNDel7E6?=
 =?us-ascii?Q?GagGgsLyCKNQMdxHI4DKazC8vthHUFaSSFBqjQLiYbSV/wb03LGI9DS7w8sM?=
 =?us-ascii?Q?yug3ILCw/Le7lATFBHqVc1DVPlb+MQtcqUnPVIgLdddfKLFqcbtLzGZ8EdGe?=
 =?us-ascii?Q?ndiF6QZI45ciwHAuEamUZG2VcQqMI2DxRRlSWhRvTyC/ISXY/NsJn6O2hK3m?=
 =?us-ascii?Q?LWondMnBoGFN3KBylucU7smCyo0c9E48s0rd7FY4IWu6qQup+5EjS6+4lc3Y?=
 =?us-ascii?Q?KAzduyjiCk+L9HKcXxV6mPIAOg/XCgzS/9hpShw5vuuiKQacWcOM3XPpsiMz?=
 =?us-ascii?Q?8HghwGrtiF5ZKVidgL+E+dyGUYiwm+xPrPTvYUMft6yLdjrO1XMRizcuLEQU?=
 =?us-ascii?Q?L4W3FfgUnV3WZxDAl/Z1goXGtOQzUCB/yoDx3sO9el7GgMABsZ5N4gNgVoDh?=
 =?us-ascii?Q?/Nz5ZxhQhBnmoEEsZyjUyftQjZRIf+jFyV/7ctf2Iz2GXC2ghbQ6SVzGmGgn?=
 =?us-ascii?Q?SBl3QdbFeH1bU/rER9BlYJ6hauZC3ianSN/IKxYN/8ICNkkjMxuvNwu0o8YN?=
 =?us-ascii?Q?+POs2s72WUaK+axZWAF1Z3+iPtDWQZqAnFeDfbcJ7GaQY/TQXqrUd8Mv0q7a?=
 =?us-ascii?Q?mOmyKlmUBrUKvY2+GkzpIihEq+i071u3mKdwNyyEM8ZuuCwK1X9K2o34NMCp?=
 =?us-ascii?Q?xy5PJXl7ss8jZ4mMJ0tMlh1Mh85x5dpwG4JtZQ0bGw/33xIMGZeQpWmjSlE3?=
 =?us-ascii?Q?xzS8UrhSOGPBYH8GZeH8E16fj8NW3E61sJEHaTMAk8JxsOVjfewDeF43pAsy?=
 =?us-ascii?Q?4gdvu/TPhFdKPHv3tJQ8hlBGYF0djMkMtxb3cy4Uq2SQPTn86f0BB/NSvm0N?=
 =?us-ascii?Q?PBK/9HLh37CMRRLrnTjRe+Q3eN2bjFQyukfOWQyfse/o7igxlZwp8602i4Yn?=
 =?us-ascii?Q?Dm4/2xllXRJCS/WkE9IR+BM1wIsdB/3zwW4xiUlY9DRiMkA+Nr1NFyLkrmkD?=
 =?us-ascii?Q?2i5GJfR+yNFTM9AMSHwfSXwzOAN4o+znnLPjJE+V4sCR5c0JGTVzI63il6Pd?=
 =?us-ascii?Q?DGVjSfecV0pgZuh4Qf3Ki/GGRrS0jG43cu/rKs07PQWs+B1KQYHv?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b26d8c1c-069d-4d9e-b6e5-08df071dad08
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 05:06:54.9767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gVdlyzjJBMkVaH26x+yJO7GnTSCuLPFILYIwNGKITZzk20ET750EOETHnba2IEDiA6UGjFSkhwg+XjUCBVfFynfKTEX2RximGvTVXQ6oGFR5WVZif6JKegKoLxgtT8kJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9785

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/ab8500-codec.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/soc/codecs/ab8500-codec.c b/sound/soc/codecs/ab8500-codec.c
index 2cf96cbdd294b..e315638499b69 100644
--- a/sound/soc/codecs/ab8500-codec.c
+++ b/sound/soc/codecs/ab8500-codec.c
@@ -2079,9 +2079,22 @@ static int ab8500_codec_set_dai_tdm_slot(struct snd_soc_dai *dai,
 	return 0;
 }
 
+static const u64 ab8500_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_GATED	|
+	SND_SOC_POSSIBLE_DAIFMT_CONT	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops ab8500_codec_ops = {
 	.set_fmt = ab8500_codec_set_dai_fmt,
 	.set_tdm_slot = ab8500_codec_set_dai_tdm_slot,
+	.auto_selectable_formats = &ab8500_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver ab8500_codec_dai[] = {
-- 
2.53.0

