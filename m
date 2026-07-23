Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010019.outbound.protection.outlook.com [52.101.228.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B088E383C6B
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 06:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784788472; cv=fail; b=Q+iXfDCXykfGiUeghvOx7Dz+oQOq9quKS0LY9Osgw9gZMJEscb3qipZhyzRJ1mg8By71ulFcCT8vDT9UVlVRktDLQQVUFh2e64IMJ2tOmRPDw84AdGdAXR5XcG+UjJk7+VhusB+blxO8xK9rqx2HSRvenPPDYey5LarSnutVBZg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784788472; c=relaxed/simple;
	bh=/2yoTJiuKGgxf8RBVinqHdZh+I2OOmA3m6CxGXjIVdU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=N7RCYwqwmdGy/V1/AA59rI5xdDPTHV9rPeku6lGVA6EP4jBCmigUsr1bGJ9HyzexEUIO/NPgSI1ev4ftE6SRBnZ2r2yCSo4A4V3cxWeVdOva9pfjYRJaQtOOpw1mRLwApYC/8XfILDb1CfMictZqd1LQEgZHu1iYV4TO7i/757I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=eGOdkzgL; arc=fail smtp.client-ip=52.101.228.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="eGOdkzgL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CkndXUBOQ/wwD3FGen9E7cq8gVv5bFw5lNXfkbLdclSm527keOaPJCnZEePZigB4PXcQhU4DFREkP2omNcE4/k/fvRuGftmeCtHNMOJzYtP29S9zs62AZBlzw/gCFsFgcNQGcJlJeTWP9uYPxpCqTEa7+HzrjYRQyzbUQglLLvaMYB3BVbQvKfrn7NZ0GHF9xWnQ3epZZ5EK6wzoOsHC/tOUh23skkT+ipMYJZXxofN3f6BVFFHujg5Nc5UL94AIO0RNwHT9pcKAYgy1eQJdRVUBaM7Xb6KKC7fjj6YsruVE9Ca4KxmfKP3ql/COf42RWdOQphR+o01yu3NiuV4+ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Lj/MRlAN74SQoNwMxho+aRMSUlmwWRQ7lsshLskClg=;
 b=USqKagMbWGuO5wT9EF4JM1Npb5IBR5R/a0k4+5dZMPPSCDETTEFfIX4LmeV+TxJDTOE5qkML9sDn0i5VO1qKxbcheU3qX5E6vdqt0jUtRfILYAV//scVCTHrdP+d/TjskKjyE64r/QBAgzQCWQk3H0piKqeUtBHYXCrQ7V4cyjV+nFZSWsmTf0RmlYzPr7K6Mt8ozsG2VQeeDReZJ1C5ZRG1feDvl9O4zua431LEXVYPuhSw3nnG6Kv/rHBfEi8fAToYUwpwkQvBrT9HclY0K+GXCYG2dppc+I/EL4o7FdfkwZdVP+O1At7MiOtsKd9cY1xB03Rq77VVSQMW8KTfJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Lj/MRlAN74SQoNwMxho+aRMSUlmwWRQ7lsshLskClg=;
 b=eGOdkzgL7vtDFKgv/AMN0PQyz0IuypDrxc29Psym3ZpNq8W3wyZzNV/8V8KWc2eAw26l3tFgYJiHyDFKuMXqOAosw9P24Yx8kLGi8thCdBk9SQY9lCbQPJ4uuLwD/URDZXBSEDfu3b2rjUFIK8mJxZ+SOEVrWicXtSP6GOOYikQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYYPR01MB7103.jpnprd01.prod.outlook.com (2603:1096:400:df::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 06:34:28 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 06:34:28 +0000
Message-ID: <87tspqrz7w.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 03/12] ASoC: soc-component: add snd_soc_register_component_{c/d}()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Fabio Estevam <festevam@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87y0f2rz8l.wl-kuninori.morimoto.gx@renesas.com>
References: <87y0f2rz8l.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 23 Jul 2026 06:34:27 +0000
X-ClientProxiedBy: TYCP286CA0235.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::13) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYYPR01MB7103:EE_
X-MS-Office365-Filtering-Correlation-Id: 27cb6200-38b7-4415-3552-08dee8847205
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|52116014|7416014|38350700014|921020|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	+Y+hAVkhqUFaiV3ak8L8nCnfGgPddF8ikKrXndAqom/MTuEU7q4EBvGunM/uO1dKo4ePjjeXndNVd515UT1Z/DcBzc7m3d6mtgl4FH+eZ8FIwaEhaklr/hhKp1G79JU+88UfuvacF0UFjgRk5ZCb4ZHURDnayKE+nNnUm6wWihphcvk54hRKbSGxmy6WQFseh5yvrK15Q3n+MdzK9VIvVRSNb1YE7ix6OK5jaMwytxUoYkTp8VU6/zgPS3SFjk2Q2kKgLE/ZSmOtiyxgjRBlM6L9yNM6723/xRvNyY3jj0DptVp4WHrxqnn/w1onVE5fIBnpaCffq4n0FCnDGgY8CwdBjsyWT7BxRGZD9nBTfwDC1eqO9xU56WHizi3XGpX+/F5OwnctyYk/GAYJgPaUg0eumP3LIS4tAVg0x4RLDYphr1vltHjr3texqx8ODVaPlIJoBTu4jd9dw7F9a4hzCstjO81N6hTOJDPusvxUgJeWEhhjMleRxjyvHoeu3PXLxd3nTUTjJx5edb/PTufSQ4KKmM7+Rcx4TR6U19/XrUCaSbM3uVNfYIW4nmdXJkuPYsRCQ1AhO1KrSKGtsXmEiq1mG2n3/7w4ZgEupizrol0Nq2KWd5P9tQZPUUwHu1Cp/X3nTi2UKoQRpGMKmObcc3ofW5csxl43Aka6XaqvncteDtCkgr1xRbk4lhylJBtTEVDNn03jAqTRYabwAa/fJAd/l87Buybz09MG+A27U40yKqBUai9Qq6F7JdoZYUYq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014)(921020)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QtJ7TsYUC4EqYdVUvUDL79gza51XQVfxWOXTr3YXKlGsAfk0ZstJyAXhpt/k?=
 =?us-ascii?Q?6TmH8ROoI4NlKTKDRBUbS5MayrxUKe3Y1DmqyZTkJcizRIrUHyTtq9IuwnKb?=
 =?us-ascii?Q?U/S3tI7kEbsxr5GQ6Dw/tBoZnFuGeT8OjzVakX8kIAmwYlCdj1JhG44FXmKm?=
 =?us-ascii?Q?0SIULfkUwEvWNATiXcECkUr3wnZwWIEDdetigCd1ewdJOU21qwiF0AWgG+oA?=
 =?us-ascii?Q?NojHS6tMAQAAfXwvzzoefh/w9VI9zPSM6Vjv0CaZp4w4k2S4diznXDOkGR63?=
 =?us-ascii?Q?ZC7H+8DlQX3LxUhKAQipDwJNBeVUm5/C742oZYRsHxfobwMqrCdyWKiQD87R?=
 =?us-ascii?Q?lKyUm3VCoy6bzaly7wyu2Ftl0u9NO6fZK49HhBuM4jb3ywuppQpB1xUaSa/c?=
 =?us-ascii?Q?8mxPSUZISTz2FgkeCjWoC4oOJVwp1SL0MdHqVRKKqlPw7dMu9/r+XTQZUGU7?=
 =?us-ascii?Q?vJ6L/lp7tK1qGYUTuo/V5QoAnP0qFzuy00X9/eGIkD7Khwxc5Zpn8qC/4Skf?=
 =?us-ascii?Q?LwEsA7EiaE0xanhwDpBLrFA43KmN4A0v4pssgIX8pxhjBkemGRRqBASMH8XB?=
 =?us-ascii?Q?6dZ9PJkg392VU5YEyQUR/81vxpDOEffUlKh1VIlnZ9DZbBWlvwKJld452O4d?=
 =?us-ascii?Q?YKjWP/Tl7AkknXdp5cQYvysV6BO7yscMbuwiKrzm7wyC5QPOmNq//FZntbVE?=
 =?us-ascii?Q?QbuzdWCmrzVtaVbuJFQe4+7h1sREEiUWoWTu49Dl1nE/JIwFdPRDF5SIjW1/?=
 =?us-ascii?Q?hq/4DszuLpokhDwarQRlbGTAfSYgesU4hXNlBBjZmG8jzNwcWa24fyPXjwsp?=
 =?us-ascii?Q?ojyvQRuQqmzs8hXpjvbN6peoxnmsfChFWCpmAn1uRuAbIFgfYYgtq+rxx8xv?=
 =?us-ascii?Q?kghYOD9mBGP3LYOhOlepxorfxAmcEYFC8ecF8F0w5ZzcgeyQublXqqvtC9M7?=
 =?us-ascii?Q?ZANWWIL9ggrcsCKaFHt8/8odRm++2hTHScWQXVILDrLzK9ToZYMvTtrXKWh+?=
 =?us-ascii?Q?W2ugcA9XDGzHnErIIPSr6o1gunbi8tBTe7gRmVVE6Cj2APe3uL7PMQ2d7A82?=
 =?us-ascii?Q?kwTY384YfEhWvsLWi+GrTZ9wJJg6nqXTZi3khZfocax2l1OTBoUcMTNvx7Ws?=
 =?us-ascii?Q?h2uAw/jsgeSM+lrBKe2U7IjNeJ4L8xOc4FswHYiDBQSh+MnJFPXqPsQ/PzL5?=
 =?us-ascii?Q?IuuKJRyuAopnITTKZu2jd7wlcqup8y7hSNi8LWQn+Nj9aGl4NHUFaDzl10Z2?=
 =?us-ascii?Q?LMb9uT+cnl3RbBf2t1UE7YtlYMPBjlM4hDCeHNS1+vfOC6oLlYmeQSNSkkIB?=
 =?us-ascii?Q?JWCght9RpMw+Te4vL1iy1rNCa04ahg8WFTwfDrkJmE0hWappAX+uSz0Xq8R6?=
 =?us-ascii?Q?/LJlAk8HkJb7b1CRKh392CjY6XKM7N5L4CHDFfb/+Z2ZYDzxgg6Ftgh5fouU?=
 =?us-ascii?Q?pqsr42laFFlgREKCKyJigEiXKuEs7OGKVhnuSU8i4ujwkl3xhC2m2MC/eaSg?=
 =?us-ascii?Q?OaBSjh3qNWKR3lcs371if4SPwoZp/y2xs4rW8OUMvEK6NE+WIKz9W8aWQr5w?=
 =?us-ascii?Q?Q1sPQkLTtH4jjYwt+ESkmgCebH8B475kxHCGpH3VbrKeFOlpGcZtPN7GiFst?=
 =?us-ascii?Q?MK4zI3ecovtYjQJbZ1wjMuuhAUjRpmZkAPuv0AEy1yv5wQzmR0YZdIFDeF4V?=
 =?us-ascii?Q?0H+tCaKKL33EhywomnDCWavtAffX2iIF7YAOrq765YChgvqK8DPd83OqFo7R?=
 =?us-ascii?Q?vmc2k7ajj5Fg0dqdPhk1o7OcOTJf83J4egUxJATpkZaD4Q3ZAcQE?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27cb6200-38b7-4415-3552-08dee8847205
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 06:34:28.1816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a7GPpxzMAx9EF8Hlshv6T2uNrPysWY26TXfEPcF1yW+JZbb2Apjty7SdSs7PL8aYo77cvD+Nm/q6pF4BowP/lrwzpdSbMI/dcNKwJ0LR/jgLq5wT7aOHiKRa8ulGAqzX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7103

We have snd_soc_register_component() (A), but we can't setup component
specific setting, like name, etc from driver, because component
itself is allocated in that function (x).

(A)	int snd_soc_register_component(...)
	{
		...
(x)		component = devm_kzalloc(...);
		if (!component)
			return -ENOMEM;

(B)		ret = snd_soc_component_initialize(...);
		if (ret < 0)
			return ret;

(C)		return snd_soc_add_component(...);
	}

So each driver needs to use snd_soc_component_{initialize/add}() (= B/C)
instead of using snd_soc_register_component() (A), but it looks
unbalanced with its paired unregiser function.

Let's merge (B) and (C) into new register function, and allows component
as parameter. We can use both

	snd_soc_register_component(dev, ...);		// already exists
	snd_soc_register_component(component, ...);	// new function

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/soc.h  |  9 ++++++++-
 sound/soc/soc-core.c | 26 ++++++++++++++++++--------
 2 files changed, 26 insertions(+), 9 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 10ad80f930c2e..cb0de41e2ada5 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -453,9 +453,16 @@ int snd_soc_component_initialize(struct snd_soc_component *component,
 int snd_soc_add_component(struct snd_soc_component *component,
 			  struct snd_soc_dai_driver *dai_drv,
 			  int num_dai);
-int snd_soc_register_component(struct device *dev,
+int snd_soc_register_component_c(struct snd_soc_component *component,
 			 const struct snd_soc_component_driver *component_driver,
 			 struct snd_soc_dai_driver *dai_drv, int num_dai);
+int snd_soc_register_component_d(struct device *dev,
+			       const struct snd_soc_component_driver *component_driver,
+			       struct snd_soc_dai_driver *dai_drv, int num_dai);
+#define snd_soc_register_component(x, ...) _Generic((x),		\
+struct device * :		snd_soc_register_component_d, \
+struct snd_soc_component * :	snd_soc_register_component_c)(x, __VA_ARGS__)
+
 int devm_snd_soc_register_component(struct device *dev,
 			 const struct snd_soc_component_driver *component_driver,
 			 struct snd_soc_dai_driver *dai_drv, int num_dai);
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 7817beea5b3bc..3b1d18bfadda9 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2775,25 +2775,35 @@ int snd_soc_add_component(struct snd_soc_component *component,
 }
 EXPORT_SYMBOL_GPL(snd_soc_add_component);
 
-int snd_soc_register_component(struct device *dev,
+int snd_soc_register_component_c(struct snd_soc_component *component,
 			const struct snd_soc_component_driver *component_driver,
 			struct snd_soc_dai_driver *dai_drv,
 			int num_dai)
 {
-	struct snd_soc_component *component;
 	int ret;
 
-	component = devm_kzalloc(dev, sizeof(*component), GFP_KERNEL);
-	if (!component)
-		return -ENOMEM;
-
-	ret = snd_soc_component_initialize(component, component_driver, dev);
+	ret = snd_soc_component_initialize(component, component_driver, component->dev);
 	if (ret < 0)
 		return ret;
 
 	return snd_soc_add_component(component, dai_drv, num_dai);
 }
-EXPORT_SYMBOL_GPL(snd_soc_register_component);
+EXPORT_SYMBOL_GPL(snd_soc_register_component_c);
+
+int snd_soc_register_component_d(struct device *dev,
+				 const struct snd_soc_component_driver *component_driver,
+				 struct snd_soc_dai_driver *dai_drv,
+				 int num_dai)
+{
+	struct snd_soc_component *component;
+
+	component = snd_soc_component_alloc(dev);
+	if (!component)
+		return -ENOMEM;
+
+	return snd_soc_register_component_c(component, component_driver, dai_drv, num_dai);
+}
+EXPORT_SYMBOL_GPL(snd_soc_register_component_d);
 
 /**
  * snd_soc_unregister_component_by_driver - Unregister component using a given driver
-- 
2.53.0

