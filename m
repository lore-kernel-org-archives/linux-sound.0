Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.37
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794288244;
	b=LPuzYGIYPE0HkXlKWH5Ydz0lQ5JXyqjVJnbQvdRQndPmCVrmdXpzq4QGgTNLbpfaCtY8
	 eueG2vO1Q5wo3q8B1/nkP9gjLFoH+Z+18nFWaFN7pAk8WE6WBylZUaGh1aYrcQDRbzDki
	 cEeaf3KkbmZ4X52xvjKjTs+7Bz4Phgv+FnoEW56wzvQqRK3KafsQqzZmDTrvZ5ytrYJ1N
	 unq5P4tc4eDwmH5YX/kpgoQh2ds+zZQ9Ecxfzt0Ak+UOutFuOs64v4SD70S3PPqTBTr7j
	 JQCxqwWrwm7wKGNn6pXl7+5NZjkUfD7qSVvU6azrhfUYhimCjezHUFsx7PvwSIJFKlA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794288244;
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
	bh=uvsDqU8arD7OOUoxVbucgeMOXTA4UmXxWLOt2j/QJfA=;
	b=Xo/bZET80NgqfOI1zEI23NTd2fKYmU2anfKQstz5KKKHtgWpn2gYNI3FJwgW/fuoRQ7v
	 wqXYNM6v+fPkPIuUboaUUvUGJcLSzTy836jS2RSf2osHPQOOcq8JXdpzp7qujPFcVDHNK
	 ENiEC66MUBXtTTmzpW/khkDOdLXmRaskkdWKCkhhSZvRjTD6iEP8l6NuoOKP69PlMBhjh
	 H9+GqOG2docXabN22TG0M5mXt/aCUP0wve2SCSl8qaQ8bUeImNPERnxlajueDPrWVvBD0
	 ORSf/9uhtz7Jnhef98xWV/tLAvrCjR9rJqzVv9f7Rr7JwXSD1vv1H5556w8k1E61y7A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=e4ohmsIm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.37
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010037.outbound.protection.outlook.com [52.101.229.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93231606A326
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 05:24:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93231606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=e4ohmsIm
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OS6tZenGhBfzQy1EHMlhSIzlX0g0OpbaGsC/snpko0si+vIice35ckN1TUXPJL1rNt1GyK4c+NDUg+2ymv5k2BQyZ4WljOQwjm2XwM0GAT0jjtm2Oyj9IeEDF8nygNcekq4A08Eb1joPvs8cDzEwBjiN/MJeFU7rAYcE1bZa2vMnDxVJipw0q/6m2U/1vvTgcnpV/8Z+ZZMYjlsjxpVr5G9HZ+EVIeBhJedbYoL7GcqBFUUL8nkez3TJeXADwX04PTdp84urV2/9v6+Ad3vChk3tlt5UUGUILu13yIWQjiIlC3jpph+4FgKvQoG4AlJC0o1/2UqT2RjScP1UOlau3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uvsDqU8arD7OOUoxVbucgeMOXTA4UmXxWLOt2j/QJfA=;
 b=dq79+6muPK8q4nYtPdFDQB+7wOStmg5ul/efgAdsDh6wGir1cGEojLx/RMgh8Io8ifdXOeF2cBo5OyrZGq/d6KXWuFg038I/kugp1t9ECY2iGJkTXvB+dFiZKYr1RJw3YCUZHNGIwlLeUb0lTpOuPYXrqSHuc719ynMgdLcWFficzO4xBwCS5U5LWdMob8TYE9Scr7oMNDTKXYUtxwPKYv6fW3EAG2BO8d9AFrduWGQGO5R/mNK11ODoJTEhtilEK53LaVyuxem/3zKzbAtsAxv4SNetrpZxwf2YkgAXQrwjiUSm7Efel9nWoEo7S+duI1dBJDJ9aRQ3b+iUph0Ycg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uvsDqU8arD7OOUoxVbucgeMOXTA4UmXxWLOt2j/QJfA=;
 b=e4ohmsImJC/PWIONHIUnor/o7YLC+fbycmHDodlUy9yVsNiXkipTxhEGncPfSUI0EnWQfVS7yMCEZ77pQps70m+tMJOr1xGWmwWe/I9NbGMQ7rAEpyvuUrJM+PhZrya4/C3u1jJtlWPBTiMj41mMAHBZk4CRl470Xcdsi7rp/Ng=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by OSCPR01MB12483.jpnprd01.prod.outlook.com (2603:1096:604:32b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 05:23:59 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%6]) with mapi id 15.21.0592.012; Tue, 10 Nov 2026
 05:23:59 +0000
Message-ID: <87zevhmf80.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 06/20] ASoC: soc-component: makes regmap function to inline macro
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <878q31nttj.wl-kuninori.morimoto.gx@renesas.com>
References: <878q31nttj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Nov 2026 05:23:59 +0000
X-ClientProxiedBy: OS0P286CA0117.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:169::21) To TYYPR01MB15175.jpnprd01.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 16480108-bca6-49e3-bb3b-08df3eead323
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|52116014|366016|18002099003|22082099003|10067099003|11063799006|261022105027099003|261102130727099003|261102123227099003|261028144727099003|261026121527099003|261009223027099003|261022075727099003|261026140227099003|56012099006|261021123027099003|261021121427099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	Ez3tgH7Ukh1mvZjc+rOXXsIX6hM/DgTt8TrPzUDsRhx7AauLEa49ow53WQVlndY+NFYKA0wTiopyUj6WHy1usDrDCY2WsVdKZGQ7j4WeuMk078U+hBBBaHFS+Aozmghb2pPKYUuBz/AYZusxLWwi1luCR63stevWumLqS2xQe4bG1eKNr44RuGzpdU0apsiNpREs0NFvTWN1UXxkfML+FgeGT/R6lKaD5ucM+WnskFTKWBF6v/7JrSBwcrxwiIoJxZBts5+Y9iNSgHYsWzLzbxR43aRKBp3PmEwh+ahlQ8s837oZJevklMKeU8sq3vT8gErmGAqfmTIfIJ61SZFs2NfJE0LFjKf8opsAr8L65R1QLARBFsqVIsbyogbl5gmLT6laqZJFX4I9oQLc7V1S8w0Pcq7bfXGPkuzCbVBNKDmTgkW4QublsWfy1Ena0egkkDoPaRgOFjV3nBSyK0LMUgLx7Qxnd5MalGW5V1kyzyWBu0ui2ARLLzVWkGjBvw6JmwK1yH6UCCW2je9YzXCDE65MCbRIxhFlIWftiW6pLO0Htz0QJqyoQYl+vj1/+N+XJjsbEpgIXxt22GdDq+oA9bCRR4KkcwBjawFSMJsyNExM8j8VS/T3FfSd2MLkMvonaiYzDo7IyNLFlW08iFtVNzjeLZDfD2lpFIOnLVyXY4tVgoI8u/suuBM8jXxMbJopuX3Y8Ywlifb+o08XsKgPPn3OLhJrnhWQXLQFAD60NRQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(52116014)(366016)(18002099003)(22082099003)(10067099003)(11063799006)(261022105027099003)(261102130727099003)(261102123227099003)(261028144727099003)(261026121527099003)(261009223027099003)(261022075727099003)(261026140227099003)(56012099006)(261021123027099003)(261021121427099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Dq+gsugmHDeJ7QaVs2/ZhV8rZTjADIgmfoG3al6kLb5O4PxOfek71IoQubY9?=
 =?us-ascii?Q?s0AEQWDbMJPyxzQCy2/U+vdvO2Kh+ncyHx5U3e/77cKEGv5NU8PC+S0v87e8?=
 =?us-ascii?Q?nnoes+iuvpsWrPTO4x05DAQI8+RZ9j2PrCyl8YjDsfT6cURZHbclVwuDXTZd?=
 =?us-ascii?Q?T7x1MPHCbDltVyftEaDPLHeZl5arISKFXjLyMEUy+yPPH+6bJU4lTEts+D3U?=
 =?us-ascii?Q?Ftchyqg97yg/4zULhFhYBFxfbK7z4xT6R6k5EkAIJr6GQlx+65GrL92/vvuB?=
 =?us-ascii?Q?RGzcmmDuM/p5w6QuW1kCZZSeXCgRdb08J0ky8S+D02w/DHr83Gr6noFoSZK6?=
 =?us-ascii?Q?/OFu9yUA8FZGAMQA8GDSG/C9ZqQr+h1oNKuYfJb6/IbUUvQWAZmPBGsVIDMH?=
 =?us-ascii?Q?YMjmjxOK4LmVdG+emcjBmnxSUSNyks1QIKp0KWCFAzimfEDxDqf1yAHf7i4t?=
 =?us-ascii?Q?bgoy0gX3MNea2gVrWEUtIlX5s6iMCf52Jv/jCiwkDLtIseT8MwpYvuN8vhfw?=
 =?us-ascii?Q?TnBZ7/fsqX1OPbUa2qeyVNgV5b+Mz7TFiLzJIWh4c+mIV7SIVylVOynuIS98?=
 =?us-ascii?Q?ypxTlJFDCxV31u7hObRomZRgfGoF8tv5VhjGbBv1C2JDssirLZ4BywKyZC3V?=
 =?us-ascii?Q?k1cOEBjhqxKYZYMRonywn2Qbwv0GH4xIMwW47N7WuEex/jO/QbwiV4lcuSSt?=
 =?us-ascii?Q?mYWPetrPSYgKL7g9GP/aSk64YIZy6f/VUgbswzG9+YYFFjBhr2Gcixnu50EX?=
 =?us-ascii?Q?iSBmTG7ktNg8NwlL3obgs2eh9Wx8SwQraVrJTuFdgFzqtVWuqmo6FF7wg3y4?=
 =?us-ascii?Q?K3bCOas+nn9fvMETH7FXOIXu+cC2GInIdoOI0/QgkUyVbEp+Ed85Veg1rqw9?=
 =?us-ascii?Q?ir1yTsAafTgvO90SOI+YFI+2A45EDgk+Z3f5Ys1xKF646eD4kP73Kskk/LZK?=
 =?us-ascii?Q?PplqXv4qTdP+N2Nnt6+fw8M72Y9o3nYRJ6/6W2Y7kPXTZxsKQQAY7Ujanabv?=
 =?us-ascii?Q?YAn3314UfbHcaQ071ZgX+USRw77spNLrqsIRnLgu/5upLwKb9HCHwwlW/8PB?=
 =?us-ascii?Q?reLfGt7hKuWMEBBdhu/tWvGRYcDbWqjy5yaeS7cv1xDcBVzY50NdpsySl4wb?=
 =?us-ascii?Q?2rzMN2pL89HYV59kF+UTnXQt2FUVIlJ5YwrqFVpZ6HaeD+vAUVd+PYiubhur?=
 =?us-ascii?Q?eE4rEcp8W1YAi8On+a4vE4cWban+z73yLPiAIOYSG0bQdgGdWyg+TWnIcGxs?=
 =?us-ascii?Q?EDp6+cJzotVCcySC/9VxMF8iUwboB3UUDhD/nyrOuE6EQGX/b+s2WjF2gtwZ?=
 =?us-ascii?Q?h11dxdlgk5Fe+ItLpxHEBGwR4DvWBDy2mZ9XlPDnPPhzRg6ey0LoFopqrxdf?=
 =?us-ascii?Q?fub4OAgqplv4w5Rc4VmBWuEBErYVNy3Oqw3lzTmRBBqvxx17E3w2ztPCa8xt?=
 =?us-ascii?Q?hqWd4frctYHJUkYFrIrs69Z+0BmRktOf5OcuM/ZOtkyNL/1bOUUGF+vHg8dQ?=
 =?us-ascii?Q?9fhEWXKG3BhhjjxfAbAPy2DCFV8g0Emfit9jcymSZkuejFfMKkAECI526wXa?=
 =?us-ascii?Q?ZBtZVE6Qxdzuzlv+Pa5Z+EP3k4/IO6j7ivg+wiCQ/l/s+FqOYQGUReEUKblE?=
 =?us-ascii?Q?tEQP/PNAh7Ed1ff1h4MIuPDKCxQx7mWHyfIOcDPoGRuz53grikTdizKsSEW0?=
 =?us-ascii?Q?8VVeIUZakEL70a4yHAx/SmyJUC1w8D5I1AmjNjpDHkGon2XxkQHEmq5yNdha?=
 =?us-ascii?Q?kgl2eLdGFvjAEt8LUv5GxVZ9Ilz0ByA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16480108-bca6-49e3-bb3b-08df3eead323
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 05:23:59.6426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zil6Wb+d9XnsggrIq9AG7RcKQCra7S/l5BxKRhafQwdA+7T2jIfQyMnK7TTcEpfczpNMdcHmsL5bxSVudl8o97I3YlzT6qGWpUpl9+whPw7svXxLafVgqxuyKsI2TMlP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12483

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

Component regmap related function is almost rapper, thus very redundant.
No need to makes it as function, but inline macro is very enough.

Let's standardize inline function naming conventions.

	snd_soc_component_${regmap_func}(...);

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h | 52 +++++++++++++++++++++++++++++------
 sound/soc/soc-component.c     | 46 -------------------------------
 2 files changed, 44 insertions(+), 54 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 6d5740d5a5e21..4e538942df643 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -343,13 +343,6 @@ int snd_soc_component_stream_event(struct snd_soc_component *component,
 int snd_soc_component_set_bias_level(struct snd_soc_component *component,
 				     enum snd_soc_bias_level level);
 
-void snd_soc_component_regmap_init(struct snd_soc_component *component,
-				   struct regmap *regmap);
-void snd_soc_component_regmap_exit(struct snd_soc_component *component);
-int snd_soc_component_regmap_val_bytes(struct snd_soc_component *component);
-int snd_soc_component_regmap_cache_sync(struct snd_soc_component *component);
-void snd_soc_component_regmap_async_complete(struct snd_soc_component *component);
-
 int snd_soc_component_fixup_controls(struct snd_soc_component *component);
 int snd_soc_component_add_controls(struct snd_soc_component *component,
 				const struct snd_kcontrol_new *controls, unsigned int num_controls);
@@ -455,10 +448,53 @@ int snd_soc_pcm_component_ack(struct snd_pcm_substream *substream);
 void snd_soc_pcm_component_delay(struct snd_pcm_substream *substream,
 				 snd_pcm_sframes_t *cpu_delay, snd_pcm_sframes_t *codec_delay);
 
+/*
+ * regmap
+ */
+void snd_soc_component_regmap_init(struct snd_soc_component *component,
+				   struct regmap *regmap);
+void snd_soc_component_regmap_exit(struct snd_soc_component *component);
+
+static inline int snd_soc_component_regmap_get_val_bytes(struct snd_soc_component *component)
+{
+	struct regmap *regmap = snd_soc_component_to_regmap(component);
+	int val_bytes;
+
+	/* Errors are legitimate for non-integer byte multiples */
+
+	if (!regmap)
+		return 0;
+
+	val_bytes = regmap_get_val_bytes(regmap);
+	if (val_bytes < 0)
+		return 0;
+
+	return val_bytes;
+}
+
+static inline int snd_soc_component_regcache_sync(struct snd_soc_component *component)
+{
+	struct regmap *regmap = snd_soc_component_to_regmap(component);
+
+	if (!regmap)
+		return 0;
+
+	return regcache_sync(regmap);
+}
+
+static inline void snd_soc_component_regmap_async_complete(struct snd_soc_component *component)
+{
+	struct regmap *regmap = snd_soc_component_to_regmap(component);
+
+	if (regmap)
+		regmap_async_complete(regmap);
+}
+
 /* REMOVE ME */
 #define snd_soc_component_init_regmap			snd_soc_component_regmap_init
 #define snd_soc_component_exit_regmap			snd_soc_component_regmap_exit
-#define snd_soc_component_cache_sync			snd_soc_component_regmap_cache_sync
+#define snd_soc_component_regmap_val_bytes		snd_soc_component_regmap_get_val_bytes
+#define snd_soc_component_cache_sync			snd_soc_component_regcache_sync
 #define snd_soc_component_async_complete		snd_soc_component_regmap_async_complete
 #define snd_soc_lookup_component_nolocked		snd_soc_component_lookup_nolock
 #define snd_soc_lookup_component			snd_soc_component_lookup
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index f717204fec60d..838a00c2b325b 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -386,52 +386,6 @@ int snd_soc_component_of_xlate_dai_name(struct snd_soc_component *component,
 	return -ENOTSUPP;
 }
 
-int snd_soc_component_regmap_val_bytes(struct snd_soc_component *component)
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
-EXPORT_SYMBOL_GPL(snd_soc_component_regmap_val_bytes);
-
-/**
- * snd_soc_component_regmap_cache_sync() - Sync the register cache with the hardware
- * @component: COMPONENT to sync
- *
- * Note: This function will call regcache_sync()
- */
-int snd_soc_component_regmap_cache_sync(struct snd_soc_component *component)
-{
-	if (!component->regmap)
-		return 0;
-
-	return regcache_sync(component->regmap);
-}
-EXPORT_SYMBOL_GPL(snd_soc_component_regmap_cache_sync);
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
 /**
  * snd_soc_component_regmap_init() - Initialize regmap instance for the
  *                                   component
-- 
2.53.0

