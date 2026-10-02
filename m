Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010062.outbound.protection.outlook.com [52.101.229.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079D8339381
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 02:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790909520; cv=fail; b=fin3V4lMepepKz82A9RQp0DWv7wDDVz5M0OYtULuO9jRoG/GWPeytzhvt0gEQ4HoJcWye4T+ASEFHnEGwoCmTrftiWXr+41fJeFkdZkdeT66cuASDuNteIa++x18GlvzpqJG8O/T5YIFK85NbnU6z+7BHeM5uhibRAF3vYU4JxI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790909520; c=relaxed/simple;
	bh=vOKkQlJJJvgSDxtBtbUfpBtTIUW2NHK6hqomE84oG5E=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ky2nwqhkv26QvWuKzkUGBLu6vnrASaqd48zWM0f1uLI4ccFIm9i5GjKpAfs932TU9gy+w2gFhktgYSqBB281HiT9YhT3nh00/X51o7QZR/tpRJ86uwTuIZ93xLr/odwPuD2KdRSFcdOlO27v2YCKae4bwUZFisojV/RKbSbAInM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=B4g7Ig6W; arc=fail smtp.client-ip=52.101.229.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="B4g7Ig6W"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HzHFpj4aP1z5AkSmZshF2ErZH6VqadQm790KT7fn76i5rUWFdPkEKoeZpTuuagiZyqSpTHaydmnIVkiYhf3Ze2TJpBIjJeSN/CqQ3Bneb/2G32OLCzalEoyuXzrht5IkGROOGYQCPU1QgD03qffjKO4uDmoiupaZJIaRNdKQbEb3zlsEfQgjtNa/p4B7bVxLy4yAIdL52VrS/6yOc/UhHloniXjeZlYyW6FmWu5wOdpwExaKCq86nTdNTE4u4cTZpk3X0Afu89WoxsCj42mMP8I2xKhPZLaDbeVFxwlnkuka05/7EJG3aKreqvfzMA33aRvUamegrt2Yu2Uvq9bycw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QYlk8FuwfO2A0HpauUGiW3mSdGYp758ibMjYXDys++g=;
 b=wpemg62wTkp/iQYQXvgyed5PV4/8cNHxjV8McJeBExpupEYRpGA7cfsNE4KTn4n6oOLvSU+5FwOtaQqFeDBcW20+hP+As/y/sqlQXOiHh1KtXz+/3QlKVEUplI90Bu2NOR5q3m+BSbiHj4DrmSESawhRlhYFGXqWaHe1OQGp63CZBMJAcKV4xljrNp5lOCWpB1Ov+ahpGgXROwK92kfC1R5e7+UFxIIVlrspyOpbSJbOAmJtu39NXSW4GypLbs1imz6RMa7+047i+5149+Ez4iNO6E+E9lqT1XUyAT+UFemwQnFPLe4hwCvP0BofbiEp1pMsi2tQ5vOD5I5btsbiOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QYlk8FuwfO2A0HpauUGiW3mSdGYp758ibMjYXDys++g=;
 b=B4g7Ig6W/acUsL/C40OnQCREmG2s7UFgSmqdoUkOyBY2XIsQtznzPAhJnuZIkfW693Msv2650HSfxve2tyKv28uwGzPKu2g1SVrib8mZPptc0aMByKbXN8QMfWVlXl6JdY6lxnlA6RxDJty9IDzoQdQsZN4plfqd/OPUHEZLLg0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by OSCPR01MB13696.jpnprd01.prod.outlook.com
 (2603:1096:604:37d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 02:51:57 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 02:51:57 +0000
Message-ID: <87ece86chf.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 06/13] ASoC: soc-component: move snd_soc_is_matching_component() to soc-component.c
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87mrsw6cje.wl-kuninori.morimoto.gx@renesas.com>
References: <87mrsw6cje.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Fri, 2 Oct 2026 02:51:56 +0000
X-ClientProxiedBy: TY6PR01CA0004.jpnprd01.prod.outlook.com
 (2603:1096:405:3bc::13) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|OSCPR01MB13696:EE_
X-MS-Office365-Filtering-Correlation-Id: e28d80ea-75a2-4790-8a05-08df20301f8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|52116014|376014|1800799024|11063799006|38350700014|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	8Z4p5LUwu0LuXhZ5mv3XpLBO7k7IWylNMsXX8JYachvdYhR8Di9U8+vFMvxkw7C+q4zOY3J0ZdRpE/Se51tlChfRelgE32fifeigKZ+rBmC9aUc7ap7kFinzBWU5UEFnvvHrmoglVmRCNjBCsgwp6POCoI8zhe+rgAIDSqTlwUn4DPtSvjiq9SgVBltP2hbRGlsubVHqmo656Y4rqZr96wZavRyF4Ox8z9vwL4QD/Q7TT5eXMm1WMEygWhRmVzLVqLUXi7gZooZd+xxVZ85lclsaDINJhiYN7lpYrPp4Kr1dIrLK8DhYl+EeIup5wrEQq1m0u3hVv4AuiLHKvl9+fb90/1yHq4BxctDJ57mhFqPrmL1lT6f5C2EN2A/r/BhcKNJ5Tb6uVITDI4M8g2sw6uVZeNyhr/XireBrNObqbRgiVrGmmA9TJCiXCXXASOxpcV3hlAiPeoTuRycxEQXAnu1XDK8vydQLLWKI0wbtlQwSbzTR7Mb5yiAIkBR3fJShQid8f0C6+t/2NnmaOsK1MhgMK8tcECha9LhFK3qxLZNIu/58unB+c3wlvxE0SwuZG0WdkaSMJ0tTzdZ1rASmyViDZ7wIqWMc1Wx9XFmESK65ucYvbK2zPka1pER0Ma6IlJX/BA3k5g6dxWgHkndTVS8Kl4pxs6/z1N9Zxmj2eEkVCvu2/AOIwNOzGtougXNB7mseFLsXh/3r9BB0Ww2jgi+gZyLEcNrfVjFTLU+30G8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(52116014)(376014)(1800799024)(11063799006)(38350700014)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?k6WgPJkAN0uRAxnaiUic2+1ailazo32amhBWHPv37FpbCZDXl7icf9m7kq?=
 =?iso-8859-2?Q?E9r1A5lifFvIFSjo9NtbNZyVHf3sqO9Hzs1y54IwYNOrgxV0nE51JoqJg6?=
 =?iso-8859-2?Q?b7ZVL5z3W6i8kC3QflrqxqUm1xGIZLK32QsXY7W/j80WUAtJT0a9We28r8?=
 =?iso-8859-2?Q?w3xnaX3NUdUd8ntX1QdaIy6lNWYqNPc5P4svKEzhSTLLcmt2fRt6XbcgfX?=
 =?iso-8859-2?Q?1XKPZzm4UxsxlMp1IWK0rvxD3PMgoFn0Xqc5TyTzw++pzvY1udlT0jlzxG?=
 =?iso-8859-2?Q?jAo0HBqRf1k0vMH5dFHPgur8PQ5GIllTDS25afAJ5Z4SjAMFDjlfy2whsa?=
 =?iso-8859-2?Q?5hEhT1AKFoZR8iFZLKYwemwWxUCXgXj8ZJPnvgzxz9j6Fnsn9gQwy7qH4c?=
 =?iso-8859-2?Q?liuBzFMGN5nsNg2qA9TpW4lgD4BWyP8VEozyOTdiMhleiYPgmNhfa44Dur?=
 =?iso-8859-2?Q?VE8C1iySDWt+Cj+K9uhU0Txfo9IOTQrUQ0H6i8JksheqB0QW/NeLE/ri21?=
 =?iso-8859-2?Q?C29qKrixtGIPk6ub83uTpZsGFRCHIuDdWH/d2Dtgwq9BCHjIpmtEn0moxE?=
 =?iso-8859-2?Q?XyqSSaobiqChrP4PXd/KFEQmT1iC6B8FFwgXRQoB+OUz1wfLdaO7CUWTg5?=
 =?iso-8859-2?Q?sdk5l5kIEUwUUTjxZV0INmxtJ7CrwiimLiI4IuRT9dJu0hgtn5im8jQK8y?=
 =?iso-8859-2?Q?+ifsdQX0PnlfNgV1HshwJMSQRm85Dckflw1SRD8Ubl4kMIbTBQJo0KtoFF?=
 =?iso-8859-2?Q?PAyXkppj2Yq9gD9diyOvl97yHKs6IrEoCag/Bj5BvHAoy6lqDy/OuhLJj/?=
 =?iso-8859-2?Q?MIsF0ZSovjBHfAAYWKeQeXFFVqxnie/SZrJ775eFlC5lvs8zfwH+tkEg2K?=
 =?iso-8859-2?Q?GBOeUN+V1hUwpUrMmmUxhvkghJWph8TURZpNjIluu8zvlMiJLppvYHkbq9?=
 =?iso-8859-2?Q?RsGJuxlT35FcsPSeG1RtwUPcBiaNOx6YGRnPgmc+CyjhwxcLAbsuGLFTyA?=
 =?iso-8859-2?Q?NttjFNMlIKB5uj9XF72Ts2vLTloPmypayT0vvRn/GfMTz/tZ+TpOk9ytYH?=
 =?iso-8859-2?Q?G3YwSiqQT8TAeNZB7Gt9gwYRI603iCEz9fZ5wLphpxABvL8z1YbUzDStxt?=
 =?iso-8859-2?Q?d8GpBr574YGXh9N3l7592hs9U/Of98kfbGXO544W7ehR4pCvcjQrw6v6q8?=
 =?iso-8859-2?Q?jEGppPYMVRQMzcjmtJdZIG5x8Z8ywBMQ9xFg/JU3eQVG3vCgOgvOwq5o/N?=
 =?iso-8859-2?Q?sNND7PnSoNCqvhLW1CkXAJjmlhVTdPeDbH+yvYf10w32ELoSf48aU0Tovj?=
 =?iso-8859-2?Q?i3qvedcA09Rl98v0D3CpPnR/z6e85iuzVR+4BzSEvADB+O9HwsUg7OBCqL?=
 =?iso-8859-2?Q?3kwnMg5k4bdfCI+14gAQv1oPNZTFkHj+yw9mtYrSp6t2BaDN8TmPbeC7Ao?=
 =?iso-8859-2?Q?gu8rNZjV7HkOsQRBIcrU84gBgjHqssdyZBpfncagAQkrgtXWVX1naeOft3?=
 =?iso-8859-2?Q?0AckStZEjMSWBCrBnef9tjI97rTyzUtGciBuYJ/8jsovbXNPhUTSXt5cUj?=
 =?iso-8859-2?Q?Pp/uR0wtUwVWoTF1cSwSl012QCFNkFkVBENONqTT7x2UHVavntT+hJu3Bt?=
 =?iso-8859-2?Q?yCuwRIJbN9bB3vqpvWiZ1EYPnxBbgucuXMV+ghVF7Fmh+z4xbU5DdTE1zN?=
 =?iso-8859-2?Q?pNLdV0vf6oUXBx3h6Wwwl9lLp5KjPcG/CN7K2DJvL5YKqQo0wb94o8yT4F?=
 =?iso-8859-2?Q?y0cYBpbUIOB1p/S5TZtIL1DmQqjvoCc+c7MCF2y2DEZh6xszFZ1P3MiGs4?=
 =?iso-8859-2?Q?elAMHY3IOaODwFf2tM1Tpz+xpBlbQ/aS1SMYP+WqJ4pyEK6Kgtjw?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e28d80ea-75a2-4790-8a05-08df20301f8b
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 02:51:57.0916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MQz0YIrK/8aPiihEVBaXsIVB/82S3M+eYojd+9Pio2JWU0wSIMtnJNSx1FKImtm8eHjZbFeR6HiSIks133ctc/FojIw+0bAakQywOgWESwi3XBOxAYAH3L6SbXouKu/d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13696

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

Move snd_soc_is_matching_component() to soc-component.c

It renames function name
-	snd_soc_is_matching_component()
+	snd_soc_component_matches_dlc()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Alvin =A9ipraga <alvin.sipraga@analog.com>
---
 sound/soc/soc-component.c | 27 +++++++++++++++++++++++++++
 sound/soc/soc-core.c      | 36 ++++--------------------------------
 sound/soc/soc-internal.h  |  3 ++-
 3 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 11acf0d42213f..9622ad96d4691 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -1306,3 +1306,30 @@ struct device_node *snd_soc_component_to_node(struct=
 snd_soc_component *componen
=20
 	return of_node;
 }
+
+bool snd_soc_component_matches_dlc(struct snd_soc_component *component,
+				   const struct snd_soc_dai_link_component *dlc)
+{
+	struct device_node *component_of_node;
+
+	if (!dlc)
+		return false;
+
+	if (dlc->dai_args) {
+		struct snd_soc_dai *dai;
+
+		for_each_component_dais(component, dai)
+			if (snd_soc_dai_matches_dlc(dai, dlc))
+				return true;
+		return false;
+	}
+
+	component_of_node =3D snd_soc_component_to_node(component);
+
+	if (dlc->of_node && component_of_node !=3D dlc->of_node)
+		return false;
+	if (dlc->name && strcmp(component->name, dlc->name))
+		return false;
+
+	return true;
+}
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 59a8f44e249a3..11e25ac7235f2 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -785,34 +785,6 @@ struct of_phandle_args *snd_soc_copy_dai_args(struct d=
evice *dev,
 }
 EXPORT_SYMBOL_GPL(snd_soc_copy_dai_args);
=20
-static int snd_soc_is_matching_component(
-	const struct snd_soc_dai_link_component *dlc,
-	struct snd_soc_component *component)
-{
-	struct device_node *component_of_node;
-
-	if (!dlc)
-		return 0;
-
-	if (dlc->dai_args) {
-		struct snd_soc_dai *dai;
-
-		for_each_component_dais(component, dai)
-			if (snd_soc_dai_matches_dlc(dai, dlc))
-				return 1;
-		return 0;
-	}
-
-	component_of_node =3D snd_soc_component_to_node(component);
-
-	if (dlc->of_node && component_of_node !=3D dlc->of_node)
-		return 0;
-	if (dlc->name && strcmp(component->name, dlc->name))
-		return 0;
-
-	return 1;
-}
-
 static struct snd_soc_component *soc_find_component(
 	const struct snd_soc_dai_link_component *dlc)
 {
@@ -829,7 +801,7 @@ static struct snd_soc_component *soc_find_component(
 	 *	CPU component and generic DMAEngine component
 	 */
 	for_each_component(component)
-		if (snd_soc_is_matching_component(dlc, component))
+		if (snd_soc_component_matches_dlc(component, dlc))
 			return component;
=20
 	return NULL;
@@ -856,7 +828,7 @@ struct snd_soc_dai *snd_soc_find_dai(
=20
 	/* Find CPU DAI from registered DAIs */
 	for_each_component(component)
-		if (snd_soc_is_matching_component(dlc, component))
+		if (snd_soc_component_matches_dlc(component, dlc))
 			for_each_component_dais(component, dai)
 				if (snd_soc_dai_matches_dlc(dai, dlc))
 					return dai;
@@ -1155,7 +1127,7 @@ static int snd_soc_add_pcm_runtime(struct snd_soc_car=
d *card,
 	/* Find PLATFORM from registered PLATFORMs */
 	for_each_link_platforms(dai_link, i, platform) {
 		for_each_component(component) {
-			if (!snd_soc_is_matching_component(platform, component))
+			if (!snd_soc_component_matches_dlc(component, platform))
 				continue;
=20
 			if (snd_soc_component_is_dummy(component) && component->num_dai)
@@ -1334,7 +1306,7 @@ static void soc_set_name_prefix(struct snd_soc_card *=
card,
 	for (i =3D 0; i < card->num_configs; i++) {
 		struct snd_soc_codec_conf *map =3D &card->codec_conf[i];
=20
-		if (snd_soc_is_matching_component(&map->dlc, component) &&
+		if (snd_soc_component_matches_dlc(component, &map->dlc) &&
 		    map->name_prefix) {
 			component->name_prefix =3D map->name_prefix;
 			return;
diff --git a/sound/soc/soc-internal.h b/sound/soc/soc-internal.h
index a08e6e8ef17f3..76353d52ce971 100644
--- a/sound/soc/soc-internal.h
+++ b/sound/soc/soc-internal.h
@@ -40,6 +40,7 @@ void snd_soc_dai_active_update(struct snd_soc_dai *dai, i=
nt stream, int action);
  * In soc-component
  */
 struct device_node *snd_soc_component_to_node(struct snd_soc_component *co=
mponent);
-
+bool snd_soc_component_matches_dlc(struct snd_soc_component *component,
+				   const struct snd_soc_dai_link_component *dlc);
=20
 #endif /* __SOC_INTERNAL_H */
--=20
2.53.0

