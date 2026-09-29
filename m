Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010031.outbound.protection.outlook.com [52.101.228.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727613EBF0F
	for <linux-sound@vger.kernel.org>; Tue, 29 Sep 2026 05:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790659825; cv=fail; b=SpZGRKE1BZkZ2HAvYwt3XDuuAJTI/dA1MIMqkCPQdJGTbzj74kvoYzMk12PUsneUaRC+knIW8S133I6jl6Uy5N1zJIuMERkaGVRT/GHZ0Go7wG30m8AqdNcd08lOttzOIS80BrwD35IW016wC93N64u/lPHKqnvJ95/7SaF2QBk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790659825; c=relaxed/simple;
	bh=TCxsfene7K71CWKErp8U8/zAiy0tOnZb1U/voemT03I=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=n07OAGQxsyiwYf8/gWAKDaDHhDnOmZbvlHgPNPoiE68n/NlMqBvz8f3LTHdQjEHVQyZialZuzO5UnfeXufYNbxMHwJI0GfEVeS0pZnW2Yhj6br5CaTGQGXB3sLdXmpTyHadNH4EQQNuvhncm5kWr8fcBYxac5FFF+VyNvC+lbs4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Ct6HXZiA; arc=fail smtp.client-ip=52.101.228.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Ct6HXZiA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X/EvJg6qB1HLWoLay9d0n1IPtuTY7IObC831rl1D8Ln2rmGkoSjEInTD5vxHsnY2JpX/lSa0MdmZ/3W8qHMYH4SxScp8cb4a6XvMT/TXlEBd4FFyJ6KvcFfnN7uIKG6nBaL48ABrsEXtFSznTq1EvRYXylj6a0XOJsjWvkRiKOcmD/+/q7Dv2FV82KoOWarcXtXdIVDu0W9q8Zaf2Y/8mJTP0zBSGG0eW+NMwRKbI/Jj2NrlqtjNmVdciJDJTvteNtsQnzTnRURNcjDJ+67+RZ4Ilm4pFcdUmdhcwkboeV+sAzw8QKBl9xgM00f9Xievvt3eLJBjMTV1nn5QZAQU2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DLFxDZGELxn5RJ9WDSE73rb0j01Pau2wOYfuQDI9ulw=;
 b=VrcpVBcz2uni0swRf6v9gJYlR9FXJe/6tQ57PiB4k2JXlecPYDIIY74vp/iJNLMMsx3yfw/4HU+x8C6ZAkvYmCDEr5ZwWnGLs7AzrljbBFwDww7BuYx0iJCD0xKyeNtOXxe+Bp7ONI2LKSCagQxVBFB2Z7zdoSf3QS8wVD065Cg6LVHSG4IQ0GJtq7gLXzChvST3p9zOCUJsY0Q7+yWdUm0IOOD+I6bNDTLU2Ino6L4dn1n44/gK4Q5ocwsMatT9eHCAX67MJ7FW4wZ6gcyEizxws/f3JKAevUDEaOx/Ijq8tFbdorjgLOxjvbUk3xSrFfLiFNG8ZfB+ZfCzg8ZKVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DLFxDZGELxn5RJ9WDSE73rb0j01Pau2wOYfuQDI9ulw=;
 b=Ct6HXZiAP65AzjRqrpMuq8Sb32yXuZbhjctD42oVQ+O3QdaMfxTexu09d0HpJ3JuDBkoq1tvoYaEGqxTbJrpBBpTv+RDw0V8v2TNEHhbGnptQYSxRPi/RrVhz8OwfIH/b/nEBVC4Hn3F2bYSVpgOKpwfYa/n3I/maDEO61xInm0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by TYYPR01MB12208.jpnprd01.prod.outlook.com
 (2603:1096:405:f3::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 05:30:22 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 05:30:20 +0000
Message-ID: <878q4keiab.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 12/14] ASoC: soc-component: move snd_soc_lookup_component() to soc-component.c
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87pkxweibu.wl-kuninori.morimoto.gx@renesas.com>
References: <87pkxweibu.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 29 Sep 2026 05:30:20 +0000
X-ClientProxiedBy: TY4PR01CA0097.jpnprd01.prod.outlook.com
 (2603:1096:405:37d::10) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|TYYPR01MB12208:EE_
X-MS-Office365-Filtering-Correlation-Id: c262730d-7849-46a3-6ffa-08df1deac10b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|23010399003|18002099003|22082099003|38350700014|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	exAmqQsvWLi4xVIDTQYZTtZBtkt5o3ezohgSeBQL1Xmc91PWeTV33KsRaYo4MbRFARlq0HBkOWbGCHOHv5I1P/AQxZ8UdXY/yVS5yEKSCbFSBMWNzAr7XkdmtuB8jnRr8KTCi9NfjPuX4rb1Yd/dOzPA6F1fF8KEYLrk4GJxJEbbv48+4HF6dnrEiQXbdAz6RB6oEBE8xOVTCw5i8fr+TdtPDTRCmFr+wJr1lHBLo+gZs9sHcw8ZgnA2StOk35OqymXTl6OT41dBun8TpjeCmcOxuslUvx/9PgXCaKr/w/cHzw5qoLv/UGFq5+EaVBhDzzCPsYF1O6hpFNwyqOOUpuUVHdhOuF0s9lZVP8RlxYH5zGBkapQ2h3qlvEveztCpiQUGWGyeaFPjhyyE4RydnF4OPe0XV3NflFCa8MGg0pzvTqPHCkBzZ2c2cmFtnVuTloilIgFcPxB3SR3cf+BOatcaedCafj4mxnbTfiSD4Y52QCGenEet0WnQWzq/Bz1688RrBGYec6HN1DkrhrPADUyp7nCmJPGXXc8rDHyQJwcJ3rUiLWGFBHvLClYDUMcoHxCdJsQz311pXQQx297JlvAfHvcglWkGP/oRpfIw9zmfYq5AaGUIBZgUUYWh3FII3VzTXM+wHz5ZDjuMJXc8rDN7SL8UMJk8K86AghHl0oEtodEMtHmM1QUZHHJpKxg8g9TWd2n1VPwcBOPXORgUZ3G+tSfvWlQXzwoPktFMKrU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(23010399003)(18002099003)(22082099003)(38350700014)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hk2h8Q5Cwof2Cl4GXYy5PvqbYhNi5j9Y7RUFpBD4CWfVSx2iltjPu0QklCby?=
 =?us-ascii?Q?LoLcv6Ep0SgiDR+CXAVudKjo804ZooAhIIN3DBiiqndyOixUZahLhL/zZSWn?=
 =?us-ascii?Q?4ohANR8fazxqfFdCbPGRmGrMMt5GRzZHpvI0Nt2aIvegCAujPehQGYlcPMEO?=
 =?us-ascii?Q?3nYTvN8K8naIrwpSY8yMW7DvBYdpDZM1Y99z8mQmdqKTP2UR8IRgUoyRC9o7?=
 =?us-ascii?Q?UzxGxWH1DdARYPtzOsgY6GkTqcD3hG4t+2G9rlXgK27BI43rS0kVye+/KdZb?=
 =?us-ascii?Q?xr2Vx1s2mo62TcALzo4wPNS/OxTen0rUncd5o8Hzxj9tROISU7EaRpcR7JKU?=
 =?us-ascii?Q?PBZ8HsSoimLnW7C5TpZpl9R/cuTttJw0II9Qsdh1FcxL9lTg75Lag7Y+yIpU?=
 =?us-ascii?Q?cj2g4tgJ3NNK5i4mG5933Gc5bMPAbv3v2X2Pk3FjBXyYZJLXL+33A8l/bZyK?=
 =?us-ascii?Q?1sxqLjaLl6hchesnoNSJChbW0Ny3u5+RcTEi/bwfXxEHnIppTEtmj1KN1aB/?=
 =?us-ascii?Q?jCtJfc7axs10mqGDKLfigoew/tg4tytKG+RBSYH1T3EViFvcMeZm9ACshB1S?=
 =?us-ascii?Q?0kOHGNQVc1bX+Is3J7g7oych7N1y8smxd8+jmkr+S6aKK+u+kE3ePwKIpU8j?=
 =?us-ascii?Q?kCmM/nvar+Ptm6k+H9CrHDC3uzqz3hwRiRspGtQtrbktZW4EmRNjbOK1g6Yq?=
 =?us-ascii?Q?jKyY3vQXCbb6tpF2dI0p1t3lWadLi74eWgHsk0CQ1s5AdkHT/8bc9Qw8RcWn?=
 =?us-ascii?Q?we7bOnLDBiHaZeFWK2DMvAC9Kffi3gTTntV6pG92AbK2zX/yc8/aDOyH1GRW?=
 =?us-ascii?Q?e/gltwFo53eUBTFXdhaTDMPSRMnTn7MJv4E7Fl0HeGNVu+8mPCVfm6iCq9vX?=
 =?us-ascii?Q?uVcS75Otiq5bk9DcmrvHs7uHEHRQ9xL2fP1RSuPv1uzeM3rkADF1h094/71c?=
 =?us-ascii?Q?+svMchgVYZ7HxI6B/bfS6NQxP9YPMWMr+FOFVJlRJs6ZgGD5lrZx5csVXk8W?=
 =?us-ascii?Q?S6Cbm/Y0f1vyNruuC6mMGfValARqE4iZN4raAwRtqF1cTWuu1jXNd8/3CtIK?=
 =?us-ascii?Q?NnsGJI4YY0M9oC6QGJHJiZNqwCdHEZSFmL2rWTuEErpzXW3/d7V4lQPpWQpc?=
 =?us-ascii?Q?GgvjE9i20z1EbhJCoHvoPoNjeJ/pVNibpdA3Y0MLL31EuSephuvTfIO4twci?=
 =?us-ascii?Q?DRsF2FCWylc+rIQ6toRR6SQ31Tuwg1q2I1dk67eq1n2YD3Xw1QR3K2s58bcm?=
 =?us-ascii?Q?oY3b3/pgbRslQwePI8scIrk7NsINgxT8nT5jE+xfROlaCwV77H3sAKABrV7o?=
 =?us-ascii?Q?+EsjJ7FO7wVpEF0cNdPJUevXNTl15VzS4O070ugK4ww3ny8UivniLjO56soB?=
 =?us-ascii?Q?Ls/yJE/udcOh4tEuaFwb0Gthv4gAkRT1H/qdvdvhlWoj0Nhqq/DgSRdbzgOs?=
 =?us-ascii?Q?sAtUauKLxMY2aGmthk4IvzNwxlnzEUAepMXu7lCRC3DXfWEg2XYteUMqh/+D?=
 =?us-ascii?Q?ZazHY2VhD3S5AeKiWmaNen79Uue3yTqo4aiaQeigwH75120HzR5pInyvPYCw?=
 =?us-ascii?Q?UJ3VKy2Ynw2IPPD8vfdJX+QoO9CNh/g7X6gqS4MXRVoVqkYIujbmIvXoOjlY?=
 =?us-ascii?Q?iDyNFnMTGyotxI/WK3M6Qlr18rl4wmhM9v2zoU3/cw1PEm6AIu6efM90U3P0?=
 =?us-ascii?Q?KFKERgD3qAwjZ/+vxDykIbO2MVHtKCXNEG4JxBcU6Yf0sClre/UM34zd4vBc?=
 =?us-ascii?Q?ykLv3PbSvQmP9L8VLFlxGOjnMMIkWy5j3DDwKDNH5vNudTW/hYzA?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c262730d-7849-46a3-6ffa-08df1deac10b
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 05:30:20.9298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 32Oue9Gs/KvyEHvyLjCxcIPVObzL+WOyyVtjavh7o5+ghsWuCgVE6t3gz2+pkEJ2wWT6pnaZ/sRROMLEBo83vb0uyGZJwgkqCAVn6ehH+OJuJu77QbqgfhAebqZgheIN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12208

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

Move snd_soc_lookup_component() to soc-component.c

It renames function name
	snd_soc_lookup_component_nolocked()	-> snd_soc_component_lookup_nolock()
	snd_soc_lookup_component()		-> snd_soc_component_lookup()
	snd_soc_lookup_component_by_name()	-> snd_soc_component_lookup_by_name()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h |  8 ++++++
 include/sound/soc.h           |  5 ----
 sound/soc/soc-component.c     | 48 +++++++++++++++++++++++++++++++++++
 sound/soc/soc-core.c          | 48 -----------------------------------
 4 files changed, 56 insertions(+), 53 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index f5249de004942..26d2a4fb9380e 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -287,6 +287,11 @@ void snd_soc_component_set_aux(struct snd_soc_component *component,
 int snd_soc_component_init(struct snd_soc_component *component);
 int snd_soc_component_is_dummy(struct snd_soc_component *component);
 
+struct snd_soc_component *snd_soc_component_lookup_nolock(struct device *dev,
+							  const char *driver_name);
+struct snd_soc_component *snd_soc_component_lookup(struct device *dev, const char *driver_name);
+struct snd_soc_component *snd_soc_component_lookup_by_name(const char *component_name);
+
 /* component IO */
 unsigned int snd_soc_component_read(struct snd_soc_component *component,
 				      unsigned int reg);
@@ -439,5 +444,8 @@ void snd_soc_pcm_component_delay(struct snd_pcm_substream *substream,
 
 /* REMOVE ME */
 #define snd_soc_component_cache_sync			snd_soc_component_regmap_cache_sync
+#define snd_soc_lookup_component_nolocked		snd_soc_component_lookup_nolock
+#define snd_soc_lookup_component			snd_soc_component_lookup
+#define snd_soc_lookup_component_by_name		snd_soc_component_lookup_by_name
 
 #endif /* __SOC_COMPONENT_H */
diff --git a/include/sound/soc.h b/include/sound/soc.h
index 09a3e737c23d9..bff24c68d7627 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -463,11 +463,6 @@ int devm_snd_soc_register_component(struct device *dev,
 #define snd_soc_unregister_component(dev) snd_soc_unregister_component_by_driver(dev, NULL)
 void snd_soc_unregister_component_by_driver(struct device *dev,
 			 const struct snd_soc_component_driver *component_driver);
-struct snd_soc_component *snd_soc_lookup_component_nolocked(struct device *dev,
-							    const char *driver_name);
-struct snd_soc_component *snd_soc_lookup_component(struct device *dev,
-						   const char *driver_name);
-struct snd_soc_component *snd_soc_lookup_component_by_name(const char *component_name);
 
 int soc_new_pcm(struct snd_soc_pcm_runtime *rtd);
 #ifdef CONFIG_SND_SOC_COMPRESS
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 0da36aea08db3..9a288f7107c3e 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -1525,3 +1525,51 @@ int snd_soc_component_probe(struct snd_soc_card *card, struct snd_soc_component
 
 	return ret;
 }
+
+struct snd_soc_component
+*snd_soc_component_lookup_nolock(struct device *dev, const char *driver_name)
+{
+	struct snd_soc_component *component;
+
+	for_each_component(component) {
+		if (dev != component->dev)
+			continue;
+
+		if (!driver_name)
+			return component;
+
+		if (!component->driver->name)
+			continue;
+
+		if (component->driver->name == driver_name)
+			return component;
+
+		if (strcmp(component->driver->name, driver_name) == 0)
+			return component;
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_lookup_nolock);
+
+struct snd_soc_component *snd_soc_component_lookup(struct device *dev,
+						   const char *driver_name)
+{
+	guard(mutex)(&client_mutex);
+
+	return snd_soc_component_lookup_nolock(dev, driver_name);
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_lookup);
+
+struct snd_soc_component *snd_soc_component_lookup_by_name(const char *component_name)
+{
+	struct snd_soc_component *component;
+
+	guard(mutex)(&client_mutex);
+	for_each_component(component)
+		if (strstr(component->name, component_name))
+			return component;
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_lookup_by_name);
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index ee8872cacfdb6..8bbd100fb0fa7 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -261,54 +261,6 @@ struct snd_soc_component *snd_soc_rtdcom_lookup(struct snd_soc_pcm_runtime *rtd,
 }
 EXPORT_SYMBOL_GPL(snd_soc_rtdcom_lookup);
 
-struct snd_soc_component
-*snd_soc_lookup_component_nolocked(struct device *dev, const char *driver_name)
-{
-	struct snd_soc_component *component;
-
-	for_each_component(component) {
-		if (dev != component->dev)
-			continue;
-
-		if (!driver_name)
-			return component;
-
-		if (!component->driver->name)
-			continue;
-
-		if (component->driver->name == driver_name)
-			return component;
-
-		if (strcmp(component->driver->name, driver_name) == 0)
-			return component;
-	}
-
-	return NULL;
-}
-EXPORT_SYMBOL_GPL(snd_soc_lookup_component_nolocked);
-
-struct snd_soc_component *snd_soc_lookup_component(struct device *dev,
-						   const char *driver_name)
-{
-	guard(mutex)(&client_mutex);
-
-	return snd_soc_lookup_component_nolocked(dev, driver_name);
-}
-EXPORT_SYMBOL_GPL(snd_soc_lookup_component);
-
-struct snd_soc_component *snd_soc_lookup_component_by_name(const char *component_name)
-{
-	struct snd_soc_component *component;
-
-	guard(mutex)(&client_mutex);
-	for_each_component(component)
-		if (strstr(component->name, component_name))
-			return component;
-
-	return NULL;
-}
-EXPORT_SYMBOL_GPL(snd_soc_lookup_component_by_name);
-
 struct snd_soc_pcm_runtime
 *snd_soc_get_pcm_runtime(struct snd_soc_card *card,
 			 struct snd_soc_dai_link *dai_link)
-- 
2.53.0

