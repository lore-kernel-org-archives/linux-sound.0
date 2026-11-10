Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.64
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794288231;
	b=qcLcs8MBNHRF3Zrkokjbt9NBY7arqvGV99zLoOFAtTob8y76TkZL/9HlNIaBbLvfVwLW
	 hxW9O7ESJ0A9Z9TA2yHWoZ93VPjDmEtvufI/EBvamPEDk/m7zkxpvyw9vnNC9CK52ZWdq
	 CXDKu01qJi3P7o1vwCQPsOtB8/BuPIwpRObDhGPqwfWNzUU91ob4+H4Sdz9I2viQJfEbg
	 RcPk/LlYpWufnBjbcNvirJRJDx9smN2TU7ks9Qn/NR5g92uiGSObSRnoyvvBC4IcUnLH0
	 7LiXxSmRBufQJvMoPX50CllnwzcNm4Rd4dAuwFJNqL3/P9X2qpca/7bD5fB1Kr9gBmA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794288231;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:From:
	 Subject:User-Agent:To:Cc:In-Reply-To:References:Content-Type:Date:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=JJlKWbrY2sk47/3lhp7vOWcflXJ8Ox97dii49sewTuE=;
	b=FdFqGjTUPK6I0inU0ayI/NPjhmucg3tg3nZsHS+MJfqecun9nG0aD8GnNPoFopl3vLb5
	 UJVHkGb65vFZWP68Z56qL++O0fkh8u9ZcLUrzO2dH2DgpOnwa8WukYco7dmWA6uU2IOhu
	 yveRbvx+IpyWJjQeNGE0WSHEeQ791LNAs9SN9AX8IKbtWq9vQf5I3mMXbCFdazLuCBB0y
	 gYs3Z1uSeihTfGjhETndEtmYVBXO8OSqKjYiU2Ho2CpBIwru2+RMsaCfYDVbCYek3RAqu
	 0E2JcX42FZ67530qQ1gM+UtDk1jXt8clvVTXmVOrFdahgcGXuwTzFrFwDi1N04aibnQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=DSripM06;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.64
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010064.outbound.protection.outlook.com [52.101.229.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5EA5606A31C
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 05:23:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5EA5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=DSripM06
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RLUA4HKddJwwMBEJuyDvMoV0NWCQCuzRlsrrO4hRLs5iMmRwSlelqhGmYqoa9fCeJZ7SeTMWBkjLeVle4MwDQNNyBefj2xIbtVNmOirLU+6H+xLsTWv8kJr8DhWquXZkHs8Q5rYM6fJVP4z7spzl9K9tnH2kH4pM1y+aTdfV9OlvS2u9mhzuh2LbNXtvMlHyPZ0zXI0+TxVpNLKigd3Fp0UTYVaJScPIg6kwEoR3F1tzfBUcQVPxJtnBJqqdU1P8JNzmtO4eMluX5rE+6N801kD0OCGovuQJ9MRPhpwofM0N/LhzKjjTVa508rHjbsjxdrGiuW+/iVK8q4AF9piCzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JJlKWbrY2sk47/3lhp7vOWcflXJ8Ox97dii49sewTuE=;
 b=yo6qoYjWpn8EXBV+GXcv7YOjSWQMihXTqSAjGG/xR0Am3hp2P9qwaAz0sFYOh7/PqnSRjk4GjVffjfNfWt9SX0XJi2jWENGZeQFh6u+hlF6RGpJ2hhg0Epd4bBu6hvKCuvBQv5e2v9KH4OO3y0o9M/tRV3udpvn/UExVZFNHDeERJh6rysqO5nyY3jI2RzZ7w6SFczxyn0O823Vva0oCGtkJEGHBCCGvCAxYADla1qCJHjY2S7dtEg2ewunNj6TcyYntdLF0SJSWuauYq3pc/MKL3W29jRQUHtYkfGVJBDZRDKUrxSNGvrlEzeMBLeRkrukobcrpZIABxDdDWtyqgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JJlKWbrY2sk47/3lhp7vOWcflXJ8Ox97dii49sewTuE=;
 b=DSripM063hUKye4YIEzZpZcz6775fdtcAItJAxvlRF8QvFXI0WI0NFkPj5IlIxWXk8ExjeeWi8RdH+4sQnBhmpEiY+m0nUOxwRi1tWftMBwPZEcTUl1f+MltZQvIIQubl+LS1HehKRGCY64d8c08ss5PhIyURGgPIIshzM6H9YE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by OSCPR01MB12483.jpnprd01.prod.outlook.com (2603:1096:604:32b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 05:23:48 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%6]) with mapi id 15.21.0592.012; Tue, 10 Nov 2026
 05:23:48 +0000
Message-ID: <8733t9ntss.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 04/20] ASoC: soc-component: move devm_snd_soc_component_register()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <878q31nttj.wl-kuninori.morimoto.gx@renesas.com>
References: <878q31nttj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Nov 2026 05:23:48 +0000
X-ClientProxiedBy: OS7PR01CA0192.jpnprd01.prod.outlook.com
 (2603:1096:604:250::7) To TYYPR01MB15175.jpnprd01.prod.outlook.com
 (2603:1096:405:27d::8)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB15175:EE_|OSCPR01MB12483:EE_
X-MS-Office365-Filtering-Correlation-Id: 88decd2d-3fb5-4626-b542-08df3eeacc75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|52116014|366016|18002099003|22082099003|10067099003|11063799006|261022105027099003|261102130727099003|261102123227099003|261028144727099003|261026121527099003|261009223027099003|261026140227099003|56012099006|261021123027099003|261021121427099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	K4Z9Tml1ayoLnCp6DHu9WCHBvrkFmASN//tjlLIw7GdTe4lmhRKadyfIknskwa3tMacv0v57AAJX6Cd2J863+cSfnx37ysN9vq0UqUtvjO6D/xyzgvbayabsGSifI0obmAP2jf0Fj5B0AON7XofPgt2nXFeJ7aVw0fdOOUPh9XAW3arMAK+fWe/LAE3EGBTRwvfy77an6TuFEfnBlo4bsU3k7BhZqSZy2C+h1N7xwCGqb6P61cMkioBVS5iGupYHDoVR0D8ILppVCNKe71PCW4PRa927UCV+LPhK7v+NKG6Dm07+hBOOUSOcTSXJqMYN5zFUFi6j6lEnnVF4DpyIvfM/L4MhjYfXecr//VuWEHHlspBBvyv9l2Uc9BRrLELhbnO6mTB54Rw5GLxIZtetH6ogwderfO3QpKJ1gIoYtXQf2IWbtMtq11EnMRBAJrERQD0TdDPuKZV63rGqDIlNnVPmsYICmk5XEfs3HcbrY6/Q3pcmazLLBrj1DqElNWcmL0ceKmpaijfBa1AplRauyq4LmYlIu89iBy3np2G4w0BbfVVZJOqGui1P/RhkpDKPgvIYPx4mQQd2nZrWEEzvjAgkoxkypD53hwbQIdWa4Y4qqw3QregjDZdKeMQU+G+V3hZWWB3pqsAlE3pPiXchxSys6v3HUKTSv2gjxsVLX6Hmm/DccYF79nKQ6t+uwjfvcDz0CV0wsSWTq2DyQNMmVw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(52116014)(366016)(18002099003)(22082099003)(10067099003)(11063799006)(261022105027099003)(261102130727099003)(261102123227099003)(261028144727099003)(261026121527099003)(261009223027099003)(261026140227099003)(56012099006)(261021123027099003)(261021121427099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FsqtsvjXBEU3v8/IeDLbpTxKds4cXv49zRVEPQPjtABWMjHyuZAKlXoqFSQB?=
 =?us-ascii?Q?B++l0hJVnA31kG4BQI8OXeK2y9tQITEsU64Eh/KGcJep5WcrQqiZ6PUsmgZN?=
 =?us-ascii?Q?2CxkxC5EXBhyWBrGvEfgpxQa72LWZAzTZm3jBO/NT+ZRQKoti1w7s2XegyG0?=
 =?us-ascii?Q?QElBsbEEASZEzPMrFmQ0x4Tzqzlk1lYo4Exopo85NNF0dy/h9UrpZiFNd6+n?=
 =?us-ascii?Q?5C/5rG9IP3fUd4FyhN9z6sr3IM0k4MjwSkLtWSkab0WhU/ZsuTCrVEIREU1J?=
 =?us-ascii?Q?Dw3GX5EhY5L1StnDrNnVrD6oCY5PCV/PydEIwHZBtmwCY15rTOMBlS4UL+CY?=
 =?us-ascii?Q?T02KH7CIzx7yNjERIUxqQawuJaBHqXzAUahlf9TLfcu5Ju+hKjFSXEthNGNY?=
 =?us-ascii?Q?1pSjRMecZiChApT3VBXKR46FVkLSVmgW1NYm2ZtLqw+IbEFdQbwhb5cAeWku?=
 =?us-ascii?Q?dnJPtiyNBFHff3Ru9FKY8Wz1pP5wAubm6aXjwK7aEX9VqnS9Miw9oZWYvqx2?=
 =?us-ascii?Q?JYkVFxE2dX5TrvhNvw0c/6OyEyOiVky7HtAmIFofLAZDzmKgHLF0C7cZOTkS?=
 =?us-ascii?Q?8INmm1tgNhNGASIgMUP8AWSgBBY8/9t1n/dk8OWRwtIaXFvLaymtTsUYaaka?=
 =?us-ascii?Q?4GSbMTGRjKwm6C7foEBFN92zdsi6Szt+uAjWPkkPZG9TwmylhegD1lwAUceb?=
 =?us-ascii?Q?WGRxadJW6Igsz+Xs8w6WDBDL/mKADUYGbHLr6HbaCJAZOUpsSqXiqam2Tm+H?=
 =?us-ascii?Q?FfPy5cpbUMhEljrRO8trVi5ft+AXLMH4RZFxoWlg1mgO1Jkeeq/KbdsWwfoD?=
 =?us-ascii?Q?Ds8dizQSCOH5w7d1WRp0ZacbQL6Vu6KtQEJOcFlIGEJyLKTV2G3NlEvS9mkc?=
 =?us-ascii?Q?qGe6dndj6xIy4jDeUnNahcFxwAObqz/5p4D8AtF+S9W/kSVauTAa4qNSMQjT?=
 =?us-ascii?Q?565kwgsmon56pt4pTlCoAmjIaizq+dSSLPm5YddfqGzicTLl3xBQpdN7gk1a?=
 =?us-ascii?Q?kvzoaHKCNNaxDTOZyrdnZ17EsCKIXrG/zmkFHaVFD2JaXlJ1QvhJeiFn4NlO?=
 =?us-ascii?Q?hJERnw4ijecNpatlC1CQUGqgpdQsMCV8hPeKQrnS8uFsZBqPhLtRZmAOrXjI?=
 =?us-ascii?Q?zwZ60q4v9a0bIw49TxeU+mthQSf9vtwn4rV88LLckc+fkipuAl7DYnIVAyUp?=
 =?us-ascii?Q?SpBI/SJ6pqY5Yz9UyU+uGK6fOTvogAefw2XvGwBMgRbYCBQy5CIH9F6+lCLV?=
 =?us-ascii?Q?M7+hlqjs5Q8n6Qlg8RqRqG2IdBrd4puG47QJYthg/mq55h0G2LmCG6DgNFPJ?=
 =?us-ascii?Q?gOrw4MCNH/XSMFTWEbg9tsjjce6p0CA52jRqG4BZ44SCpeqj/hN1IZDpLQ6C?=
 =?us-ascii?Q?DbxejrLa1SbD4LLi8HdtvxenI/LJrdbRG2u0+J3Be+wGdDsG3MJBxBiFS2jz?=
 =?us-ascii?Q?QEFXbAjfAQ2aSLadurgyWEd0OniMglOwhcnN5G+LoTJUvLa31g2yBBKIC8d2?=
 =?us-ascii?Q?Z0mW2u0YmxB4+Bk0Mpdk7NYEGu9JREACgNdfn+4o8s7lTH0U8yfuW17mihs6?=
 =?us-ascii?Q?OAiTZYquIQxj7N/Xz2ZwC4h6NPq/akkRfVUNTI+P8Ejb6MtZRI4qcbay6Kg5?=
 =?us-ascii?Q?XYYvFEwot1VaNMQ79KGV6eBLOjPsnxeaGiaInJKj4lib0ZUOqYfl4gkXzkew?=
 =?us-ascii?Q?Kn7uC0T/NDv8E28IG0J7XuF+TCZKqK2+QuM+6yGh01Vjq9KyJeO2HayzeKJG?=
 =?us-ascii?Q?+gbs3ewArqGeVzLT+Ez3F6/f0zoWP30=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88decd2d-3fb5-4626-b542-08df3eeacc75
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 05:23:48.5924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mkn9+/VRNi1Vqr44Wg2ctI0R65i8isVtIj74bB1HFc2kL+OAgcR/MZ9aH7s0xazNOLLZAgoSn2iQ/JiiYW+Fr2F0EIfLgkp4fsInJ0+Qoyt3hEMCrAXSI/DlyE/fsdNA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12483

We don't need to have component related function in soc-devres.c.
Let's move it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-component.c | 40 +++++++++++++++++++++++++++++++++++++++
 sound/soc/soc-devres.c    | 40 ---------------------------------------
 2 files changed, 40 insertions(+), 40 deletions(-)

diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index a2f079cd8aae2..080568810ea5d 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -1763,3 +1763,43 @@ void snd_soc_unregister_component_by_driver(struct device *dev,
 	}
 }
 EXPORT_SYMBOL_GPL(snd_soc_unregister_component_by_driver);
+
+static void devm_component_release(struct device *dev, void *res)
+{
+	const struct snd_soc_component_driver **cmpnt_drv = res;
+
+	snd_soc_unregister_component_by_driver(dev, *cmpnt_drv);
+}
+
+/**
+ * devm_snd_soc_register_component - resource managed component registration
+ * @dev: Device used to manage component
+ * @cmpnt_drv: Component driver
+ * @dai_drv: DAI driver
+ * @num_dai: Number of DAIs to register
+ *
+ * Register a component with automatic unregistration when the device is
+ * unregistered.
+ */
+int devm_snd_soc_register_component(struct device *dev,
+				    const struct snd_soc_component_driver *cmpnt_drv,
+				    struct snd_soc_dai_driver *dai_drv, int num_dai)
+{
+	const struct snd_soc_component_driver **ptr;
+	int ret;
+
+	ptr = devres_alloc(devm_component_release, sizeof(*ptr), GFP_KERNEL);
+	if (!ptr)
+		return -ENOMEM;
+
+	ret = snd_soc_register_component(dev, cmpnt_drv, dai_drv, num_dai);
+	if (ret == 0) {
+		*ptr = cmpnt_drv;
+		devres_add(dev, ptr);
+	} else {
+		devres_free(ptr);
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(devm_snd_soc_register_component);
diff --git a/sound/soc/soc-devres.c b/sound/soc/soc-devres.c
index ca6c29b54f6ab..431bb366468ac 100644
--- a/sound/soc/soc-devres.c
+++ b/sound/soc/soc-devres.c
@@ -9,46 +9,6 @@
 #include <sound/soc.h>
 #include <sound/dmaengine_pcm.h>
 
-static void devm_component_release(struct device *dev, void *res)
-{
-	const struct snd_soc_component_driver **cmpnt_drv = res;
-
-	snd_soc_unregister_component_by_driver(dev, *cmpnt_drv);
-}
-
-/**
- * devm_snd_soc_register_component - resource managed component registration
- * @dev: Device used to manage component
- * @cmpnt_drv: Component driver
- * @dai_drv: DAI driver
- * @num_dai: Number of DAIs to register
- *
- * Register a component with automatic unregistration when the device is
- * unregistered.
- */
-int devm_snd_soc_register_component(struct device *dev,
-			 const struct snd_soc_component_driver *cmpnt_drv,
-			 struct snd_soc_dai_driver *dai_drv, int num_dai)
-{
-	const struct snd_soc_component_driver **ptr;
-	int ret;
-
-	ptr = devres_alloc(devm_component_release, sizeof(*ptr), GFP_KERNEL);
-	if (!ptr)
-		return -ENOMEM;
-
-	ret = snd_soc_register_component(dev, cmpnt_drv, dai_drv, num_dai);
-	if (ret == 0) {
-		*ptr = cmpnt_drv;
-		devres_add(dev, ptr);
-	} else {
-		devres_free(ptr);
-	}
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(devm_snd_soc_register_component);
-
 /**
  * devm_snd_soc_register_card - resource managed card registration
  * @dev: Device used to manage card
-- 
2.53.0

