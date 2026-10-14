Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010042.outbound.protection.outlook.com [52.101.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9CD3AA4F9
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 02:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791946745; cv=fail; b=MsIQ5N6u9fcZ3AmB1grmiURGebHDqpMBYxOPykqYi5JoycACJIQ87naLgumzBeIiUtrWWIb/NMpAhM1l4vBWiUcqe/mU80fhtKVraqfwQauc4ix5+PDNrZeT6WnFvPkTvhuaWdegWFJbFO+23rn49e9ZUkuOLpMZEGu7aBIFX/0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791946745; c=relaxed/simple;
	bh=icmE+thuMv6Vkz59659xvYBkXUk8gDJfFqJXYPeITyY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=TelGsdHxMI0OVo0ETOiUL+BEoT6jUFgqLduvsT/0KeDV1Z0Pj1rOfu6z7JV6qLOMptxWO6hUPDPhuvT6xe5fKX1Q9jLvUNLxBKIf04+OhIdj0ftpf1jmuvA3bjST4k/Ju+Lp1t7/xsDoUwNmnho5JQ/gDGIJie52RCU+TnnYCow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=DmEODfQR; arc=fail smtp.client-ip=52.101.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="DmEODfQR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iWXbNnsipHq8oBU3jR2+aXfGhuM3HqWQIlYsmeruyVDDKxrL9zwvBB44OVJsmzsNmUHPIddW//1uuFkUGQrQgTPiwTX5SahhYH54GZRNMnvUAvA8LwyfGnaOoS0CKp44X7ly7WD4ZMebNhV5wcDsGodwJYkWiz7hwLrcrRh/z+61LhzGmy/ESccm4bMY9jEGXm0lo30tgaZUOctC6JYcJF5Z9niedZmDm5u7IKGqbhYLCAHdTEKU6EPPX4J7oMKTsBzTB/pgZy3rmMtkpLeOYrFIh9jG6NqX1okczG3VtaQqQqNJjTLtpxo2cmAs7zMRyufGSx/MX3/NYjBd8I7/5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W0l7bsrnFFcEcoqk0RhMvwWp4SldhZwOBurP0q43W1Y=;
 b=BmFzjChDJZ7qI6QXOxh2wG75PdFn+Uq24NxT6v8waA1rxEfyaa4iZPvh2Reye93n16PlHhow0jW6u1Tr/G6x087JuBAh/FsNSoS0Z/EypiL2on66fc5uPQ9suh0cWk2fmT32lTfn/E+xsyJ7mwrfzphvdR+5QiCs0EF9BVg8vreSEGBXmerjEjJ4apIZq6ViDadabomi4SxLoOZ51jGtffY8fURPdhh/jewRLt6TqVqQ9rPEIwLwpoJBefqRL8TVgOoxnNLd6v6Js3U9Vj/5vkkfXFbMeRGIaOEvffXPu5tads4vhW2v727dk8v+kpEpMxL9e2ssjPVlNQ6JgTOeuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W0l7bsrnFFcEcoqk0RhMvwWp4SldhZwOBurP0q43W1Y=;
 b=DmEODfQRayuM0eVsUdhj1oNhp3iz5TYru3T+HVXtsEvusDA9SSbO+q+p2H0FQSbZApwSN4E1e/BpwTWySWOr6cTq8edNSeoUkXNQs2SvkLZZoGK/EgLWv+jSQtw8o5YxcwlSsWZrJOe6Yht21wmBFLSeXpnYZZo3Wg2uRSZkSKM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS9PR01MB820914.jpnprd01.prod.outlook.com
 (2603:1096:604:50f::14) by OSCPR01MB14695.jpnprd01.prod.outlook.com
 (2603:1096:604:3b0::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Wed, 14 Oct
 2026 02:59:02 +0000
Received: from OS9PR01MB820914.jpnprd01.prod.outlook.com
 ([fe80::12e4:c507:3730:2294]) by OS9PR01MB820914.jpnprd01.prod.outlook.com
 ([fe80::12e4:c507:3730:2294%6]) with mapi id 15.21.0496.021; Wed, 14 Oct 2026
 02:59:02 +0000
Message-ID: <87h5ipyolm.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 06/13] ASoC: soc-component: move snd_soc_is_matching_component() to soc-component.c
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87pkxdyoml.wl-kuninori.morimoto.gx@renesas.com>
References: <87pkxdyoml.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 02:59:02 +0000
X-ClientProxiedBy: TYWPR01CA0038.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::8) To OS9PR01MB820914.jpnprd01.prod.outlook.com
 (2603:1096:604:50f::14)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB820914:EE_|OSCPR01MB14695:EE_
X-MS-Office365-Filtering-Correlation-Id: c08c5ea4-90cc-4ca0-dd9e-08df299f19ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|52116014|366016|1800799024|38350700014|56012099006|11063799006|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	1POeG+dbZPUtsOxbEjPsrpS0iaNjy+7JGU2iqTaooclAKoG1I04H/Y/ukQnPJ7HOBZjPGVqaJPfH6r74NXrY+iieEmkuObLY0mbgvMmQMJ6NrLQvf0zpEDooIemCLsrm5yKJNRhRXyah5HqV97hu71EwO502o3l4C3hb1HqHTKXQm0TtV17SiSbeKOajYB1aGsD6/Ut3Y8mPDmCsz+h6TUX7gIfvkouUP899KbCBJErJhVxQ6Lnmy9G905aXHxVna7X7rg75vox6yhpyTWhbUTLHluZOLPVEMdF2KQqDx+yFzE691ZagP5vbwv+xYQysWdBiPYY/L2y6UBwvfpWBBMPsmsvULy6ggfVuEpJEUAPCuR/3Ip5/PNblRJ9CzRLC4WiqGTGIgBXamh7vYDNGH50cHdAY9Ai+XzSmrd0IJ5aJ70A4vHlwaLr5JBeP4pc43Ci9/6kWw9M5gesLQVGAKHKmxqtLcRVwzNgRMv6eMMIjtcAxUo/He0o8P28E6Gb9k65Jgh2A2uWSR6pQmu0NlW7tRg3HvFJYzf+9kWLIhAsWJHh3/eSvHpKjOe+N7zLdniHwruRHNQGhTEAP8XSjNSGYAzocq7b5b2Qke/LmuYFbvkebl2NbjeJSbZnXCO1cCIcFdtjUci7uR5zmpDk2NPaXbC+G9G1x5bRR9lfyyuORb1FHIPITpm2RBlScPmzWp6t/0fzHvIZYueoiWSfPHRW5Z5NfiAMzfY2VKcsKm+I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB820914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(366016)(1800799024)(38350700014)(56012099006)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?Wz0omf4KvzCjN2fqsZaAn9DFbwxIBERgrDBNPU0NXCp7k88BGg4SAFUnBI?=
 =?iso-8859-2?Q?5XvLYhdErwgF2cLHIUspvF1ibMdjWU6FAQI2YdxLLxkAMrPledXRTLZdW8?=
 =?iso-8859-2?Q?cezwK5niO05ZnJ3Mw4U9ktClrmyXZEANaFg7tS0mr17ZXYD4zR7o2XQ6ks?=
 =?iso-8859-2?Q?Erz8KQwflwJwlkCL955HhJQgzf0JK6NR/JOPKjrQemWxTxqOaMbyxLIXQ7?=
 =?iso-8859-2?Q?WuHZrhV0f225RjWNN6XuX+Rj63gWvejHkaqCu9vr9IRak4uiKel1DFd7fS?=
 =?iso-8859-2?Q?VrM6rH8T/e79+HWye+IenmJlv7H6M3iRy/ThlSvg9SJ+I7CZbE41yNLJWS?=
 =?iso-8859-2?Q?2j2VqbTlKxePJT+nYPwOvVvtm0DGXkDlFt0pWweXE5pHPTZC6MoYMWK7IB?=
 =?iso-8859-2?Q?Y2jJ89wjXg6lHZ5yrYg/q4pPHm7WXPuB1pw/vBPORj2bgc4BL1ndv4E60t?=
 =?iso-8859-2?Q?ya/PZCnIyf/BauyV9v8boTbCYdhCwYtDUPE3bB1fvM7B/dz3Jp3yghZjCO?=
 =?iso-8859-2?Q?GdfcZ16lubrkyZxN78St0YE9Ddp2ZClP3VykdXV+dbRZloIqc3Pj/FmRmP?=
 =?iso-8859-2?Q?DWiKbCj2gPmtnPWo1hWt32PyehKZT0oZmTrX1/4EVv3R9ZPfMN6SLHAMMR?=
 =?iso-8859-2?Q?o7svE2nR7N4w+5F6KYO7pCvzkJi4T7LRIffq3KQzmi/uZz5h29a+q0PudT?=
 =?iso-8859-2?Q?oXwNX8rbkv8y/jq/OAIzxkTHHKDNFV5g/ZpsPh0DgybwG0cEYUDNZsQ/PV?=
 =?iso-8859-2?Q?3Di9kqsZmKwCfIAXbQ5mTjFbTJhk2uOPHhWhDdhgBDVGBy4pYHVbOBHah+?=
 =?iso-8859-2?Q?s7HKtgGZti2YF4uDYE/yJK7hhW7PPN3dmz+bK+0VS9dvuCCAHj6wqeD2Gd?=
 =?iso-8859-2?Q?YR1PLyuY0XwSThc8eLN5KOhlbFTso8+MDgt1pRb7w8M7Y1YXIyyy5PgImP?=
 =?iso-8859-2?Q?zpubsmjTZNSAVzis1+LmztO9K99uj+gmcV4disFW7TQbZO5SiiUF9bswuf?=
 =?iso-8859-2?Q?aPOS3idcp2cVcDOHZML9dRdd9qsok0L4lumACMtRFlbx2mH8kWIA5X7gG0?=
 =?iso-8859-2?Q?yq2krcZMUYMCNXaiS3G/NXk/i9J2tyV+n91DiPK8zIa8zxTl0Yz6BLYMaa?=
 =?iso-8859-2?Q?nYHigQYAljiQn1ExWmChkPuq/UtgWth4gitWgVB9AnGzvsVXXeQAuvZ+gs?=
 =?iso-8859-2?Q?pgW5XBIW4D6VQZ0VATyTKAOC3U2EIGIpAcooz727gVmsZgQgfZiMp4WAf5?=
 =?iso-8859-2?Q?wKrdlJ/mWnmFgiTVBilrmcobfQFYcGDTvEIz+Pybj5K89+BuxHB43zISce?=
 =?iso-8859-2?Q?rg1fcEhSRzLPZnazYVLIowdKU2e1L3hTYqBwX5twKuY292TcyugJ61q0po?=
 =?iso-8859-2?Q?eZkJhbauFBHCEvP0/xSpgCWrgsX9mOX7+7HWwu6sHrgaR6hu+Moy1emWzD?=
 =?iso-8859-2?Q?xmSvixBVgLpwsxjhQnKbx+1cddrXRHBipCBtg0ZV9y6ehn/1GTHAFf0wMX?=
 =?iso-8859-2?Q?wz9MUXg5IZTMGHtwcZzHfLSeL49CmO8XAbsHoT75fBW7iSKQAnnVG3ldYD?=
 =?iso-8859-2?Q?khf1S0X1VVGZ39iBAlBt8QIZeJkRO4YQt14ImYIkGigqhj2iQvBHf6l9E3?=
 =?iso-8859-2?Q?zff52zI1s/9N1LDTXMzs52BCPKdH+ADndRakmCanS4q/XFxVrTxpz2eK2s?=
 =?iso-8859-2?Q?3nBcwCZqbhyfG5UCqC5+AT2od92wl9s+PgTE1RjEsfu2KC0bYbWI/3JZiX?=
 =?iso-8859-2?Q?EeTeHBF0TcgdsLSsI/zsSkKXmu+hpT6c7w7OBnq60t4zNdy8uhCLt/yj0a?=
 =?iso-8859-2?Q?UjSyqioK3jcBizBlVaubrotkLUJH7OWpcRsCmmTZu45BMDBYVZG/?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c08c5ea4-90cc-4ca0-dd9e-08df299f19ed
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB820914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 02:59:02.2232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pw+XSgXlC4lnevcOM3WgUbdfdB7Cu1XbOmVNMwPEn0jqtcT4F9z29ga94sFOh4CHqpjETfmhO+2quCiwZMRXe24SYNZaLTDLbBmF7fB6h4aQ8U7AzFr3ee3kf5u1pLAI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14695

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
index e431b07159eb8..0635988b17c45 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -1287,3 +1287,30 @@ struct device_node *snd_soc_component_to_node(struct=
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
index e6cc2bb73fdad..e96b86561165e 100644
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

