Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010065.outbound.protection.outlook.com [52.101.229.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6C037BE99
	for <linux-sound@vger.kernel.org>; Mon,  6 Jul 2026 02:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783303350; cv=fail; b=jSICSGgrFegzwg0aby7KKi7LiUcRcm8qHoN6HtJ5bVbVP6phx8z2IEic3j80tJk0agmFVcbUaAVBgg76z555kHd9qj3U8fwjFSFlbWmxjpejhOmWjV+j+rk2349DGyfAiQvxXO956bkdBM6ISIA0Woro5zAELmWkdSuSAxJRPfc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783303350; c=relaxed/simple;
	bh=ZlD0181v5ie7ydvDDLfWjh3px08DZhLcgpIe2QtJRJo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=gR8vMHkUBJGwdnbesu/vCQdlPU7HcUflfOJAO5udN5QidjEWtRr/gOxGC1nDExw0jDSJXLTL0lGyUUQCiLd/cd3zZLkYhxqWkehQ+P5xK89Jj2fxmpfww77F/UJOtVfKs4k2BBSksL69kvkyPypyq+KzaQhY5K5TilXPmX0GuMU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=I8+CE5oa; arc=fail smtp.client-ip=52.101.229.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="I8+CE5oa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DXFKoc5erdGkBQkfVQw8+Afv8zROpYB2ISLAJKOsvnPSz+dCHNUtkmcfbFQewwclaf58vBoIgqUaKuWgrrAAqXc5tj27h8tpMeVcpp01It4quLgJIzaB4h6mceK+xbh9ctXZjmTslPedqGDFkAR24w7FJ+G0OoKCde3UVK6oNvwE9/65LTBq735for/XmWigk89TAOH8S5NbrCpcdczmeQ269VOkUfCjmW4eUmFGSNwYY3ttnqNmD27zJ7uu7iEBjAbsCuCec1F48B7oCCOPnP16MvUcdlJLCkJDatMJX3qpsn0fFrVrjs58nlWgy6V+pn7uYxEO4Z0SVgsjTAmzCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nrW7TDo07bzdSi5yhY5i20y/JgCOwKjasQGnnzNdVXc=;
 b=mu5nc0Qu6c2CZVLPnWYbrnwgDEa/f3onz1xCJs27n+49Kw/fVZrt6PVSYHQ8WqDeWV/R6wwQGrHmUgGYxX7zpDIhYZKXjNCQiSBEPJ4a68mYPPlnoaxhhG+K3rXHX/E8bkszeB3umrfEA8egojwLoWr1pLvvoshUqgJ4nJpF0GC+5CMm89djUuCxIBc60UDUS7YTdSCJmqLC+rmYvaTXHuV220X+/CTzNReo0JSL9LRrAEFaxN+CMYO3fJ0NzjpF0iUsNHHJgHW7opIaDNqT9d/pvMlCAe89ezawGm7uSNTbSmdZDtvFqXExIP/YRUspa0naKkyen3Bf+t5UfboNsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nrW7TDo07bzdSi5yhY5i20y/JgCOwKjasQGnnzNdVXc=;
 b=I8+CE5oajk5FGPbMpNCvpHkHQHPa/FPvPt2izJxnI4Fnq8LF46CS65F7EfPOw3x5y9mQjM7qiPbLuEz3xe3RRSmpQFiZPerBVJtFJ2lkcdF1Cs6bdsdpL0xRhWanlKXW4oaZStpZlQmpvetnfYMgENYAidBcbWzLJ+0RCHFh2Xs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY4PR01MB14075.jpnprd01.prod.outlook.com (2603:1096:405:20d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Mon, 6 Jul
 2026 02:02:25 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0181.010; Mon, 6 Jul 2026
 02:02:25 +0000
Message-ID: <87v7asc1u7.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 03/12] ASoC: soc-component: add snd_soc_register_component_{c/d}()
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
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
In-Reply-To: <87zf04c1w5.wl-kuninori.morimoto.gx@renesas.com>
References: <87zf04c1w5.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 6 Jul 2026 02:02:24 +0000
X-ClientProxiedBy: TY4P286CA0065.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:371::7) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY4PR01MB14075:EE_
X-MS-Office365-Filtering-Correlation-Id: fddad2d2-75a4-45d0-c388-08dedb029fbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|23010399003|1800799024|38350700014|921020|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	TDnGCYWXampCp1VTHuHw5cwwPY2pRC5IuK8IqzuEodOsM8wEiySCNaJ3MLfw9a4SL6UOaGTx2ZrOayRtqL7FRoknViku3qac/7744X6Ht44nGbFwC2cWxK68nX96RzAcNfu4uXua7OH8ykQUD/aJdUqeDFNRGeCxvH8hPrcNlI553iJVNfWHwiwR+6Jf1V+OwthCGKe74S6IwdufMmvW+fZ90ihDGee8TQXVugROg2DJFk6QXV/g3g045oYgktAsHz6rfjpo/tpp+diwO0u+hv2gjno02Fv88iSB/FF5VonKvv+gm6NAoos5emoZurIF4z2Y4b0aJpvJ+O3vFsr0wyCRiH0OPmvHw/HXOgm6c/+dGINnrcLkwFtNGN+HdI1sYh89KMPris+N5zNl9ErKyugUY0svOZWkh/rzRM3gBlldwKr3VT3Y/NhvL8Rp0KJ0Rbs8HHxhnaVNgcd/xYnxas1aiiqUsexzptZhBwBHWD8VIW9mtr2yG5eCEU1o61lUamA3ZFLOsPkZ1pUrenJq4uYPFFt/gbo9EXkTwwqs/Hs4bM4Q9R9a1duoxu4Vg2o+C864QSUQOa2zQ70hxtwNG0+OAErQkCvPnAGkL+lCOf5XahMbaXi7vPiQM1Ddw6O50gjE6eDLjfFIoUdEKcjiZj7VXTddW+e2SMLSgjYYkD2ipC6Fl+o8RidoPdqbDOyIlH1yXgGuCQ6tVqymraZek9jFs4AZFCBpVBiXTzAA8wdP5OmMa1Pzon8D5Hy15HNY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(23010399003)(1800799024)(38350700014)(921020)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lZhuR3ug7lcM0MhHOxgoBkHUD1CqawXIuDBJWD102kYvMQIXaUtpf+fPNYJb?=
 =?us-ascii?Q?5eX0U0ameKqd1D21PnnFhkLPX/b+tmd6A5KtGPnyMFH6vkRtkLE5hIsjQpvX?=
 =?us-ascii?Q?LpDfsbuYAKzdv9Zstd7O5g6kam8+0/FHWXRAKHgPp0diKWHgrknxWH3oFz05?=
 =?us-ascii?Q?NJq5BtSsmFeaGO2rhoyd9ckWMrlO6xE9kqrUwFfeIsJsO1SUo2dJUbUNlALx?=
 =?us-ascii?Q?jqKz1FSz68RBOsT+W+i8iP1+GET8ALhWAqvAC4afnSz3S+l8CDImwz1MVqeU?=
 =?us-ascii?Q?b3Cqqeg09k1BjJaJVJG+usI/Hut8Y8mFhkH/6LZXWqqfZqxTkAwOvBH4Km68?=
 =?us-ascii?Q?pSlz/O+6MVD0fFcqiZ27tJoy129A4NcDNTVbGDiAo5glIVdQ8meaCokhUVad?=
 =?us-ascii?Q?nnXV9ppU3aFiyHDZUcZpQ7cHlB79emPWqA/CEYgYgR1ZtMXVHmRW8UkOomcf?=
 =?us-ascii?Q?WoG3TWd7n9u8WgQms5gAK3eH9r64yrOwoNebqT0Zm6qt79Hju6rjMRlN38gf?=
 =?us-ascii?Q?KJwWt0pBs9jDpZT1CumYIVCFFESBMVWwa6erh4cJxaR9e6/CLK5gw9F888po?=
 =?us-ascii?Q?yHMCVkk740e4ZfjdiNZNfIntrRE9RSZnyhMKEr09c4OEHfFbKqSODVaOK6lS?=
 =?us-ascii?Q?CftmpX7UnVf0HgTGKrBVIuWIE+kxnj0ly99LenYvabS7J6pbNTGc/1rVLFrd?=
 =?us-ascii?Q?4MtojOnisAXR8cF2VMUPDaT9n32UBc+cRBgXjIzD9l4ObU3lvV3uW+WJVoR8?=
 =?us-ascii?Q?f8F8Un+bKMpAuaF4aGPqi3n3M5qfThhcNu7STl9n81u2d4lda0SzmJb3b/Jo?=
 =?us-ascii?Q?CRsj4AiCTG3g1bFZtAQN1NC/uuBdLdG9kM0AO7c1ae4Ww1Ql/LKbVbN2g9wy?=
 =?us-ascii?Q?vxZyhnfB1aSyYxusMZIrImJEryu4A8vgOxpQqtn4OKhD3JUl0k4WERQwOPe6?=
 =?us-ascii?Q?saTEVpsLTPFu4kO5pPTI0RzEgk0v3GSoW/qJfH0QvqyP17/vVJE9XjQUOsbH?=
 =?us-ascii?Q?wHMg0KhUpnbf8azwPfl0/8jS7xAU9CxWF2cPAjcg2qT1o96I3a5z0I2zes6i?=
 =?us-ascii?Q?egNj3cJaF+jgas5Bn143jePJoCeJFgaVYUmthADew5FnxnP26x6uTkAeLU8Y?=
 =?us-ascii?Q?5ebZjcefJaUNqAuigZxMBw96zaqN+5FLI0l17V3Jy5gPzt48ANWBxDUGZJ0C?=
 =?us-ascii?Q?pL62Y+NWlXTavG3c55zU47t8OsfSoJNhvWMLWnC/Qt4dsREMiyFWGJ5YlNv1?=
 =?us-ascii?Q?6yQrK3KdqqP1vLowIvZN3P/jXlWGoJi+DGwxQDMbRUj3+y2KOxrz/INtCVEq?=
 =?us-ascii?Q?NMXv6UXty+8blvF2cByDQ9BRvhdsy34SoV5yPtlTrpmswfi3YYs8PLSWIcNQ?=
 =?us-ascii?Q?574DtoL4lprberAEBelwvzJzHpTgZulx6NHtwsDqy9YKEbrGecBDD5XAhvJZ?=
 =?us-ascii?Q?cZlHee3EagXA7uYk1+HpM76K5AxUqG2yxCuArSxTtfIL84dbCc7du4H4952S?=
 =?us-ascii?Q?3gn52FXV9tS1rXaLZAN7vf5TG4UG1xnL3W28pim5+66745/FtRXR0F7SS9lv?=
 =?us-ascii?Q?JNsT+/Gm5GihtSpWOYhRQeknZDlrwmntu5x0mg1w4s84TAWCkD+Ov3SYsinG?=
 =?us-ascii?Q?3l+2Eyn4gEMLq5dVumEwUqw7wIvGlgK0hg82gHdj95C3VxnYAH/aAwUHJuxH?=
 =?us-ascii?Q?bo9q2TbUVPCY6dkv5fDGRo7P3qtlsJKSJeHkudFF+shzAewvQUmFVLSDGTeZ?=
 =?us-ascii?Q?YWTgWsIwyV/64EzNkMh2KnwycL1Kc24=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fddad2d2-75a4-45d0-c388-08dedb029fbc
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 02:02:25.2462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WOkRjEOroRX94QZ8lcYhPYWuUhuJpO+x7UyFwtuXVSjOgSk0HvVviJCeI2Q1SighcwcBdKKR9PXS5wBNQqf9I6zyPoznNF99gWWmet+KLMXF8E/a4gHXdE8SEQ6rY7VI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14075

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

