Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010026.outbound.protection.outlook.com [52.101.228.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293C7223DEA
	for <linux-sound@vger.kernel.org>; Thu,  2 Jul 2026 01:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782955292; cv=fail; b=p3rs/r8BZyWy1649DeOLUd1gopnAIYWqaoXJHiNTcJuh13eJD6Cc3uGqvH2pTIDq8HsaJP4+WKC63geNXbqi116yif+vfCLdtEvGKJBhn6xHM9vqdOc8db6ebw5/bc4EXEgyehBarYpA+K7w/29dTBuuYEBg+fb2ObAW41VEHS0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782955292; c=relaxed/simple;
	bh=sVfWhlx+ZZSYrVNylgYdUqdHNZAY6Y4nMxwfc3K7WJU=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=n+tL9Ny/gtlSyFrHgV4uqut1YNUpxd9Z74arbGCYjZ+JYKDmG8Y7ZaTPE3b209Zq2Dgqti8nZ5NndB+zod+baR7XhM4unQcrL0VCOACFhTUaoSipT3qhFKTpIy/1FZqQvll6SjgGZOjQ6tpNwD5m+CB1sXDtL3zlp5IA+Lan2fs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=IkI8NsJ2; arc=fail smtp.client-ip=52.101.228.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="IkI8NsJ2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hxP3u1pr6VXFmPhVB1d8Jl6hvIg5UkJ6EScKNu1PheYJzyO6fElVr8B9wyQdLF/pVu2oXwy2hnbPHChleV3S4GASCkJ86exaLCKcibOwnZv3jV4VkDfCd7tcWtesjamcgLBhF3ETxOKbmv/r92K8Q/a+GnSvVMzYZFOdffi3gJUk7AkMGBY+PZEGbnVCD6Vl1XWBSN96KDa5dwrOjNefTMC1EwYUYt5d9i4B3Lmc1fkAOstKdz45dzyV+ntgQTxgqTSdL6vyhJYJi80/UNZ4MTm1L/qW1wp46EX8k2GKgpR/dFfBZOhuHQjWjMrpzfSugGW/pv1gSRJDG7jwlOE8vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GWs594MRMi49S0OGcuhPfbWri4hDQepV0pJQkHWENqU=;
 b=xq3X9Sf3GzpMTFB3Gc6coUSVRcyLEtxdideRDHg/ClMVmMdOljyx+zH0wmByyIkhuQ97TTB2anTiGdFYjILB7KC5+h+bk8Y5CJGRM2U81bsy5Z9q1cKFEjRrDYxaxXUYhwsYvyXeKY1vpu+NMCYbswiHpLkmn5IvKAFAFqytPET5/X8YWiQW51COqryvuuJHBc9JXGz85osFwczBedkBYu9C0XYbKhUS6aCGYcESaVkrE8xg0FJGmsEhrosEI74tTl80sng3FEvbkQ0LS0oEFUu0fqv30MLOHDqixzBot4H96aY6xK0FFx8zmWlXbf+SC9EME4+H98B8HOfo4+gYwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GWs594MRMi49S0OGcuhPfbWri4hDQepV0pJQkHWENqU=;
 b=IkI8NsJ2XtJkL7gO5Ig2KvELBDJCX/AG1JSqu8S9dJbFH2TXsg1BvvIqzqx2bAbF8pgs/gJP8rgJpuIYjNqxE2u2DUJFe37S8wAQVnuvFoBW1kKSlOFW7SZ2y/LsLiGDHabd+7bT21cPYgRXfmVuD10KRCuDfKT9t1UGUmJWfAY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com (2603:1096:604:235::9)
 by OSCPR01MB16080.jpnprd01.prod.outlook.com (2603:1096:604:3e6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 2 Jul 2026
 01:21:27 +0000
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834]) by OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834%5]) with mapi id 15.21.0181.008; Thu, 2 Jul 2026
 01:21:24 +0000
Message-ID: <87se62xk2z.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/8] ASoC: soc-component: add .priv
To: =?ISO-8859-2?Q?=22Amadeusz_S=B3awi=F1ski=22?=
 <amadeuszx.slawinski@linux.intel.com>,	Bard Liao
 <yung-chuan.liao@linux.intel.com>,	bui duc phuc <phucduc.bui@gmail.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,	Fabio Estevam
 <festevam@gmail.com>,	Jaroslav Kysela <perex@perex.cz>,	Kai Vehmanen
 <kai.vehmanen@linux.intel.com>,	Lars-Peter Clausen <lars@metafoo.de>,	Liam
 Girdwood <lgirdwood@gmail.com>,	linux-sound@vger.kernel.org,	Mark Brown
 <broonie@kernel.org>,	Nicolin Chen <nicoleotsuka@gmail.com>,	Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>,	Pierre-Louis Bossart
 <pierre-louis.bossart@linux.dev>,	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,	Xiubo Li <Xiubo.Lee@gmail.com>
In-Reply-To: <87v7ayxk3s.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7ayxk3s.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 2 Jul 2026 01:21:24 +0000
X-ClientProxiedBy: TY6PR01CA0010.jpnprd01.prod.outlook.com
 (2603:1096:405:3bc::14) To OSRPR01MB11811.jpnprd01.prod.outlook.com
 (2603:1096:604:235::9)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSRPR01MB11811:EE_|OSCPR01MB16080:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d85055c-a4ff-4649-78bf-08ded7d83ba8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|52116014|56012099006|11063799006|22082099003|18002099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	P6/gY3LFDCe336XLqp+vZ1vnQU5MwwYLxYCvNS2qh4Iyaspv+CJjs0Ff5MpMqMg96VHM7ogjF94w1sycUraPx85MwvfA8qjb4gwneF7vYWQLWEx1EgVyRQnxyszbHI4LTKAZ1HncsIfi4+4g4e7SXL2rzUAgY5L28lZF2ymFXsnudWcoERI7MFzZpnXWe3I6UoaLjNw7FCoT/222EQLzGCWWYDsN37pI6SjxZa2H7swa5/3GQsIQIv2AAD0f8D8w9ou2BV/laRrceM2eXgu+HPWKWtvURAeMCJPg91TTP1Vjpq5uizcQRCh3yu4Yua2wYb9g9euXmR/1UkdjjuBW6+3Y8J00mbO5jw1PyRoGTqqaz35RaXJOc8Bfr/US3Xayd8gGfnmw8x7AkAANN1TwKIdCyJa5ZxF4RrZ1Gr4sSwktxZ7vzhyE86DK5eEVtMfUjkL3GjmmaWv7LCT2BdBEyaFwxUBhLz0jb3yYYPLFmPSU3kogYcHZVK+IYM++ODBKeI6x7uW7hBsvjPiuWkrUQIRXDsqFGt0+R6IC1fznvEjjP5zIieeoXdWheFzl0Q+Qkv6ZutSlL/bTH4qbx0LquIbEntJAnbJ3GvaUKf2LJaxdS8X9LjS+91jzQWOKdmoOk7dd8xLwOY9kyRPjpMHv7PiN7GLC3+VlMs42Qia179efrScPEWSHe0mJCezNTDxZuMD55pdkvQLkP+UFvsew9YUPnOIqvuJP+MCNHsOKDAHusrvWl6aFN9hNmujnu9c4
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11811.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(52116014)(56012099006)(11063799006)(22082099003)(18002099003)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?adOFk2ROkk3oSewTbsy5XRcr1YBAWS8HhzLnn57AI4BC597Y0FE3y3ohFo0T?=
 =?us-ascii?Q?J8IGAj6I5BPCb7xmXi7g7zGHuQZG4ydZEdJxJX8EYsVu9gJmJePV4S8oAmdP?=
 =?us-ascii?Q?1P7p1cVecy0xmgh5HkgE2xC/D0cKQfp0l/AQG8XULwGh9bGCfh++71tShoO+?=
 =?us-ascii?Q?coRX5vf/onyztH62RWHJh911S+Jucpsd4CgAUlrtlRCVnGX2wXuWIPR1QYIs?=
 =?us-ascii?Q?L1hs355wITTgayVkDoUbnFfzJTsjCs403Q70mWCFFBku9EDkWDkHTwepI28d?=
 =?us-ascii?Q?oPbvd9oD9q2w020+1UYA/L5Q3pri9MfITMI0G6uCpIixdmql6C+B6zu3+evO?=
 =?us-ascii?Q?hXyTXY6vBNI/6aKR6Ru1gFE/1Ln6m8dOjNaqMi5JzzBGblUiMjLxQ2jzFbLb?=
 =?us-ascii?Q?PqcQiHSOOVWr9B5bd7MjGft1A3op5zr7pTdJNMp8oC0brOzbdcnrwBbRBk7J?=
 =?us-ascii?Q?Nhe/B+68RpAvrp0jrgZWBYsthQ99c6cECXw/KfiwNecer3K9jJhwxa9mVxGx?=
 =?us-ascii?Q?JmB8L8bTae/RmR3vMPcZq5gvpLJ4LMPLc7wWI+9Bx6TA1WGJJx3yp7piMxQq?=
 =?us-ascii?Q?wwkHm8cdQ/ww83jltOzElMmNnd7mI4qcN+rz1TvtI7oWfMmFDYNMSiQ9dJ6b?=
 =?us-ascii?Q?nZVPhmVDSSJT+e96eQSyD93vijqQaWSf5JB0CV1+iIv2DUGuadbKYTEfvJEf?=
 =?us-ascii?Q?rLJTyRHwyA28/19dDIG2+mGGM4RKnh0Tv1ty2LOps9C+bp/ZzRx/6fE1Fwmk?=
 =?us-ascii?Q?geQKISo42oabvb8KMHYhm9OJij8qqdd+0usvNcEZEAlM5zZvHSqLpbqvSSr0?=
 =?us-ascii?Q?9/BXiDPs/CRGayo1n5OvHpC63iucBm4mu+xbL4NJ4lpJZBG/SXanSAFjb3oZ?=
 =?us-ascii?Q?H30ybfBc7R202roE9RL+oK5xfBqHwsoQVdlWTNjgWlyQVzbD8qAq1z4L07bt?=
 =?us-ascii?Q?e3w6KHYcgwReZdR0kcjiOKPbA3pZnYXbn+TGDLQ9Gs3IkRF1WgBnirbh8VTf?=
 =?us-ascii?Q?sJQHgfrbh+JcdH0PR2lxM8KUzxg2Le/zeeJmE9+0DV/SjYLoDrpTI+jdoXdz?=
 =?us-ascii?Q?UEfxOZiucXViyqVCKPiXc82WJTjQiplYy2Z4iBiH0kXO41VND5BC6SILd8fp?=
 =?us-ascii?Q?VP37pEWPS1TeLByVdqEvISBGnfeaWDKrMYFQsyGlAR94LMz54cERdxy/GUxj?=
 =?us-ascii?Q?KvOIhHEbJ/BrUjCEp60PPnhKrsYhLq1lwZ5mRLtengpDbOhte5JidNWr/T2t?=
 =?us-ascii?Q?8vH1HcxYmE38TQD8amtauZ4EaYD1GH9KHqdSnfZ0vRhqGokE9wNIfmRZvzGJ?=
 =?us-ascii?Q?d2+HTjKQWw+JUHWYr3wrWR34H19JbMn7RgRCnCDMVwKEpY49ndQ7SV7Xbza8?=
 =?us-ascii?Q?oArDwamXVJuUrLGkV+z5NUXJ4Ultm7dCsf9OMXuLVggRmsnZm9Of62FVP2jj?=
 =?us-ascii?Q?/+YiU1efifVHTeyrDh3r6KxM/vfguKYC8Wao0Needx03LeUNKtr6vojWVi3e?=
 =?us-ascii?Q?SHv0Otm2nV+4Z4EohjFmvUBIxhbgcb3K6xXJxveA9cJotneQfq//ad4RODrE?=
 =?us-ascii?Q?Um6I97OAiSGW0RZuEygTw5yjVVsd0pYiZWXFrwIioFJa5G/Hr2JQGqtBanLV?=
 =?us-ascii?Q?Sdc7eEh+uonPIKwtMhBBgYurlQkI+92uwW4lO1iZA3KUC32ifOn8GvWNIPFA?=
 =?us-ascii?Q?pzq166TYiDjcN5eYAJn5k9J5AAOgbnizenGHKp/E4AR/GbZi9nofgAEFdLBy?=
 =?us-ascii?Q?3+Ixct1zV/kFrA8vKSda742bvzsRYIy+oVTdP86yCXSn6CH72l6J?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d85055c-a4ff-4649-78bf-08ded7d83ba8
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11811.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 01:21:24.8519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fQhRioe3ovlFQxxIWhAsrjUlEBZ07XmqrB7h4kjzkLBvm4AeQEZOq/7bGHxH7eotRwt1e7ONPfjgyg2d/H/8NqvAyHWDX6Yg9KWxxDhhCNhru2WiZm8Vgv4ARp0/lova
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB16080

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

Some driver is using snd_soc_component as object instead of pointer.
In this case, it uses container_of() to get parent object from child
object. But it doesn't work anymore if snd_soc_component was capsuled.

ex)
	struct dmaengine_pcm {
		...
=>		struct snd_soc_component component;
		...
	};

Because some drivers are sharing same dev with multi Card/Component/DAI,
etc. dev_{set/get}_drvdata() can't use for this purpose.

We can solve this issue if Component also have .priv, like other system.
Let's add it. We can add .priv when register Component.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h |  5 +++
 include/sound/soc.h           | 57 +++++++++++++++++++++++++++++------
 sound/soc/soc-component.c     |  6 ++++
 sound/soc/soc-core.c          |  7 +++--
 sound/soc/soc-devres.c        | 11 ++++---
 5 files changed, 69 insertions(+), 17 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index aa423865dbe7c..c510856d7cf57 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -252,6 +252,9 @@ struct snd_soc_component {
 	void *mark_pm;
 
 	struct dentry *debugfs_root;
+
+	/* Component private data */
+	void *priv;
 };
 
 #define for_each_component_dais(component, dai)\
@@ -282,6 +285,8 @@ static inline int snd_soc_component_cache_sync(
 	return regcache_sync(component->regmap);
 }
 
+void *snd_soc_component_to_priv(struct snd_soc_component *component);
+
 void snd_soc_component_set_aux(struct snd_soc_component *component,
 			       struct snd_soc_aux_dev *aux);
 int snd_soc_component_init(struct snd_soc_component *component);
diff --git a/include/sound/soc.h b/include/sound/soc.h
index c91f416846117..b02f0443874fc 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -453,29 +453,68 @@ int snd_soc_component_initialize(struct snd_soc_component *component,
 int snd_soc_add_component(struct snd_soc_component *component,
 			  struct snd_soc_dai_driver *dai_drv,
 			  int num_dai);
-int snd_soc_register_component_with_name(struct device *dev,
+int snd_soc_register_component_with_name6(struct device *dev,
 			 const char *name,
 			 const struct snd_soc_component_driver *component_driver,
-			 struct snd_soc_dai_driver *dai_drv, int num_dai);
-static inline int snd_soc_register_component(struct device *dev,
+			 struct snd_soc_dai_driver *dai_drv, int num_dai, void *priv);
+static inline int snd_soc_register_component_with_name5(struct device *dev,
+			 const char *name,
+			 const struct snd_soc_component_driver *component_driver,
+			 struct snd_soc_dai_driver *dai_drv, int num_dai)
+{
+	return snd_soc_register_component_with_name6(dev, name, component_driver,
+						     dai_drv, num_dai, NULL);
+}
+#define snd_soc_register_component_with_name(...)			\
+CONCATENATE(snd_soc_register_component_with_name, COUNT_ARGS(__VA_ARGS__))(__VA_ARGS__)
+
+static inline int snd_soc_register_component5(struct device *dev,
+			 const struct snd_soc_component_driver *component_driver,
+			 struct snd_soc_dai_driver *dai_drv, int num_dai, void *priv)
+{
+	return snd_soc_register_component_with_name6(dev, NULL, component_driver,
+						     dai_drv, num_dai, priv);
+}
+static inline int snd_soc_register_component4(struct device *dev,
 			 const struct snd_soc_component_driver *component_driver,
 			 struct snd_soc_dai_driver *dai_drv, int num_dai)
 {
-	return snd_soc_register_component_with_name(dev, NULL, component_driver,
-						    dai_drv, num_dai);
+	return snd_soc_register_component_with_name6(dev, NULL, component_driver,
+						     dai_drv, num_dai, NULL);
 }
+#define snd_soc_register_component(...)			\
+	CONCATENATE(snd_soc_register_component, COUNT_ARGS(__VA_ARGS__))(__VA_ARGS__)
 
-int devm_snd_soc_register_component_with_name(struct device *dev,
+int devm_snd_soc_register_component_with_name6(struct device *dev,
 			 const char *name,
 			 const struct snd_soc_component_driver *component_driver,
-			 struct snd_soc_dai_driver *dai_drv, int num_dai);
-static inline int devm_snd_soc_register_component(struct device *dev,
+			 struct snd_soc_dai_driver *dai_drv, int num_dai, void *priv);
+static inline int devm_snd_soc_register_component_with_name5(struct device *dev,
+			 const char *name,
 			 const struct snd_soc_component_driver *component_driver,
 			 struct snd_soc_dai_driver *dai_drv, int num_dai)
+{
+	return devm_snd_soc_register_component_with_name6(dev, name, component_driver,
+							  dai_drv, num_dai, NULL);
+}
+#define devm_snd_soc_register_component_with_name(...)			\
+CONCATENATE(devm_snd_soc_register_component_with_name, COUNT_ARGS(__VA_ARGS__))(__VA_ARGS__)
+
+static inline int devm_snd_soc_register_component5(struct device *dev,
+			 const struct snd_soc_component_driver *component_driver,
+			 struct snd_soc_dai_driver *dai_drv, int num_dai, void *priv)
 {
 	return devm_snd_soc_register_component_with_name(dev, NULL, component_driver,
-							 dai_drv, num_dai);
+							 dai_drv, num_dai, priv);
+}
+static inline int devm_snd_soc_register_component4(struct device *dev,
+			 const struct snd_soc_component_driver *component_driver,
+			 struct snd_soc_dai_driver *dai_drv, int num_dai)
+{
+	return devm_snd_soc_register_component5(dev, component_driver, dai_drv, num_dai, NULL);
 }
+#define devm_snd_soc_register_component(...)			\
+CONCATENATE(devm_snd_soc_register_component, COUNT_ARGS(__VA_ARGS__))(__VA_ARGS__)
 
 #define snd_soc_unregister_component(dev) snd_soc_unregister_component_by_driver(dev, NULL)
 void snd_soc_unregister_component_by_driver(struct device *dev,
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 21492d15833f7..e19215fe792cc 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -29,6 +29,12 @@ static inline int _soc_component_ret_reg_rw(struct snd_soc_component *component,
 			   func, component->name, reg);
 }
 
+void *snd_soc_component_to_priv(struct snd_soc_component *component)
+{
+	return component->priv;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_to_priv);
+
 static inline int soc_component_field_shift(struct snd_soc_component *component,
 					    unsigned int mask)
 {
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index ec69fd52d9e86..6bbf8d381f7f7 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2775,11 +2775,11 @@ int snd_soc_add_component(struct snd_soc_component *component,
 }
 EXPORT_SYMBOL_GPL(snd_soc_add_component);
 
-int snd_soc_register_component_with_name(struct device *dev,
+int snd_soc_register_component_with_name6(struct device *dev,
 			const char *name,
 			const struct snd_soc_component_driver *component_driver,
 			struct snd_soc_dai_driver *dai_drv,
-			int num_dai)
+			int num_dai, void *priv)
 {
 	struct snd_soc_component *component;
 	int ret;
@@ -2789,6 +2789,7 @@ int snd_soc_register_component_with_name(struct device *dev,
 		return -ENOMEM;
 
 	component->name = name;
+	component->priv = priv;
 
 	ret = snd_soc_component_initialize(component, component_driver, dev);
 	if (ret < 0)
@@ -2796,7 +2797,7 @@ int snd_soc_register_component_with_name(struct device *dev,
 
 	return snd_soc_add_component(component, dai_drv, num_dai);
 }
-EXPORT_SYMBOL_GPL(snd_soc_register_component_with_name);
+EXPORT_SYMBOL_GPL(snd_soc_register_component_with_name6);
 
 /**
  * snd_soc_unregister_component_by_driver - Unregister component using a given driver
diff --git a/sound/soc/soc-devres.c b/sound/soc/soc-devres.c
index e39cef5104106..e57cb0c159dd4 100644
--- a/sound/soc/soc-devres.c
+++ b/sound/soc/soc-devres.c
@@ -17,19 +17,20 @@ static void devm_component_release(struct device *dev, void *res)
 }
 
 /**
- * devm_snd_soc_register_component_with_name - resource managed component registration
+ * devm_snd_soc_register_component_with_name6 - resource managed component registration
  * @dev: Device used to manage component
  * @cmpnt_drv: Component driver
  * @dai_drv: DAI driver
  * @num_dai: Number of DAIs to register
+ * @priv: private data
  *
  * Register a component with automatic unregistration when the device is
  * unregistered.
  */
-int devm_snd_soc_register_component_with_name(struct device *dev,
+int devm_snd_soc_register_component_with_name6(struct device *dev,
 			 const char *name,
 			 const struct snd_soc_component_driver *cmpnt_drv,
-			 struct snd_soc_dai_driver *dai_drv, int num_dai)
+			 struct snd_soc_dai_driver *dai_drv, int num_dai, void *priv)
 {
 	const struct snd_soc_component_driver **ptr;
 	int ret;
@@ -38,7 +39,7 @@ int devm_snd_soc_register_component_with_name(struct device *dev,
 	if (!ptr)
 		return -ENOMEM;
 
-	ret = snd_soc_register_component_with_name(dev, name, cmpnt_drv, dai_drv, num_dai);
+	ret = snd_soc_register_component_with_name6(dev, name, cmpnt_drv, dai_drv, num_dai, priv);
 	if (ret == 0) {
 		*ptr = cmpnt_drv;
 		devres_add(dev, ptr);
@@ -48,7 +49,7 @@ int devm_snd_soc_register_component_with_name(struct device *dev,
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(devm_snd_soc_register_component_with_name);
+EXPORT_SYMBOL_GPL(devm_snd_soc_register_component_with_name6);
 
 /**
  * devm_snd_soc_register_card - resource managed card registration
-- 
2.53.0

