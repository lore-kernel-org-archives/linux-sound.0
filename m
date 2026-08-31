Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010061.outbound.protection.outlook.com [52.101.228.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308973B42F1
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 06:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788158309; cv=fail; b=KaBhREeiVjj41LTsa0zAcshReiiRsp0Pzg+JJZXSWAruifGIHLDX4lvGk5JpGhniR+v1DB4APvKKuj1+Z0mEPNC0jhrPuCm4B5y05z+WQdsA0ldEvKxgY+N9zLpUFlbMNedHiM1s1Ct0+d5ZMmY4Zvc/hynJOE5ya0Vf7Nl7gbs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788158309; c=relaxed/simple;
	bh=Qau7kCWbJsUbdOvSJpSDYubvedIRcDjo8WEFy1tQ/ss=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=HMpuE45/8XFUsMX/+hrA76kjPjYqz8HLlELfdDzjzvgtP53Zun8udv+vlAgzQG2jFa17PfZgZ2GTNXNLwA14PO7pNYlMsouQJsQL+hgDjO6kCGz+ojrru922keITMYm7lRnVgYgHdQvK6VaXayj5/4vagsLQ5qn09gmTm679Yjw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=mEpcsv+j; arc=fail smtp.client-ip=52.101.228.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="mEpcsv+j"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d0Zu4UtZD7L0/yj/GCjQIrZ6EBz5cbwT4KvwWqlFkpRh0d5kng3yUHqxclY8j/EtE/2maywL5B91r+Vg3pdWPEnCz8dIEruCT65HlWP9HqIw6xiD3irASgEw0nYokGhkZBY2/qnIuAZ9SaVULVdnULcS+WB2guM9aqkMoWPs+4+mW1OKABWadmtbWQTsD8tSNmyFXPiVREMaFWszAcMRsUpkMNK3s05S3Z1rldZrI99th3qy/jIv7jr8AYOGAOh0Y+5/DFnuwnPr8Ncn7AXbogOn2UJOnqfUKIPG2qhWkgqA0Ow4IYT0t6nc90zI9DC68Bh+T13MpaSFbhGaVr9tfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U8Ep4e10OgtV90Dpjh0DV3/gnjbCarwjZ41dod2Tmkk=;
 b=h6N87/b43v0239j3dnwB4NPapa3dfL1mSJuOPVwPIpQy2vcuoTXF+rE7Ks+GJ6/aDN4qsXM6pu/HncTnqhSRaXKmcrQga+YcGx09aYRRbS/CYZ7sZozs9kwyFMof0nRp5l4cPsTJNGl/MJygxavM5XVsANuERoSdcutxWf0k8oX3C7VDx8X5JYSd0lBJRBe0U1FYgyCuEoPx6XGRf/mBo8aJv+DuQbwCMuDK38MRjUPYKR9G9LSWG+L6ENegvkaVCAmn8+fIq9olWhEEJK5GNz46s8qhm/xHDtrb+RdGvjOJ5r02Y6eFdblrLMyS+4Q/p9M9rvb8Qdz2eCKvDAO8HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U8Ep4e10OgtV90Dpjh0DV3/gnjbCarwjZ41dod2Tmkk=;
 b=mEpcsv+jsoDg4Mw+pvBtNbFnbgXA9pjyxAkWD8ZO+ysvw2wC+uy/u1VwxFYX4tzAgtFWIsgtisnnKfBnDV3ZyctI2R1Nuwc++Ji5pBfif3GvBxEG/oIrMTiEr8KLnzYgrI42j/B5aV/kwK3gNH9paV6/vpW4/w9OVdFlfw9AdoU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by OS7PR01MB17278.jpnprd01.prod.outlook.com
 (2603:1096:604:424::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 06:38:26 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 06:38:26 +0000
Message-ID: <87tsoasske.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 06/14] ASoC: soc-dai: move snd_soc_{un}register_dai()
To: Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Vinod Koul <vkoul@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <8733vuu75t.wl-kuninori.morimoto.gx@renesas.com>
References: <8733vuu75t.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 31 Aug 2026 06:38:26 +0000
X-ClientProxiedBy: TY6P301CA0028.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:3bf::18) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|OS7PR01MB17278:EE_
X-MS-Office365-Filtering-Correlation-Id: 39c102e8-d776-475e-d811-08df072a7612
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|23010399003|366016|38350700014|10067099003|56012099006|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	N2yFoxcIQvLazg/cEXyNTG2feZWFVXAAyrshlQS419JDCYuqcSAUuPmJwAUWR4QcNc2+ojd9/BwpUsmcJ+m4jRvNX0ZmWCE6v0tr5mfLPGFCbElmt4KeMYuGtx2EJeTgScMt24wwbDlXLisNJge16Um0CaSNEpCn6pg3EMbf98tGNqdafExEMmnoW6IXlnGbrqkvgGHflCuQ1CLgvzPE8/tgU33ddTWl1QBsngIYF8ezZlG8pTOEx3nza0+rXVV/QdTadQ7ga24uneUANx31LAkUSkiijg/+B/HTOzFdxwlVA5LkhUvSCOc6fCR1jSleglP5yK5l3yCKxVTgulF5brWHEiHSrO0H0OXw99ZB69E9lUaHyeFVYllbWAF6KOmSlCZphGqFZEI+ekJQRCF1oEd7Ij6KkzvA4Kz/z1koM4+SS84HSQP6qTuSYw1RH6+AYv1TeG9ET3/PPQvTix5flKAP9H3/Ak+BlEt/4o/I90OmQ2VPTXA+gYZVEjn1nMCZmMJb9zhAAhzGA/PPQNJgfSS67Q8q4PKOJgaX1Szb+gUq40ke7JFkYVstnfIUgL+fWZb1AS/4ecbUmy7sV16qK9ocVUbdzoWXbW5KCW+3JAfBXBygm5DyTg1GDn48hxd0lG4Dl1xkz1vR024k0BUmG3RkXN1q6Xxe3nfYm3DviPJFHB4ZSMSpjIG8lsuqUit2sJ6wPMGYvMGxhc6ypHcWKnUKoEqbmdh4gqqdIgtKWlE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(23010399003)(366016)(38350700014)(10067099003)(56012099006)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HVn+E6YLJXtH6HSCYnnHHMGq3zOU0v7gRwHWAFrPBtxb/DSSm2yJSEUsWxJ/?=
 =?us-ascii?Q?NBUb9uVz7vVXPPjDVLiXXgOsIVIGv1itPurbNAtulamUB9HkujBXCcrPD05L?=
 =?us-ascii?Q?ZA4vh6ZIJpntGqHvzON+fbXZK8NkZGdwZWMPKO1aRpjS4zUCgU/wA0qgASSP?=
 =?us-ascii?Q?4TR9wchE6oKFdFzv4VAaJOx9MdixaOwRjl2duvjjqq+jP5snI0JNAkTKWGvF?=
 =?us-ascii?Q?a1uXjWK7A4gcogGOlhLgMgD1s7107WZt92e4yugjmMiDJ2ajPhpN/sh3A+IL?=
 =?us-ascii?Q?B/tUiJnZO0yF5UgGPoC23iLcMRAfU1ju6v6e1qmnRu4KW3sbMvEXLNxG0TqO?=
 =?us-ascii?Q?r6NR3RNEeSxNTREyjRmpVqhkwbkoh5Zj5R9GgZaP6ms6rwZBclF5cbso0svS?=
 =?us-ascii?Q?ynJdZR5rueo9FxN4Y6WDCSfeqBE+i5YLXkSh1tgZf2QyLm8AqzwKuqF3u9MM?=
 =?us-ascii?Q?POJ3qr8wE23XkjWYBB00TT9l0C35q+qRveB3Dv+9HOkYzAfa9cad4b7j448o?=
 =?us-ascii?Q?8HacXvgTU97etKP+He8umjWXkRCj8uK09Z6+1skTp17WReOwH+qc2639Xa6z?=
 =?us-ascii?Q?VclMhjbHv2RWGGQnKCtdWJGrUfhnZysWmbUSe3pqSc2VWJb1gMbnjpoRJYNa?=
 =?us-ascii?Q?sv+HwzdnjdHeBvEVchbemJcbvuGZxnfIRVVvvE7DSPkBO9OR3JKPj56PQDw+?=
 =?us-ascii?Q?9MEckGnVd4S0itzXcBzLIfvbAIaQBz7pCz3XeZjhdKH4oCwjStPuZ+19eCJ/?=
 =?us-ascii?Q?nGxkk8RpzAaT8BKbb3cu4FesjTHb/5W83LDWEx01icu2whuRzsmxtC4JmTj0?=
 =?us-ascii?Q?mM/8O3MIYSNnUDWLcsLqFdMDoXDZ8oT3XpKOBc3v4lPzngjYHWc3DVpWY0AQ?=
 =?us-ascii?Q?yWppoRbmu0tAYO0Vo+9ZXbPfIPs7SKkS8oTwubACK1orUHhOQ2x5cteWnm7I?=
 =?us-ascii?Q?jgfo0+IpM1SYDjetpIDTsg/C1yRZQ99wx0zL+h6msepA0lSr3yEBZBPfvV96?=
 =?us-ascii?Q?vA7/NpiGR6ih5TdvuSrOaq5oIfxDHiRehL3/gyeRGjYHS6XpDf24mZ9SrED6?=
 =?us-ascii?Q?xuM3r0Gu9h/pwag6pEAR0f5u6Vq09i/Q3uz4Ht//C24WpAzs3j6E69vz4j+l?=
 =?us-ascii?Q?s1pEs9S8rR/SBna05M1QuARAk6erRAMXqp+i8UER92WglA0oUWzMrAQ5lowX?=
 =?us-ascii?Q?ne/gyEo0USgQbfLreub7DBXYQtulB9CmIuh0k6o88TNQbpU9q9Y/vX2BVq1u?=
 =?us-ascii?Q?s+6rvpNY3TRzcygS4NQ67QZ+x9gpWuKuk8RPTT72V9TV4WVVnd1bZCvlQvOY?=
 =?us-ascii?Q?Uilqw7ZGiLNzOlFUWIu3Cqm9bve1jqnUCa5oufdVZKqQUHvGOBSMx8dEkk+P?=
 =?us-ascii?Q?XYTzGyVKylOFKmjf7OOqsEqWK5EInizOJLphCbqF8GnStW75vxk5nnLVDrA3?=
 =?us-ascii?Q?Pg0ubbH76ghpn0LnVLi6GP0nXQ41PSuUxZsz5DFp5ArAcdoXeMPp86jYrLKG?=
 =?us-ascii?Q?f37JWXPE/AVP+mrtwAT2XEi9HR+Irht0rm4/Sl2liWe3nJU3EOoB56qKYeph?=
 =?us-ascii?Q?jPvQL52+9xqG6HVUSFqWPLEYImuTo/O7IPEStWq9iE8KbOr2Lhb5Ju/Ejswu?=
 =?us-ascii?Q?Sb/xgYWnI9Y8+Rv4oUAmIoBToOp5sYc1iy0ISa+Vbue2oWQrNtW2ivQULda8?=
 =?us-ascii?Q?wSt5kx7R3IP9Ki7dEHoBXgcwO3yAtCNOfbxvuAYb5DEt7+DK4D6wkXc6xXLn?=
 =?us-ascii?Q?xBMKsytDj856ZZ/PFvAtEM1QGJNOLaiUgxvvkzHdaEnRMGTbUvOh?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39c102e8-d776-475e-d811-08df072a7612
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 06:38:26.1988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bhn5g2dOjumAtlVQS2gpT1QyWMaONTLE3LrpX9CTmwp7MxWQDYpI4Ya4Vx5m0EmfyVUYR4qM8RFH+NPUsVaHeYVZDr25CxJAJxAOqf0RB/c2brjBWyyu4nK0HqVpGDFB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB17278

snd_soc_{un}register_dai() is DAI related function.
And its parameter will be capsuled soon, will be not enable to access from
soc-core.c. Move it to soc-dai.c

Note1
snd_soc_{un}register_dai() needs to use client_mutex which is soc-core.c
local. This patch removes static from it, and allow to use it from ASoC
internal.

It renames function name
-	snd_soc_register_dai()
+	snd_soc_dai_register()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dai.h  |  5 +++
 include/sound/soc.h      |  6 ++--
 sound/soc/soc-core.c     | 71 ++--------------------------------------
 sound/soc/soc-dai.c      | 68 ++++++++++++++++++++++++++++++++++++++
 sound/soc/soc-internal.h |  2 ++
 5 files changed, 79 insertions(+), 73 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index dd6ac8ac41304..ea5182344c0d0 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -610,4 +610,9 @@ static inline void *snd_soc_dai_get_stream(struct snd_soc_dai *dai,
 		return ERR_PTR(-ENOTSUPP);
 }
 
+struct snd_soc_dai *snd_soc_dai_register(struct snd_soc_component *component,
+					 struct snd_soc_dai_driver *dai_drv,
+					 bool legacy_dai_naming);
+void snd_soc_dai_unregister(struct snd_soc_dai *dai);
+
 #endif
diff --git a/include/sound/soc.h b/include/sound/soc.h
index e7bed64375bfc..e49d1573ace55 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1386,10 +1386,6 @@ void snd_soc_dlc_use_cpu_as_platform(struct snd_soc_dai_link_component *platform
 struct of_phandle_args *snd_soc_copy_dai_args(struct device *dev,
 					      const struct of_phandle_args *args);
 struct snd_soc_dai *snd_soc_get_dai_via_args(const struct of_phandle_args *dai_args);
-struct snd_soc_dai *snd_soc_register_dai(struct snd_soc_component *component,
-					 struct snd_soc_dai_driver *dai_drv,
-					 bool legacy_dai_naming);
-void snd_soc_unregister_dai(struct snd_soc_dai *dai);
 
 struct snd_soc_dai *snd_soc_find_dai(
 	const struct snd_soc_dai_link_component *dlc);
@@ -1552,5 +1548,7 @@ static inline void _snd_soc_dpcm_mutex_assert_held_r(struct snd_soc_pcm_runtime
  * REMOVE ME
  */
 #define snd_soc_add_dai_controls			snd_soc_dai_add_controls
+#define snd_soc_register_dai				snd_soc_dai_register
+#define snd_soc_unregister_dai				snd_soc_dai_unregister
 
 #endif
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 7d8b1103f40fd..16d652993b2f1 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -46,7 +46,8 @@
 #define CREATE_TRACE_POINTS
 #include <trace/events/asoc.h>
 
-static DEFINE_MUTEX(client_mutex);
+DEFINE_MUTEX(client_mutex);
+
 static LIST_HEAD(component_list);
 static LIST_HEAD(unbind_card_list);
 
@@ -2462,74 +2463,6 @@ char *snd_soc_fmt_multiple_name(struct device *dev, struct snd_soc_dai_driver *d
 	return devm_kstrdup(dev, dai_drv->name, GFP_KERNEL);
 }
 
-void snd_soc_unregister_dai(struct snd_soc_dai *dai)
-{
-	lockdep_assert_held(&client_mutex);
-
-	dev_dbg(dai->dev, "ASoC: Unregistered DAI '%s'\n", dai->name);
-	list_del(&dai->list);
-}
-EXPORT_SYMBOL_GPL(snd_soc_unregister_dai);
-
-/**
- * snd_soc_register_dai - Register a DAI dynamically & create its widgets
- *
- * @component: The component the DAIs are registered for
- * @dai_drv: DAI driver to use for the DAI
- * @legacy_dai_naming: if %true, use legacy single-name format;
- * 	if %false, use multiple-name format;
- *
- * Topology can use this API to register DAIs when probing a component.
- * These DAIs's widgets will be freed in the card cleanup and the DAIs
- * will be freed in the component cleanup.
- */
-struct snd_soc_dai *snd_soc_register_dai(struct snd_soc_component *component,
-					 struct snd_soc_dai_driver *dai_drv,
-					 bool legacy_dai_naming)
-{
-	struct device *dev = component->dev;
-	struct snd_soc_dai *dai;
-
-	lockdep_assert_held(&client_mutex);
-
-	dai = devm_kzalloc(dev, sizeof(*dai), GFP_KERNEL);
-	if (dai == NULL)
-		return NULL;
-
-	/*
-	 * Back in the old days when we still had component-less DAIs,
-	 * instead of having a static name, component-less DAIs would
-	 * inherit the name of the parent device so it is possible to
-	 * register multiple instances of the DAI. We still need to keep
-	 * the same naming style even though those DAIs are not
-	 * component-less anymore.
-	 */
-	if (legacy_dai_naming &&
-	    (dai_drv->id == 0 || dai_drv->name == NULL)) {
-		dai->name = snd_soc_fmt_single_name(dev, &dai->id);
-	} else {
-		dai->name = snd_soc_fmt_multiple_name(dev, dai_drv);
-		if (dai_drv->id)
-			dai->id = dai_drv->id;
-		else
-			dai->id = component->num_dai;
-	}
-	if (!dai->name)
-		return NULL;
-
-	dai->component = component;
-	dai->dev = dev;
-	dai->driver = dai_drv;
-
-	/* see for_each_component_dais */
-	list_add_tail(&dai->list, &component->dai_list);
-	component->num_dai++;
-
-	dev_dbg(dev, "ASoC: Registered DAI '%s'\n", dai->name);
-	return dai;
-}
-EXPORT_SYMBOL_GPL(snd_soc_register_dai);
-
 /**
  * snd_soc_unregister_dais - Unregister DAIs from the ASoC core
  *
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index d22815656d149..f9bb4fa356d74 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -1071,3 +1071,71 @@ const char *snd_soc_dai_name(const struct snd_soc_dai *dai)
 	return NULL;
 }
 EXPORT_SYMBOL_GPL(snd_soc_dai_name);
+
+void snd_soc_dai_unregister(struct snd_soc_dai *dai)
+{
+	lockdep_assert_held(&client_mutex);
+
+	dev_dbg(dai->dev, "ASoC: Unregistered DAI '%s'\n", dai->name);
+	list_del(&dai->list);
+}
+EXPORT_SYMBOL_GPL(snd_soc_dai_unregister);
+
+/**
+ * snd_soc_dai_register - Register a DAI dynamically & create its widgets
+ *
+ * @component: The component the DAIs are registered for
+ * @dai_drv: DAI driver to use for the DAI
+ * @legacy_dai_naming: if %true, use legacy single-name format;
+ * 	if %false, use multiple-name format;
+ *
+ * Topology can use this API to register DAIs when probing a component.
+ * These DAIs's widgets will be freed in the card cleanup and the DAIs
+ * will be freed in the component cleanup.
+ */
+struct snd_soc_dai *snd_soc_dai_register(struct snd_soc_component *component,
+					 struct snd_soc_dai_driver *dai_drv,
+					 bool legacy_dai_naming)
+{
+	struct device *dev = component->dev;
+	struct snd_soc_dai *dai;
+
+	lockdep_assert_held(&client_mutex);
+
+	dai = devm_kzalloc(dev, sizeof(*dai), GFP_KERNEL);
+	if (dai == NULL)
+		return NULL;
+
+	/*
+	 * Back in the old days when we still had component-less DAIs,
+	 * instead of having a static name, component-less DAIs would
+	 * inherit the name of the parent device so it is possible to
+	 * register multiple instances of the DAI. We still need to keep
+	 * the same naming style even though those DAIs are not
+	 * component-less anymore.
+	 */
+	if (legacy_dai_naming &&
+	    (dai_drv->id == 0 || dai_drv->name == NULL)) {
+		dai->name = snd_soc_fmt_single_name(dev, &dai->id);
+	} else {
+		dai->name = snd_soc_fmt_multiple_name(dev, dai_drv);
+		if (dai_drv->id)
+			dai->id = dai_drv->id;
+		else
+			dai->id = component->num_dai;
+	}
+	if (!dai->name)
+		return NULL;
+
+	dai->component = component;
+	dai->dev = dev;
+	dai->driver = dai_drv;
+
+	/* see for_each_component_dais */
+	list_add_tail(&dai->list, &component->dai_list);
+	component->num_dai++;
+
+	dev_dbg(dev, "ASoC: Registered DAI '%s'\n", dai->name);
+	return dai;
+}
+EXPORT_SYMBOL_GPL(snd_soc_dai_register);
diff --git a/sound/soc/soc-internal.h b/sound/soc/soc-internal.h
index 7dc296e94ce64..1c43a06332c25 100644
--- a/sound/soc/soc-internal.h
+++ b/sound/soc/soc-internal.h
@@ -16,6 +16,8 @@
 /*
  * In soc-core
  */
+extern struct mutex client_mutex;
+
 char *snd_soc_fmt_single_name(struct device *dev, int *id);
 char *snd_soc_fmt_multiple_name(struct device *dev, struct snd_soc_dai_driver *dai_drv);
 int snd_soc_add_controls(struct snd_card *card, struct device *dev,
-- 
2.53.0

