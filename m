Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011015.outbound.protection.outlook.com [52.101.125.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746452580CF
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 06:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782454195; cv=fail; b=ogFZ9yeADQ4Pq/3FfDHPvUQihNC07AveWiNO6YTLR8G5FkDN1djVWgcul4vWhVcDG8Hi1wqcvS9iHxCy6uzw7ZSAxWD9vfkS7K7YaBBAVpHWkqt7RFWYanlKk2xDcbfvUxvQM+JYRpu/Lt5KaxYQntV4e/LuSb/Qo19sRwVUf3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782454195; c=relaxed/simple;
	bh=1IIjOjoEdzTPI64U0DciZItt1o0t4X/uXQlwdmubxo0=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=LIq6F8onp7PQWN2C4CyKsmWlX44nFtk+QY7ZbHxU6Zap4Qy+9kQs/aIc7HiDDV/b+N487dkuyGl2aH6t8uUqWPN3o1Kie6Fus3NSnm9boFK3GYiyzto9O8b4APraQ5wVeYnvc8lh3bkHT2TeVzVwsFtGrgcTsGMmjOWEGf1yEsQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=O1vLTXpE; arc=fail smtp.client-ip=52.101.125.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="O1vLTXpE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xCR0bih6zNxk9jIn2uyOAHb0RrD2xP56CCEFM0YP+afOEtriewKUB7mGsSDtcmM6Xr2/SPWRgHBNmVYsgTm9qmJtjLPcfVgJ8D2k1pBhO+oVw30Hmb+onC3AXFT/gnWroxY9aLph/t8vRe0/Kxmq+ByVadfFRVMDh2hts1Y6kodbl01Xn0LdUUnYcQ+KSzkva6cSBRJjWxuQAgNvkJx1k3s4ZTG+b1Wf9cWTHffQpiVBag3WdkhJAotve1w3h4e9XRPFO6xAdemwoYBCGTApw7wVVo9LDtHVyetHgSQJ4TLSfUwQ0XZibMndksJK8Otih8OwrLFDrHuFysnmgUR16A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vl4vZdNejehJDzvv/T7i6j4o7wykASCp8TqB5CUQ+ho=;
 b=CYGl2CHOnKbxlpYBdVzqag7HwvhwvC7hmQ8J4OQNR4nlT5Gj0rJP8NnyGW+y+WxLMJiOy/6aye1n9nVWuEEXSQa46oStlY11VHsk6DQwe4XeMcgIgwgOb/aVDoICAhmFsgVOFQ2PWQpRpcRhr2PCux1OhvTd+iMK5xXR4ylQu4gkURJ4qDmjDRGHdDk7HEfzJrnDvUXxYy1GGn2Nw6FAdvQEpz9k4/IsUmg++++5ENV3mxRrZCJ87OsO4rLB+9wVjTksUbUtdD2ns5sFmOVjZI+4cdKICZqgQeTkkQaOVDB+H/dIUFQ+ks6ZUCabORQdraL+Y1HLVCqjVhsIQdVenw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vl4vZdNejehJDzvv/T7i6j4o7wykASCp8TqB5CUQ+ho=;
 b=O1vLTXpEk54+LzfdFdIoLScMchiysz+bAeYLWWv1O+z5CFGHkD2gEfhQTRotySAtLh8cMVi7U0SHOqlnI5bFWlZleDJjDJsjji2Kwh0EzRpJOSOroNp3L4nfkW68yGXBBeWkYOj+zA45GqOvcn40TEJQP7cb3dI9/SnEA3b+V/8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY7PR01MB16025.jpnprd01.prod.outlook.com (2603:1096:405:2a9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Fri, 26 Jun
 2026 06:09:52 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0159.015; Fri, 26 Jun 2026
 06:09:52 +0000
Message-ID: <87echtessv.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/5] ASoC: soc-component: add driver_name
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Takashi Iwai <tiwai@suse.com>
In-Reply-To: <87fr29esth.wl-kuninori.morimoto.gx@renesas.com>
References: <87fr29esth.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 26 Jun 2026 06:09:52 +0000
X-ClientProxiedBy: TY4P286CA0137.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37f::11) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY7PR01MB16025:EE_
X-MS-Office365-Filtering-Correlation-Id: 94cc3e4c-fda3-4d4f-b9e2-08ded3498954
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|1800799024|376014|23010399003|38350700014|921020|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	kl6pyMuc0UVlqcl7JRW3T496m3da8/Y0h8dWEimGzzrgw+BsSrfONoFSC7avqHeo5PO7QbX9/tbhZ7Xahqmtg5Fs5X5vzO7l9EarD23Zo9/8nBq0oGlnQgw39Ejsvv9/qk7HlFNoYM/IV51U6ME/+/wwqpIa0UhM4obTez8GvusVIFK6BlRd4MB6hfgdh2EpwOGwe5y6XNoCpWPitTn/aTLsqnSO/YmzbvUGpuWu6+4BQVx/9u7pVpzBvMbN/n5f91aB8o80sfB5Z7CeN2+55m727WIaQ76tEMOrZyNHmOPASKy1qpGBWBDCpocUyfS023Xj2ebwBBj/pLdUeUc46c7FQ12T6U6EfoFMNucRl/6lhoTh4MoUTYBbHKx/bmqABgLQh+uU+UTaUQb6z/TmcxVTSr85DTQLAFm9mDVY3dwh7A+f2yfSJbk0M8PDCf0vA4GwO98jY6oVApwaz3AeowC8qvv6yLvpA/h9EiP222Y+i8joaAW7o5yn+1SI0gBaM5oc5N7PH3erdvkNe16taIEweI0RJBBg+Ge7RPDBbVngFwFYsSHbGvtMBLH8E//KmnvaCfdKnSv7lXVfHUj2LmW8h/Yx1H89W306FUfOK2PZSfqJwDryZuNv+D6nw9XEnVa9dADmisdVjI/hiThw09TxwoF+g2WplHAEYXWXzcLz2gU87ju7JXUiMpzRimCZb+zu/vUjlRJ4NsBaevgguboc7xgxLC07hlGxAhIIEZqf6uFJ0IIw5/n8VzAK7m9p
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(1800799024)(376014)(23010399003)(38350700014)(921020)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lDEUDVT0kFlsvojDHsKE9WlKlHv//9QYuMS5xxYsjafdLoQq7qKeTosOkSXD?=
 =?us-ascii?Q?1DtfR972HOr9ycctiNTzBHSIW8vQFPoUqlrutU1VSLR4dk+DZrHRnXu+MJXQ?=
 =?us-ascii?Q?hf1Roq4BC104lARsffZlVGHxR0SpRyyQYZf+wZhJ4eJv5tYUM34NltykbGcQ?=
 =?us-ascii?Q?iryNRnOe/VSP8OrQd+7QNFAa0RdWc/VfREZHUKogiYlZkUxihsjD1CorgG1B?=
 =?us-ascii?Q?t/wBWN/7LNqWz9yq/i3eweAV4rUsDFOaf+Qivlnm25lHUbxjRnayDQSF7o55?=
 =?us-ascii?Q?8bOVi9owvC2hSaAi1l5iVS4hUu2kqrmvKj6lwF3a5oZAjhXqPV/8i8xhFoLo?=
 =?us-ascii?Q?FqY6qkXDkvFjtAUcatOAgi1jA5X9iC5f/qM/uYJW5pYDAkiXp/4lAr3aPMfj?=
 =?us-ascii?Q?ZdBdJ8JTrGJ20GVIXKLPijcwH9UwvMFCX+h9crmsAH7PBca2Fmva/KRoQiD7?=
 =?us-ascii?Q?4U/7w8g5NWErcg++jT1r/liFgYN4IE9aa8S67CAEz92kBvakmm8GXnqWjU+Q?=
 =?us-ascii?Q?a84Ok1vA+YOzgs6eNqi2G06FwF0Jeg/TJ/x1fzIUCBQzuuox1WTfa4/EiF9m?=
 =?us-ascii?Q?VApZ8Fl5R4DIQbrXDwdMtH7ght+zlKzs7yxv6cBvgTt86AlmuAR4h/kAksm6?=
 =?us-ascii?Q?fLR7+ydWQLU3uE72N9e/YSn0aVct5/YJGZx7Yq+tqJpSRwvRx7yvm/MltGWq?=
 =?us-ascii?Q?QyRJPzOUm+0rPvbZl3SWdx/rnEg8GuJN89NGMaIw6+LN+QtXm1M8Zy36rc+n?=
 =?us-ascii?Q?6qxjmua6VGnorKA/kTxJ16d4o8BtHw0XIT0tgzDs/7ff0JleJiwrQqj3FyyV?=
 =?us-ascii?Q?5ms7ZgzYwoKzlr7kIR2JQ90A5/tzYezZXIHyhArzuKN2EoLaKo5mG3JIVIty?=
 =?us-ascii?Q?SBfcFRsMuQt0bWJICX5YE+vWLpW+Q6OXRq2wPRz0KB0ZDqtPhaStmt3otyjW?=
 =?us-ascii?Q?NqyZUy5nyewAv6r5Re3SZdUYcaWjNctPtIcVnxDLu1331ZlFK1kkA0ytKRtw?=
 =?us-ascii?Q?/AxzbImwJqytaPKzwHErp3+MUMAcNh597REyEQV7INoAXZnqOgVX90T2xk1C?=
 =?us-ascii?Q?+LGEDf5cix8Sp24SCDgAl4yt6CyYfsL2c3pe+sQ3PpP4ktchzNn1yz8zAuOO?=
 =?us-ascii?Q?cm9Ly50VktSkZi3fvi68pb+kCVH4lnVfZ7a+tOe4VuUxL9WNmdmBGz82kHlB?=
 =?us-ascii?Q?9c+fg+FWACqbcWx9qC2U5k51j6XNko497dVqu/Gyhwbv3UNypLNH5Fch6/oM?=
 =?us-ascii?Q?RL8ErNOwYf4Rmq+pxATppqGtLtUxWgOD4WYf59msf8IWv+SOPf0mCrLtJkGT?=
 =?us-ascii?Q?iaAHv/wIekU0YtGLTc3K3Ocds5zVBxythyAjYdvsCmdY53GHfugvyBoC91GH?=
 =?us-ascii?Q?a3IcSppYD7DCvHOTJ+4yxA865o8I+gTtbwsjLbOEDm1gZ99GZNYezf5cdbCA?=
 =?us-ascii?Q?X9gwji1jwviObHKPTEhR6h8IzwrPod6Dot/iNX/is020tGA7ZHJ7JeHcNqa5?=
 =?us-ascii?Q?bJtEOVAi630ZNbl25N2R8FeoVVbfSh6cDE2D5VYxMeLNA+W0/7y56hL4Bs93?=
 =?us-ascii?Q?6jMVwcfaA/98JVDMjh6eWNT2Gu7AhxJmGifSVhbjcMMIIH6AGh2JbtGcEuJh?=
 =?us-ascii?Q?u7uVoYH+xL1i4qzheka3NE+pSSpuZ0FG6VRkywGzO1W9ql8zA2wK439VhDbw?=
 =?us-ascii?Q?zhPb/Q01zPxle6blhb3h/xiU2tDWeP7fGUB5tQ/geVdS3rvnxUYPznQ0Zspy?=
 =?us-ascii?Q?tDHP5OrPLRBwJ5J3eG0M5choZj36ejV0Ot+8FVAmeP+yqBT4Kt90?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94cc3e4c-fda3-4d4f-b9e2-08ded3498954
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 06:09:52.5108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jqdlEggHf1AAiK/4yc78iXBbR+1GZG2K5QIw7dEh67o0WUGm/kiaC8wOiO5JWm90LxtvNF84L/rKuIRh7/YA0fh7lTx7SbrNY6losRLeH4+E8Lp8W35JsK0K58iHJdu7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB16025

Current component has component->name, but we can't setup it via
component_driver today, so the user need to use
snd_soc_component_initialize() / snd_soc_add_component() directly
instead of using snd_soc_register_component().

We can solve root cause of this irregular to add support it in driver.

But, in the same time, current component driver already has .name which
is used as driver_name.
Add .driver_name and use it instead. Existing .name will remain for the
time being, but will be removed if all drivers switched to use new
.driver_name.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h |  5 ++++-
 sound/soc/soc-core.c          | 10 +++++-----
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index aa423865dbe7c..b2a362f3effa4 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -67,7 +67,10 @@ struct snd_compress_ops {
 };
 
 struct snd_soc_component_driver {
-	const char *name;
+	union {
+		const char *name;		/* REMOVE ME */
+		const char *driver_name;
+	};
 
 	/* Default control and setup, added after probe() is run */
 	const struct snd_kcontrol_new *controls;
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 7817beea5b3bc..e5860a2cc90d3 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -344,7 +344,7 @@ struct snd_soc_component *snd_soc_rtdcom_lookup(struct snd_soc_pcm_runtime *rtd,
 	 * to 1 rtd, this function will return 1st found component.
 	 */
 	for_each_rtd_components(rtd, i, component) {
-		const char *component_name = component->driver->name;
+		const char *component_name = component->driver->driver_name;
 
 		if (!component_name)
 			continue;
@@ -370,13 +370,13 @@ struct snd_soc_component
 		if (!driver_name)
 			return component;
 
-		if (!component->driver->name)
+		if (!component->driver->driver_name)
 			continue;
 
-		if (component->driver->name == driver_name)
+		if (component->driver->driver_name == driver_name)
 			return component;
 
-		if (strcmp(component->driver->name, driver_name) == 0)
+		if (strcmp(component->driver->driver_name, driver_name) == 0)
 			return component;
 	}
 
@@ -2808,7 +2808,7 @@ void snd_soc_unregister_component_by_driver(struct device *dev,
 	const char *driver_name = NULL;
 
 	if (component_driver)
-		driver_name = component_driver->name;
+		driver_name = component_driver->driver_name;
 
 	guard(mutex)(&client_mutex);
 
-- 
2.53.0

