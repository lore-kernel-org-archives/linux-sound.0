Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011065.outbound.protection.outlook.com [52.101.125.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD4E1D7E4C
	for <linux-sound@vger.kernel.org>; Mon,  3 Feb 2025 06:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738563672; cv=fail; b=b9husFtsOD1oMDEq7JvJ79oBK4Ga85CRzjhjaQgYT3/aS6pV9T4qp30FDDnwPt5489HlBjv2xygnTTajb3jKoU3PV1JRCJ9WzoMOBmYgjxHDzSq3/rJNwoRbjQ8vHm6x8fB3YK8Jba2VwyKZc2C6KYiR5l3C/T3ywDDk7GelddE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738563672; c=relaxed/simple;
	bh=2N7R+/1XE0pMg+3cGG7F9YaQSlyeBrfuKJCNErxAtwY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=hPeXnPCat2F2UEvemSMbdCLYQhdNqAMpoyLxcLWHYqz6QLEPvniZw50Xab5ycr/AYqGxPKt/j4waxpI2YGUG1IV+icoDBOVh4f55T7fAhQsxj7BaVyScPl17YZrgtQynMDoiMiK7zktSHSBnoeQe3NFAnUXSW8NzXXKi2bHis6M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Vmn0MtZP; arc=fail smtp.client-ip=52.101.125.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Vmn0MtZP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Od0XvngcgF7wckB28ubjAdK58CEnfLQ3lCjoZKw+xL3AQFzEpjyfMIDWb+zfgeiKCXFWWzCvgJH3e0OEFnvH8IbGdyHuq8nS/oepRaG8SSHzFlaCxnqHZ+f+h4UidOPnLOVAM//xw3gejuQYET/k2M0oqaHJTz97Dgv0yQPCEjHsGrWm4Z432HzIe/vINMMxXC6j46yi8YvZ9hIHK3jipVqn+1iM3FXS4vn48pbARY8Pfb32t6CTV25tIM3QsmYxUcdBI9QpoWFuvgZvmMdPnssTHIah8ASBeYenp3Kq4T2vEmQZPbUAu4qYyNGC4gnfyk/egVRI5sYJSBIBhUcvLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=45ej9izMZ7IL0v2qHPl//3PtYamrYKGW29CuNl2lVpk=;
 b=GZ63NJlz9wjzJVmONBkziAuZ4O0C6K3U8zkM6MTgai7M077Wfi6ezH/aElPjwXSVtUjwV0CEvdwadpUL6NaPEXpiN9HTq/0rHNcT7wG51zk9gaTAYGQSrijlxLpHM1EutlPqLn4b8EDtvGgUM2b6D7V+Lkct2kqt5qthYPWgaaxXmfO8Z2r4HRJFkHEaeC2yE6CCltp/tdIqlP4Tq4nbx7x0Kkknwkkdg9cqaDeAVKEPpAAU2oFMHpWqErSRWKuaO0qodWZk5NtUThFdAu9KwaKzoOaDf2yQ/RAshYbYbAUxC9GljURHKgVyZ+XpJpj221zbxN5IDUGotNMoRRvLtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=45ej9izMZ7IL0v2qHPl//3PtYamrYKGW29CuNl2lVpk=;
 b=Vmn0MtZPmJCWHIbPcIKykIMR+HG2POiElfTSQNmkw8UEp3JXl4iICqYAxiAZhu41fr3h5o/BX/12IeQUCKEcbyb9emnmy9JjTeaO+z17kLAJN5skohtpVApUhnT22zaxlwgrFDcRNZkSq3DXCxhmjMbDHcz3ifL4EepKlNXSC+Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB11036.jpnprd01.prod.outlook.com
 (2603:1096:400:3ad::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Mon, 3 Feb
 2025 06:21:08 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8398.025; Mon, 3 Feb 2025
 06:21:08 +0000
Message-ID: <87y0ynr1kc.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 3/6] ASoC: simple-card: use snd_soc_ret()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <8734gvsg5i.wl-kuninori.morimoto.gx@renesas.com>
References: <8734gvsg5i.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 3 Feb 2025 06:21:08 +0000
X-ClientProxiedBy: TYCP286CA0259.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB11036:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fdb6cb6-35d8-456b-d999-08dd441af253
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3vSQeOEjk1gEhUFodwdQ5V1ASwhCqyhMflDMtP4gRWaPDkzYwUOAfEmKf3Sv?=
 =?us-ascii?Q?KUh91HGQsw3iYclPEZvGIVaQfwq4QNaQTGIPltMrk3pWx+g8UcnhzQVv0zrP?=
 =?us-ascii?Q?H2PPEgjIfQH1oiq11Z2UJq1KYqgSbQAMEqoyHpLAWG7hRSDB+PqyH89AEiWG?=
 =?us-ascii?Q?8z76us7tSwJ1kG8/ngWGBfg0PMU3wAOa0jWpK8bIJ15o6YMH7crrSrr+2eiv?=
 =?us-ascii?Q?Np+cfaZpap1dlC7xxzVnvvi8EnkZTBgqTDrqMzh4YopTRyCj6T8rxhgOVEGU?=
 =?us-ascii?Q?Nxn3hUxIR4AQAYxwpFjiZ6kGEgzycedOnIUIyZuDeysULtclOj/mVimB5PER?=
 =?us-ascii?Q?HaGJJRYC7GQflqeZlOdM1rFyTgXgqumVrj9uUAorU2igM/AlMGDPazwUiPTe?=
 =?us-ascii?Q?igFBSX/CltLrReDdVCoIesKj0E2di93yq4X8ceh5uComW22bAdiL88S6fih/?=
 =?us-ascii?Q?vWJKurw+XFO/PK3wVzdeNR1vqnj5XwNF83xuEl5mv6KlUy/hV0lykCUajGMP?=
 =?us-ascii?Q?U0Uc5U5j/ZXb7dr8eYco8CgoVY4OjjR+su95H0Y3BysiMKujWqj8bFsIIJkf?=
 =?us-ascii?Q?WI7gK2D7Pn/iJELLd/Oi8o+yKzXrMxiFqV/1uW20lAkCqmtSwPS74aT2tgrU?=
 =?us-ascii?Q?T1JMu4lIg6sL8kwhURlmxfBrJZ8Aiul5Hbz9CZgxN1eU4Ngq+PjEu4cOTtcS?=
 =?us-ascii?Q?idefjaHLZvDsE/ycVLEVbQw/wjQBCQc0cHX5FNjxnMDqhF/svZu8xX/+/cD2?=
 =?us-ascii?Q?5CvWcp4dSHmwXhZEnkokzYIkNQ8jnJNpXUXW28yn0XshEumyzC+qrg2uOQ5Y?=
 =?us-ascii?Q?niTum4GaTZvf/6Q2+fEouK3XsSdBrsSaquX05paOqw8zuWUCFwaz7AxKykWF?=
 =?us-ascii?Q?MhIACs0cVnGXmyaWeDp9tnzp0OiogJiE8Ex/xQ95GhHhW7yJDfwAmg0EHNep?=
 =?us-ascii?Q?8Nk5e3css63mHF/2e7e04mQO7mHHz2jL9jRazz30rQQKDS0GOK6GOJxa7Kl/?=
 =?us-ascii?Q?+hwCragwuoBlR+D397MDTg2+F5g/RO09S2n2n/Ib6aXq5Q/aV249lLsEX02y?=
 =?us-ascii?Q?XF5wb7rbhx7msD43SZ9eU12Buame5HarAYur+0XvqZkH3Vot/s6IoaD80OeK?=
 =?us-ascii?Q?wwhqlC3+emU5CetrjeaNlZdSzm2u7d814AN/tF+fcifJ7ItD9SfKrtIBv8OW?=
 =?us-ascii?Q?x3diOKygpxOhiu8o61eRA2AxsWb+oTFu7YNv8exIri1zYjbjawvMiqUsfax4?=
 =?us-ascii?Q?9+poE+gcEgvzVe3jWt63AMmpD8UUSsHyLxS/Gxp9gcLitXqVmNlvro1RV0V2?=
 =?us-ascii?Q?k0YJ9hY1o9m8zOKrisCEcmjcQQrv8XuzIsnBmhS3PjPRSEE/r+/ACWykqheo?=
 =?us-ascii?Q?eLUj7MMvA9iBVCJwnZUy/ZtdS25hU+fGWUQfjBR6+gPKBZUJ5LiFEMrP3mlJ?=
 =?us-ascii?Q?unqqanhmsDeCnhdDKW6CEd4lTf4LH0BB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8qbSgTj9QroNB+w0HzjnSHDaccu0JcdVTRw+vQyP4mSi4T82oc+WpTM0EFZH?=
 =?us-ascii?Q?Djbfa33CoUsb03pzQpzw+lyaXWcthYqJlQ2OPT6thrC+ENv+glK8G08SIvVO?=
 =?us-ascii?Q?SmxVyH3ewFC863o8SxtREPCR62HQs7eC5hJNaUvcOkbreTMoRklIkFAk41Ua?=
 =?us-ascii?Q?HAl0IGEc5CZoxZmnW9qb0IlbswRfFeWctv4+rAgi/jsq0GLOO3/SdOPvrLrk?=
 =?us-ascii?Q?1LBVRHzSlZFPU3DqZYNWAWGpr1FlDCWfCXFxw0MGEzOmPKqqYfYsZJ0vAGER?=
 =?us-ascii?Q?/KNdRtjqISKVZIva031mq6PZB319sf7hMZqlbP7x6rWPz9llcOruzyb2N0rq?=
 =?us-ascii?Q?QVuyCh9K4o87knpB9IG9lqS/pC0WxEp6QOW0FFoWWs6LmForW1WoCLCgolyX?=
 =?us-ascii?Q?bIQnbUCka9CzCNMROUsNaD5KS0XPkRQByVRvRx1GXQfiI4nNsQXvHZJT3IpR?=
 =?us-ascii?Q?AZkmfApahs8WrajQkZt25vTf9+jGQCONF4nm2myFrIgeitZrgWug6UcZJXMY?=
 =?us-ascii?Q?52+NIeYG/99LxFCNoq+YxSSr7cKsqly/VQsM7KaZ2LYQmCDGM8v3JfIS1ucY?=
 =?us-ascii?Q?uge3n4NCcxQGpb2Xl//zwW5E8TJHAQGUB7PDDPt2pL8SwEDSTA5n8X92kChs?=
 =?us-ascii?Q?FREw+7SmGwyIZngD+3oLRdOjLs6seLm9p5SeiC2M3UUHhIDbfkII0vqkwZM1?=
 =?us-ascii?Q?eVm0zjAN3QcKe4OAxebwP/9NoWletg69hV25Y1ziO8xe08CnQ1aAA1Cr7up0?=
 =?us-ascii?Q?1eHHEDYfQGsiBwwmzfAPqxQX6fgp1hCBHFqASuO/1UDHw/nz1ASlu64/XV5W?=
 =?us-ascii?Q?J6jb4bdjBmX143HSP5bq72bnZjHZvJOmWq6bI9iF+MjtxK/UVbqxWHpw6EQZ?=
 =?us-ascii?Q?XCw/iN0mBJ2XBHqZP2OvQUxBNqN+q0KDKcXOzpjR3ZD2gIE/tRcI2JKAQPu1?=
 =?us-ascii?Q?zOyxWc3Cp+4wfwNvkOglKG3SrSeIhuhUQEbTPvZmGSwuJ38J4XV8K+xvtW6H?=
 =?us-ascii?Q?PDrlTEYjAt21JDcBrku9O8bI3ivb1ilxsEY3f+yaN/3QyWEQr5n/RgDa7nI5?=
 =?us-ascii?Q?TVWDBSPqKWJ1E6SvGW8a7kU82ZYJW/21ypDj2nDirBfuyAESMPzMhnMHw3o4?=
 =?us-ascii?Q?Mnfy4j656eNm4ggbBmlib39c+YU1Y7xQJ3+1eOhbs2ueKb6qlrAvnEBwQYy/?=
 =?us-ascii?Q?ojSFvl7bo4w/NtGFmEBk3vaDwmK0OjFWao8TU3wVkwO4TYEdwOomC20tICzu?=
 =?us-ascii?Q?IcNJ/F+9gEl8oaorsBXKh2u2MyVV6QedXSUUY7i05QjDfTYvlKK5Q0JBtosO?=
 =?us-ascii?Q?tZTeW/yTgBw7z2SDvZuC3/wQWbHnZX85t4inPoiQ8kRHCQUcPAbtuoPjNf+9?=
 =?us-ascii?Q?5JZUSq84gWLDY8k96fRFzi81FVd42FOy4Agw4Culy6ILewJVJBZJ/jZUwUuA?=
 =?us-ascii?Q?b0D/FG4ue6wV7oju2bB+8QFhk4EJoz6VuxWUw+kh+JNUv6CBuOzoEcrgnzeY?=
 =?us-ascii?Q?JWzKBrd0Yrey3IaJO6HxCtTHnA9E5NOVBSYOwEMmgH1wpMwcIORxxoJ4nLcO?=
 =?us-ascii?Q?9Xab684tsjUWpaIpsz9YGKr4w3B+sxIRK9KSIsXr0P52GERFDqJJWxhp+Glq?=
 =?us-ascii?Q?NPQqeDBVfEBGY0TL2einQcI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fdb6cb6-35d8-456b-d999-08dd441af253
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 06:21:08.3047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ITcRA29T6eHQurpov5WCgw6yyHYRsHWpSZ3Jdc52osZXAz+Aw572jnk3D2xS7BQQ5DCCAVbhNyPFCI1yxHMNfCFJM71xDQ6r5zR42C2+93I1SFHaOwgaUrMipdE5aNeG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11036

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

