Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010027.outbound.protection.outlook.com [52.101.228.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F1612C54B
	for <linux-sound@vger.kernel.org>; Tue, 17 Dec 2024 01:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734400234; cv=fail; b=KtAGKQVqQpmjFTGIoxmIAk+jui2Ngm+WAX47zCpMOVqiXOmQglIqIFxyi7imI+ugs6IoqFLSf7c/gHbAVD5jfpOUj8Auww/r4RKTN2imZIwhdRAgjJrvKFp6tFa3GT3GGYB2Ruv0IK8h3RhwfUwfX9B6ZDj0wx7nOi31cjsQHk4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734400234; c=relaxed/simple;
	bh=Lc4kzxLCllajJdCh5HkkYJyONs1sbaRqqvgHA+IH2N0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=D2U31rDpavd7aFR16Rq/arMiq3GHCpqf/9URStmPb7q8NNqWFIC2nFPVRlJnMwhnWRAjIAXI8cgDUMHTRMNc2BQq8FZhGsP5SUjS33pz+TRJVgqfHBBBY+/FWJWOnGJkwYbAtJj6fhEOGRF/F2Iy2gI8jHlZKLnpUAUj4fhPPYI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ohF8ZdbY; arc=fail smtp.client-ip=52.101.228.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ohF8ZdbY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WfI+mmcgRH5vqKtlvMqYciKB0rys2u6Boga1G8kxZhxDMwYtNpAC8ylMc8GMNKsFm77GNLsVOE2mSJ/hgIlBkLELS6+EI7OnLat6vwDN9s3bUJKqf7eeWVeYTo4/Fhy5MHmrPLVZtS28ck+yiwxEH49jCmKPVcjVckyuHPREWkulY+B8d2hj4eDd1o6z18OB/OMZ6/4ZAhrEhYjp/h4ny4urC2Vtwj35U2dZxI6FEbCDPrGqki20UkvuGYaG8RmKKteQKOG/aSa2BblfXjlr5RpNt7sSvTXwl2Y/bYVGgotLIzpgyl82bfJqUNm8UNs/ERiJFfk2lrxvjCkdy7u/3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qC6Dklo9EHAe/Bkvwz32hjcvQRPGmVWPJVRiVfz6rCA=;
 b=rDuWppefBqQU8W42y3Wwrk1lllkG9vWhWuKnygjeSAp46SvQ2+QDhMcxQpZ7wvz/asBUU397RrMzSEMzrDK+9fsYR7KXNeqDeJdiS44rsgpf07+Yb5mAb7KQ8lqnR8ZFchXpu4bzYbIY4Qo1o4hgW2XHx1QZCoWsx0rNUY7liRql6ZRZhRjDp8Yf+SvVThvV1ZcGCwQ5Ak1CU6srFPZ35EbA+5U+uOC/cSyEbvmhMf8XkPyRJC+zp4BvJoPWlq6GF1yJLx7yYaI3aRXXvXw3bXdKstw+OKRaWHl38UywZnj4Y9pZIKvzrtiaAslfSLDCteEDPKI9+BJbUCTmZdSRVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qC6Dklo9EHAe/Bkvwz32hjcvQRPGmVWPJVRiVfz6rCA=;
 b=ohF8ZdbYaiwcjwUNT1raR0TqQIS0K6YwngLdm4cgjbGCAFKOL8zMskXDtnd3Jufia3Vl78g1elhRwGF+9yM7toEDBAzGam3iJBfrHejXRrvK7Mo+NwmXsXRDSzUpkHTVnHYCC4aAn+lq5mSMymxWx1laO0qA8MuN5bhhCelYFRc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB9279.jpnprd01.prod.outlook.com
 (2603:1096:400:1a2::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Tue, 17 Dec
 2024 01:50:30 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 01:50:30 +0000
Message-ID: <87ttb3m61m.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 5/6] ASoC: soc-core: Enable to use extra format on each DAI
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Stephen Gordon <gordoste@iinet.net.au>
In-Reply-To: <8734innkpy.wl-kuninori.morimoto.gx@renesas.com>
References: <8734innkpy.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 17 Dec 2024 01:50:30 +0000
X-ClientProxiedBy: TYWPR01CA0038.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB9279:EE_
X-MS-Office365-Filtering-Correlation-Id: 363446d0-5cc5-48d6-5095-08dd1e3d2ff1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?K55ch8vVGkKQrIdI0YFtC2Tf5us8z1rHJnJxt/XTUXhA4xXgyBZjGLQ9yUDs?=
 =?us-ascii?Q?3yMJWMpfj9srze6GLdu8r14b0DYJZIC63qU2up835t2sXtzIATKYvKPn7Yvd?=
 =?us-ascii?Q?I0kzJ6g3CXate1ncUxWNFb73PjikD3KlhQn+rKzNqTbVJPOAObk+OMfQnV5y?=
 =?us-ascii?Q?6mhOZRBXItmrymjtF43HsbaQtHNuaejdM+kAlapoK3LTaiAeC8wEao0KOo8H?=
 =?us-ascii?Q?InuuWZifl7u+vsK6xEjfuyjbljWgDnYZbwmulxVcJRLa9ZnjBUms6GTZLS7g?=
 =?us-ascii?Q?ZG3walVGHDMWCDvrfmJ+XARUIXCGa81hC+3NF3JLb1OXHSCvOUO7Akuj9yZC?=
 =?us-ascii?Q?o0qbK0UpDocQQRTuBItYT/ThBgL/J+UJPcYRx+wL4OPRDLCeO9RFtB9O0xfG?=
 =?us-ascii?Q?Fk8int65fPnn3qZvVvcViZ309zV4lNXDGj3BLdKYno0MP97giQvQqDNJjvko?=
 =?us-ascii?Q?m3/C0XCRLZqDxgvRhbRRNlLWUkZaD/ZEsB051g0PdnvHlDBAZtN0/GAbMRX3?=
 =?us-ascii?Q?qEHkzdshE0HzQVGh3XfOHqhcA4fMLU3UJMIYe0yGObwK2+vX9iY8UHAWrQVd?=
 =?us-ascii?Q?xAb1DiokSPvfA+pA8KijiTXU08EbZwAEMAYtZAgCPHAZhNfRQYKLy3S4tj8+?=
 =?us-ascii?Q?/U72soJOIZa+53YfaLGSTnArbALmukZRM5BGuCpiXL7n8ygvrBp+9ZD0G0Zk?=
 =?us-ascii?Q?2uJWn8CPF+Vyy8BZLnT4o1qgJ7PqNqKnfrhX06B17JenfqNe4C+AnzLZytbd?=
 =?us-ascii?Q?K+dJbhgWHUBIeyj47gl0iYiEkwYYvWEN8M0yDlNXU/MPOiWnYG2VCsuXXx7b?=
 =?us-ascii?Q?oQ3AMxa5JPiSXlyqzWXVOi/QrEAQPBCmi8fKL9ZsWK7y9hrfO+WKwiSmrXeu?=
 =?us-ascii?Q?+FYNCpzk1zeoaUNqUALA5yIu9kBGNirUsoPCDXFB9mZKMqpzlSxUXGmSmuF7?=
 =?us-ascii?Q?ZKnb6UvIruoJI68fv0STnjneXIgHnLJnEhO3bcMd2McmFYw+JAN4QxUvuCiX?=
 =?us-ascii?Q?HxhnSOmmmWOK9b68xCStRrNNejL0tp5bwt0nF3RHU7IllSCSE01R5LsKMCOU?=
 =?us-ascii?Q?I4W6OaOTjibFQ9vK3CiEFoBHVvPYAnYXBTbxIOYP69gbgtckaEPm6je72SSi?=
 =?us-ascii?Q?DV5gTmdrXxkg2IDbd05fwU2m73JOxwpFJ6WgUS9wp2kQXJY+vbY0u8k0j/iP?=
 =?us-ascii?Q?VS00pPy3+NXDUQg3DmVrWLxeJZUqeqaGQzeOuOQh8b6dkMp7uu/FA2O6PJu1?=
 =?us-ascii?Q?oN7hUmuR2xgWrMRBDStb5/m5IkdoMsbh+yRyH0mW9Qarhhe21vci4cLQZdSE?=
 =?us-ascii?Q?hJF95agO0+cj7CCV9CZU8FcGUUCLYe0IBDaxaW3vE+4kY23E3zzGWNg04vLW?=
 =?us-ascii?Q?q4hlQcPmPgAhNyawTGKFTrmGH6LdAAXd6Vic7AZ1OmcfqUKWRc0galx0cc9M?=
 =?us-ascii?Q?xr1v/yV1KC31AMXTbZ4tpyyinzKPwq9P?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aY2BFOUQWoc/bnfJMMCO+m01ozISKZ4nBhw/YIjGpYAa7GmYamJMjnPSfGxK?=
 =?us-ascii?Q?Um5ekqzzw3Ed/k1BanQQv6jNXlH2OxnfNLbYVy2gUUC94tqFAvg0DljmsyMc?=
 =?us-ascii?Q?fzmrx46/KTZCbuFp3M+fhlWrwx3a3r1V5Q/JqgM/pDPA4O1vi3rOK+r8IjIY?=
 =?us-ascii?Q?qe4cPEsdznLu9ZhDgDz2xscCzySN/FhQfosbpCk1Zr8TE8SbqZNPhBo+J5ti?=
 =?us-ascii?Q?uiHvyuN3qPqZa7HVPzg+m3uboq+GZYWKvxzL5wnbMAWbM9/H+Z2+5R8BGNfW?=
 =?us-ascii?Q?8qTu+01Cb+R5ST7dy28cy8BxffOJAUxlOEg/7eOEVYsAwxZ1iR6JHLzKPOpY?=
 =?us-ascii?Q?Kz+P2JTG2W9nl9vDsR24WxNCpic43detEsgpmjcTf4Y1SoB/kc3dUn617Zp3?=
 =?us-ascii?Q?RYk/wLX012MNqtTi+OUctCVzZzBYtGTK4bL8Ef4koawTO2fZuWjnCu9Fh8i+?=
 =?us-ascii?Q?hkN2iVB+P5B3QVZV03EVD4qvOsVcJikF+F08+Qy9rECe6guBEgTkzkHHSnTR?=
 =?us-ascii?Q?fqOmj+8RXhVgLfufv8pSilaBq3cqcncE2084WQtI9E3RxB+4bmh/0YxV4Tlz?=
 =?us-ascii?Q?f1muaD5v2Nb8urgfz+rm54QlxA6f2SHcbxkgjMgOxewNRpT46AUU34+zSqBw?=
 =?us-ascii?Q?8Iu55LL7Yq/AcIfYzVspgsQT4dqvmkJGRb8IZ1CY6lZQXjwK/Yxi3ZX5NV7V?=
 =?us-ascii?Q?GbYHvV3N9ZWXSa01sYwmdHxu7OCsUJIA3Pw504KGfi53KgVjorziQutRYoqM?=
 =?us-ascii?Q?L/7YRefaciGU5zx0oHdQ+hnaU686KqEtCj5OhO2gg77rBN61S24ukFD5ePKK?=
 =?us-ascii?Q?F4VONtimUivzZ4I7AA2y98SycAfUPN+LIIJyCobUlspVcClvRukjMJCixC1B?=
 =?us-ascii?Q?wNOJm49MwDgRgg/jVmZC7VioD49hsURzxalygrOGnPfK0zuEOi6B2rv1M5gx?=
 =?us-ascii?Q?CycxsrPlG/17ePR2qrsOYOGFuNV4t6J0NfmXBSpl+2DGpvyG/atV8PDEGCiI?=
 =?us-ascii?Q?kBcJ/GS+WCZySrVTz5A6z/O6GK2vLCiqM3mo+Dv3k2q6AJoDuwUGHYPTzGDI?=
 =?us-ascii?Q?LN1pTrdbfvEnyp5nU86NI2ZZiOjKvFGSmz9Ft/fY/VpBm25aZ4zckPMvfx19?=
 =?us-ascii?Q?Zh/pufIYUrv8jc3z1I3iHm/uu+uc72IIuh8e8EhpaCcgzQZOmr6iftCqj0Qh?=
 =?us-ascii?Q?9V/xZl5SmthrVHKZz6lAYMaU2Gx/Na6fJlDiWB/KL0U09fM/VdUMTdQYQyJg?=
 =?us-ascii?Q?Jinkk0hlf4R5tdfUVVLJtae2lQE8iBvtRjnwUTdjuF7o72VttzvMRE2JpYQ+?=
 =?us-ascii?Q?W+Xmyx9NETbKVZKOapMuSlSlgrRe2QvtVsDj5/8Tj9qFUa8Bk/AbfJzR/Pru?=
 =?us-ascii?Q?NqdZQZG1g9SgTyrRkb6GcKOaH45iwY/h8kO5+XpSdObjveBbRl2SdVJ2cNGy?=
 =?us-ascii?Q?J0R/rBHXaQYsBM7aIF0jcVZZgRi+oeVev1+tcHTQ9uaffsuCUaY9PmjzeeCN?=
 =?us-ascii?Q?Duu9dpQV2rqH54koapuavT6RwV3DiMaZKwcbI6W207jby3nwYVQqPFweFiYZ?=
 =?us-ascii?Q?mnQhZK6OJ+A/7sFVuY9qEUH/+0ebqfY2ylvj71viNtBP+LVFaAatICGmyYAf?=
 =?us-ascii?Q?3vyON4GxFcDbLl5dn/aZq2M=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 363446d0-5cc5-48d6-5095-08dd1e3d2ff1
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 01:50:30.3602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FbhsMz1x9p81K0CRZJNYTFpqz82j01Qc0O4+TVa/+6/rvu7K+BtNoPoqLI2zHbfUobAL1TUWhapj4n3H0MbIP0q4uunbq4DmlzW/r2cLDoOE83Pd/a2XUDWnxAyV0cL0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9279

Current ASoC is using dai_link->dai_fmt to set DAI format for both
CPU/Codec. But because it is using same settings, and
SND_SOC_DAIFMT_CLOCK_PROVIDER is flipped for CPU, we can't set both
CPU/Codec as clock consumer, for example.

To solve this issue, this patch enable to use extra format for each
DAI which can keep compatibility with legacy system,

	1. SND_SOC_DAIFMT_FORMAT_MASK
	2. SND_SOC_DAIFMT_CLOCK
	3. SND_SOC_DAIFMT_INV
	4. SND_SOC_DAIFMT_CLOCK_PROVIDER

	Legacy
		dai_fmt  includes 1, 2, 3, 4

	New idea
		dai_fmt  includes 1, 2, 3
		ext_fmt  includes 4

Link: https://lore.kernel.org/r/5011ceef-5100-441d-b169-dabba135d27f@iinet.net.au
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h  | 11 +++++++++++
 sound/soc/soc-core.c | 27 +++++++++++++++++++++++++--
 2 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 4f5d411e3823f..61eee40da12ad 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -681,6 +681,17 @@ struct snd_soc_dai_link_component {
 	struct device_node *of_node;
 	const char *dai_name;
 	const struct of_phandle_args *dai_args;
+
+	/*
+	 * Extra format = SND_SOC_DAIFMT_Bx_Fx
+	 *
+	 * [Note] it is Bx_Fx base, not CBx_CFx
+	 *
+	 * It will be used with dai_link->dai_fmt
+	 * see
+	 *	snd_soc_runtime_set_dai_fmt()
+	 */
+	unsigned int ext_fmt;
 };
 
 /*
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 426f8d8baa38b..e067366f2a315 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1449,23 +1449,46 @@ int snd_soc_runtime_set_dai_fmt(struct snd_soc_pcm_runtime *rtd,
 {
 	struct snd_soc_dai *cpu_dai;
 	struct snd_soc_dai *codec_dai;
+	unsigned int ext_fmt;
 	unsigned int i;
 	int ret;
 
 	if (!dai_fmt)
 		return 0;
 
+	/*
+	 * dai_fmt has 4 types
+	 *	1. SND_SOC_DAIFMT_FORMAT_MASK
+	 *	2. SND_SOC_DAIFMT_CLOCK
+	 *	3. SND_SOC_DAIFMT_INV
+	 *	4. SND_SOC_DAIFMT_CLOCK_PROVIDER
+	 *
+	 * 4. CLOCK_PROVIDER is set from Codec perspective in dai_fmt. So it will be flipped
+	 * when this function calls set_fmt() for CPU (CBx_CFx -> Bx_Cx). see below.
+	 * This mean, we can't set CPU/Codec both are clock consumer for example.
+	 * New idea handles 4. in each dai->ext_fmt. It can keep compatibility.
+	 *
+	 * Legacy
+	 *	dai_fmt  includes 1, 2, 3, 4
+	 *
+	 * New idea
+	 *	dai_fmt  includes 1, 2, 3
+	 *	ext_fmt  includes 4
+	 */
 	for_each_rtd_codec_dais(rtd, i, codec_dai) {
-		ret = snd_soc_dai_set_fmt(codec_dai, dai_fmt);
+		ext_fmt = rtd->dai_link->codecs[i].ext_fmt;
+		ret = snd_soc_dai_set_fmt(codec_dai, dai_fmt | ext_fmt);
 		if (ret != 0 && ret != -ENOTSUPP)
 			return ret;
 	}
 
 	/* Flip the polarity for the "CPU" end of link */
+	/* Will effect only for 4. SND_SOC_DAIFMT_CLOCK_PROVIDER */
 	dai_fmt = snd_soc_daifmt_clock_provider_flipped(dai_fmt);
 
 	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
-		ret = snd_soc_dai_set_fmt(cpu_dai, dai_fmt);
+		ext_fmt = rtd->dai_link->cpus[i].ext_fmt;
+		ret = snd_soc_dai_set_fmt(cpu_dai, dai_fmt | ext_fmt);
 		if (ret != 0 && ret != -ENOTSUPP)
 			return ret;
 	}
-- 
2.43.0

