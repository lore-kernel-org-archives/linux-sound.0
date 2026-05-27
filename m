Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010015.outbound.protection.outlook.com [52.101.229.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2553ACA40
	for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 06:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779865065; cv=fail; b=rBcTfKP+eO0TnCk13DElJnlYdqqLZplaiQlmVjjg9KduFTCk0xoawB/7hHyZzPPehOZG0vwE9LnQ/Z3Jk7IiAdqIw4t2r7W0NocOYxNDD13TBlFX6ajICKcckl1D5YyhQOMS7KE6npYy+Dz4E48DM7+VWlBiPkXewri7fHJlHZ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779865065; c=relaxed/simple;
	bh=wKoaCSmMSd56Yt/FQbfXxAy6aelt1W0RJNrJdI67F+U=;
	h=Message-ID:From:To:Subject:Content-Type:Date:MIME-Version; b=McOj5irUcf5kQpiL6AVrxRQHmFr89zewY21wA/cgpxq5Q3pxrL4A7t8QFd35LGcva5cjpvxDW4rMiv8RuHMaAGw5j+wIHL+fg/zn7e3YeJtZle2+t1bNLovQN0VXnDFYbdRB5DL1GjBnCiIvo5J881DwPAJ5vXhijhhSG36YeRY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=nTr3ahtY; arc=fail smtp.client-ip=52.101.229.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="nTr3ahtY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KvF6iNOHr68usAUVrztwnHR/0EZaITmlWbXc6g0e8Pscwo2Oiigd2s4KnoXCWI7o8JNQm8fB8MRbsKs6ZqB5TkJSN2ZYJPSTIpAqfEcmFvb3HyQefz7gXusChyPUgHqfFAhvZfTi0wN7kOrbvJxVHAf3I2lpwTDVkn1WZlU8w03X+xZORDhPyy6okGAz8DZoRcjLec5xOWtay412ftK5xzwDET4IbqGXxsquDuZdOBRDITTmS5kX10kdQVMt6wQ1r2W/0e7XgHZDd1XJCkPStNaVxBlJiX3lF1bW4Hc3hvEzSHCGnI+YowzFA3FghVkXS/1OZVGzR8/oYzgjmQfcBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mQYOYGJljHNKQG41rF7T+cCQ6YVs356M4wHnoz05O+8=;
 b=G+HjS89njtmOqXQG2ok8mP+w2SL4HIDmGexiLR0fZXcJ/wZyE5p5uj0lx5IpOvmkVmclLnAQ23cnHX0ky+TFV+cEuObtkUQBrvsDF4CtvLqgVQbwDjysYBXb55OO1ggQcPN7MIck3eNt1E4xQOAWmWpKiJxN6Aos7yHVbnGngCv7V6qak0pVYBz2T0dU6IAfTdQKGAvBpSHG3Jba4yJJrzpG8CpicCnl/cAPMG+ZZ+L6WAa5xHAk+UVLljozLJ6tn/N4Jv6QzXdJCjUB65qm9fqtC0l3CAdFnQqSRPZj6aW/y5bFp9b7hkQKKZUsrJFCChqfgehyGwqy9fQy7ytbVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mQYOYGJljHNKQG41rF7T+cCQ6YVs356M4wHnoz05O+8=;
 b=nTr3ahtYLOFNW7Mvw4wzaV0DCFv4K2gM6ttsA831ONpAihSwV3h0VEPYcxeG7cFc5DXzndfw0Z/P7o4/Ss1GvVbXWOoFaCp4/0LWg89A6PnlPBw9ZjBRvkJC8foa/aC11RGCkKQNz1OcV6utgya70b1avh3TLIUKn2wyWQ8EJJk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY3PR01MB12089.jpnprd01.prod.outlook.com (2603:1096:400:3cf::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 06:57:42 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0071.010; Wed, 27 May 2026
 06:57:42 +0000
Message-ID: <87se7de3vf.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, Chen-Yu Tsai <wenst@chromium.org>, Daniel Baluta <daniel.baluta@nxp.com>, Jaroslav Kysela <perex@perex.cz>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [PATCH] ASoC: soc-card: add snd_soc_card_set_topology_name()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 27 May 2026 06:57:41 +0000
X-ClientProxiedBy: OS0PR01CA0005.jpnprd01.prod.outlook.com
 (2603:1096:604:24::10) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY3PR01MB12089:EE_
X-MS-Office365-Filtering-Correlation-Id: c72efb8b-7af1-42c9-266b-08debbbd3f56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|7416014|52116014|1800799024|18002099003|38350700014|921020|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	ynIr65/BH+OgEXBSlQfYt9tmTBW9/5/y6YHFDZyF88EU37wM3ANuEJekr4hI+Xc13cpYQM7LgahaC1dR5V2Q/fuI/sUiz1hbWCSIz+HACzIT1krWm5/+s32zyiyYL6NUqgfqj0VNWe3xnpWNILBVdEO0EFeyXa/PtEojLw/R+IsSX0S18YZ78q4KUi3YdQTnMzNNEr2IcHxhE+svkiBfUa9cKI5gLkKwb+WaC+QciYWkc3j+srhtfGLatzmqvWl9c6YNt6aP7rBwffp8Y8Vt8/49jqmBvCo5dpkbmVLtYrr65JJwUQ/gvHpkFC7m0K2ueqKhSuCpg7BPFmgHd+55AgFSH6yAuA5aETjzHixKduhYyeUPGfSes8OreHBsSgb1Oivoo6QrMf87ynpbjvofrFAzwdvok1qc3FbA3QZTBDQ6OjZ2chQJcyneZvMajzaRHZeySN8a/VDdrrhpJqCQ9KI9QTUxP7V/RHzpIrqz0Kqs9yPv6EpHbUEZLIez8u0zdRew10NX8GVL5Kqm4Fm3i/R5ovPXK/pGcL3/FsnxVSMb6QOh5/ooihrEUIxgKrPnT2yHWsJgM4PWvuRs6o6oCqknDKVn2T3X2ARicDE37ho3PChak9ybjaaNJxFQ3psbDYho3QSphNv05PvpXVootITFbcSRWNz9f9QozgszE+ZfEZg0cAAbbbmjbSZYtrY2AaEndHDAbAI0K12l+utKYpoZxmV7R1SdmVu6utirLye18643ACle13UZ1xoYloZ7Kb1u2Cshxx/gTIfvgU8avA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(52116014)(1800799024)(18002099003)(38350700014)(921020)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?d8SFj90U+4n+Ox/MCPPqIwHLgdODyti+R8EvOrAKUUomk62alj2nAPDJHoY9?=
 =?us-ascii?Q?1JsHtRFNUMOgCtIOV97CAgJHKyULpgqAa9GCWp/IeOCe4P6DOYK3A6XAoEkz?=
 =?us-ascii?Q?91eKnHhOeVrheRLTQLYkLj/BaQKHEFsHTR6LpHXJea9qGufklbG8oHCI0CIL?=
 =?us-ascii?Q?0RETP8VjiTypGKUFpCJaQiaSjTp3dsfMwhOTiijAAv/tMlRBI1F3vYLLzHCU?=
 =?us-ascii?Q?vMIrsAFY7HEHaiX2eivntx+OfwFcXIrW7i+QTZuE8VMA9woIcHzfzCPnDUjp?=
 =?us-ascii?Q?RVV9mrEv2111BVB6ypyOxgJyXJlciaEpTl5U7JHHoSDZnaYPQoMzq/x3pN7P?=
 =?us-ascii?Q?7CVygTgmeRurA+L5l6nDMq/b7X+KeNmYNBzRyVYibrPglks3HFoDd03dYO+U?=
 =?us-ascii?Q?1fHLN/vZxvcP1A1AOgNmjcHo7pBPzJQ+9BFtJhdY0xM343K4RqY0UOtxhyMf?=
 =?us-ascii?Q?C5Zgg54vLnU0fSwUjmdsKU9Yk/Mq2RA8ZV8WvgNw+qLRGPu7yBThNiRim7oY?=
 =?us-ascii?Q?56WaQZp+BFmZyzioMOoW8qwDjupmyJ/T1rzH+fvF7tzrkcNeWZ7o/Y0nuB0f?=
 =?us-ascii?Q?NqSYqz6G3JinIwZnmkOvjdDL12T5PiGXqoTxBtqkKOTKvQ51du0M2CzGkRgq?=
 =?us-ascii?Q?2Jff0TgP23sadYcVOW+EAfS/ts7aJnYNGcIMRBJbMxUE+nygnKannRVwkmcn?=
 =?us-ascii?Q?xn9BVbq4pnQk2n5gMOOymV9Ln0EvFYmUfg4BepoH8WHmPnQpXjgE2t+DjieI?=
 =?us-ascii?Q?Gl9eGeRayq5GRS/0BAskHkajJ9q8SZP56uZJI26rmjjo2HHBiR6ouPSlGjXP?=
 =?us-ascii?Q?unyTs1V33nY2OW3rEr3c+5eKPKX8Q0FAnIUnb8HfSjQ0ynw7ZzvDcT7UVdXx?=
 =?us-ascii?Q?v3fIOhwjlliGIZy/czqvjT8enUx2L7aKLSRs+1kt8LIU3Lo1hC5mbnUWmtfG?=
 =?us-ascii?Q?yiWknplws3iKts4urpwSnvkLLDGs9KVLSIOPkTRlxR7JORVOMPC7pBxye5DE?=
 =?us-ascii?Q?raqNcD377NSUrDeQRqyUQD1oTK+Upo1o6mlrP6GoO+yF7ydZBbNUjRpAVv6q?=
 =?us-ascii?Q?qrcoLIkE6g8/FPmZPM8XI0WcrDyU/HI+i1eB/b9EHDGqqnf/TDU00OoFzfSR?=
 =?us-ascii?Q?yRkLH2at2+CDpXgx6aVPG6iCtclIchTkle58pH8hglzdwBi39oW3QKWyXhw3?=
 =?us-ascii?Q?QyPuFJNthh0GbBFKiMo9b75zPmzQQHrsq5bDAivGXZOCq8nJ8PVVyzFb3ueA?=
 =?us-ascii?Q?UB3BbTZjpGo0NnFIiBIMcHN9Vm84cuJirYriOcY76FwHUV7WrK4zxEiNGNFL?=
 =?us-ascii?Q?ScS5J9leS2cMhbQGZz3sQQf93kgbYdFfy4ptjNquNRJNvPKPSPM5xwh5VaFV?=
 =?us-ascii?Q?JjC9LVZbTfc3cnJELJzs/p38HAQdVYDCYFgCLDg+O1+1VwzGxG1U7M2ct3gf?=
 =?us-ascii?Q?vvbexqHiK9ReTBeaoG9ceQK+m7O9RcSQDh0HlfD9MmpgIMfFtmsjaA+VDx7F?=
 =?us-ascii?Q?rZAHxErxh0o3jxwuM9KBygMOl1ZgpRYeZyACYxM/EBJXgd48M9yrpYz9hgcG?=
 =?us-ascii?Q?Xo/J5lTbztfteQfdExDypYJm4E7Ld5OZA9IxqRbrStOmAZvzvK1kkY5ZXEjF?=
 =?us-ascii?Q?lQeUe44GQ3pHeoDgTeLWN3EhxcqGPbMtWE+PP9C94kI3srpdRvOHCdatfBkm?=
 =?us-ascii?Q?rJupxjByyNn94KrUq/HPpTULLu9dD4ozxVil8+Hb+WC+GuHJtbkKpFF1cz5C?=
 =?us-ascii?Q?j7BSTDtn7o+x9kMuRML0TUXQu/z49aBgn4BYG0SiGTcZisxoISxP?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c72efb8b-7af1-42c9-266b-08debbbd3f56
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 06:57:42.0101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ujo1P6H9rNLh1GuD3JGx/mJAXySbcuLitTYJkwmPCUGLhU7K0nCCGKFB06igOu09NUe4eQg/T15qNWxTYow21dBCg5C/i3SxM7jvwsqR2IG4OvAGvgo664thWjxQQr7g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB12089

Some drivers want to use topology name, but currently each drivers are
setting it by own method.
This patch adds new snd_soc_card_set_topology_name() and do it by
same method.

Almost all driver doesn't set topology name, let's remove fixed name
array, and use devm_kasprintf() instead.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-card.h                       |  2 ++
 include/sound/soc.h                            |  3 +--
 .../soc/mediatek/common/mtk-soundcard-driver.c |  7 ++-----
 sound/soc/soc-card.c                           | 13 +++++++++++++
 sound/soc/soc-core.c                           | 18 ++----------------
 sound/soc/sof/nocodec.c                        |  4 ++--
 6 files changed, 22 insertions(+), 25 deletions(-)

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
index 235427d690617..313021eaa50f3 100644
--- a/sound/soc/soc-card.c
+++ b/sound/soc/soc-card.c
@@ -246,3 +246,16 @@ void snd_soc_card_remove_dai_link(struct snd_soc_card *card,
 		card->remove_dai_link(card, dai_link);
 }
 EXPORT_SYMBOL_GPL(snd_soc_card_remove_dai_link);
+
+void snd_soc_card_set_topology_name(struct snd_soc_card *card, const char *prefix)
+{
+	if (!card->name)
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
index a1adec44e77b0..7698db9e87b82 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1989,7 +1989,6 @@ static inline int snd_soc_set_dmi_name(struct snd_soc_card *card)
 static void soc_check_tplg_fes(struct snd_soc_card *card)
 {
 	struct snd_soc_component *component;
-	const struct snd_soc_component_driver *comp_drv;
 	struct snd_soc_dai_link *dai_link;
 	int i;
 
@@ -2050,21 +2049,8 @@ static void soc_check_tplg_fes(struct snd_soc_card *card)
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
+		if (component->driver->topology_name_prefix)
+			snd_soc_card_set_topology_name(card, component->driver->topology_name_prefix);
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

