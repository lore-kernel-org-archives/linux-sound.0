Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010030.outbound.protection.outlook.com [52.101.229.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A6D3E9C3C
	for <linux-sound@vger.kernel.org>; Tue, 29 Sep 2026 05:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790659819; cv=fail; b=DbijkJFaWOc1aAEi2V7WyAxuf3NBHKp+4g+uJ/bWmHYEZQvf4dEqAwuUlvat//OB5mBPg9DL/ckLc+sfJ+vYvp01HzR4N5Ey8kT5pyYDf4Hlyw+vM7ABgCp8KEJhexF63rhVRWz28YNyKcAeJQQvegsX7c+iOOh72GDC/IKvrJM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790659819; c=relaxed/simple;
	bh=sCL9Sw171TpX2GxrFdeEw61ZgZTXr352tZHBGs4apoI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=kRRcY9bliXl8jYkKnek1tBurbrb+7EqX6WSqKJ+suMFLRikyzMsArqBtcTqRN+N9egHLbKTiT5PFPSt9ltc21cmfTVVuwLAiNi8yIvd+ol+x/h18iU73GZSZTERY9Voc7aILY0fm00IewW0AHrA1qYfBzkMyhFA6v2NzXcwcNJ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=otC0GpK9; arc=fail smtp.client-ip=52.101.229.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="otC0GpK9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bbpvhkOWQ6rDLCmmasnb3vm1UYsyLPBuwl5ShHwGnc/vgjIgzht2sVbOdjnD1Do5QtfJmoAHQe83rMXoDjpQluK7QfyqNf02g7Pbl9ASEm99ROWuFDfgLZxTKfuJd7DU+KlTJlV7hi3Nm2ER+xglJPZBuRL2LfI5USxIBdVFFnaecJI8Il/MM9WckN6FMTyTnWVR1Mt4oDZPhKh0Pt03GCyJOWiXeRbmib7omr+QSGSQ7vBO6hRsKLNqJUldHb1iTpJ9Sd3MgqwZx3009tcSFATvrSvKDA1fnIkSOJ9MRo0g89zXlzJH62LKCZIH8aqydhusk6Ntxf6WkYGs6ONWdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+wUWJKshSdWhk8PmpjRwuADIWc4C1p2nbGxQdAJ5eJU=;
 b=RqC2wW5Zm9uazl7d9bqoe9adpCX8D5vSk5OqCte7/S/mI3pN34NyLFpWBzanRCiSMcxa3zAzBMJZGEq4TFeHaPolk7P7zRFpZ4pp5aWM45y6fpLgAs1ISSHY/I+0sy3ZohD7XfWLdpuE63E/DIiHf7ZStpqdD5uR+i2CDYU9FIZyh091wTciamhNI/TC0CFZOQkyBlAjA2IPtgBA+3uzetO6k51Wt6gwX4uTVI0iwnGjsIc325BkHIIkBP8ekc4o+1frvu1ZuJgpbyAEwzHzZe2D2LnMKKpEdPQnOGXnkIzbGXfQilN+9mhDUJZexU1kWmGzrQNNpbrMMb71EpLPGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+wUWJKshSdWhk8PmpjRwuADIWc4C1p2nbGxQdAJ5eJU=;
 b=otC0GpK9C2z5xViaVk+XXyn5qtX1lYoVcguI2LYX2BFW8RhhK/7FRNl4erg8bKEROHQe3jCgvt3PnOX1r2bqFsJLivH690KFHx0HaerVjHACfQRdYlnL1U/6Gl/WD/JLoUpuNWSLAIHlMqFFvxDmmFmxNp9D6BcPmnfuNDeIFCQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by TYYPR01MB12208.jpnprd01.prod.outlook.com
 (2603:1096:405:f3::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 05:30:16 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 05:30:16 +0000
Message-ID: <87a4p0eiaf.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 11/14] ASoC: soc-component: move component_list to soc-component.c
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87pkxweibu.wl-kuninori.morimoto.gx@renesas.com>
References: <87pkxweibu.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 29 Sep 2026 05:30:16 +0000
X-ClientProxiedBy: TY4P286CA0065.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:371::7) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|TYYPR01MB12208:EE_
X-MS-Office365-Filtering-Correlation-Id: 4eddc884-4a6f-4f01-277f-08df1deabe62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|23010399003|18002099003|22082099003|38350700014|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	4YupSMHd3fhFFEmE3bPW//ra7+oUphRY5lxtEBWxQqrXugNHx/o3MiP5vO8xyV/W5zmUcQnJdPulbTc7rZjr9PHjkXd6SgB918pk95hoW3n7I6jLK28/GfI+drZLLH1IpqM8NEqbL5DMoUcd0dPljBMEKptEOtGFIXh3UQWZrnc103AMYEET5p/vy7Up6IN344nAgAGS6ibc52rDChQqDVXaWAtPgsS7hhgyL0ZnjYByz0L90FLMbZhxaxJ2nmGru86kTSR77w8xOa9BWQvc8Ctg+2kCfm8Z7uYdHWoWW34ZuTEWxi+HLvN16OnAKYHdwIytmrrmpYWl5siavh/v4oKTZDXz91JrN3j0ETsjKCKqk7yGPE8xR+bTLK04zlD7IV1muyTpb6FpqRNVNsiVhLadPW6R04yp9rOikOu7/4O5S+HEOlWGrOybd9LdjHD5cGvaVOFMRGs+N1WBFbBeQajQbLi0jkjKAbI4e7nFnBvjViusbYbCrIiyrgcxmAKhZ4cVC7NpxdCqT46ImsG5MogA26GZG5hLY7F3z7PdB4tpE8/x5KcI/c1oKPOxBUenoZ3lFYE6XVhhFHRLzeuEUZuSX23BxLIy0OjJZTAV+5VtvT7L1GHz4S5qcUZh0CsNFtvQfS7LCVu2PNlhHCaauu2/lMnId2C7pBmahnJVOxENVLYk6a2bWcBVUU8//djxuRUknYc6AlHOfS5/fNlIMHM5CIrVLHp6jA3T2VSTZSg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(23010399003)(18002099003)(22082099003)(38350700014)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oGBvw0poBryGutaVvWLyiyQ/sfmxAnUJO7wRb73UUELn8OJC1ygks7KhFj0l?=
 =?us-ascii?Q?p5j0dFYHFIm6oaqc7+s4cB+ITy9289y5axpHqnUTOiy504JRl2jxJewEXkix?=
 =?us-ascii?Q?/SSsu4dQ9k/SfWsMQLkcLl4JuZxCbTEaarM4k+Wuj0FUPTgyJPlGKVN9BvgO?=
 =?us-ascii?Q?q9EiJ+uS4QTCtgPqcSN+GBB2M4Pxwot7ELt413ByFmqlh0n6sUFUsIRtB6Yj?=
 =?us-ascii?Q?zyxL+O1tNrpI3CR0AOv2+Y4K0+s6ROpP7bDNa7ZAvsObQRx2ZEc57duCuigE?=
 =?us-ascii?Q?xVLJoKl59pvHi3SZxQ0EBuUK17iR6TSFtoJKs8KpIyFhiW2JBmTTyhsOvG8F?=
 =?us-ascii?Q?rE6LVyp4b4ATEbGOeExM4tfBFZt4T6YWnYgCw2Y5iUU1QZCpRizcMoOaLqBL?=
 =?us-ascii?Q?nwoiIaGfaezBHMzooFAEpVzVye0KL00HW86RJ72D9KNASPzOnD8cJ2QmdotP?=
 =?us-ascii?Q?Acf51jD0FqIAdxbqRcFIX0BaBl82V5nwg1c4eYBs9e9R6aAhJcbKYGvYUE6e?=
 =?us-ascii?Q?70mt7Te4fdWPLYmh/VTAwx86UArnQt9oaReL1HTmHaA8VY+a4qnS6ekz50pV?=
 =?us-ascii?Q?BO3zNCpHcYLMGaqxhNb0cavsOrkA/WlUMD1+jx7gf6oVTtZBw1/LOqrDxJ0g?=
 =?us-ascii?Q?QFwJskAG2D8jARwLxNfg5qjgOObj9YfM12qeL9FtcmPADG1vnpB33957WPGD?=
 =?us-ascii?Q?2iZpCvbaPlJAzT0lNrBbuigov8R5eRnxtTD2SWNNNkwnwnBA3Idky2wpb/e9?=
 =?us-ascii?Q?GO2spd6J0DyMVOC+KsTQZ8FQ9DMlwQXecKdVbh+zTd/rs2O9A8XfDPHrZ3zR?=
 =?us-ascii?Q?kcsYwrN0xfIIG4hNcIDgAFQmq3MITCYYSKHG46H5CieC96X1bQD1+Wb2v5m5?=
 =?us-ascii?Q?jcaC0lclGo9jsggbSZzRCTtGN5hiXUPUBe8MxiVG9kEnSFfk1CoAwAz5AvkK?=
 =?us-ascii?Q?RTkOPL0MzfcIYxEu41l6Gq/ze5j7DSfl1SIhQcK8cJL41r63apd4r537cMKc?=
 =?us-ascii?Q?snYgfAuwc88ahZDAGjVnWo4WXoxacwetYBcM25fy/DMXdPdZuw9vW36aRvj2?=
 =?us-ascii?Q?3VMkjYI6ID6frfXsy9VLWhOY/lDNNbpkAxPzhNxlXUs8QjaZA/xYhu3nylB/?=
 =?us-ascii?Q?ucM3Qfx0QX61Jj0hJjUAyG/+lWSSArUuwitM8r6Ij2Kd34b8MnmS83ss3Ndd?=
 =?us-ascii?Q?iTgWkJTUv7tAGPl55Z2SrvMECiuX/bBs3Xxf55A+7YdHaHtu0//6tHS3cjou?=
 =?us-ascii?Q?kZJu7dUIlH0rT93hj4mC57LtK2nN0w/wVlhgIxdz2u4TgBaCq8T7fYNrRlHG?=
 =?us-ascii?Q?bnXTndUQ99wP3YUj54hqUN8EXLG3VhvfGvKb4/Fdm6tR10zVKEvmlHZ9GP8n?=
 =?us-ascii?Q?MFhvRXVZsNYml3noDh9ZTuvfxBynL1ZjLL0M9TN5O8+zAsf0oIZP2t0W0ZF+?=
 =?us-ascii?Q?RY8tQWZn2FcqqjHIovWQiHdKnmX1YDV3sgkmsR7qha2mYS5BocfEVG4Y0NyH?=
 =?us-ascii?Q?Uy0SO1ODsAHB4LgNp9ZhpHupMnM4r6b2lYagK1XaSjr8WdbaFl56XxxeoTz0?=
 =?us-ascii?Q?dwt+utl20sN8rqFxFVg74IRXShdAlfu8avXH8c+XaFdLPpG97V2liFunNQTs?=
 =?us-ascii?Q?VKyK+MhNYhQ1HOxcM60mU5RplaKvNv++AKRxlvI3Xk1mu5NfHOdeeM4QeEfc?=
 =?us-ascii?Q?YLrbLbaH5GHS9PCWTdcL8ZapvLNopNvaKFE23PWbFAQUawYAdVpspROtKjyl?=
 =?us-ascii?Q?FzMVz1J1tfchmXie6dyoRymMZQWjR9LPlpzkcQZIQIbwi7mOS6z4?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eddc884-4a6f-4f01-277f-08df1deabe62
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 05:30:16.4558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z6sbzTQCgg6NTV7YHim2AmS83aSMSPphvgLy0mEDQI9HAMLYOci5T5EPvqd4QFDLVSrQ34o5roRibonr/q3cDePGVDBU6zq5owRpdqmkUhyo0y8YnZDGQMmvbmwLBSx2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12208

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

Move component_list to soc-component.c

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-component.c | 6 ++++++
 sound/soc/soc-core.c      | 7 +------
 sound/soc/soc-internal.h  | 4 ++++
 3 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 236675e6e75f6..0da36aea08db3 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -44,6 +44,12 @@ struct snd_soc_component *snd_soc_component_alloc(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_alloc);
 
+static LIST_HEAD(component_list);
+struct list_head *snd_soc_component_get_list_head(void)
+{
+	return &component_list;
+}
+
 void snd_soc_component_set_name(struct snd_soc_component *component, const char *name)
 {
 	component->name = name;
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 38663aaa483d2..ee8872cacfdb6 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -47,13 +47,8 @@
 #include <trace/events/asoc.h>
 
 DEFINE_MUTEX(client_mutex);
-
-static LIST_HEAD(component_list);
 static LIST_HEAD(unbind_card_list);
 
-#define for_each_component(component)			\
-	list_for_each_entry(component, &component_list, list)
-
 /*
  * This is used if driver don't need to have CPU/Codec/Platform
  * dai_link. see soc.h
@@ -2389,7 +2384,7 @@ static int soc_component_add(struct snd_soc_component *component,
 	}
 
 	/* see for_each_component */
-	list_add(&component->list, &component_list);
+	list_add(&component->list, snd_soc_component_get_list_head());
 
 	list_for_each_entry_safe(card, c, &unbind_card_list, list)
 		call_soc_bind_card(card);
diff --git a/sound/soc/soc-internal.h b/sound/soc/soc-internal.h
index 5fdd6dd1687f8..3ae24274504cc 100644
--- a/sound/soc/soc-internal.h
+++ b/sound/soc/soc-internal.h
@@ -44,5 +44,9 @@ bool snd_soc_component_matches_dlc(struct snd_soc_component *component,
 				   const struct snd_soc_dai_link_component *dlc);
 void snd_soc_component_remove(struct snd_soc_component *component, int probed);
 int snd_soc_component_probe(struct snd_soc_card *card, struct snd_soc_component *component);
+struct list_head *snd_soc_component_get_list_head(void);
+
+#define for_each_component(component)					\
+	list_for_each_entry(component, snd_soc_component_get_list_head(), list)
 
 #endif /* __SOC_INTERNAL_H */
-- 
2.53.0

