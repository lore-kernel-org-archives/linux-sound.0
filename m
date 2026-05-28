Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010054.outbound.protection.outlook.com [52.101.228.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3954F21D3CC
	for <linux-sound@vger.kernel.org>; Thu, 28 May 2026 00:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779929292; cv=fail; b=N9oUx8el8fkhk7z5U6+De4H87bAfHtSw3wJHgyet19Bp/wg3AlUsdhaLU8dc1TnRqAmW9MwHC5CStOFryfKLqciKfH/0ZiljPRlYen2FlEURPO4cMA+r+3x9Y/T+shxzye7MSCkOYkGdcT3MMcpdwP7AAielrjs84lIMpif8RRc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779929292; c=relaxed/simple;
	bh=xTdHSLbaNebWhxemFvnO1WiQeQC2QvxxaacQD97B2XE=;
	h=Message-ID:To:From:Subject:Content-Type:Date:MIME-Version; b=nwO4fr+YCSahqEmsH1/Ot1iQZZlHTWO+O3JLtBlaAKh9RRhatKKL6t29oHw+QZzKsMaEgPoqq4WonXSyxDmRkcCU5PQdW5dvfc52EVPkPBMrgczTMDzw1oFD83ichVhfjsHdgFTA5qlaMTL+n0YF48I15uovL/MN8MIvPJ5P1FM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=In5+70EC; arc=fail smtp.client-ip=52.101.228.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="In5+70EC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xLuEenWAiCetrwwGmp6YRlwtLtVn8Dlp7ABhqFhglt8hRSU5YTtVCubigP/xvba2IVsK6Co8lDNqfXGQ9pdUtVWtbfcJXGOhva4yNl8ju4M8MTIvSOC/1eUJiSkuhzBQA43Fra8CmfxFp8ZNAnn1Nz5eSALf0VbU3oGaDxyqbCuS4wSXsBvtjvj8RAV5/hrjqN9GxGQIREh6x1lbi0+hlZjMMvD9+MPuaz/ed2Yun3wKxXh72BSKaoOu1/tqHQbEi3Zx12ogyDHAFZr2nVIyLgqsRZGA5XGuonJbs/F8qeHR1Bpk0zzCBRNYgbEFFlPSk0qT5A18jqXPMkEcY2kUvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nJRoI6vd+GWjBm+kuz7FsG7tPPUaCwRmY8isYqBKH0g=;
 b=hd4qXipYmEI/ImoOlPENtaQimrcdByqYWMWJHUbjeDYp0L5S8yu9ari9Aw+fz5wTi9tA17yPbCl1fb9it5Y7Qu7c8eRYtqyG6WFP1TgetBauduYKLuIZ//eD20NgOflJu5N9G4fGp3mzGlKKlu1y9kI7jEmzLJH2S74E8JRp9o+ZeHmxEV/KaUkuXLClpsbPEa1BYhCURSV4MC9Q6LOIwBkm0FgTRc/MzsKLZco7kiUfmYlchUd80IhneYi7dsMorYig5EDtApGTRH7uc8wZLlQTn96Jyfw3I2Gwmmo1wqISH3qryvbXz6rDerg+gxEGC3bE2ndIy8CqIFo+GxzMaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nJRoI6vd+GWjBm+kuz7FsG7tPPUaCwRmY8isYqBKH0g=;
 b=In5+70EC0Ybs2h61BBofJwAuqTvzlL7ZVUya8EsY8eFGepTDx9P6eBmZ9G3ahTVdhwE7jOLg4atFPSz5x7ocnpWIUFUHFXWLaI/O3OTqPQN01Yaa6xWsThigwQBYwnMDnNHk2lW7JeUEdkksMqeawVmIs4NF+JhUOHTJgge0Jak=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSZPR01MB9298.jpnprd01.prod.outlook.com (2603:1096:604:1d9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Thu, 28 May
 2026 00:48:03 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 00:48:01 +0000
Message-ID: <878q942wce.wl-kuninori.morimoto.gx@renesas.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, Chen-Yu Tsai <wenst@chromium.org>, Daniel Baluta <daniel.baluta@nxp.com>, Jaroslav Kysela <perex@perex.cz>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Takashi Iwai <tiwai@suse.com>, linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2] ASoC: soc-card: add snd_soc_card_set_topology_name()
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 28 May 2026 00:48:01 +0000
X-ClientProxiedBy: TY4P286CA0117.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37c::17) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSZPR01MB9298:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e357fee-3cae-4445-f285-08debc52c55a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|11063799006|56012099006|18002099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	dHqQBuTj57Wom+R/kibIhdiZiCGaLY1+BHaJ5zfKbH5rf1tUsvtyi6FUY5Am4GzFc9MBy6Xa9IAfyIZrDs7y6ZS0b8FtcoQU2E8s2j3ZPk84KcB4ILK+Wol9JTLsnTyY84WjIxlYhzsNg8/x7w7chshbM//h8x9usd0MPYeN4cawzsAt3381C6hgNhsFtf8tJcKQPfYY/Tz1d7x5K6B9oXyoQ4IAoSbzojG93u8LvT1yHZVwCLPoN7ZwBJ8aW4jCrZfHmTLaSIVdajaVH61CPo7X4dTAJGJszVChbCeHWOFK7wY5PGC1cyyTpdrvjDkTGEjYOBfGRDMN5qT/MSKSdVzNK1/mlsg+5DCAd18p/SEWLsH71k8rOq7wV4Tk8/pRRbobOl9W9BqGkKoS46afdRGcOcwgkBFw3V2cSeyfpu5n03/TrTUZOG9YHfG/33z0G8eW4gjNtwYNlThL2jGzoXvnQyARNASNJIRYgDR8yiOUpxidBtoxGsNUjc+oTGYH9pwYqUhcdKwPuHRYpHTkJBl5UmEpRiZBDEOTLdHHA5wXhOOhc9Dcj6CpaK813JjWtcTRiwPxCcb6x9cZYi2x3W3cA7xCLMzs8AFwdzI13j+DjkLsf1NB1B/U7ZOgbA8t89llLl1QQLHqUM7GSwXpNS7ToUFDHJsYLd1Z5z4Cam9S8CwwJ0SSpgAzF5YzJcjkOT6VcMeFt8kVzK+X+cMp8kn60K/fRO4qhcE7oYtW68jckiV1KmZ3/Uh3kbzJAcmS89G4Wp961jGyWsFlHtCqzg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(11063799006)(56012099006)(18002099003)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IOrD9Q91odYrebM6oo2Rofco3cMkRcGUzrhHkMv+XkPWe7rmlgKX48UkeXTq?=
 =?us-ascii?Q?7MMgWa2EtAMCYOP2BejacwZ5f1DxNiPE1LefyWJrQlW3/UjTT1OQU9mD0MEj?=
 =?us-ascii?Q?UFT/iEC2IOB6vMxncIkclImMcxeEMja6RXrlLVcVeKy87R6Mm920/ptkATKd?=
 =?us-ascii?Q?MqIxG3ghYXQsD2pu1BixFpBbxL516MqNcB1DKHCXxFeaMF0wnTNY0qt/roS3?=
 =?us-ascii?Q?PnNsjaeilsjulh+1PAEcsqY7m2UL8ptTm/iYdipgD08h8ZvNVQhcqFUz5dCb?=
 =?us-ascii?Q?akN6ZwxM4smyg/J44I5n30b8yOvtlz17iReU8pjjlry/ErUyT1UMIu8/rqnu?=
 =?us-ascii?Q?m+3zNVfPSAk5GNEV7cEpPTkmx9FVM5bgTqVc0ReLnvViK4BEMlZ9wwsLE4Qa?=
 =?us-ascii?Q?D4QEU5uCyD+NlOqQllv8bBsEQR3JWDgjqtqgBYQvpmYLvDz+FbTJpM64HTOJ?=
 =?us-ascii?Q?uijUu7Ol1P0CPTFFYmInJZAIBICaqin5pkVGybfXGvUAJ1DPLicA6Wfwxic6?=
 =?us-ascii?Q?bMrdhUJrSgyBX7isu10Anzt/ajKSBkb0CopJE+KGNdjwpL4eRgbEFMXOaRPf?=
 =?us-ascii?Q?a8VjkAKduuoMFtcklRnmVb64oG3nQ4D2L78HaCQLjeqtD9joC2vpJPH0k1x0?=
 =?us-ascii?Q?ou5i/r9C0yaPec0qEcp90l1qVMp+p+IwdoSS0xD0hPKSPLRWnw/ksSb2i61Q?=
 =?us-ascii?Q?ak5bp32PXKfKjpH9jhZekGcnAj/EjO8ZqN45Ajd0D9fEsfJNpXYWe7yij2ff?=
 =?us-ascii?Q?/1T5O0Zt4sdEEwVVG2I8r03OlwSo9l5YbBuGVR44iqUMU3LMcA1TPEabrqaz?=
 =?us-ascii?Q?AYPHEt08SMloISyKgPAR7IIOVGyFmUQ9ov26mLshfNMDowT+qcFmpiTwE19x?=
 =?us-ascii?Q?5XXWmxfVtJLaOPRVyq+i+MGhn014syCh81gqlOkh60O3qsfsA2IVTRIsm7Rs?=
 =?us-ascii?Q?k16WepegHcj7xpJet+CJEaI4CLXx2GXaXPxOtgBq5nj6viwkNgySxdj8q5gD?=
 =?us-ascii?Q?OlqcYsF4XRRHiMUH3IVpt8C764u0VkpFKSbwHYl4vncyqabfpYOHIspUuvwp?=
 =?us-ascii?Q?/ZdlmfkH4Ilx0Pfr8Ip4MMznmuCIhwpRbXPgwWCcKUZaq23cjByzAOGRtEpm?=
 =?us-ascii?Q?4nbTs0rRwvGToCvPoX9Ej7cMbJfcCV0F8DLmC2T25JE+D3kFBhehNHHDS7xV?=
 =?us-ascii?Q?STvUqoojGkML+BcgyEV3F+3YXhsAILz+bZOPbnfs5CePDqPdxhO0EnHsVD7y?=
 =?us-ascii?Q?qggMd6CHdZSj9qInuhcruNUEZ/0Y9bYvWgulNVoFR2aUsGT9PGgwCgTqghIc?=
 =?us-ascii?Q?0+cFxBTdFq1aEHsdrGcmhXiHnw+OQi6yRqCylveV2gtRz7N3LK6nroYhZudv?=
 =?us-ascii?Q?EFtE4x6jHzUnKsYfAUG3+V8T7rFH5ZcSg1ziyB7ZuBQVa8m1W7LXiQpPGtiy?=
 =?us-ascii?Q?Aswek+LWUDOBzc4FAjQ38WJJeZzOOEo9PWy21MHAcIqdVUTbkmojqtCHbl7I?=
 =?us-ascii?Q?FQ/jOJcZ2n+RDajCHN0B4Edg7NLapw9JKpUgB+gX6toyhYQuWPCIcRkccioH?=
 =?us-ascii?Q?g9MLM4yWDkJnkkOqqPBIPgZHKxu/IudHIOfKHAgMQIPbnYkWfCW+1HvrmKhc?=
 =?us-ascii?Q?DyQscraH7SvWNFyh1n1yB+NdsgveWhmPPWecmucc3csDbys4KdFWm0E2npAu?=
 =?us-ascii?Q?oQ3CoCdlN9NI3la2E2jdltJ7EEt8pmFFMngNioPn5/dBX5xzXoKpYmU3Vloo?=
 =?us-ascii?Q?E04qWABDfj0E8caL2cPDkRxhxh+ipn0FToXEEbkAo8NCX2fAU2dG?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e357fee-3cae-4445-f285-08debc52c55a
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 00:48:01.9123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MVRFqM87i+sqpqs8cFgwOazyW2kqs84xQ7wSAXaiNAvOymKlc9sZF0HMheAfd7F78UotXtVi/7DFrrCjvh3t76vhTqXgiVssda+A8a8OF8QLU3iyOUf9FQmwDh9vV/EY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9298

Some drivers want to use topology name, but currently each drivers are
setting it by own method.
This patch adds new snd_soc_card_set_topology_name() and do it by
same method.

Almost all driver doesn't set topology name, let's remove fixed name
array, and use devm_kasprintf() instead.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
v1 -> v2
	- snd_soc_card_set_topology_name() checks prefix, too

 include/sound/soc-card.h                        |  2 ++
 include/sound/soc.h                             |  3 +--
 .../soc/mediatek/common/mtk-soundcard-driver.c  |  7 ++-----
 sound/soc/soc-card.c                            | 13 +++++++++++++
 sound/soc/soc-core.c                            | 17 +----------------
 sound/soc/sof/nocodec.c                         |  4 ++--
 6 files changed, 21 insertions(+), 25 deletions(-)

diff --git a/include/sound/soc-card.h b/include/sound/soc-card.h
index ecc02e955279f..1f1e7d45f5533 100644
--- a/include/sound/soc-card.h
+++ b/include/sound/soc-card.h
@@ -47,6 +47,8 @@ int snd_soc_card_late_probe(struct snd_soc_card *card);
 void snd_soc_card_fixup_controls(struct snd_soc_card *card);
 int snd_soc_card_remove(struct snd_soc_card *card);
 
+void snd_soc_card_set_topology_name(struct snd_soc_card *card, const char *preifx);
+
 int snd_soc_card_set_bias_level(struct snd_soc_card *card,
 				struct snd_soc_dapm_context *dapm,
 				enum snd_soc_bias_level level);
diff --git a/include/sound/soc.h b/include/sound/soc.h
index 8681dd3f4252f..10ad80f930c2e 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -987,7 +987,7 @@ struct snd_soc_card {
 	bool pci_subsystem_set;
 #endif /* CONFIG_PCI */
 
-	char topology_shortname[32];
+	char *topology_shortname;
 
 	struct device *dev;
 	struct snd_card *snd_card;
@@ -1084,7 +1084,6 @@ struct snd_soc_card {
 #endif
 	/* bit field */
 	unsigned int instantiated:1;
-	unsigned int topology_shortname_created:1;
 	unsigned int fully_routed:1;
 	unsigned int probed:1;
 	unsigned int component_chaining:1;
diff --git a/sound/soc/mediatek/common/mtk-soundcard-driver.c b/sound/soc/mediatek/common/mtk-soundcard-driver.c
index a2a30a87a359f..cdff7322426a9 100644
--- a/sound/soc/mediatek/common/mtk-soundcard-driver.c
+++ b/sound/soc/mediatek/common/mtk-soundcard-driver.c
@@ -289,11 +289,8 @@ int mtk_soundcard_common_probe(struct platform_device *pdev)
 		soc_card_data->sof_priv = pdata->sof_priv;
 		card->probe = mtk_sof_card_probe;
 		card->late_probe = mtk_sof_card_late_probe;
-		if (!card->topology_shortname_created) {
-			snprintf(card->topology_shortname, 32, "sof-%s", card->name);
-			card->topology_shortname_created = true;
-		}
-		card->name = card->topology_shortname;
+
+		snd_soc_card_set_topology_name(card, "sof");
 	}
 
 	/*
diff --git a/sound/soc/soc-card.c b/sound/soc/soc-card.c
index 235427d690617..282d666dae9ec 100644
--- a/sound/soc/soc-card.c
+++ b/sound/soc/soc-card.c
@@ -246,3 +246,16 @@ void snd_soc_card_remove_dai_link(struct snd_soc_card *card,
 		card->remove_dai_link(card, dai_link);
 }
 EXPORT_SYMBOL_GPL(snd_soc_card_remove_dai_link);
+
+void snd_soc_card_set_topology_name(struct snd_soc_card *card, const char *prefix)
+{
+	if (!prefix || !card->name)
+		return;
+
+	if (!card->topology_shortname)
+		card->topology_shortname = devm_kasprintf(card->dev, GFP_KERNEL,
+							  "%s-%s", prefix, card->name);
+
+	card->name = card->topology_shortname;
+}
+EXPORT_SYMBOL_GPL(snd_soc_card_set_topology_name);
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 55130eea04544..e96dd4a3f46c7 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1990,7 +1990,6 @@ static inline int snd_soc_set_dmi_name(struct snd_soc_card *card)
 static void soc_check_tplg_fes(struct snd_soc_card *card)
 {
 	struct snd_soc_component *component;
-	const struct snd_soc_component_driver *comp_drv;
 	struct snd_soc_dai_link *dai_link;
 	int i;
 
@@ -2051,21 +2050,7 @@ static void soc_check_tplg_fes(struct snd_soc_card *card)
 		}
 
 		/* Inform userspace we are using alternate topology */
-		if (component->driver->topology_name_prefix) {
-
-			/* topology shortname created? */
-			if (!card->topology_shortname_created) {
-				comp_drv = component->driver;
-
-				snprintf(card->topology_shortname, 32, "%s-%s",
-					 comp_drv->topology_name_prefix,
-					 card->name);
-				card->topology_shortname_created = true;
-			}
-
-			/* use topology shortname */
-			card->name = card->topology_shortname;
-		}
+		snd_soc_card_set_topology_name(card, component->driver->topology_name_prefix);
 	}
 }
 
diff --git a/sound/soc/sof/nocodec.c b/sound/soc/sof/nocodec.c
index c0c906a78ebae..11a95dba3c9cf 100644
--- a/sound/soc/sof/nocodec.c
+++ b/sound/soc/sof/nocodec.c
@@ -15,7 +15,6 @@
 
 static struct snd_soc_card sof_nocodec_card = {
 	.name = "nocodec", /* the sof- prefix is added by the core */
-	.topology_shortname = "sof-nocodec",
 	.owner = THIS_MODULE
 };
 
@@ -89,9 +88,10 @@ static int sof_nocodec_probe(struct platform_device *pdev)
 	int ret;
 
 	card->dev = &pdev->dev;
-	card->topology_shortname_created = true;
 	mach = pdev->dev.platform_data;
 
+	snd_soc_card_set_topology_name(card, "sof");
+
 	ret = sof_nocodec_setup(card->dev, mach->mach_params.num_dai_drivers,
 				mach->mach_params.dai_drivers);
 	if (ret < 0)
-- 
2.43.0

