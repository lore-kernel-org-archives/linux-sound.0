Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010010.outbound.protection.outlook.com [52.101.228.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CF13C9EE6
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 05:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782452715; cv=fail; b=X69n2o/9ZeDtutf2a7WfIDb5Uytv8Zr1CZtz6D753TQ3MjiYRJHsj9Kyo2VlriPCP+lFcGdthRp9OfdPyR+lVziweFWpVbJCNnam+ei9QPQ174qSgXlpyCEntMCDU4DsFv8vwkxJ0oxrzUaqZBIQj8GSUJm3LU2sKlnRsSGGXhU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782452715; c=relaxed/simple;
	bh=DXYfHPCs21uQNw1OLMk/4KpTqdc4kWE2ZIIY0BkOwA8=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=IR2Eq2erufgZrEvIV2wJFXCwJez28snRsJ/byha/yiavHa4JG0t2qgirKq4BL0kwwVznEuexCeAtxTXE86IbI2Qzj4HqD01jFNznI7P2Sei4JgQyu8YRhbAhYVR3XL0jtZ/y1wiCZuh7nw/ud0WMiXguzVC+eU/Ez8BJgFuKXnU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=TIcF5UDd; arc=fail smtp.client-ip=52.101.228.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="TIcF5UDd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J3WCTlqWWiuRw11qTQZzvg0Ff22WlCtMyPcatOpjfDS7dsHJZKWlu7ghXB8rdAg6lI4gXSWkp9gX8JXP7xo1KmoOp0OWtN+fYVcB3NnYsHaNi7ljo3j+J2cDQbd4Rs2NIElhEBDmJXj09Y6jtDTfop6p+wOQTuyOvVVpAKTXd5upKg6gqKhnlRPBxIEP53oc2Y5Cr9CB48/XLtKOhScebdOK+gZd/+Cf3rdppy+MKeQOuNJO5//68gT5GEG4rESAQah0uBtmoJp+fUl29ACv72HaQ5nT9UdE4Tbs/wAGp0rXYvbgw/gynxfrX4/e3WrhAVP5dwKICH0zu8qVx6Ye6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMPEZOS8iZLFyBOHl87KrBSxgSG/IsKof2a7xqzWYes=;
 b=JfdBgDpc1r7rhnvCFS+t3mGj7rpBem0wlHlnEBfUqzC4BBcNiHPRqZhlpB57abZ6qsJYMDKigVrCTTpn4nSZ/8KaBo6wkZoO6ZxFNDXOy7lDdpt1PzpbOeGGC2rb4iniSy37oR8xg1CWj7O0TqCbRxvAsFv22rd4cWmpHKCwwqq1E+eTDDKuFEiseB7VwqlgiOXN5I958mRt1UzDNCqy3C+wfNyA6SaMf+OR/E/RUqbXRYN8/3IiEeDSjG/SIalkRiJ6yks8GY8LCK4p5gDoDC7qsgShpfMIcyS5l4xHlOLDg+BwUhlgZw2qY+bUd5z8S5enTghUvkNOZNXOna6KuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PMPEZOS8iZLFyBOHl87KrBSxgSG/IsKof2a7xqzWYes=;
 b=TIcF5UDdU+JJbQ+181XIQuYYwBiH8ZuTzb+STySmeGXcY4aB/Z+E5+AH4uQhp/+nNuYDNOzrj0KXMnn82cIjOSDjIyDfGBo0IjQkUhhjhJYrpm41ZexjTEoc4U3YwKsLQ4P1bnRgT7/c6qeCIZvKI3ThCPLrqLyz/+K92/f3UhA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB6606.jpnprd01.prod.outlook.com (2603:1096:400:ac::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Fri, 26 Jun
 2026 05:45:11 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0159.015; Fri, 26 Jun 2026
 05:45:11 +0000
Message-ID: <87jyrlety1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/2] ASoC: sdw_utils: tidyup .count_sidecar
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Takashi Iwai <tiwai@suse.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>
In-Reply-To: <87ldc1etyp.wl-kuninori.morimoto.gx@renesas.com>
References: <87ldc1etyp.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 26 Jun 2026 05:45:10 +0000
X-ClientProxiedBy: TY4P301CA0064.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36a::16) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB6606:EE_
X-MS-Office365-Filtering-Correlation-Id: 57c9d436-969f-449e-b975-08ded346166d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|23010399003|6133799003|56012099006|11063799006|22082099003|18002099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	NtoTgE+MJHgxQqHlQFcBwSBTroFspJwW1r685YnEubZ90gEbN5aR8R0w45A1mzTsd5e8/mrK4tGIN6lyGbXZ654P9uGVQAUPpiH2bjsC0iXIZ2uJNMKAsU2cracBLq+y5Bh/7ihAZnrgYJ5x549tIxP5t0bWfIJM48emWTxHPq4CKuq2S73UkjxmMyE/Lk6GCp5+CQBeoSoXvrFq+beToMSv+071LagtGEfTsWjnuRgz2G9XSUBGy+IkqTuTur7Zy2kSB9m4/6/K+iFg3UhltJI0ARkRGrny9jeVXjwe9YKX+vOhcuGUH+BZzpzMG2Y1gb/n0w5ty2g2gvSoXTQpOOvtepk9o2Tfs/rqP0TvXwy1Ao/rYyCtvIMVscpyBuRpOBf672C/AhPwHXDAQCiVpWG7gDiP7Aqpzn/50GJxaKpv/BXR17ljEx7wsSLdVs4dUaKoZGi1GMnAueaqMslWYgaweensEAHKgE6gzIOJGoVBpgBIrojFZw7tEqw2FkrswSwKSn7BM2Qg7DagRYsRvehR+fDR52dBT9vkDDmaWZiBmpr+UI7Kb0dPBljC77vW30U6/4hs/5E/pzgknf83BXkQi6oowWlXjjheLfhtOOz2NrNsAxjkbbFmVahbNqdcTeMphN9T5/ldWC5xNnm38pKEyj1p/jwGLly7blNv6eA00Tk7ZQWDb/rGC3cuY68sTfZP6Wry3/78rHyZDvGq+ymBc+J3osPgLEHV97OmfAchpYcc0rfbEOVokiLOEaKW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(23010399003)(6133799003)(56012099006)(11063799006)(22082099003)(18002099003)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eOzzfA53bL0ayTX1Pknk8yIe8OhHkotfG7x0s7VFl0l38hJbnXqO/z35kzgh?=
 =?us-ascii?Q?sn/NozNXaoUShBaSrO23J4t6Lyqwc81+Vd2/jxtDUGkIF1cD177D9lowcBy0?=
 =?us-ascii?Q?ZQM7NaZq8BOcPGoMoamUySJ/lelu5lzvWjTVwXmNtU1E+WzSWX5iBWiNZquo?=
 =?us-ascii?Q?0PNMBVkOOSncNHlMGPJ2v0QfKn7mS3QFX3k7//Y+J33nXa9Ps+Fz4Gd1h8q1?=
 =?us-ascii?Q?/p5cunXzahHT2OLuvAvSQERFn66FMH2PMNPadxJ3hc40Upw0Whdk4HSITKtM?=
 =?us-ascii?Q?LpEHzH0N30RAfa4Q4++RCZSeb665vB/bH6e/a8mqygFWiiB99xqPFihfQQ9t?=
 =?us-ascii?Q?RHU5VX91fHPrNMhAclZHkOybFfF0bMZe1SSjwJynm4zOzGEA9SJAjaec9vgk?=
 =?us-ascii?Q?uD6boMbtG1puE81eRtcJGjgV91Xgukvfh0QcVgA7CSNR7XOluAyAvtEvBcgi?=
 =?us-ascii?Q?hscLOJ2upOZpgkrncWMqeP2IvkvXn0ET9BknksqYU9XQyRkDRZakc+P4g7nV?=
 =?us-ascii?Q?EjOp4iEZ7IQHo5hXN2UAq4ROc4u3wdJJoF8moQBoL4O8DZykc8D2qTeQ4TvF?=
 =?us-ascii?Q?iKQT79KfIq76vTscJnuNA7DKnlWchcriEyzCDDPFjmSId3QVuyLdUt9TZdL1?=
 =?us-ascii?Q?5uSfwi5jf8xvuc1fV+pGQ/4zRVrZDsYOYz5p1I+ML4zUhR95tKO5iacdh9my?=
 =?us-ascii?Q?JnCskewLJhm5tR+umSeQjEp3Jklsrn6KBVgxzW0FB/IYs0EVzvWszf6plKPW?=
 =?us-ascii?Q?/Zmy0Nt4nR6DIys04+DbcbaTzk2R+hEoBP0rpQV0QNiFjM2bCxmNNVfSp3wn?=
 =?us-ascii?Q?9JCBEe6HyrphcgeNJjjTr6xn42VIahMdKAeWedIdwKt/AKvielVTcEsWxUwr?=
 =?us-ascii?Q?7TrqIZCMM3xOytq/3xIfZxo5zhD52AvsPJzvK70JEhDfEvRqAtwfCJEJweP/?=
 =?us-ascii?Q?HGNs2Gqvme3H2NEHol0ZmZBWY4NCxtZ5+bVicHRk5mN3y9PwhopPyJO9zK0K?=
 =?us-ascii?Q?yTOv9tJVW56IsY2eNvbF5AzgY3JFW9tTiv1DnPlo4qNIz6TDNxjk056VpFXs?=
 =?us-ascii?Q?n+RqtutB20uvhIZVF6Xh8VpKrLRInQo1zl594W43G6f0ELPaJ9dMCuBhf32u?=
 =?us-ascii?Q?VEjcOflrFCZoUN0Bl848MZRjJgveTtfjpDvXyQptMvVQRGqxIhilyBNpt/ya?=
 =?us-ascii?Q?wIaGiHek1WD1L2YANDmQa4drHpLnTx4SvtAgyqpMPexMYoinrJ27RMea/Iox?=
 =?us-ascii?Q?YeJAx56+M++M4BsiAoqyGaThOs2qRpAM6EyR9xtMigiu/k4aN++QaJrXAxOC?=
 =?us-ascii?Q?RfIwj/wfIPeG1OmSS7raLTjOideZ5k/U3CvtYkvRRHmFjtPl5bSjdaHkpQIs?=
 =?us-ascii?Q?KvTL4I/xWw5u0APnEZOUSY+3QHD/SZaN4XAlITBwqt5BD4Kr3bWWwlo1Pwc6?=
 =?us-ascii?Q?g9QbCYr1VLjlFC7kyJjP2p0ME1PnlGCA641tJTtIaHuh8ygctinhFRfsud5z?=
 =?us-ascii?Q?awQwH9TMZInrY66empHGU7+SwZbsQUY5BzD/Ksq1FBgqkX/9OHfThmegZ1ri?=
 =?us-ascii?Q?nXOcM76K7VlNbVH13x5HLgE6dzpuFmfjYa2S+nNPDtf1hm1Iya1HYO4lJU7G?=
 =?us-ascii?Q?qowbSoUupejlAeVMNyRTqGECGJn8xtSDVC0IDEOsg/fvLmTe+mlsObRVbVk1?=
 =?us-ascii?Q?6Xxn0UcmOy9MIRjW/+evHJjH39OTiP8JvFLNjg4R5niCEXJnGzjTb1DgFlYG?=
 =?us-ascii?Q?mukjcCGAgstndKJAGSDMEPrpR0nq6VWfpuDAl5GHgR5ODgz7ihAb?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57c9d436-969f-449e-b975-08ded346166d
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 05:45:11.1861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N0h0+Lliby3Lwaw2NxUXLfJCfkNadIleBCp+Q22m2NZyUXoH7ay23+Dhaspv+PgVaBVQQrYcQSPklNekXqsHs4A5cLq/I+qzwvzVMWgZ3PctsmqJHHcV7tneLI8yEhGW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6606

count_sidecar() is not using *card. Tidyup it.

Current code makes old style / new style conversion difficult.
To make future conversions easier to understand, this patch clean up the
code a little. but no functional change.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc_sdw_utils.h                | 28 ++++++++++----------
 sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c |  4 +--
 sound/soc/sdw_utils/soc_sdw_utils.c          |  2 +-
 3 files changed, 16 insertions(+), 18 deletions(-)

diff --git a/include/sound/soc_sdw_utils.h b/include/sound/soc_sdw_utils.h
index 79c21966220b2..443d63dc6ea37 100644
--- a/include/sound/soc_sdw_utils.h
+++ b/include/sound/soc_sdw_utils.h
@@ -44,6 +44,18 @@
 
 struct asoc_sdw_codec_info;
 
+struct asoc_sdw_mc_private {
+	struct snd_soc_card card;
+	struct snd_soc_jack sdw_headset;
+	struct device *headset_codec_dev; /* only one headset per card */
+	struct device *amp_dev1, *amp_dev2;
+	bool append_dai_type;
+	bool ignore_internal_dmic;
+	void *private;
+	unsigned long mc_quirk;
+	int codec_info_list_count;
+};
+
 struct asoc_sdw_dai_info {
 	const bool direction[2]; /* playback & capture support */
 	const char *codec_name;
@@ -88,25 +100,13 @@ struct asoc_sdw_codec_info {
 
 	int (*codec_card_late_probe)(struct snd_soc_card *card);
 
-	int  (*count_sidecar)(struct snd_soc_card *card,
+	int  (*count_sidecar)(struct asoc_sdw_mc_private *ctx,
 			      int *num_dais, int *num_devs);
 	int  (*add_sidecar)(struct snd_soc_card *card,
 			    struct snd_soc_dai_link **dai_links,
 			    struct snd_soc_codec_conf **codec_conf);
 };
 
-struct asoc_sdw_mc_private {
-	struct snd_soc_card card;
-	struct snd_soc_jack sdw_headset;
-	struct device *headset_codec_dev; /* only one headset per card */
-	struct device *amp_dev1, *amp_dev2;
-	bool append_dai_type;
-	bool ignore_internal_dmic;
-	void *private;
-	unsigned long mc_quirk;
-	int codec_info_list_count;
-};
-
 struct asoc_sdw_endpoint {
 	struct list_head list;
 
@@ -235,7 +235,7 @@ int asoc_sdw_es9356_amp_init(struct snd_soc_card *card,
 int asoc_sdw_es9356_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link);
 
 /* CS AMP support */
-int asoc_sdw_bridge_cs35l56_count_sidecar(struct snd_soc_card *card,
+int asoc_sdw_bridge_cs35l56_count_sidecar(struct asoc_sdw_mc_private *ctx,
 					  int *num_dais, int *num_devs);
 int asoc_sdw_bridge_cs35l56_add_sidecar(struct snd_soc_card *card,
 					struct snd_soc_dai_link **dai_links,
diff --git a/sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c b/sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c
index e0e32a279787c..129a437ae397e 100644
--- a/sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c
+++ b/sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c
@@ -99,11 +99,9 @@ static const struct snd_soc_dai_link bridge_dai_template = {
 	SND_SOC_DAILINK_REG(asoc_sdw_bridge_dai),
 };
 
-int asoc_sdw_bridge_cs35l56_count_sidecar(struct snd_soc_card *card,
+int asoc_sdw_bridge_cs35l56_count_sidecar(struct asoc_sdw_mc_private *ctx,
 					  int *num_dais, int *num_devs)
 {
-	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
-
 	if (ctx->mc_quirk & SOC_SDW_SIDECAR_AMPS) {
 		(*num_dais)++;
 		(*num_devs) += ARRAY_SIZE(bridge_cs35l56_name_prefixes);
diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index d8db8fc5313ee..073f3f9205a73 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -2045,7 +2045,7 @@ int asoc_sdw_parse_sdw_endpoints(struct snd_soc_card *card,
 			ctx->ignore_internal_dmic |= codec_info->ignore_internal_dmic;
 
 			if (codec_info->count_sidecar && codec_info->add_sidecar) {
-				ret = codec_info->count_sidecar(card, &num_dais, num_devs);
+				ret = codec_info->count_sidecar(ctx, &num_dais, num_devs);
 				if (ret)
 					return ret;
 
-- 
2.53.0

