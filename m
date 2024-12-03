Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010004.outbound.protection.outlook.com [52.101.229.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3422B219E4
	for <linux-sound@vger.kernel.org>; Tue,  3 Dec 2024 02:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733191830; cv=fail; b=Vkh4D1H252INtoWw+JQy7nlEzut1oswTOaEBx11QgJCTNZhpKlXqE7Qqs6cv4PA00IvtkmIhKju1/rsnZ2TDBp/KG0WduNLHUAjjrovL8NIAX9HOHp8olxprZwo5mM1hcusmK8KxQeySX8jyMmLBw54kND+V4JV9Y5Ti1bwP2mE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733191830; c=relaxed/simple;
	bh=oQ2RHPbt7j77K7Q9wMi8A9SOVGwL+U60HHpwsCxOjOg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=WIlZHbeXP7jtK6jkAf10XaqjxlpL7Z2mNMyln3RpMiKJmUlIqNTk8uuevCCNpkprQ0b601GrO1Bnl60l1Cpxvr0r76kLRgVHr+YhsmXvYfoIpO0RN+/6Cv+fiNgqRaxMdRCC3bKCu4ABHFnMmJgAZW5IJMvieQNHEUS0Tvu9nCs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=hXWz0Ml8; arc=fail smtp.client-ip=52.101.229.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="hXWz0Ml8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y4/tPneCtYboCDt42D/voQJWPPowqOpppeor7R/2JX5D34ieEKRAjkISIuchnVon492ZeeCE/joMOLosWq35T3M5EeldpkWISPcASgW3rZ4nE3Z/knbN+crDtVnrTcxUroTTNHOmdfKCTerQEGJ+7pEf5dn9nFocOmCIhuasjg9O6kbKKOwciqtx9DVZHnYQvJlJP4nWJe/RVXDqoHAqgISoM3h5CbHP4pnnYdSi1rHB5PXUN2wort/uiqWje5BfEvqDLxNtTTGEMKvT+G7yfa0K2hcblEbwSG3Q/19AhDBed626nmDH0puGypgWe5sgvSintpJaukn/mPCm2i1uoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cFTOYPQUG2ih0Jx/XZtiyIqAMPGdn72wIFl6Gn02lsc=;
 b=hBkHSbzB3/z2UvPmyJcBFtbruHYb4Xq/owojJda5BYzTGHbAq/IgFmIa9ONxGLS5htd7B6hHs2VFULShfTPXr2LaN+ixli5tkPpop4uakBQYyiJ/tGBYFdCXFMT3hVAkTRNwTAMGYSxCNKvg78UZ09SBbz8lVqYlv8vYUGwvJAB/KKHcAU1AU3tD01OXAJWbwpLbtSFaL0ed31zcEpCZrRA5tHkVSdpczylxuzPzYm1eA3e1/UekjjDN/HcXFeWHOYddkVlpETks2Tm+kVQls+Z1n/PGjhFpOFbITL1JG6XsSPVFitAS22IOYGd94uY+wxv6aYhjlmKBjJ7w9V2YgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cFTOYPQUG2ih0Jx/XZtiyIqAMPGdn72wIFl6Gn02lsc=;
 b=hXWz0Ml84nLqQCmi1LBtMtwwIWSRUSEZbeTg69Vqqi05JN40eV7pJQ8Y6m6kEgyZb7IosAjxltah2VKTDvZsRPpY2XWZkiHcnoc5+8T0GbyJOh7xjgtHZ1NIntJKmPFQZVPAWcFzXEAGphK6xowuCyXI9rQfEI2KtNoydSKjFsY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB10407.jpnprd01.prod.outlook.com
 (2603:1096:604:1ff::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.14; Tue, 3 Dec
 2024 02:10:23 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 02:10:23 +0000
Message-ID: <87r06pfre8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/3] ASoC: simple-card-utils: use __free(device_node) for device node
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87ser5frep.wl-kuninori.morimoto.gx@renesas.com>
References: <87ser5frep.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 3 Dec 2024 02:10:23 +0000
X-ClientProxiedBy: TYCP286CA0041.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB10407:EE_
X-MS-Office365-Filtering-Correlation-Id: 403e26d8-9068-4398-c2e9-08dd133fa582
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eUuOlnsmMurmGGSOtVej8l/Ui4MdZrHvjnadp5vJH7hTn9XckMkgIrKUpfaR?=
 =?us-ascii?Q?roiiHuNO/AmVPN+pAjQYeo6LHv+yklD2hFuvrmAp7OcOMD+w/jhAQiynZEei?=
 =?us-ascii?Q?QuPY63jDnz+7D6VNKisPMXNBuSo0TXMR99y1RXkAanF+tFQaZccUookFPgeL?=
 =?us-ascii?Q?MkfNpmk/8ov2nmDcjt9grgQ0slV4xHmD+Sgv0PRpy2W+K7VM6LvJPTbPbrXb?=
 =?us-ascii?Q?zzNkhwE0CWRXUBWB7ZdrrmtIu+uzM4wgXUr3k3qHhco4T6DuYINRvzjC86J6?=
 =?us-ascii?Q?vp1hIv6hUh7m3rkyFT3q4GDtoGKNpvO4vDLEsWH0iv2w/OYzIxAGTHeCrmpW?=
 =?us-ascii?Q?XbsIh0lR5529xbjVQFmm+XnkcZ7+QH7S0zPz9rsU+8Zyr7lZOeZIWG6PTX04?=
 =?us-ascii?Q?JinFb8QYD1E96JWa+wJsv4fGNeODZs7ZMLs1pJqQs7AqsR9wwPffSZh84Rso?=
 =?us-ascii?Q?WovO/kTsv5M4gSgEj91Sk51VaAcVaOiVE0HMyZLuihGNIfh8gYTjhL2WAKJE?=
 =?us-ascii?Q?DjajXhayMqJHwTJZtCcHl/JBVeLGsQUiblj1OtwPe4MMDGBR779erm3nP5n/?=
 =?us-ascii?Q?x1uljqRDcBgkRZ7a8LJkCVpzRLSoCg56lHRUGOMouAbhnZJWnA3DehuMg2aR?=
 =?us-ascii?Q?8VwEP8OswSMWHMLJ4N42IqdyyU+S4JLbdtCInQKnON/qeuKh9e/VNNURN6nr?=
 =?us-ascii?Q?8J/fyEU8q64haqSJR4GGkAQr1hVzUk4984Gu4k6wAqBweziX2bctF+7rqt4n?=
 =?us-ascii?Q?29DQ6Ej25p2p21CgdXEPkg5t60YGGVNowOH1hfwvkmnBhpOugJEupum9brr/?=
 =?us-ascii?Q?K7bqUuMPEvURzK07XULXv0fQdzA0f8XQQ/09M2Jx1SlPGxFEsnPoRXYRLdcF?=
 =?us-ascii?Q?H+hvh1bae1fy1iB84HEcBFlN/97G5jU+EpPNFYNCGLlfvRP8nqh7gXjl+pOK?=
 =?us-ascii?Q?Tu4djZwdkR3qtAT/iX3V9+VMoLxaXq7hbF0jlO0ZkoKPsW2UMeJzJewpsOC6?=
 =?us-ascii?Q?oa4+468oGtsWmyLAOqX8m7byWVSnAlbfKbx5W/zj6L1+FbAr2Qrs9WLihFjw?=
 =?us-ascii?Q?wNErU0AwKaq9HXFi5F2BZLVFBg56+MbmOdHk32Xbw6eYpeO33bGJ1rgxG/XQ?=
 =?us-ascii?Q?wQsUwc/FgD0NKkIJ8AMl3/Z2OG/0VZM0EZaQny/kIZ+qLAkUZjVh1ORFrY5p?=
 =?us-ascii?Q?GVjI5p0IHuBy+AkxWfNb3HSHAqsK53RjgcPQDanpvsCnvpfkRVzhu5dXNytz?=
 =?us-ascii?Q?Tdp1yhaJgA1hz4nXm6H00vY/YKpXQlHtS5QVIhZZ8u4syLy3pzTGjmOuO2nH?=
 =?us-ascii?Q?KtQ5hd77+Hpt6VcJSzo/SLD2SO4Zg4oboWVDjpqlhkRJ/Icqxz+AYrwcjNGy?=
 =?us-ascii?Q?nX77MX7gKrWiHUSqoZvErVzxOdYAWfoLgifL9Ky6L2ggXTxWew=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YkdvIn2RkEc1DEltn8gRveb6xE7dMmAaMNuxbHXPSilU7xhGGQmu2XBqytu5?=
 =?us-ascii?Q?wJirwKYQzyCH9H7v7eTdNKPj/LNARACqsHECojEjfKVWPcyl77GfaB7LMp7l?=
 =?us-ascii?Q?8afwQvi1hdm4ubzqWuHtrrUkkI+jWUWkQuB6XFlCEuxWHEeqUw0pozR2MjXq?=
 =?us-ascii?Q?jnLNrbMIW/0T5pYCCa3mNiYq6N+VSnrR1efwiamEOKa5Zpmpbt81d5D2L5TJ?=
 =?us-ascii?Q?ljJfq0C1+VbLAPQobyHBZRqs+FKw0AZU1S2jiYblm6V1MUELm4yZJovd0fYq?=
 =?us-ascii?Q?FcSBpr6lRIDGVlnFC6tLDY+pPpcM3WyQfd3msm5tTXlqEHuUmNPJmiS2SX0A?=
 =?us-ascii?Q?7DkepcdleonQAjjAwUq5E4aLroc7a7n48rRlzNl7wN71jdyHsTmcTMnP4Mtq?=
 =?us-ascii?Q?DxaMhBK66fRVKU49IxCEXO2luXGo68SVihTobKNmh6N4g3mUPJdYqFHQQf9k?=
 =?us-ascii?Q?Q/vWh3hjG8nJDj8BOonpgxejaS5gC+I2ii81rDPyTf9eerHfDW/04II/IXz/?=
 =?us-ascii?Q?JDA0ILhsXXiS3rt11sEytFt2mbmnN4ZnSLQIhg78Qtuoz6A85uAhDRYb4YIr?=
 =?us-ascii?Q?cronp5wrOCYyq0ZUTHAVHFoKik4JKZJYLPS8cYCc5dEtBbfNHvNmTUV2MtEB?=
 =?us-ascii?Q?95YQJJ1iivNA7kN65FDMv+ba4HKVt20UbWYoKghg6Hrzg0OCLrIRL5An78D8?=
 =?us-ascii?Q?IT0XOsML9p1Hew2CjfFF84h/xVtxEepAJRomBKie7EcWcN7FDIcDa2ZtfquL?=
 =?us-ascii?Q?DBPzvR+vzQHlu1t4rgl/PoUoWjXW7Eg59Xsg2a7ZMm9Ui1mbhzDXKbBrhNdg?=
 =?us-ascii?Q?KH1f+gwpj9KVcLv+TPdh9wjLDAdV/OBrB1h/2j0GEDcwByWyExwOo8QHMnkx?=
 =?us-ascii?Q?vj91e9XkqTgC0c6m1NaYMPmw/RHF6uCVHfSYJVrBeFWNCvZ2IYZijZP4ezLh?=
 =?us-ascii?Q?pO7FpnfIX3zgwOmCNc9dfQYOQQuLdCaSYkYnl4QQbmHE7J2121XaEIsWp/RZ?=
 =?us-ascii?Q?kN+jVVpkNhKDcFp0qAktRWsEkKCZoOP93RBuZsixCe4DiPLKlTVRZNHTNB+t?=
 =?us-ascii?Q?3IcGaw+FQOjuwb56YBuxeXKbQ27Ji3GjLmd9Q6AMf2Imd9t5psbfj3me3hgP?=
 =?us-ascii?Q?jb02TVnZzTuQekUmQR8okfloN1BCvluOK3+SocpwgwHLCMZdOHpuFBLMIFF3?=
 =?us-ascii?Q?LFpoRpA099BeFv6EQJ+N11Iqym4o9COIgSGyVIelRIRcxMIUZrFsAmribF2c?=
 =?us-ascii?Q?Bt057e81kogQcST+ygYfON9HayzQRCD0wdQkvzqYFBr40PTV1kPAP9Ztrk1T?=
 =?us-ascii?Q?dFkVfkM4o/6Q+TK7iFQFTnU2GOdM8hFw/Y4FMFJYAtYd1jcc5if/52EQqUhB?=
 =?us-ascii?Q?8ksbbQXMQkEIeIAVX7mKS8dJlVJB00rsSCu32fRXCtt5DwnOxOYBhvSS8AXV?=
 =?us-ascii?Q?UMwY+8GkTcNAxiya5G6qgA+P3pjW5wMV8fKP7McF67l7UKzCnk/Olwrw1maB?=
 =?us-ascii?Q?ZlbDdX9kZqVRkUTbPCdM/qhYzWZNr714jlPT3WdBKLCYwUpLKPs9IQUAIY5u?=
 =?us-ascii?Q?IQYD7qlP4A1vqUi/Vlnk82OCDuLt7zBqLqfwnCSxIhESOJnLeOt3zAu0rb6m?=
 =?us-ascii?Q?x6EPTKAyDMay2bpv9DWx4Dg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 403e26d8-9068-4398-c2e9-08dd133fa582
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 02:10:23.8437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oAJ5aD5zO4+XEs5anSGgbVMH+Q3CErainaiZLrL3ZJP5/8GSm2KnSrB9gg4jpkq9JifiO5YH+9A8rKcFegSZ+q0xlySgCZCgZxU0LnV67rqm3JIFlAZwx77ATVcn+qzk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10407

simple-card-utils handles many type of device_node, thus need to
use of_node_put() in many place. Let's use __free(device_node)
and avoid it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/simple-card-utils.c | 44 +++++++++------------------
 1 file changed, 14 insertions(+), 30 deletions(-)

diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 24b371f320663..d2307d135931b 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -1005,35 +1005,27 @@ EXPORT_SYMBOL_GPL(graph_util_card_probe);
 
 int graph_util_is_ports0(struct device_node *np)
 {
-	struct device_node *port, *ports, *ports0, *top;
-	int ret;
+	struct device_node *parent __free(device_node) = of_get_parent(np);
+	struct device_node *port;
 
 	/* np is "endpoint" or "port" */
-	if (of_node_name_eq(np, "endpoint")) {
-		port = of_get_parent(np);
-	} else {
+	if (of_node_name_eq(np, "endpoint"))
+		port = parent;
+	else
 		port = np;
-		of_node_get(port);
-	}
-
-	ports	= of_get_parent(port);
-	top	= of_get_parent(ports);
-	ports0	= of_get_child_by_name(top, "ports");
-
-	ret = ports0 == ports;
 
-	of_node_put(port);
-	of_node_put(ports);
-	of_node_put(ports0);
-	of_node_put(top);
+	struct device_node *ports  __free(device_node) = of_get_parent(port);
+	struct device_node *top    __free(device_node) = of_get_parent(ports);
+	struct device_node *ports0 __free(device_node) = of_get_child_by_name(top, "ports");
 
-	return ret;
+	return ports0 == ports;
 }
 EXPORT_SYMBOL_GPL(graph_util_is_ports0);
 
 static int graph_get_dai_id(struct device_node *ep)
 {
-	struct device_node *node;
+	struct device_node *node __free(device_node) = of_graph_get_port_parent(ep);
+	struct device_node *port __free(device_node) = of_get_parent(ep);
 	struct device_node *endpoint;
 	struct of_endpoint info;
 	int i, id;
@@ -1056,13 +1048,10 @@ static int graph_get_dai_id(struct device_node *ep)
 		if (of_property_present(ep,   "reg"))
 			return info.id;
 
-		node = of_get_parent(ep);
-		ret = of_property_present(node, "reg");
-		of_node_put(node);
+		ret = of_property_present(port, "reg");
 		if (ret)
 			return info.port;
 	}
-	node = of_graph_get_port_parent(ep);
 
 	/*
 	 * Non HDMI sound case, counting port/endpoint on its DT
@@ -1076,8 +1065,6 @@ static int graph_get_dai_id(struct device_node *ep)
 		i++;
 	}
 
-	of_node_put(node);
-
 	if (id < 0)
 		return -ENODEV;
 
@@ -1087,7 +1074,6 @@ static int graph_get_dai_id(struct device_node *ep)
 int graph_util_parse_dai(struct device *dev, struct device_node *ep,
 			 struct snd_soc_dai_link_component *dlc, int *is_single_link)
 {
-	struct device_node *node;
 	struct of_phandle_args args = {};
 	struct snd_soc_dai *dai;
 	int ret;
@@ -1095,7 +1081,7 @@ int graph_util_parse_dai(struct device *dev, struct device_node *ep,
 	if (!ep)
 		return 0;
 
-	node = of_graph_get_port_parent(ep);
+	struct device_node *node __free(device_node) = of_graph_get_port_parent(ep);
 
 	/*
 	 * Try to find from DAI node
@@ -1136,10 +1122,8 @@ int graph_util_parse_dai(struct device *dev, struct device_node *ep,
 	 *    if he unbinded CPU or Codec.
 	 */
 	ret = snd_soc_get_dlc(&args, dlc);
-	if (ret < 0) {
-		of_node_put(node);
+	if (ret < 0)
 		return ret;
-	}
 
 parse_dai_end:
 	if (is_single_link)
-- 
2.43.0

