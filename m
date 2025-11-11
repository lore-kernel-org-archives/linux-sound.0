Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011066.outbound.protection.outlook.com [40.107.74.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6AC12CD8B
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820344; cv=fail; b=VrBkm0fjpR7fyBGwzMtn9W3EuGed0XhJB0/fnFVKJp8EfzbFQHt8hL5Q4+FIFXJ2yR1EL9wnPCtuZ+farR7wh2Yo0q2SHNhktohq/lfHT9TjoxiXeqxKaZVz7qKVRNrkwm16WE8/ccexMMuBh208fkCgXnJ8XVNqRaoBVe+RKj8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820344; c=relaxed/simple;
	bh=a/SXazdScxzTNnjnMHAK5hqPac8O81+PwKFPs3kbrwY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=qTUCzRODd+aqewB7/3CVGzE2pYlAvhvUFXhqA6NVxmbB3aU0Uw/vHUOsTvb3celIWRPFGn8SrEhdhmnPtLFFbcXpiHpS1rdOcixKWkoPOGdh2NkHNQHTnJtjlhUhknk+jijvrPpWgoJQNUqqxRECw4Alt6urO5qlQBk0aotUdsk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=UI3kgXxQ; arc=fail smtp.client-ip=40.107.74.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="UI3kgXxQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wa7BsxsGV1zrFMctZvA3HWjy2be9z6WluJ6MPbnV5JJdbg2nArBcL0ajSzu6QStlrGaTpUWbeciWoQDvz3qUpPXtUhGXVTIzFJ7IU0MIbIM7tcHrKa4qtvCWWEXBetorkHuFUKT9SzG3SmJCntjDxagMW3EM0fkOxt03KCAcCqlyJe5xRgmZTdRrJkJ0BAyklai5RWWH5+kTGF6jieSa+7v1ueuimCGx8zUY78AWHlGzwQTi/iSzjh0lrqhEct20XhvrARGWeMTBMujfa/dm3scuqkWXx4jZSSfLMeMowwcekEhSoGekylHiClBcyuzW62vUf5K4J5N5l6Qm1MZczg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eSgSEtQCUek4087V4v+IxlJNJomOAY8LS20r5c1MUgo=;
 b=JVpshAvOZAXrRXQtiFz+jRG12PrN6N8/8AbhnkHUELF5JPkGqPuK/OS2STVmES2Zrk0F4xJA7+ljRuhX5vRiXe2EDGnLQT7dnt2ac9V/6n1ZiHkHD6t6FrgRUzxwnvRBK1+VWcD5NQQQhjonds0NHJ+7iC/S4jd9LUrzSKrOZ73HO0FlsZW054Mq6TTP5TjTOzFd69b5uTRVktcS3WURPXztdTpy2bgKfpjWdXRppMMwt1eN2bpBRoRtAD13+/z9FqQcVX0gyCsm54KQvwSjnev//sRw9GA09z9TqQAFk4a4rcxHKmVlHYntNijUsSBP4AkG57OuIK6qCIPcpTszOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eSgSEtQCUek4087V4v+IxlJNJomOAY8LS20r5c1MUgo=;
 b=UI3kgXxQGSjjuqoAcyjZayxCG8c3myPT0m77tkzwvkPzW7KA1VPJ3fWbgMJ7BpzXvBq1RVJEsklWfwq6413lVc/d0Yqd9XXh+rKJQQkE7asfkHExo9QesJcuuq1zpPkLh5+01iR7GIGPOIhTF0826b8WaZFk2VKrNxcHs1ZDFnQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB14361.jpnprd01.prod.outlook.com
 (2603:1096:604:38b::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:19:00 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:18:59 +0000
Message-ID: <87cy5p8lqk.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 025/292] ASoC: codecs: arizona-jack: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:18:59 +0000
X-ClientProxiedBy: TYCP286CA0338.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB14361:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cfe5c8b-b955-474b-6897-08de20b7e939
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pfPHUM1sUyh4nbTH0ziAr8ZKKDib5PJ8hY3Vf3zEDGBgYiryvlkjGOSwNofF?=
 =?us-ascii?Q?aKN/lxCgUHZ5wO04izbnRdLQ3mVFGSmyb2aKut8cRfVO8JT0mqNyUVrYf0c5?=
 =?us-ascii?Q?51+oBBql/luin0nTOHzhyZFfsbg/nFpKHAW76dTOH9HeLpeyv/EbVP83qKky?=
 =?us-ascii?Q?Odg9bD6uH1sdJxqamuU5y7K8ZbVffMseSFwUYzkEMAzx3h/nxuDRvIbEQtT3?=
 =?us-ascii?Q?R14XbZVJ3NPWdoYI72JTdVBJXJRp9+Dvhbbo/01gTl4OtVKetGIVme7BYJZi?=
 =?us-ascii?Q?2uc9U5DUDnpgorShkSzuOlicXd/xr+UxwMvq7KehmClyoVl1ep0SAjZapAdE?=
 =?us-ascii?Q?0V2GC5Ii6v7FhCr99B0kcFhWcJGXdNvQPGyzvgsn1Ddb5lllI7HHjSR3SZKV?=
 =?us-ascii?Q?IqB03QAKcaf181R/eSbfN0VUbUKCpgGqbVvhQfHTgv4ZqhhReGJcYwtgpom9?=
 =?us-ascii?Q?9++6/XHD8lOrdeT4qhlWSF9jhkNZjbGdN+rhiyuI/Bo9fFgtnb+U+D/CXo3+?=
 =?us-ascii?Q?blcQuLgL7QFOIBIkRSUbcpU+XhPMCZn/MZZqMU6W6AOm3ji1LxnDsL9/nY+x?=
 =?us-ascii?Q?cM6AREKtjPQvUsK5ua5lNKRAEBuRH4ADA10onySwQIXLKQM9Drap0r/rbJW/?=
 =?us-ascii?Q?GLNLxNRXRjO0ifA7G2EWubzcAmQslNr5bhmKo+R4+cHYIZhuSbz4umNQJKWl?=
 =?us-ascii?Q?nk6QVhIdC86yoNLEAHTfJQUkeg+gjf9zYO5PjTzfvLkMZDcj8KgjaaBrOCS4?=
 =?us-ascii?Q?OsafpKE/6bPtbYNPitkmjJ8B3fHtVNk/IwKQETeLpCrT9ALM9Q7/x8oCAsT6?=
 =?us-ascii?Q?XH+RXCanQesnPR1T4XtZt82tWcPSQN4RE0yfbKPKOj5vh2PNSzwTVuxDE0dc?=
 =?us-ascii?Q?a4dPTlSRmP/IQlvxrr/Hj0HJZiTK19PwxoXNzQiBhBQ1wwEGhBJmf/C5MHiV?=
 =?us-ascii?Q?NKZ9ii3KhPlO0DWvZmzI+xn249pVl0kM2bOAWZ4r+caGdjq0lhlJ8ND4eKpT?=
 =?us-ascii?Q?I8i1QojdP8ACypKwb8z/SbKr+0xCbdLjop2c8tpZJJo8rXpD8zKII032u3lf?=
 =?us-ascii?Q?AWMijks2pnz5aoSZKjYpi5we7UKgAebCzOGZ+EEmdozeZ9xf5q2qN515VE9h?=
 =?us-ascii?Q?1qzltDQpEqzDJON2PlNdEPI0lrpDxUixkPAvBNcToRV+QwORztdFY6bFdRDX?=
 =?us-ascii?Q?UorJkY3vLP1dRGAbLRHxr0twnIdHQK1e5dJAFUh3TjpO1MhTpTGvjKYAHOSP?=
 =?us-ascii?Q?g+SqbUtaXL0ZgGsd7GVM1ZEUeWCLCmloWW6cM9iFB1bxbt7EeNDVtpzE1iR/?=
 =?us-ascii?Q?7R4gP7sGtDz6glqgQHPbnxRfxG7YPMQ2ghsigasUd+ppnxtlXSO3up+dOvnz?=
 =?us-ascii?Q?OhkToTK8HD4kan+hMlr3ZFm5qLHTQhWhtmIu8FH09Wiv2ByAJ9TpfcVOVXvg?=
 =?us-ascii?Q?OHzPzFGKDoUijsMA4MKFklvMnZFNAhwh/p0bRgqDa3HtXa6nKitdNCNoNa6H?=
 =?us-ascii?Q?6KtkTEc4lUGnMVsbHZn56GpGuihIip5ddmna?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lRYrvKHxZ+PZr87Yb3aXwSuee4P2xvTlYS3qcb1WZa4W15gvS3CkQdqgT/cE?=
 =?us-ascii?Q?jmt5k7Fa16IBEbZGCYyPO0HntEMyMIg31cF95r8pVdFJQeMXBQ7RIrNJPCi5?=
 =?us-ascii?Q?rASA9EDeFjI7bURXf3P99nYeJLdhndJFysE4aD2OftcUh4tUJ3JdiwuHnSgi?=
 =?us-ascii?Q?AdDgpybXcbs+11npGm2O55akMut7n9BY5xwcPkzLqc79X8fmBV/eIJ4RXo1t?=
 =?us-ascii?Q?gIi2Vz6Yk8GKbwyxvUQGOmajo9RF27SEALvsxI7Mnk6t7vDL0Y2CyNeyu38t?=
 =?us-ascii?Q?sI8KjEMiId7ltehHhAYHwZhZynwnB/6Qc8qK9pcyPfn1UtnNsVnDBIPEwdcm?=
 =?us-ascii?Q?0618yIOM63vqe4Cm1eF1LkxWRciprNArqcCIGJ2hwp+Y0GxBT/3pBLOGyyJd?=
 =?us-ascii?Q?/pgA9E3BQhRd15HWbGEdlWjFgGWOH/ZlJ2CY1zr9AgyGumJyu2Y65oS//Z6u?=
 =?us-ascii?Q?vaXVhG3E0nKcAxvk30mTtx2F0civ6K88VWLTSluJXxwf6k3cbQewGhjZdwRf?=
 =?us-ascii?Q?rQKB1DkS+WIgMNM8FIxaLGkzRBRJGx/7CVk0Ir2GLDcJxnULwZ4m0rFsbWBW?=
 =?us-ascii?Q?/apRyoK9UbqBIhqLfUKSokZR8KhKbw5MMxFTKtAAJoV2KHL4tZHw7BFsyvI4?=
 =?us-ascii?Q?17YaPUWcKD6vpNk8SUeHjS2q27Mj3mc5jTfjgD7WN5XSZXkhpb2cSlGappfF?=
 =?us-ascii?Q?YDM0C2KKtH9I9WP24SYRmHo9plzztUaYI5Ch3S5RC4eEaM1pa9S7I0tJrcqX?=
 =?us-ascii?Q?capQMRao32MKPjmKWohnnXO+SMQItC+coTHTEex1jK326KvVaOK9ftX7U3r3?=
 =?us-ascii?Q?9FS+azA/IJXPhQvS3GOKDGU7O54NEUlXH5oTQtFK+/d/KcmCyJWWR/37lNws?=
 =?us-ascii?Q?h3u8/OjOhHvIAMvjJ4/giOHuJQ5PIaTVj3cObOulDJSn74Q+8nXci1loLrya?=
 =?us-ascii?Q?ZVpHgXuEjSieVVnayTLQD+B+mSSMoY5fwFlPPFxScFH6Bu1WDpoUEMjzDutS?=
 =?us-ascii?Q?Z/bFlgLxk12BoWAZYb4oWUdOmOauicB5FqqA2qgR/38E1/gMIoBNW3XBsOEI?=
 =?us-ascii?Q?2bCM/VrO0Q1N7eO+yxF/bi9c0IjRCL4oD7Q//ZgzK0WOAvq0xtX+HWsrT0qQ?=
 =?us-ascii?Q?MFMAF5v611eLTIp3VnvLyZUa3RzqiuKMjWuZR44Ln4rUF0jk1egO0spOvxrs?=
 =?us-ascii?Q?g9zkCUVOUPfZ4oJvLRDUet9JnZEpME2gbX7wA0z5jSJkK+rgi7iVM3EgeETP?=
 =?us-ascii?Q?6Al7wPKlaWbjiJ62vi2ytvylBpuMT/1ln2lEzNkLtqdWMLx28wSK+lRp8qdS?=
 =?us-ascii?Q?f39sI7TqxQMf6QK9q8CGGkM+8WK25ABeZ3zYz6w7Ep+ckQgoHwWVpFTWxEGC?=
 =?us-ascii?Q?u/fi7Hycmg544X6mwoqXj1QZvAcPdAKRuD9x7oec68uCzFgSuJRcBkfAYV9/?=
 =?us-ascii?Q?bCqdf/Ke1cbeymgeW4TJLPy6NK1afFxcOtJzz/90U+GmIHZF23FKVhPKUmlB?=
 =?us-ascii?Q?WGIBrbA7sTPv8cZkkZFfR8d2UjFrDbM+OuNeoQEOpRvJbRV9UuxoYvDNkOO6?=
 =?us-ascii?Q?6VHxxPTWHKSBj7G8oNqqHlYGJStv8mGuCzESOkGKV7BdgG1Qgc6F2jxSskr2?=
 =?us-ascii?Q?V7yYD6IqqjonLq5pZgU7AcA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cfe5c8b-b955-474b-6897-08de20b7e939
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:18:59.8610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: it7FqvyFViT2BWRV2Sbln9DJnZqR0AQq1Hd0MT8wxLRFCY1ylnDvB429h9dKvuCbAWsMvPeifRwSOYThi8KLefBaxE+Jxese1+kUVIhAapdsC603VVbG/gM54100Tm+x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14361

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
 sound/soc/codecs/arizona-jack.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/arizona-jack.c b/sound/soc/codecs/arizona-jack.c
index 6b55610ad535d..303c1d44ebd8c 100644
--- a/sound/soc/codecs/arizona-jack.c
+++ b/sound/soc/codecs/arizona-jack.c
@@ -212,17 +212,16 @@ static void arizona_extcon_pulse_micbias(struct arizona_priv *info)
 	struct arizona *arizona = info->arizona;
 	const char *widget = arizona_extcon_get_micbias(info);
 	struct snd_soc_dapm_context *dapm = arizona->dapm;
-	struct snd_soc_component *component = snd_soc_dapm_to_component(dapm);
 	int ret;
 
-	ret = snd_soc_component_force_enable_pin(component, widget);
+	ret = snd_soc_dapm_force_enable_pin(dapm, widget);
 	if (ret)
 		dev_warn(arizona->dev, "Failed to enable %s: %d\n", widget, ret);
 
 	snd_soc_dapm_sync(dapm);
 
 	if (!arizona->pdata.micd_force_micbias) {
-		ret = snd_soc_component_disable_pin(component, widget);
+		ret = snd_soc_dapm_disable_pin(dapm, widget);
 		if (ret)
 			dev_warn(arizona->dev, "Failed to disable %s: %d\n", widget, ret);
 
@@ -287,7 +286,6 @@ static void arizona_stop_mic(struct arizona_priv *info)
 	struct arizona *arizona = info->arizona;
 	const char *widget = arizona_extcon_get_micbias(info);
 	struct snd_soc_dapm_context *dapm = arizona->dapm;
-	struct snd_soc_component *component = snd_soc_dapm_to_component(dapm);
 	bool change = false;
 	int ret;
 
@@ -297,7 +295,7 @@ static void arizona_stop_mic(struct arizona_priv *info)
 	if (ret < 0)
 		dev_err(arizona->dev, "Failed to disable micd: %d\n", ret);
 
-	ret = snd_soc_component_disable_pin(component, widget);
+	ret = snd_soc_dapm_disable_pin(dapm, widget);
 	if (ret)
 		dev_warn(arizona->dev, "Failed to disable %s: %d\n", widget, ret);
 
-- 
2.43.0

