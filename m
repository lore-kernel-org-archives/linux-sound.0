Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010008.outbound.protection.outlook.com [52.101.229.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F75427AC4D
	for <linux-sound@vger.kernel.org>; Thu,  2 Jul 2026 01:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782955316; cv=fail; b=KZOcendNgShI5BV14of6FJUsywu127fdx9wEBkhMUIJTEB5cdL77JbPUfTIEhsQg0DvdaBau7xjLOul3aW3aUgc5SYuwwZY9kH4H/89k34bCdaUdqd//+DLHQm4DnEJLk9XBmoCnx5nbgvKAPcTFEQZhL3Vu4qLXycOI3pizX9o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782955316; c=relaxed/simple;
	bh=8ZWiamL9TodvEDZUqrpweUycikFnl3upEZOTt3HAoUk=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=VEmJDdcbQZFaS2LcssAvCynxCUJ2sIlUg9rD1k0tBVpwA4k6J9lpdwPm78PEgkfupfZ0yw0EEcBEwkUE574Pl/FxP6mqwxixxluG2DS/rL+s4jGm4C/8HNuqdc9d9Am/QV1PycIbnMmq49VJkutmUz4SzB/XLnMx4iIB08Qpruo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=JiD5CHi1; arc=fail smtp.client-ip=52.101.229.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="JiD5CHi1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JmBuiJaMXUdat7dAzt+Sl/4eOjoVJ+ueUP+y5kbw+2ur7sx492Go1/jbV6HkpD0gFcQCBu6Hlp8b3XkLhT2t+vGxGBdkObJOsl3wVtxnnAG2VLzs9S6/21qsaZxmXsiAKuaW4XHZunuaoH/wCbagVWrEFwWxjgyZU/4TZ5Alj7sVLvrkkuFKtzurVdbE6CXRImYX5McTwEiqiOMJoKpf0znX7QQ+ACzE8uYQyvWoWxQgktot0KY+7kvcjdXa8tSoeF3wv2WTLL15WzMI0zk6t01UYR3YjiBQW/mEj9Wwe6ZM0ftnFAzwqbHS3nf0Fa0JcdaikjZcwtq15OrSRDhJBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p7WJxCtrVXzQqoEyNddZwtFClDm4QWIe+yKFQVBt5Do=;
 b=cYVCLrzc28EWGtrDiKehJjYFjb4x+YVoRpX7guF9UklaKmIOkyjcGAL5wE/Uau6a8Str6JYQRMT0geBrW55usnrUADRJfobhH6a3lVHxikuJtVfp8YvHLSbiFyF+Bj0oZvR+m+KHcei/yYixPa/nlntOYANIuyP0g8M1uu70CoEB++9R12EgU007OclvKa9jNCN8XkLIAHB9tqPLKPzcIG1munrXtMOGXYrl7SnB03hf9Znq5i+MzCzN93XZZwfm00iHQqfgxo0KqQZrSFlrBjXIcrgLQR/GDnMz2VQ2MyT5OHOajRrBvO7CWREC4YHzZ0S8vKM6zZBmpp6VAohOjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p7WJxCtrVXzQqoEyNddZwtFClDm4QWIe+yKFQVBt5Do=;
 b=JiD5CHi1uhfx4S/r4b/NYLqERClWbX6d+5ODHG2f73DxHzyzOEkHRKWGbfd8mA3SNcSyaJPrll4PPCoL5enfCZT2ZtbsH4EbFbulQVDGvf9ljGkYfgCEfWjZcQ8Vxq7yMpCjxFSBY0m72YWEDEL6ERevBRODQzh6Jpk3O8WT7xI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com (2603:1096:604:235::9)
 by OSCPR01MB16080.jpnprd01.prod.outlook.com (2603:1096:604:3e6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 2 Jul 2026
 01:21:53 +0000
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834]) by OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834%5]) with mapi id 15.21.0181.008; Thu, 2 Jul 2026
 01:21:53 +0000
Message-ID: <87jyrexk27.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 8/8] ASoC: soc-core: makes snd_soc_component_initialize() / snd_soc_add_component() local
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
Date: Thu, 2 Jul 2026 01:21:53 +0000
X-ClientProxiedBy: TYCP286CA0103.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::16) To OSRPR01MB11811.jpnprd01.prod.outlook.com
 (2603:1096:604:235::9)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSRPR01MB11811:EE_|OSCPR01MB16080:EE_
X-MS-Office365-Filtering-Correlation-Id: dc660e7e-7dd7-4301-3861-08ded7d84cbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|52116014|6133799003|56012099006|11063799006|22082099003|18002099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	jQYyGd1tDCHdcN3k79V0oJyCla/9I0wujoqkm7sfd4/Na7bSgibbvhi8LGo89lEBv4WUWivupHQcnjbAbcUbJE1sBrpaS7Bm6NLCQms4e2ywdbQnjndUHCI61J22Htc8l/kwvMj168l54wpYVgo460u57twFIXU/90GHAA+pwRudMbiyvxo2vBsRSpubVlTEcENzAAAM4haB0r4WXVhbVryCd8b0aV1f4U8ENguuZ2pjacX+hyLD3MHv3heigNJ5hQe22Lf0qBbV0Tgjko6hi/sv9wjg6ZxfqHca68Qvq4fViFpU10rVDY0pd80C/Vzida4Ui0VAVH1TmQqj3rsGY4FNnwP4rWbfVdR/kgXoc7KQziKd+UMdPF5Z8s8Pqp6o1uESBFu6szEMKPdSR3VUHjtEdTSw3b1RQICZZkH85WCLVrdJq1gupO99bYEpQ831BfkR5hFHxDz+PBZ2EdOrSq8+NkeVLSjXxcf6UD/lFSzQ2icIN1c1/NjNF8wgqnN4su+0UlfCkEw7HhokTSs61paEo9n32yoz+m1P4144KSSYfrvbU+FiqxRtoGyNmpS4x3Jj2mszIZkMd21xdKJgaBAjsUbCgYCLlIXhNPvyR7x4WgR+GuVGLn6nAOr52I2KArHNDn9xVawbFAETIin8snT+gcAe3QXaZ7BZn/PYG4kQQIlbLBTysGbi4U+Y5KDtcx958xFneM3JYfQz2mc2UrX1t/wqdGW9cAAu7Ko2ZWs31sHrsjBvX11r7kKuYUE7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11811.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(52116014)(6133799003)(56012099006)(11063799006)(22082099003)(18002099003)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?54fyX8SaBvDtt3Q3VU/k/r0wZQkUDIYcJDwkCBIGD0OgS4Lfj6IzOha02AaV?=
 =?us-ascii?Q?IcfQd0IYNERiyCpoVX5pA3VdHRBBmK85kgW04dXeCyk7T87zu+0qQpza+3AX?=
 =?us-ascii?Q?391rAaJamUrdUbjI/yhfV4x+X6GjD/g7T3U+xsz/J+ZS8mMQHB1OXihXFn60?=
 =?us-ascii?Q?vJkmj2tTP3E0wzJbyceM8tlRpzmbUS2tzTugMgrb4Na02nx/XJo5erI3X+si?=
 =?us-ascii?Q?KIyPlhdj4szplJrDZH3U2pi3OrLyop1btPWsOXt8/3B/VjWGLvD5quUBQewM?=
 =?us-ascii?Q?HOdpRyDfTdo0X/hWEdKGcURB8/Li0S3I6AsCqqG1k2X0XJSXpTsy8H2jOXWI?=
 =?us-ascii?Q?tMrS5cGqUND9E0kuFrT0TCBtnJAlSCMZnyCViQbafIthMbRw8+b+UVZOLlEe?=
 =?us-ascii?Q?vtCCBmFxufSSTPoiJEjAw0MlTEdvOiXxlxe6YXJbD0bYz0eM6uIY/gMz8gOP?=
 =?us-ascii?Q?8T6Mm6+bCTEn/ycCyU4KNK3yDDkDrmRUkejIqgrLNZ0ZIm86/oEwcY6QvjqF?=
 =?us-ascii?Q?w4IQBtYcY620QFvjIVp2dzc4YghF+skne+kPCqL7xdn7H6w8klMvwLqDep1/?=
 =?us-ascii?Q?PKTlX+ws8Zt4AUQChZXcPBIshnCt4pSamxEs0WUjtWwMaMxF1ff88M+5Ounr?=
 =?us-ascii?Q?5aMaOtGMIK0Ilpq6eoMwIquczxrKMrw03R8iDTG3F6CoNVKjfMoLz3DBiLPh?=
 =?us-ascii?Q?+aqgafl4iIjuojTuf7bV40Uah7vuLFUiffOzMJ0W1sLwm1Q0RMUcT+fNsx3p?=
 =?us-ascii?Q?ly40RdM999/U2D405NYZsuDQ6ObC85V+M4x5Y45HqoEX49pbKM0w8sj6vf+U?=
 =?us-ascii?Q?okkr9JKlOGWnO3i8VA8q5MBE3O6jxRpkSXqocO42pGW8KfmvsTTj0rKkOE4/?=
 =?us-ascii?Q?/+woi53VZ4s++deI1/IUDP8kq/DVa4OG+Boygv0xrQ5N4g43jzR8J0hmsuD2?=
 =?us-ascii?Q?DGj0+8a4YLJE1S+fMNob2DoHdAidqr5iiGXBioMlyHn/hGkMU23iwws/4N2/?=
 =?us-ascii?Q?EI/PM6RzaXrIbyx+sO+hXzty5w+E6rzxnON6mVqlZbK9CIfeNKcBq/TJZdCK?=
 =?us-ascii?Q?y3Dn8Z0+LlldOevApGezC1DI+l9fC6TOrDH8ECmlOsKu8+mPhDMYX2TO3CF+?=
 =?us-ascii?Q?l2H4tOn+aiY0m8AmRqcc8C88igEFw5cyQS04SlxQ835wGJeScjto/phJqRZh?=
 =?us-ascii?Q?i31y9o55SxpQ7RFXgAEPeyA0ppDXVymQdeVJNpSKVMwXvDzWl4rWgJs0AXGd?=
 =?us-ascii?Q?ZhDgNx9f+26BLIGLDnmXp3v2FohV4B9qHzOkJp7mZv0zoE2wvBgTPMkam/Ni?=
 =?us-ascii?Q?MN0LeOfsw606IOFQYX0T31wahgV23aWPrfGUH0NWpc6j4JpJaTqvKDdJAY9s?=
 =?us-ascii?Q?nvzCyhJAsgUG43QdQI/FIgQdT9Z3JVQubd6Zdl5lE8mqyglujiuS0Dwe3qyU?=
 =?us-ascii?Q?2ui7OCWR6NwC+hjrvJWCb1x3FAMoNbbDzjGB04pheUHEl6pANiTR5zc0acmF?=
 =?us-ascii?Q?IW/IBi81n153FskIDZzlX28XdtQJvgDcJU0Y2CBqj4A8tiNnV/SATenArpEk?=
 =?us-ascii?Q?kpIDIRzjJIG62egQfkBv3O+vGhXuq173NIxYsLjsI6A8uYjZuFTmp9kwOP7b?=
 =?us-ascii?Q?rLD+tggfyhGAkdrTGiRQNu76/71GzaUISeke85ux6uRuS5JiVjfy4OvoP5v2?=
 =?us-ascii?Q?pt/acZucWRJiakvkqUTeCb/L3ao3pmKjeDhhuG4iBgu+FRgpEHXzK92JvHJF?=
 =?us-ascii?Q?R2VCIqg5z5iuPYZitrZnqPKBcDIdU8RWcRJVq7kqSylSiUUXccBL?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc660e7e-7dd7-4301-3861-08ded7d84cbd
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11811.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 01:21:53.4827
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: icMa7NiuyvcRSa2zoCeo+FRclYuRWcIm+Qa3WwUA6mrYvR/5e8EF17YagL8MBeVM6EQk1VOWNrh8XAlMNhAzlptnOm86NDpaVthHPBPIz3MZO/g6UljZ6LUn8OIozwiv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB16080

No one is calling snd_soc_component_initialize() / snd_soc_add_component()
calling from driver. Makes them local functions.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h  |  6 ------
 sound/soc/soc-core.c | 18 ++++++++----------
 2 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index b02f0443874fc..9224c8a507085 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -447,12 +447,6 @@ static inline int snd_soc_resume(struct device *dev)
 }
 #endif
 int snd_soc_poweroff(struct device *dev);
-int snd_soc_component_initialize(struct snd_soc_component *component,
-				 const struct snd_soc_component_driver *driver,
-				 struct device *dev);
-int snd_soc_add_component(struct snd_soc_component *component,
-			  struct snd_soc_dai_driver *dai_drv,
-			  int num_dai);
 int snd_soc_register_component_with_name6(struct device *dev,
 			 const char *name,
 			 const struct snd_soc_component_driver *component_driver,
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 6bbf8d381f7f7..a9825ea36ff4c 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2702,9 +2702,9 @@ static void snd_soc_del_component_unlocked(struct snd_soc_component *component)
 	list_del(&component->list);
 }
 
-int snd_soc_component_initialize(struct snd_soc_component *component,
-				 const struct snd_soc_component_driver *driver,
-				 struct device *dev)
+static int soc_component_initialize(struct snd_soc_component *component,
+				    const struct snd_soc_component_driver *driver,
+				    struct device *dev)
 {
 	component->dapm = snd_soc_dapm_alloc(dev);
 	if (!component->dapm)
@@ -2730,11 +2730,10 @@ int snd_soc_component_initialize(struct snd_soc_component *component,
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(snd_soc_component_initialize);
 
-int snd_soc_add_component(struct snd_soc_component *component,
-			  struct snd_soc_dai_driver *dai_drv,
-			  int num_dai)
+static int soc_add_component(struct snd_soc_component *component,
+			     struct snd_soc_dai_driver *dai_drv,
+			     int num_dai)
 {
 	struct snd_soc_card *card, *c;
 	int ret;
@@ -2773,7 +2772,6 @@ int snd_soc_add_component(struct snd_soc_component *component,
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(snd_soc_add_component);
 
 int snd_soc_register_component_with_name6(struct device *dev,
 			const char *name,
@@ -2791,11 +2789,11 @@ int snd_soc_register_component_with_name6(struct device *dev,
 	component->name = name;
 	component->priv = priv;
 
-	ret = snd_soc_component_initialize(component, component_driver, dev);
+	ret = soc_component_initialize(component, component_driver, dev);
 	if (ret < 0)
 		return ret;
 
-	return snd_soc_add_component(component, dai_drv, num_dai);
+	return soc_add_component(component, dai_drv, num_dai);
 }
 EXPORT_SYMBOL_GPL(snd_soc_register_component_with_name6);
 
-- 
2.53.0

