Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.5
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795570938;
	b=KBQlc3JttC3YVcif9wz5msByTASQEhGgRLwgKbnpgSrNejnIPr+5w7lbPXE21JD1xseH
	 TbHy7QFpuL98hBl4sJSVOf78tQYLADY6Wi1s2SBfSQaP15z1IB2cWFKgtbKeca9jQQHuW
	 EBpBmqBT6jxGal2qWpCTLq/YBLsfQhHNECPidkSsVwuY74JPeq1EPlVu30NGXLgTj7Y75
	 yt8EfWXrk0vXmTGIwCscjoglYITMi6H9CUOYD7n6c1E2XvqmQQWto+tSRSQApVmZHuueU
	 0twcHlapRXHmSUhQv8xtPFKxy9zKz6tP6ThYXMM27f65P/P6kR+eHuPqY1yUJvU077Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795570938;
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
	bh=lR2KKV3rnNEtVtv7lKCX61DHKUXYlrjVt0bLS9+f7dk=;
	b=IKPZlpFp8OuHcmdLBH4c3vcN8aIOwcV4ElEbCAs34TGGQAQoi87zkw4xMR4utKS43Vgz
	 avz16mK5ZVvPqY5B2sxtidXsLzz3y/VlnC9rxC0UJojMF9ghvtODnn/aIcNlbhbn5L+h9
	 E4wgsPxs/OieMTbq33qjUZOebDI/cnbcLk3XCUpzNCrw8xzai7PncXVr7S6d5eGhFsWhD
	 zHBRgueNCzrnnJ5dkCElWCaizP8z8wVSLvEf8DCgI/WlPsXXTpt/+rVrzMhiNmP8HFogz
	 AHsq86XwFArKbcCZZpcyLuQGg7gkqBJxWBkmB/WnrnlhA+uLQa+qk1JnO0syN8YSUVQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=RZqY8kyq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.5
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011005.outbound.protection.outlook.com [52.101.125.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD9F606A326
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 01:42:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFD9F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=RZqY8kyq
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lo41TJFUEiT3TVQRQG9LQ9HNL5rWH8pYGG8GhaorsK8iPuh3idT5QctFXjDIOV+KxrdqM8S9wvUqX3Ay0nH/XZCygOIhSWPdyhmfFD9uMInWxDVM1n102gvam7Kw6UgdS1gpSzql7XShr5SZIoDiko3qOtuxvpTBBZleMJZbKjCqBnkHjwv3rhp87pVIcqedl1g31naMEYzSngwwIY14P0cmHiaOybh0mPvC4y1JQXMjQp5JXP+FOMUY+zdDp8ztexRjuWJ3WzZz/7hjkfSFZcSluMxw3K8YmWWT3OdvXXPpMbQF6e0fYsJI7yekNNns6w0hUBfEl/akgKg8X/QHTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lR2KKV3rnNEtVtv7lKCX61DHKUXYlrjVt0bLS9+f7dk=;
 b=h6qWRldfRutCT1Cd0W9bw5ib5vLZ53yzZ7m0mNeLJnFXudWPHgoc9xCnMU1y6wzJFnV2O1nKnSHkcOSIBFZs95abh+gi4gZCbyHMFeEZZcKt4v4Q5gSmvwt8QXAA3H2zJGHKIwp21j/+R52i2MRE7ngadBJAD/hEklRrc0lwROz8oxtuimX5LjBAnCv6V4ud59hX1Aqp/WSRaC2Yp8GeHSfRz/CYHPabU6o0LsZ8PAfZBGpnZ+uYr9vN+2kXG/s+D5GWCfLAlT50hvlqDDAIHv+TnCAm5LDenZJXXaOEzDjkoF1NXiPY3S9eBFWRxUerKcbgs0WcMOJjKgvqKvQPkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lR2KKV3rnNEtVtv7lKCX61DHKUXYlrjVt0bLS9+f7dk=;
 b=RZqY8kyq1r/NniXqWX1ENcyxBDIH1HLiEBMA5ISLgSIHTn8z2myjC/ZCCNw5mf1CT/4Bgbq4kWFBEXDmN8gcSDFL4wWEBN+wGCYmXAjQD7GkRJNB+GSkR+pQwv1LimlM4CeyUt6e/MZz4GPNSxnmZJ+ztLF9V8j6pazwIJaPvEw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 (2603:1096:604:4ba::14) by TYWPR01MB9838.jpnprd01.prod.outlook.com
 (2603:1096:400:234::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.5; Wed, 25 Nov
 2026 01:42:16 +0000
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180]) by OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180%3]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 01:42:15 +0000
Message-ID: <8733spg009.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 05/27] ASoC: soc-component: align snd_soc_component_{regmap/regcache}_xxx() functions
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
In-Reply-To: <87a4mxg01k.wl-kuninori.morimoto.gx@renesas.com>
References: <87a4mxg01k.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 25 Nov 2026 01:42:14 +0000
X-ClientProxiedBy: OS3PR01CA0022.jpnprd01.prod.outlook.com
 (2603:1096:604:db::9) To OSOPR01MB749128.jpnprd01.prod.outlook.com
 (2603:1096:604:4ba::14)
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
X-MS-TrafficTypeDiagnostic: OSOPR01MB749128:EE_|TYWPR01MB9838:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b7687bb-8f7a-4d6f-83af-08df4a9554e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|23010399003|376014|366016|22082099003|18002099003|261009223027099003|56012099006|261028144727099003|11063799006|261021121427099003|261022105027099003|261102123227099003|261102130727099003|261022075727099003|261026121527099003|261021123027099003|261026140227099003|38350700014|10067099003;
X-Microsoft-Antispam-Message-Info:
	E0Eakt62Mc+AyjM9ln7zNW8cW/f7oJLL4+kLlj9GAbcZbFQNI4Ot9+T1zwEriRX37JW3OMPigaDBo5VyqQOGFKhmSKSFlaB7lKO1hvSjbxY2fjdlaMQNFlTWd/bUueQMmmDdgKg1KmSO4kyZjjSXzGZQkavD34HLjB06HeOdQ7GjkZ9BzaZRLwrxieaDzB2Ltj5ce6RmaBhenWsg3D88TT+MfaEXnCiEWVF5SDY+hDfvW6uoKdAQbbjQ/cjZjtDHPqwRTFWBxsfqMPHzTArLrB2gEBaGB+9VraOzdPSw+Kltx4uNGx95eDCqNaon6vZF/mvvU54X9KZIqWoEc/n19SV04Ff1cdxWBxx5PbE/fV0aB9/qtygDHqz4mp5OMdJt1lNPXK4lBkWm24a1LkGVCL37GzN2MrplwjicxeMi/RTv4PSdH6BsdHqiTe7nxhKyYSWfb5YBqIA1U/4sxncnEj3kQ5hSnf7O5vLwnSzXdTF33ecxGFYlZmtElNzq6NlBy4sLHeZS737Z1zvnekSzlapA5C+Z5pvsZnAPVG1R4+IY4S5VvHmZ/i87lzl/LPPMnb8nrtuOfMaGmvX+sJDCGZz0HiRlLIud1u7/YgjMCuECx0obx2lfDsN1cQFqnmuQsNAGDTUcyTUzVdkkFbBWf8h097qy5zG0gq2coTqW9d1nuO0TvLevZdJLEm3VQHcGqdqsBzYiJ9mbbuTIUfoR0SiixMlKP8D6NGHu2YzdmBM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB749128.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(23010399003)(376014)(366016)(22082099003)(18002099003)(261009223027099003)(56012099006)(261028144727099003)(11063799006)(261021121427099003)(261022105027099003)(261102123227099003)(261102130727099003)(261022075727099003)(261026121527099003)(261021123027099003)(261026140227099003)(38350700014)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SM/zwvb2aW1PAhx3d3VfkpuB2zq3Giusqx8mzIKgW0d3EEslORmnS8qECPB/?=
 =?us-ascii?Q?ju70IpUvoMRub+iGXudYgKBBKNswi4k2RibzXdXPa+h70aAuhL0yJNEZ1UUn?=
 =?us-ascii?Q?R53uHNWI9y8hAVRsxpegd/xJbkJYkZxciZ9tO4CaJsBN0qXsY4U+RRyWIh9z?=
 =?us-ascii?Q?aqXjyXCz2xrR0tuWCXKuR3j2NpOEy4dQt6lMAoWb3+3bskdTtV++E20xWmGy?=
 =?us-ascii?Q?K7f8/9ZkJ5lznq7laeNSS4p10WO2iyyPaW5uMxDIjwMnJSBVeaozQBw2qBJ0?=
 =?us-ascii?Q?ROgMXZuknNW4tf8KMUnM9xoJxdzZZw8+xFKwq4c0I4jSr2BVFvBqfiCxyBic?=
 =?us-ascii?Q?8WBFHXFBp08yJS59piVM1WKXvIrTNes1r5jwuDTbB5PHTPtCrbsakKVYjlxK?=
 =?us-ascii?Q?A9XvwwbfRaYKUX9J/a6zZq7Wwkdm0DaYM2+Epbk62KMRQkBzmb8jBjq8WNPs?=
 =?us-ascii?Q?pCviKPxXqyDkBxzYJJRF1kQTrwNexBsCQPHQ76LRcFbZIZ/srUa6ljVz2sck?=
 =?us-ascii?Q?AKWNBLZDcEyFVcTWmGPrVwnZlf6JvfAEmh/BOrsLFzZs0ECLRtglfofB1cZP?=
 =?us-ascii?Q?ZmRucM67XNB0bSj8gGzNdMk17Thg2cczLyBqEnrGTACGSRionryDdwGCydGu?=
 =?us-ascii?Q?/5YePKW+vxC0oS6plY2Gh3iWfMFDwzCAuVemT0DvZVFzuSXIFbv9933iJ9Iz?=
 =?us-ascii?Q?Zw40oCASz0PhMmZyq52OfjinHTVcXnQv+PGXyzrfMTy3IlixGFVwdoq3zFd+?=
 =?us-ascii?Q?2Trjuw7+Yxg12/cLJrL7RywOydRqQkwpPd9+9m29H0+Krv6V+aAZGw45ldQm?=
 =?us-ascii?Q?szuj+EYs2d0A6hwjriyVwryf6zQXrcm2Hj5IubAwc9k9n9TYptTVpegE8D0B?=
 =?us-ascii?Q?x0CJAboAdOmwfJZ998k9LPYzb65r854YxQMVko29qjkrAtMt6clR0sdYMTWI?=
 =?us-ascii?Q?CBZCGjOjMcyLrUTGifMOZUSV63s9oFbdXCLP7HIzq+tYFyk/SjJQgbzxe351?=
 =?us-ascii?Q?5DOdnaHdyCJQVmRElrztNvjWNVmGHDNfNFBHo5P0KOlvvQwkKg05/++n8OZr?=
 =?us-ascii?Q?mzlHezWnh88RnazzjKqgU8Ld7AXVU7tK6R92lSp8z7wXohllTdEI+br4p4L2?=
 =?us-ascii?Q?LChbdh6Yhece2yarsTWsNilPmjoF8jcqA8oEHhGEW1a9arILuEZyKe00P91W?=
 =?us-ascii?Q?/r1DdWEI/tbwBUwm7v24485E8DzuSqj9KyG0i/L6uhfMTCewsHqjPUpJmLSW?=
 =?us-ascii?Q?QAeGYCgIg9OB3PnbAwCzweQhIsa2IYq4F5HnISGwK1mVNY4+yyo92qRAZscp?=
 =?us-ascii?Q?Jt1uNBQ20FM1DJ3w8QgAv6MRWGvI1L1JCp6Ib16+/5UGQKP9izHEMZl3GDAY?=
 =?us-ascii?Q?alQaTOMTjREPZGdDSY7Mo1vjpqiZm1jiL1mGLSxMeJAQfvdG5dlXQECw+aOY?=
 =?us-ascii?Q?h9YQOiT7PNP3O1Wa/Iq1944D0Kar8PI7k2sIE4V1zXlvijBZqZvfFGTLjpYT?=
 =?us-ascii?Q?K4JyeyjFj/BPOGK9LYNojNu/Phf08sq8dw786pOWt0s6W5fGk12eMwPc/NXb?=
 =?us-ascii?Q?D4ZPKnXfXQB5N5N/XvPQpGb1vB8hTLbVOitLFhd5H5Mjge9GOFvOWn2s8nr8?=
 =?us-ascii?Q?2J74nntHu8AlCbMqlArVaFRWL3ja6C1lCI7ARafbwucvunlsb7CaVa7KP9/E?=
 =?us-ascii?Q?5/3IntqsWtvWE+MyuNK0Je3g39ygmWvUOWxXsP0Zho9uRLEBSIZl93EuKj6v?=
 =?us-ascii?Q?bW2uxOIsmiZU4/dDzOy359pfe5pXtUQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b7687bb-8f7a-4d6f-83af-08df4a9554e3
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB749128.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 01:42:14.5768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X0r4Ze+9eDLWU2f1OLTFai2mTU1wp0rRzg2RtkAULuC4gccWRXSrRCa6pvjeUpWutMqdySOrrX+KlY02cjAdhpyuLNGfGkAW8V5C5pNKE94QW97op927RxSF/3pImMTw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9838

Current soc-component.c has snd_soc_component_{regmap/regcache}_xxx(),
but are located randumly. Let's align them.
No functional changes.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h |  6 +--
 sound/soc/soc-component.c     | 92 +++++++++++++++++------------------
 2 files changed, 49 insertions(+), 49 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index d4fe3e02347eb..7476923c60d0d 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -333,14 +333,14 @@ int snd_soc_component_stream_event(struct snd_soc_component *component,
 int snd_soc_component_set_bias_level(struct snd_soc_component *component,
 				     enum snd_soc_bias_level level);
 
-int snd_soc_component_regmap_get_val_bytes(struct snd_soc_component *component);
-void snd_soc_component_regmap_async_complete(struct snd_soc_component *component);
-int snd_soc_component_regcache_sync(struct snd_soc_component *component);
 #ifdef CONFIG_REGMAP
 void snd_soc_component_regmap_init(struct snd_soc_component *component,
 				   struct regmap *regmap);
 void snd_soc_component_regmap_exit(struct snd_soc_component *component);
 #endif
+int snd_soc_component_regmap_get_val_bytes(struct snd_soc_component *component);
+void snd_soc_component_regmap_async_complete(struct snd_soc_component *component);
+int snd_soc_component_regcache_sync(struct snd_soc_component *component);
 
 int snd_soc_component_fixup_controls(struct snd_soc_component *component);
 int snd_soc_component_add_controls(struct snd_soc_component *component,
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 2979d2b79ed13..7e565da045b60 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -386,52 +386,6 @@ int snd_soc_component_of_xlate_dai_name(struct snd_soc_component *component,
 	return -ENOTSUPP;
 }
 
-int snd_soc_component_regmap_get_val_bytes(struct snd_soc_component *component)
-{
-	int val_bytes;
-
-	/* Errors are legitimate for non-integer byte multiples */
-
-	if (!component->regmap)
-		return 0;
-
-	val_bytes = regmap_get_val_bytes(component->regmap);
-	if (val_bytes < 0)
-		return 0;
-
-	return val_bytes;
-}
-EXPORT_SYMBOL_GPL(snd_soc_component_regmap_get_val_bytes);
-
-/**
- * snd_soc_component_regcache_sync() - Sync the register cache with the hardware
- * @component: COMPONENT to sync
- *
- * Note: This function will call regcache_sync()
- */
-int snd_soc_component_regcache_sync(struct snd_soc_component *component)
-{
-	if (!component->regmap)
-		return 0;
-
-	return regcache_sync(component->regmap);
-}
-EXPORT_SYMBOL_GPL(snd_soc_component_regcache_sync);
-
-/**
- * snd_soc_component_regmap_async_complete() - Ensure asynchronous I/O has completed
- * @component: Component for which to wait
- *
- * This function blocks until all asynchronous I/O which has previously been
- * scheduled using snd_soc_component_update_bits_async() has completed.
- */
-void snd_soc_component_regmap_async_complete(struct snd_soc_component *component)
-{
-	if (component->regmap)
-		regmap_async_complete(component->regmap);
-}
-EXPORT_SYMBOL_GPL(snd_soc_component_regmap_async_complete);
-
 #ifdef CONFIG_REGMAP
 
 /**
@@ -472,6 +426,52 @@ EXPORT_SYMBOL_GPL(snd_soc_component_regmap_exit);
 
 #endif
 
+int snd_soc_component_regmap_get_val_bytes(struct snd_soc_component *component)
+{
+	int val_bytes;
+
+	/* Errors are legitimate for non-integer byte multiples */
+
+	if (!component->regmap)
+		return 0;
+
+	val_bytes = regmap_get_val_bytes(component->regmap);
+	if (val_bytes < 0)
+		return 0;
+
+	return val_bytes;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_regmap_get_val_bytes);
+
+/**
+ * snd_soc_component_regmap_async_complete() - Ensure asynchronous I/O has completed
+ * @component: Component for which to wait
+ *
+ * This function blocks until all asynchronous I/O which has previously been
+ * scheduled using snd_soc_component_update_bits_async() has completed.
+ */
+void snd_soc_component_regmap_async_complete(struct snd_soc_component *component)
+{
+	if (component->regmap)
+		regmap_async_complete(component->regmap);
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_regmap_async_complete);
+
+/**
+ * snd_soc_component_regcache_sync() - Sync the register cache with the hardware
+ * @component: COMPONENT to sync
+ *
+ * Note: This function will call regcache_sync()
+ */
+int snd_soc_component_regcache_sync(struct snd_soc_component *component)
+{
+	if (!component->regmap)
+		return 0;
+
+	return regcache_sync(component->regmap);
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_regcache_sync);
+
 int snd_soc_component_compr_open(struct snd_soc_component *component,
 				 struct snd_compr_stream *cstream)
 {
-- 
2.53.0

