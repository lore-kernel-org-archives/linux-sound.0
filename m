Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010054.outbound.protection.outlook.com [52.101.228.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B90618FDAF
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820676; cv=fail; b=l/5IX+2pyKiWFunOgwL06P1HHd2OLLpgofvi7+PVW+Dv2LUAfNYLgvt0eWcDyR4JPl5Rli+azX6GQ1sW7FL3UV+Ap6q69VfEHoirfQXhOXSzA7DQ2s2J1Xhn+Lk4OwaSSAkt8zM9lbwm4ACyT4bTxXs++xZKMuv5YM/BzKK0E8g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820676; c=relaxed/simple;
	bh=J75raD8Rzua+wpXaonhof9ZyDR97w70oC71dIA21SJI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Doi7J4FcjQ2u2G5ZfRCJaXAmtQZwVJLfJXmfghETk1X/DgYbRBQUdvW3yyR+02AxUtIMa7eHd0NbI4lYFrne9/+3oxFabmr+HEReCp3gneJB0nt2X2fxB04H79kQVDdAeCKbB/oYOiPZBjWFp6T05IDMBsZ9jXNcQ0bjt1HAL34=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=nY0KbVtP; arc=fail smtp.client-ip=52.101.228.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="nY0KbVtP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O6JG1R48VYQhwwoq3QSGC5tRGpXAnYdVkayIc/Sl16GVBDKwlSjHDXv9CyGNinfyD4VhjsZmLeA6wK8wBzSnj6YrdrvYD6l4YeZcpFvEoTkFpHB1kt7QPB23cvOLSA9Fg45aSj0COuhwtU7Ms4NljGF+sc5Dcp8OeJkqnyJSMdZB4CgatnG61mSGGZJMlmG7AxS3nwLAMXbC1eBYAhwFi9u84dOZeNYqy3Sh9QjwlB3G2WXLjXqA8mavijeyo7EED2oPG9wvD4OVPZYVZBsgJtzvmfq2Q9aL1/CxIFox7mV3hPuCWXdYVGbFgTSII2xHpd5B8CHx6tpaLNkbJ9eISQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mAGT23Jp9x3hUALNwgkcGl7BUNTXfFfOge/fFkpL3LM=;
 b=W6cNikP0OzUZndIGdtBCnhAPD8fG+vXF9Xc9NfkS2yCkjUfEn4pc2zpHtmhUEec1ftq/X3oa8S7I3MF7u6lNa/einkmxaH6E18qCiFD+LBaj9OcVN637ItweCTxv8IDybozvZdTih7KVHVjQNtpYKJXKY4E4L0WbUuJH6r07kqjSvtPDdJ6WSszCod5It3lBotIvjGx7MU8LU6FjQ4KHhDnfMCKPBaikQrzrYw3jqHxCYxrZb956qC+rAqbh3YCyGHYyEXbYSncup5Szg3sq3PDzUEKhrkoFdbl6iI7gB0GI3VB1O/GDre1gY5pKAY5L1WpMogiFlSa7DTa9gRBA5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mAGT23Jp9x3hUALNwgkcGl7BUNTXfFfOge/fFkpL3LM=;
 b=nY0KbVtPlafPIrrOKt+bTw78/Mji5IkXdbhRaP3C8Fs0/RexAjHw9gw204PKOQXBinsfNt4O1DPDlTJg9EgBfevuzlBVWNHyUd8OnLzk0pfqAOnH292hoPFo+EIuQddMi0m/9MKHI7c9qd7xo7MS67iY1Bq1vUT/hqu5fwnsHHU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB16440.jpnprd01.prod.outlook.com
 (2603:1096:405:147::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.11; Tue, 11 Nov
 2025 00:24:33 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:24:33 +0000
Message-ID: <87bjl94drz.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 100/292] ASoC: codecs: rt1015: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:24:32 +0000
X-ClientProxiedBy: TYCP286CA0259.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB16440:EE_
X-MS-Office365-Filtering-Correlation-Id: 32710482-4f38-421d-c2c4-08de20b8afd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gYw4xTBvgIg+geRVeTlD3wKlILaqoJB43wENl2gzAljaYgGFwU++T84keuzF?=
 =?us-ascii?Q?MT4nVYc3KSDxsG8O11qJm6idiQYS+sX3wf3775d5TiPK0ETQeEkcSnvStQg6?=
 =?us-ascii?Q?e6ZJWpR44kwAoIlvw/xMPtrqRqp87Cxi/cZeLnZF8a2CZg7KZTRg0LrkHhPl?=
 =?us-ascii?Q?klDpaqIaD+spzf8AB5G/eioFiQUT9LWb3M/tfezsv1QtAFTOcSx9LXXxGLek?=
 =?us-ascii?Q?av+9WjCmz+suhGI+kxYTsaTAhbrcFLoTFt8ojOHOAzAey9ZgxAuFE6kqg6Iz?=
 =?us-ascii?Q?oOWj/Tu/O1zuA7jXBErCyJw8QMSxaxnN01tdEN3CEVwuTRVn0+O7gm2YKqyh?=
 =?us-ascii?Q?NbxBlFVOdlKv34XO6n2P26CXBGe+YA5d88eR6ji35Hw8UhyYi46bUgNGpFog?=
 =?us-ascii?Q?sIYaBINAk/M7PJugqFuBztl/g9IlkVgwGn/aCBwz/NEAuwbWal2Ctw7UO/sE?=
 =?us-ascii?Q?g3n44jA4i8j4q4Dor8lF6iIK87iSf0WbxRr4X+nhdAeR/TgjQIvSVuQ4zWzw?=
 =?us-ascii?Q?9NsXAgNiuj0MdW51gGkpbnrTjbEyB0zUEKNjSi7kZ52krtr4l1nlGMmLzj07?=
 =?us-ascii?Q?HGlHMweQdwWvbgKLQuBwtBVx7gsYvPsGJQ9i8MtOC3pfJNPB4lQmqch//qZN?=
 =?us-ascii?Q?6Hvi8yRc0UkzOnrm1WI4O/qj+U/pDdHe3a/IP4RRJKcC6RmAgz/3UUfdrVFp?=
 =?us-ascii?Q?rjF2FivXKA6V8g6EPFPpmiSczLi7qVY4sQBCkHTmpdJ9YjLgMwRMgX9z5YuU?=
 =?us-ascii?Q?ifwrFZhiFrNrHD5Ycpp+zmybnA8lwvIJp1BhKZSLMkmb9azPc9RfpNxLM0u3?=
 =?us-ascii?Q?xTzB8YNzXGQLseyjyMYtnw0cjwuTftRTEfxcDAYeQ1WUH4j6X8wk5TqkxiWN?=
 =?us-ascii?Q?AjylRxU3h1Sc7xla39ayStlCqbtZpS+fIlrNaXkp+BizNYRLJ1CGAR4o99I3?=
 =?us-ascii?Q?wSglpSu4AKoGo98sRaVo5UYBLWeFvpnzPiUcApn+OTU3bnlXCbQ8DK6EUQGT?=
 =?us-ascii?Q?fIxdZ0X4FzvABw7xOgF0ZHDTHju4iUb5NUkBdUEXgjMdnT5Lkw3Hqte0ICQ6?=
 =?us-ascii?Q?vy5pYRAEW6VcRcwoW9Nq4H9ZNY4xQneZlIUmL9xtVbH07J4zJO8SM9rkj/ZB?=
 =?us-ascii?Q?SvYXXtLCOp/43EbBprgQ+u10viCODF21DkrxMPP58/NHzPeGqoEKjQgyWet2?=
 =?us-ascii?Q?3Q1HgG0KJta/qkb3vs4wAsOx1y+Z6higVoxrcQQaNRQIdnYxzC1L3+cKTdnw?=
 =?us-ascii?Q?rdVqWI4SbCdiA7EGr2IyLxmt5mjEoqwlEKwyCyB8XJ60dZKhPlSAdyo9DRYD?=
 =?us-ascii?Q?+0IFdv+HTX5OjGHkbPtHxnIM2MZZ2vOtvwDI62x1k6dh6TWEIs45U67deruf?=
 =?us-ascii?Q?K/7lULq4UbEWZ5g1pASYAOWX2MgnuzA02hgIIrSxEBSOzmDp/Cdq0J1lVwoO?=
 =?us-ascii?Q?FW3PkNfMhOyqiE8ux4OnnRCKO0II2oIG6aAptvSFyOuE/v/NNSVX0LIKFyDz?=
 =?us-ascii?Q?MRt9Erj4sZ5JWyADISq4rLFS6V4iIhy5aDkw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iGv+g0/9MsgsvXVn/q7a0NVYTvAoI8npqCbP606Ql3Jt6Xqj+H7Owh/hjoOr?=
 =?us-ascii?Q?gYUCK2xC/SlzSS3M5H2uzMUPV20FbnkhG6y4HCj2Rua9IGT9+VO5koiH20xT?=
 =?us-ascii?Q?fA/A/lCEtduXarXXHWTFQKl7xred4yJ2sLh8HstpBU5xjdcOB5TBQyGffjhy?=
 =?us-ascii?Q?q90M2tA7DTxbBcQQJ7tfn2G7pI0fFnSr1/KeZ+zca/FqI7JtG5UdRXS5UHAr?=
 =?us-ascii?Q?MqYgGP5Oaa4SP+ealnjH+oSLczZba0GNKNA6lwc4A+MhcNRVOafRMQuTGGGb?=
 =?us-ascii?Q?O/YTEY63pKz0SKVhByjkuAmWHDEsEWCDAjQFYkpOW6YWxQVB6fQ4oU7PtSBJ?=
 =?us-ascii?Q?i++t41G0/DPZGuf2pJKsvXnva8lwObXZoCIvMCjvr96XpsRO5tQGkLGNXt4R?=
 =?us-ascii?Q?/+/ep4oi9PoDCnXiTh23jo59c3SZMAy2TQcA3xHkumZIN5WMDSRVrwM9GpA/?=
 =?us-ascii?Q?DXbx8AlGFy7cGjeyFRlzFkhwMqY9jZ3jWZ9G1wDT0XWqYH41KOxcuWYpuIFD?=
 =?us-ascii?Q?aBZjmpF6pYoZPMMcFv7jB28/WMzEpHxjfSHVfViin6axy3dvOQJUu1mYkuSD?=
 =?us-ascii?Q?w82djyY7v99qXxj/XvFatd1Ybp8mGYiBbA8QjL768Bw4ZG/2HVNPeH+6IegT?=
 =?us-ascii?Q?Gmijqq4Q/Dp/xsv+NrcpYpY7YSIFHqJ4SMmZZi1VJOXenzi8gF+03n1UM9JG?=
 =?us-ascii?Q?88c5FsnzNA8+W4fwPI07yOhtGggXj2aqBnCoHu3doQIqvRTyQi97xOqDVYop?=
 =?us-ascii?Q?NvhDSUxdjf2FIXt5OFr8sWsXO8tA1OzdztI0V6zgtuZ88ddq3Wmax7Xk6man?=
 =?us-ascii?Q?y2DlddQ35X28HORT6f9NkSh1dpcJd2/k6s7j7FK6EspR7BaAE6Vgs5dVtPtK?=
 =?us-ascii?Q?E01+hgZTkEINlDYoDfX6YDvmMuLnLK2fzNq/pYhgULVeW3Px+bjHEPRMeuvH?=
 =?us-ascii?Q?WHgBiK9ZAdE7QLo58GLK7akiI+cpoW9WpEfFVYveYBplCvlw2fnXSHqow3Sj?=
 =?us-ascii?Q?TYOdxkhdhodzLpRwK4zAXRiTEPnR6pIE5uf2QGzbOIFCqIKIPpQqjpruOHrZ?=
 =?us-ascii?Q?8ebM7S6gDTttMGSlgqEAyWDtUfa9Ymht1FoqNVhLX36qUe2fFuAHvm2F8RED?=
 =?us-ascii?Q?EtrWWjAHadckPlqiakMQtr1gDS+DhZKGaB065dxSKdLB+tTZjyfRfhwduiJe?=
 =?us-ascii?Q?U8Jm5VlskdUspCjhKHomEqYTImXfK0jS3zn6qiJqCASYqBUDKYFxRQHCFNf5?=
 =?us-ascii?Q?xPWS2OVfXL0UGqpfcG73SmjCQR50TkkMWnZhItQNS64Jkih0cPFMTqM8RTIB?=
 =?us-ascii?Q?+qI05zojwNvoyW5IRbLIa3elcGiyXY60JcXsW99wmO6hDhqrJmysbIySfkw1?=
 =?us-ascii?Q?AhmvWIS/+ED0jCBC6hKBA/GTExGUwq8KKDkbu1ibJlqAe73B9jRfaElNbJJZ?=
 =?us-ascii?Q?TtgeoEqNoLn1DlI+AfBHSFWUv662rZ81018ZgHhXZDlZlnGkRJwXxrm12vO8?=
 =?us-ascii?Q?D7xVFyZV16jnQb4fvQceYIAnIbu1BQiDvqz09KqESIrOo1LrOY584Iwd0hWO?=
 =?us-ascii?Q?cwdm87cF5wdMaA7Btyxwau7ueX2V1fnNKwzWxJ9TCfMijmx87t2DhV6q19z5?=
 =?us-ascii?Q?gmxEw0jfBgWYPVhYqfIdiHI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32710482-4f38-421d-c2c4-08de20b8afd9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:24:33.0686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: elks7wDX5244aA0q/ydDLzUqPrMR0F6jOJzeh9bhCF+9139MB5qbgwgkrCmMO20mYGC5CM5K6AtnZJT9Db8uzxHEXIVJ/D7soUDtXjeZ2Rz3MCPlcEsz0mWIQhzz3lq5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB16440

This patch converts below functions.

dapm->dev					-> snd_soc_dapm_to_dev()
dapm->card					-> snd_soc_dapm_to_card()
dapm->component					-> snd_soc_dapm_to_component()

dapm_kcontrol_get_value()			-> snd_soc_dapm_kcontrol_get_value()

snd_soc_component_enable_pin()			-> snd_soc_dapm_enable_pin()
snd_soc_component_enable_pin_unlocked()		-> snd_soc_dapm_enable_pin_unlocked()
snd_soc_component_disable_pin()			-> snd_soc_dapm_disable_pin()
snd_soc_component_disable_pin_unlocked()	-> snd_soc_dapm_disable_pin_unlocked()
snd_soc_component_nc_pin()			-> snd_soc_dapm_nc_pin()
snd_soc_component_nc_pin_unlocked()		-> snd_soc_dapm_nc_pin_unlocked()
snd_soc_component_get_pin_status()		-> snd_soc_dapm_get_pin_status()
snd_soc_component_force_enable_pin()		-> snd_soc_dapm_force_enable_pin()
snd_soc_component_force_enable_pin_unlocked()	-> snd_soc_dapm_force_enable_pin_unlocked()
snd_soc_component_force_bias_level()		-> snd_soc_dapm_force_bias_level()
snd_soc_component_get_bias_level()		-> snd_soc_dapm_get_bias_level()
snd_soc_component_init_bias_level()		-> snd_soc_dapm_init_bias_level()
snd_soc_component_get_dapm()			-> snd_soc_component_to_dapm()

snd_soc_dapm_kcontrol_component()		-> snd_soc_dapm_kcontrol_to_component()
snd_soc_dapm_kcontrol_widget()			-> snd_soc_dapm_kcontrol_to_widget()
snd_soc_dapm_kcontrol_dapm()			-> snd_soc_dapm_kcontrol_to_dapm()
snd_soc_dapm_np_pin()				-> snd_soc_dapm_disable_pin()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/rt1015.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt1015.c b/sound/soc/codecs/rt1015.c
index 033a196cb5c73..ca1ed9d5a24ed 100644
--- a/sound/soc/codecs/rt1015.c
+++ b/sound/soc/codecs/rt1015.c
@@ -491,9 +491,10 @@ static int rt1015_bypass_boost_get(struct snd_kcontrol *kcontrol,
 static void rt1015_calibrate(struct rt1015_priv *rt1015)
 {
 	struct snd_soc_component *component = rt1015->component;
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct regmap *regmap = rt1015->regmap;
 
-	snd_soc_dapm_mutex_lock(&component->dapm);
+	snd_soc_dapm_mutex_lock(dapm);
 	regcache_cache_bypass(regmap, true);
 
 	regmap_write(regmap, RT1015_CLK_DET, 0x0000);
@@ -515,7 +516,7 @@ static void rt1015_calibrate(struct rt1015_priv *rt1015)
 	regcache_cache_bypass(regmap, false);
 	regcache_mark_dirty(regmap);
 	regcache_sync(regmap);
-	snd_soc_dapm_mutex_unlock(&component->dapm);
+	snd_soc_dapm_mutex_unlock(dapm);
 }
 
 static int rt1015_bypass_boost_put(struct snd_kcontrol *kcontrol,
-- 
2.43.0

