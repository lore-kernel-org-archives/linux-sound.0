Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011027.outbound.protection.outlook.com [40.107.74.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F3D2DF144
	for <linux-sound@vger.kernel.org>; Thu, 12 Mar 2026 00:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773274508; cv=fail; b=AyP2GgrnDOGhUuhcf8bsmiq3dEpRZkhI4PLb7BevNRkJtSa+wwk7emjRdTj4IWS7IoAL02kgSp8aE2uqIhvB3wlUsAXf8W5zgqkwXOoA/98TcJne6kWuLnPub53AvmC2+6zYmJiEvhY9D07Q8akYyDgHwiSeZujI+uYlyr7HemE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773274508; c=relaxed/simple;
	bh=+HmXZNUpeWlKpAeJIU7trCycldfWMqFQP8ZBzaZMmq4=;
	h=Message-ID:From:To:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=VJEfL80GWwmP0j4qkVDr4vz5yvSxcnvqZUW4mpbQnOKnkpTFBlxeKAGrmqhhPOv/3NYcrota0tHkWKfbag+/7qKqo1njcCvkVZw+h+SatySE0P2Vemdb9j5DImH0D0BSIeHLB/C68sJJtHXPWpOgnYR62WEYnJoZ4zZxXc7d2jM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Uc7/6wVO; arc=fail smtp.client-ip=40.107.74.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Uc7/6wVO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=at8E6Tnu9tQkpuzBVMjus7TSMRdK6Ox93Z24j8FUzM7X/jUB0u5Apy1itz3iftNn1+vG25C2MzMUDRqPi2XjhZVc+18EmT4afSDGUoUvDWq27IHvVhX1wM67q6qghC5FYHi8R11enjXrfwIm8O8tR6HlJ5/NlO403QS/KMlFVk86nNSrpOD9jdD3LNug6aWxZbv6z0sOlPMF56sZHiXuGCW9T8BPKE7NkROu8L5KYcy4iICWS+3hjT8lrHFvU0Rmj9EiHdHOs7K+F1305uxtQ35zxFiHe7vBY9r0hRKfunBTnPxGlWulrgA18j7tg8D1zuDaI5VploM3TEfV/YFbSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kb9SGnT3lZUOXQzrbGhudMXdYbYL9CyMg5f9t4c2hwk=;
 b=HyUdV6Gggcz0h4N7JoK4Ve2ND0CG0r54VZ4pwY6e3gfcnP6FioR/BjnHahf38+AJBoUCk8P5gzV5RwrxCOrcKyE1T8JqKhaAm199RmdGkWdgygNKOQlCV6lDNyly8RSSUhxCVXGOOlxuRWJVX1AdCgphMIqP3ZzfLC9jq8q9XS82IHFM5wCR3awHeuMhaT5vuSy9PZvCWkKiuyMbtFvQZbymKYvC5yWUmHTuujH1ewOxpmCoPPG22uQxgVv103uvp3RejgABZPOh8JIHd6omwaM1rR4xYrwCYqk5nw6CP1/L+eOor+KYnC3onym+rZsDVUyoz9Di9sFRA7yAghDd/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kb9SGnT3lZUOXQzrbGhudMXdYbYL9CyMg5f9t4c2hwk=;
 b=Uc7/6wVOJGME3lTESVxD9reWcsYvHhTbGMczysTUZVgIbkgiBTFjX+1/+vAiBEWPo7gBz0v6j1X12DR7JrfI6jIz8eJy1pr+qlXgw2cOklw3gidx7T4/EgoThyjuoeMtffy7j9/ZnbagMoc7YOgfh86ltTZzw0Qi+TB7Sw3U940=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by TYWPR01MB8282.jpnprd01.prod.outlook.com (2603:1096:400:165::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Thu, 12 Mar
 2026 00:15:04 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 00:15:03 +0000
Message-ID: <878qbxzywo.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Jonathan Hunter <jonathanh@nvidia.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sheetal
	<sheetal@nvidia.com>, Takashi Iwai <tiwai@suse.com>, Thierry Reding
	<thierry.reding@gmail.com>, <linux-sound@vger.kernel.org>, Jaroslav Kysela
	<perex@perex.cz>, Jonathan Hunter <jonathanh@nvidia.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sheetal
	<sheetal@nvidia.com>, Takashi Iwai <tiwai@suse.com>, Thierry Reding
	<thierry.reding@gmail.com>, <linux-sound@vger.kernel.org>
Subject: [PATCH 1/4] ASoC: soc-component: add snd_soc_component_regmap_val_bytes()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
In-Reply-To: <87a4wdzyxf.wl-kuninori.morimoto.gx@renesas.com>
References: <87a4wdzyxf.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 12 Mar 2026 00:15:03 +0000
X-ClientProxiedBy: TYCP286CA0292.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::17) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|TYWPR01MB8282:EE_
X-MS-Office365-Filtering-Correlation-Id: ef0ff1e1-d0fd-408b-fbe0-08de7fcc6834
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014|921020|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	C4VxWm3hOvRscsbpURXkY8ejDzlrAyrMfLN6R2BFWQuG3PyXfxuro7HVI2tlltPWLcUc+kIYSYin11Ac7/ASQphZ8kFPU4RuAJlHp+qjYxDIZXoD1IkRdAnjByDwz8uppuPE3wUWo3GwSNi+fFoLcdxsKx4tPVJq8kR2UfCH3MrRkigfybT9zumHQICdPIfgLnlPyGUKNLdaArOisfI20PQQxKVWDG9T+gka3X140AH624QXLlta1xX39fe3fjYls9pxph6za8m7ReEbcAr9Vl+vyrRffJOGZJq94FFRebK8Qe5mclMvMFg2QblSS+FKdpRs2YADH7CzuE/Eyg6kw0vsycGLWrRZO3pfzlnFdqS+fFLveyYXflMrd1/2283oTSWWZYIzpqO5RmN7WbLlCXCGgCl2EjmRzs2m9Mr/qr/vz64Boq370ovt/iyPGUIHmlqalvqTWAQS/Ex9pW96VGXN05cO/LI4M/gZwwHr0rSOTb9AT/Mu6CAVDV4ZG4sIleNptG5oTpgo5TZ6dHHKtKFkc/TJvuveTTp43FcL8NcngoReRK8mJcnueyfIeWKV4hR9f9GYndfcduhjPBXrvN/K2xQz/1ksdfrkxJqdhcBF7EPK1dJsKD0JdsKDhflQSCI6Kw8z/EbqLzHUiW/T9AEPCRoZbBR+TslRT8vx0+49pbxAHAik08HLQdV5Wbo32hiEhO8afpYgrGcALxGSJHyTcg95tO3XBw4fFJVsIMMp9pMdkBjrqhjC8pmL2BzmXtQ6jSLIodRyvRLAQ/F4jq2U5hxp6nTESveQAqDtRDUy+QBKEl4CjtZvEQMnIHmR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014)(921020)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8HyaypDiKjmqFqWVMz5hgg8SvAHuna5IesHLPod4WTQA+4IZoI6blXoOknCV?=
 =?us-ascii?Q?qg5+bLax84oeCvqzo4tWa4R/sbgFb4PREqVHDOsWCTUqpp1GFcB3eMSZnf4l?=
 =?us-ascii?Q?XHaxqFzeznkRWfUGK+00rtNzxm1iZ561KyeSuFZNOICm3qggowBq9YfI+Im7?=
 =?us-ascii?Q?bKeTlban3j8LDGhkihrSo/g97AvMuTzJcCScOhnCbyVS5Dx12RcMNQ/8xRDU?=
 =?us-ascii?Q?zDpiuq65UaAG8scDWTXXm7g7HayxmR60YW0l+hBQWZjGZvAPE7ZfSLbKuiIX?=
 =?us-ascii?Q?1lROhKvje0gQe89fZY49ECR7DKb3NoRGilq3AkGfJlKwdidDv2SSZyC6nhHV?=
 =?us-ascii?Q?orXm1nPzzmzC9F6wG++y9i5ujNxkoS2FjNM8kiY1JfR7U9gfcl28kaugxhw8?=
 =?us-ascii?Q?FHJDWB9fiZSGJ8t2SEDboJ/Zx9/d38w0S9395NOGo+22yY3Xmq2oMeG7MZRA?=
 =?us-ascii?Q?ZwY1CoKwTJBbt5dZ9j4/jrqH7TaBsnPaOacEevVZ66kHf2exyXVIx+dLGuZu?=
 =?us-ascii?Q?qOytAOwMsSDNLId+Zdp+6UrDuy+fzxNPy72haB/ose/ztnC4gNHQIABI8QEt?=
 =?us-ascii?Q?sHUAmr1ju/PVWp95yqe185JdYGBVLvqKtmxJfo1VV4gpFbm3mpy7/Neo+BXE?=
 =?us-ascii?Q?zqqNQv75aHn4f7H2b6foXj9SPonhGx+5QezR0k9ki/+jFGvlIvN44JP3NUEj?=
 =?us-ascii?Q?DN0AFOuNGmUJr30JGhhAHODGSqQ4O2mdvP2EEN1SM+jN4l4mZFu++Yv3UGoz?=
 =?us-ascii?Q?odWRpPpgze9SVXp2w25EUoVYs1PRcv2Ac2ga3wKqDMfPYFSgw8tTEPODzZbb?=
 =?us-ascii?Q?Uupe1bnx1awF7/WRZS9Qh72GK+dYNllfihO2mebHFCwMaYXC39IjRiAWbByZ?=
 =?us-ascii?Q?HC3oHXRgoReDBitMibF3N9H/fUSa56dxbxQXaY57s5NelXjV2rKYigLYtiux?=
 =?us-ascii?Q?xZekLTHJDxgth1i8p1WVOt0yMcoCGbHv5jcjjwTPePHuTLYGVu8ddAirOE7l?=
 =?us-ascii?Q?BaQmXVVtP0vVf6Te8+gZ2BPe0De0H5NbOJ4/lOE5uttRUwPeak3S6+PYbep3?=
 =?us-ascii?Q?1M4RXe4LQnb1BnL3m8Fa3vLHgBrCFC9fJeBic7r9AqZ0ewS9W46c8jNKi5qO?=
 =?us-ascii?Q?J9NJ2BhLjrJhf+tD9igJOtC6S9ZgbwM0PzcNRToVO3E4DsFTDlwDrY/stBqK?=
 =?us-ascii?Q?NoysxPJSY1cHNAW7U6hMioB0I95UVGl/qYaNQbz/vVkNOoo+Ck0ATSOGrO/8?=
 =?us-ascii?Q?SXXOeTKZbzgY2nS7hRN2drGjPCGJRwdhxOyGguqPyP/sYtcAln7bZQOh8PPq?=
 =?us-ascii?Q?7CcM9CwXpiimP0ff4BtZwdspeWzmGU+dS/RUvXxe5RlXtGmzeKdVzKPzNrla?=
 =?us-ascii?Q?o+oVQhgpq0HpSEYGWDno4CODiL5EA1HK/CzFOd3Doj1P0qCBtdDxBx9CNIqL?=
 =?us-ascii?Q?tO5xcpzssheakDkc5eG3vQewRvLHXf9MlD/oG/mHUkZkhLhMCSrlPE0K0mGX?=
 =?us-ascii?Q?oNkNYqXGvhMGhpkZOjuRNrbgtIyBgVUmpcHNE9Eejeojs6ZjSVSZEH94VEIP?=
 =?us-ascii?Q?p08gmIQshkyfxApWIybGbBbj8tEB5yxA5ClwJ+1PE9KDjP82CxKczHFhM1oB?=
 =?us-ascii?Q?Xx4AFFxXen+bx5l5n7kdks99D93Vctc747bYFJqH2RNL1WwuU27rVgrSOsS5?=
 =?us-ascii?Q?TW1qtAX8ZNOaCvfhCNW1ragCtXE2vPw8cZxtspoG6e/lLSWRZuLsqSJGoZU+?=
 =?us-ascii?Q?Qitmo6rBBSontuJfNgVu2iwnJAzCF9YTriNEDDFvwUC45FvPEsDg?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef0ff1e1-d0fd-408b-fbe0-08de7fcc6834
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 00:15:03.2712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kyA5cQmZJrEMlwV4llLANEtr4VcJjx2UDiXuIZila5ZNf+4vEEBNJQmfzq8tNHsTnSGC0zz6Lf6z8oajAkEXtCLBt7WkaIAng8G6ZlOv+y3ASppExwDQw7wK6zqrnICh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8282

component has component->val_bytes which is set via
snd_soc_component_setup_regmap(). But it can be calculated via
component->regmap. No need to keep it as component->val_bytes.

Add snd_soc_component_regmap_val_bytes() for it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h |  1 +
 sound/soc/soc-component.c     | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 2a2b74b24a609..c08922290cf1a 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -327,6 +327,7 @@ int snd_soc_component_stream_event(struct snd_soc_component *component,
 int snd_soc_component_set_bias_level(struct snd_soc_component *component,
 				     enum snd_soc_bias_level level);
 
+int snd_soc_component_regmap_val_bytes(struct snd_soc_component *component);
 void snd_soc_component_setup_regmap(struct snd_soc_component *component);
 #ifdef CONFIG_REGMAP
 void snd_soc_component_init_regmap(struct snd_soc_component *component,
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 89f236ab30341..9dc2cbdc2dda7 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -351,6 +351,23 @@ void snd_soc_component_setup_regmap(struct snd_soc_component *component)
 		component->val_bytes = val_bytes;
 }
 
+int snd_soc_component_regmap_val_bytes(struct snd_soc_component *component)
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
+EXPORT_SYMBOL_GPL(snd_soc_component_regmap_val_bytes);
+
 #ifdef CONFIG_REGMAP
 
 /**
-- 
2.43.0

