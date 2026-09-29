Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010064.outbound.protection.outlook.com [52.101.229.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1043E9C3C
	for <linux-sound@vger.kernel.org>; Tue, 29 Sep 2026 05:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790659813; cv=fail; b=Mu22Hfdo163wZTAxd5SBjAu76kMS4559nVD41bRiVz+oL70GzrpZwTKwzFqCyDNVAGG3p3ctXqTZLatOwUgCUAspmdrT+9OdZ3t4qWS7mSic+iVZFlk1/kOqx4I7V7XGIjDOPevuIuT1IvsQyjABPdCRtTy+/SJ7OM3JQfSnFN0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790659813; c=relaxed/simple;
	bh=n/KW/L7Ww5vINF6pKS8HyAJNC1sRnjBSV5TV/u29BgA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ZDE3Pt4TVGLwtqjjfvsVzk60C4RPm9I/T2vfQpMF5dDefnOSffyzTgAh87mlzW2fz7BuoXN59iHupXm1rDRyb8APhDGIAfWJJGOO+yeiWYY7aCsln0KRlsmcaJ5CodbsESu8alSvdSjNSIxyqr6Gx8dN8QG55w2Jx6H0vhg8Dec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=LhGRjW5Y; arc=fail smtp.client-ip=52.101.229.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="LhGRjW5Y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nrgeUk6Ehckp/TpUeWTJbh4YVfTYAPAkb0zg6jh/CsvA8TEftSGBkfEzrX1hvR58UqQnY7ClvpDjwjyPo/Dm4xMeux8PEQAQsEx5cM81cquMtkMCxJLSzxMSfOJF64qsX0CfaEX6e6JLE7CNvVePfLeFGPMoFs7v53D/4smj6vuu5eIM09bcgwiRxYOBhJqO9eNtQ0H6qTkXXlREtbivtKRy8X5eEBoL4O1yKfjmnOSfrVKSrWpXjbgBM0hBbGoxhfN3efqP8yh58lvPjlxpq+DIO3KECSmrqbP0duykgtMQEQCnaBjPJFoI9V5a++UUeFixodbh2X9I4L82495FTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PYr4O+NKieQ0a0VbrKDXucRertb6cB9Ro28aL1uZ3gU=;
 b=g7A/98B1ybXS6Qd21jzVB53KVZV5XaUcXquDivqDQ/MVKSfTW4lvQaauWZBdlDF4YW+mu4QsqKzyrYNJM14F1qhTE1pKB2pj9o9HiA8hnZ34bRnsNFJbpNGSwRly7Ctne3EhHOgvHMe0MtmVeqPxpoqsrE02PO8SUBRX50FIp+Efa8GqNeim8Mefa0EwcmqL2eJoEiTphpHlTqd+fl/hNHTle1hlXmvKekZ6vruUitZ82Pf0B3c4dh/IlDuV2k+I/3nad1MO/BNrUDwgnoOW2XdNWvjL1LNPQgeDu1ARbNPdt5nU0mNCftUpY7p1JicaHnQq1nrVGNt2FSAifI+Vlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PYr4O+NKieQ0a0VbrKDXucRertb6cB9Ro28aL1uZ3gU=;
 b=LhGRjW5Yux1jbpmENNF2IQ5NCVO9vAPF6ZTOhZr3Z2jVu0tacHsdGAx5lE86HZfDEBY8pk+8sCDZEjOVP7YdY0kFuoIFZ+McihwYTqrZnECAjlBzD9r87T/WqMEgord9iBRQC5QHBIGvJsAj+UhHiq7LtGwW5c9n0Gp/gh5nAto=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by TYYPR01MB12208.jpnprd01.prod.outlook.com
 (2603:1096:405:f3::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 05:30:10 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 05:30:09 +0000
Message-ID: <87cxtweiam.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 09/14] ASoC: soc-component: move snd_soc_component_cache_sync() to soc-component.c
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87pkxweibu.wl-kuninori.morimoto.gx@renesas.com>
References: <87pkxweibu.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 29 Sep 2026 05:30:09 +0000
X-ClientProxiedBy: TY4P286CA0059.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:371::6) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|TYYPR01MB12208:EE_
X-MS-Office365-Filtering-Correlation-Id: 329a7699-6dc6-4965-68da-08df1deaba66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|23010399003|18002099003|22082099003|38350700014|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	CLKkqYSinxomcJNT/hqNEepsq7nl3+QKxFnN/hn7uB+8Pbc3l/Zr58ZU/bMsyeoxIr1Ij+CABIVS/OK1g2skjv9TMOMzZuIkhZSuxf75XY9u4WvF0HOJj7kAILcliYlzn1rw9WTG5tZSg9/Af/l8a7vNG+SPxI1DMNCUXB902O+EYbeiPf1ZhoP/iyeCDaZNXdP8+MYvd+BJ7IRjFUW5ur1FRVEp0kfT4GHwdXpKATHbkKsGDSvQF1slV5806b4/8Oo41SqXRmqLBMqa0o+yBMJc8Stofqubht8usdiR4muDFucKAzub97KgAvEJZEAmCQ6F8DGsorSFgmb7pTQNZ02YfH2yvs2B8bR6ytGnn6FoupNHZpmUFrBEqiXtr6jpfcTJ0QlfzEYL3s5GFYvU3lV3uFZ88BfMFWbY4/EqgIAERznEtgaH+fCObJUZNOgSKPmwWspSNIyWCoaAzibN5qhcCJ8u7IPe8bQfGd388pscH+5CXyhKyXjptGs871Hj49Ti0QACVYBH1UjmKmv4wRPhzipBGiqyYqun2kt3nyOGIZM2EEVEpOWu/l7f5NM1+XLfa9RFu6xp+yyw/K41xcTUpOCzfV2a4+EjwiCQ7fPs2zErw/neO3DtMZKumZtvqTMQHG+JIdqvW4LndU1kk0eJ0rcZL9YIMdONy/WWiWepVli481hgvflD4uwvir1AqsOp1faJzw1vWg3sW3z/0fm2aYloUuDdO30ewS6o3io=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(23010399003)(18002099003)(22082099003)(38350700014)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wV38wBIMOSDoG7SQbkQ6pmoia5+OS2U6rDfyAu9NBKF2u99I8wKjnsP+glTK?=
 =?us-ascii?Q?23sSJ/JdIV+OUlowRplo4KhB2JmsygUWqtG4rzS/TgOpCc0z3N45vv+lUCiq?=
 =?us-ascii?Q?PC+Zuc1ZvOYvcxQRl7zVmxHxgXzrdljyjJatxI6HFa/cSKS2UnxTqPQwjO6d?=
 =?us-ascii?Q?RNXGFLiPDW69CbxQzHUIT1HraaSlRZukNLvbY2cvpmUN0wdWyQA/ARp0xjsa?=
 =?us-ascii?Q?WgquXsOyz1tmtkM9ipy8ZR+ulwbJiqTZOsp0PkgkDoxyk5uOCXEN1HhiDomU?=
 =?us-ascii?Q?ZCRM2Cc1vwQQCNkm1xl7WdTyN9mmWrmO93YhhEEjHfK5vdJpwKyGugJWRlr9?=
 =?us-ascii?Q?sj+NeFWA8/C0h0PSUnLTYkHQp/5lShq0ILl9SmnXhVmjkSPAjkrlIrIvDbV+?=
 =?us-ascii?Q?MG+ULD2eCWMImSP9PpjTNILWsDU0MjHL8ulLjVgK93BkS98/XYppy9ptgYKG?=
 =?us-ascii?Q?EGY1tyP4XPyxCwKju/u7qQ9mknDY3eyJT+oohuNhaGOIJNOSxBCSKT8kdOiX?=
 =?us-ascii?Q?nP+Lxb0uwefncq9kErh5hosUtxWoaEEVtJiJnbBNmhrT/YNVVK9DWzCfUd5g?=
 =?us-ascii?Q?RJ53gFfspw879tBNOdXLYR5XGCmDpbZRiEHiXXhOkpF5Odyk3MVpq593EVVl?=
 =?us-ascii?Q?UHeuXQzZK/llFvhpQeN1bu6pps1w01FoSxAsmfH5sIuiHLzNo38KUU1eUDAa?=
 =?us-ascii?Q?BrvttsJVE5Nnwx526DP2YIzmok3utvE3xenESOpd2cxQa9TWX10Tq36OT2Ut?=
 =?us-ascii?Q?9xIV6vcNSJauoWhUTUtt3NTNgsQOxNLO2gL9FsPLYbE8SjnQaMSeXJIcqSiU?=
 =?us-ascii?Q?VvIi//XZ1qSrYVne5Y6R4G6ZiV/TaLRkbOsgWVAgwW1bbmXZR2PJ7T8QbqAE?=
 =?us-ascii?Q?XvpoH9njLz9kXvN8WkW8oawRLw+QvSw/y9wMWwdr+NpSQXLD8SAtv4hgIA2U?=
 =?us-ascii?Q?i4OA3+l2en4mBK9Fe+8OKHpMLISFZsLT/W5a29r95HziPnpS1tnRO893/jxn?=
 =?us-ascii?Q?u03HB4upwHCosRDXekykww8nGhz3vyC+6iD4tkgeJ1UeSKVjkEKXmeIz1H45?=
 =?us-ascii?Q?HhQh6mFINDpX+5BnLhtmdXgKgIz92lf59x58apk72CYyUXnZTLjITk5Bk3dH?=
 =?us-ascii?Q?GcfivGax1OPkEi7IejtRPjByBT6Mfbxjw6bwiYzLBq2A/fYi5Ct10o9ZzbOI?=
 =?us-ascii?Q?3QtHK64Ja11E7IGsgNQi60rQlZZPf/2ZpThM0xj4KX3+iGONZN72VcK7YDVC?=
 =?us-ascii?Q?DYcrjO/6oMDiKPjxjGT/po8vjtsfoMkB+QOILDKLGKOKiTYx3JPFJcbv7eDp?=
 =?us-ascii?Q?so8QHtnHDk5NqpAZNi0MuXl9vFoQnXVS6n5uQWPxuyjj4kU3Ps7kqKtzhPfs?=
 =?us-ascii?Q?hF2+t1/cRVG3fhWJ+WSA4rkMRqD1cHMlqO1Gk4zY4KqNrOHo/e7tttMxHP7p?=
 =?us-ascii?Q?iYIjCiIX2hj6CdFzCwjX/Z0G7EKUxrXZdo0575eqpxejMJ7oT54F73Btb5GS?=
 =?us-ascii?Q?BFcf+V3HvYksAIhWjl0aTqElKTzO3g7UT8lT5HV+Vm0cmM8rULPBXU58qaeg?=
 =?us-ascii?Q?LV1bGmpUIIwG8U4BA5og3pccs9SQdGpyZGmZxTl+P+izewcnWZ9883nX+zGp?=
 =?us-ascii?Q?83yCq2fV0Zia2KSwLnS/1PVTllM+W3PEjSNoTkqmuFWc4jWB16rmb8P05Cys?=
 =?us-ascii?Q?M0aeSLymO08oi+fIY40njNxdx3f0pLOvqVRInychDo4fl/40aPQqwAHtZh6F?=
 =?us-ascii?Q?5LxbItgjxl1+vTa6mvcqUzN3F1+RF7r8HdIYwvzJ4JorWbREF1Xc?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 329a7699-6dc6-4965-68da-08df1deaba66
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 05:30:09.8231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: usFs6T/iUKDVvgDnXyep44k0BubD5NF6iQudjuLFKxnMaHvamKuJt7m8bmfta+VqSdKcXCfKbUeJjUODzhuTGXmYjY2EnCFDZRuCxNQsa7ikZjI/ovkSIDnGygaG5jkt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12208

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

Move snd_soc_component_cache_sync() to soc-component.c

It renames function name
-	snd_soc_component_cache_sync()
+	snd_soc_component_regmap_cache_sync()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h | 16 ++++------------
 sound/soc/soc-component.c     | 15 +++++++++++++++
 2 files changed, 19 insertions(+), 12 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 306d61b2cb5eb..0f5738154a23b 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -274,18 +274,6 @@ struct snd_soc_component {
 
 struct snd_soc_dapm_context *snd_soc_component_to_dapm(struct snd_soc_component *component);
 
-/**
- * snd_soc_component_cache_sync() - Sync the register cache with the hardware
- * @component: COMPONENT to sync
- *
- * Note: This function will call regcache_sync()
- */
-static inline int snd_soc_component_cache_sync(
-	struct snd_soc_component *component)
-{
-	return regcache_sync(component->regmap);
-}
-
 struct snd_soc_component *snd_soc_component_alloc(struct device *dev);
 
 void snd_soc_component_set_name(struct snd_soc_component *component, const char *name);
@@ -340,6 +328,7 @@ int snd_soc_component_set_bias_level(struct snd_soc_component *component,
 				     enum snd_soc_bias_level level);
 
 int snd_soc_component_regmap_val_bytes(struct snd_soc_component *component);
+int snd_soc_component_regmap_cache_sync(struct snd_soc_component *component);
 #ifdef CONFIG_REGMAP
 void snd_soc_component_init_regmap(struct snd_soc_component *component,
 				   struct regmap *regmap);
@@ -452,4 +441,7 @@ int snd_soc_pcm_component_ack(struct snd_pcm_substream *substream);
 void snd_soc_pcm_component_delay(struct snd_pcm_substream *substream,
 				 snd_pcm_sframes_t *cpu_delay, snd_pcm_sframes_t *codec_delay);
 
+/* REMOVE ME */
+#define snd_soc_component_cache_sync			snd_soc_component_regmap_cache_sync
+
 #endif /* __SOC_COMPONENT_H */
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 9b89061e4675c..00f7d412097f1 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -410,6 +410,21 @@ int snd_soc_component_regmap_val_bytes(struct snd_soc_component *component)
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_regmap_val_bytes);
 
+/**
+ * snd_soc_component_regmap_cache_sync() - Sync the register cache with the hardware
+ * @component: COMPONENT to sync
+ *
+ * Note: This function will call regcache_sync()
+ */
+int snd_soc_component_regmap_cache_sync(struct snd_soc_component *component)
+{
+	if (!component->regmap)
+		return 0;
+
+	return regcache_sync(component->regmap);
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_regmap_cache_sync);
+
 #ifdef CONFIG_REGMAP
 
 /**
-- 
2.53.0

