Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010065.outbound.protection.outlook.com [52.101.228.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7418E3B9DA5
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 06:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788158299; cv=fail; b=ObcONRkTX0MJZTRCP8Uq9YMyQMe5FH0acdV7N8d8oAM663PQYirmfIiF6B27nIx+cYSp1CRoc9+XhSf5ySMLC3oZsxcEp0eztwnTTunY67gmfU7RqMD3z925umNmgnHvp7GzJNFmLKxENPGlXpDwP83x+8bgNbT/ZFVLGxHDhFQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788158299; c=relaxed/simple;
	bh=58nXkJdFfoKFoSTQVVPXutcF2F214Xa687BbHsi4VUE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=eI65Z60UtxEJMlthwpa3tt42IEzY6F02nperWTo/hrCy8j85F02ThQrX69pPsNj0t3KlB/Q0s6sUshqj4mvjoSmakUKBFw45RTgBu5jcpgU8jrw1z6dgCQta9dE7lmC2ldQ7zNMfHWiFZbwU0tzn2Xhn6h6G/uHinUP1sREMOVU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=DZ6Ho9UB; arc=fail smtp.client-ip=52.101.228.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="DZ6Ho9UB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xgsi0lVSOM9LJ5APi0Wu+yok5d4VVa5oHipy4vofQA3XQH0N63sLiwD8nZuPxKMQvdXmDE2pkQEIwlg9zV8YE5/xdfhVFidBidFL5RYuh2nVhita0fntdNkBzVL2K2nN/UmqT3au+i0K2dVSUZU9PPGhbByxly/vKkKRJS50WGZSPDBmzCVMU0rRUSEpFFt9nTRla6tJDophQipnJ9AkagBOSpBWqAXtjWB/AQDnp3iBhmWgFm3qsmMV1fO6plE7VPEHWduKQx+h59M/yofIx0tlEhgXdx7N7iQe6fDP8/LcnPip34/Plb7IFsQAbjEe849LJoL0LiIET1xMmIZ8WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JqXeA6NcfepQaK9HZaiqbYFA4SL0Zc0jhn/kd4EQiTo=;
 b=Y5YFDOKVs4wiFvzTy294XOUgHQZ3Mmctn4MmNRM6HbToLzF2TEvJ5Md/yzFZWfrNj0LyZ1mE/GMiNrJE6DIjfHTvulNEW6BK9W1UWrxguZ9DTXlebYAFk/HTW8NvrGJwLHvXtstEnrJcAfmwcGRqWSEhp9H8P3ZD3O5KJ8DOiqvmXqKSGxVRtcNjucXdcXhWoV1ud79XQu1tcemAUv2YZxnn0ttnbjWiNai1SUHkA5t3ebZQUlFmm/0Df+6lumcutB0WX+b7UzyWCJvpHX+WnwEh6lBKiWHSRwAd1ZrD0Y+tRPjx3cMweCaHSikD2gfy/lgb46wcwgmoAAbdrthKhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JqXeA6NcfepQaK9HZaiqbYFA4SL0Zc0jhn/kd4EQiTo=;
 b=DZ6Ho9UBn5MP+Hom+XtbMsCmEBSGQdZKQ1EJXvkgRv9DZmNN2J8Q1d6bVzfBR+dd/guzfFsmqMdD/8aE2FOsw8NX7V59K2+omVSech3hoh3/2qbPjHBGPRV6iGOHRwpQZNdrtPcVUdYQcIoHYPs1Z1cZlPDrxZQUaK73Zv2d0G0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by OS7PR01MB17278.jpnprd01.prod.outlook.com
 (2603:1096:604:424::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 06:38:15 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 06:38:15 +0000
Message-ID: <87y0dmssko.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 03/14] ASoC: soc-dai: move snd_soc_dai_name_get()
To: Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Vinod Koul <vkoul@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <8733vuu75t.wl-kuninori.morimoto.gx@renesas.com>
References: <8733vuu75t.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 31 Aug 2026 06:38:15 +0000
X-ClientProxiedBy: TYCP286CA0092.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::10) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|OS7PR01MB17278:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c20a613-b1df-459e-00b5-08df072a6fb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|23010399003|366016|38350700014|10067099003|56012099006|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	tkXMbKzzQORvSVKSVoQ7aPvaId7f2gbiFZ246k7Bo9a5lmWd7tccN1gCdqbk95UR/Z40w0w9PO62cdxcvZY5umCmgtKifPa5TvFtSqXY069IKhd2mALz0uH4SxWamhtoudrafU4WvjZdq0NEIcVZ3KVqcThOwsaUl08NtkOHJqNoyXLJoI0sukKu/ougom93mwOd05uv3G++QOrwghKM0RB5rlaChLc0Y0o3c7XsSHsmyownHJGfClR0rFG3v5iN9cLCTStpgIB65kmtlJCd167dBzsDM1QT4qv5Qxt+JScQu2NhiFN92Y9igXFEn6WCdEZHOpPQsSicVmYFDZtLXD3GBd2O3PyW4iCivwfWvGqCjdM/tgqvbnZ29xYfbcr+xuzAhDhbbyJc9Gf1Mky+STHq82GkY3s3ybHFuQ9TZLpiWUpgcs8toEHHtBuYc/evNM29wRo0YTBMyJKwZHsFjOYwFh2TsDFFFvI8qYPz3Tpa/AFgUxpZuEPp+Mlr7Ys5xtWSoE2LgRXo9GcrEyD1CuwTm0YTp2pRTZyqEF0WRy5Pq70njqk5QOTkByJTtb6nYUrT1YH9C4CwqhGJj3D8YPGW4+pAb0NpW/c3WaxuV3w1v97JGlJfxz5KAF8Op+5E98zxF6JAu8O8upBboQPi4ajQVmLSsv3prId1FVAh74/0ozCFKPRbriHsHOiOWELJQematZ8R24UeBUxm87dlQPB6NKawHAPvcS8y965XjKU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(23010399003)(366016)(38350700014)(10067099003)(56012099006)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MsRuhA76zw/3hku5IWE4lkEQFVHhB7AFR9Irf3ArG1yWmkSFA2hg4Wr50FGQ?=
 =?us-ascii?Q?7AaoVUL/JrntIarOq+ZfznLgbKlDSNIyzUp7VwtVUw8dxKINJ5ps14NNfD5D?=
 =?us-ascii?Q?iv/FXA13VLQFilrvtE7v+TpsGp1G4XOXzY3Ha2eTAOacoCVz1lz69KQuGty6?=
 =?us-ascii?Q?ISmqtS0zUzuKLGwdYx7xNPlu1e2VLQ1ih3RjsfkCWjQNKMRVb20bBpR5AMUM?=
 =?us-ascii?Q?HN2VGf08b1gB2SlEsUIfS3wlKw+oPlTwGBvz5NoLcPLAQjhG0HaXG6hXZmEo?=
 =?us-ascii?Q?GsxfsMEaq9niOu21dcTXw5lwBbhP2JR+Drv28yFBeqXXHPdHhfRAQJIBYbOY?=
 =?us-ascii?Q?7uYpMwF8LWYw/1k5ujfOWqwFcKxUYKfv2t0xLEuss0Kcxd7UCgGIA6rfMOfG?=
 =?us-ascii?Q?ys3c+LE2wWcL35mmE6L9Pix46cErUoX9Ci35iZva5CNBEic1nO2HBVkB3lbo?=
 =?us-ascii?Q?H0OtbrgLiFcguBPNHVOMiNDv4qyEnLD0memFpoNRRjVyFOA6Pz/nl5dJXYI6?=
 =?us-ascii?Q?sBO1I1yxXukRw7/tkfaub6x8ZijxedjzCjAShywX/74HV4E1a/HUrWNgQb0w?=
 =?us-ascii?Q?NPQj/OUmBd7vR0dreiUn2ETG2gQTyJE3I1fbfLsCotuePP+4r7zDtYqDOmLV?=
 =?us-ascii?Q?xxyu2nfmo1kWQ9p0S3e9mRFJyaueXtZPN58WMh4YWYU9KOT1mo2IJwyHldYp?=
 =?us-ascii?Q?bHF7VYzdjIPoydT6T47I/4o73mgM0cEnjFfLfvVBArz2pBMlMMuND/5UWKFZ?=
 =?us-ascii?Q?ux8xtOHLJk70HqpL1D7eSGNnhn2s/LdLKqNKsg3jA5EJo8HJlpe6rhI9KXZx?=
 =?us-ascii?Q?gJc5JQ32g6eWMHWtapMU52Qalr73XatRs2zudaG9qa7TosyxPSJoMFGPL4/D?=
 =?us-ascii?Q?icoDE0Af82/95ZaT6D86Ihsb1FJxvanWZ+jGY75OpB6yEA541SJ/LO5VwrCM?=
 =?us-ascii?Q?vkYRf891OJCC8YYRSllGAVWN7I4P4FENNGr9pUpdTovckNZCyID1R/FZNeXT?=
 =?us-ascii?Q?YU9JSzmmbXPwXD6UXEkOpQVTw07RSPH3KPeIOcslZy68+xCN+kU68Rv3NZVn?=
 =?us-ascii?Q?k96n8d8uydAHkpBgeeF9/FKj9qjQjIUtVoV+0M9Zy6iq8nKOmRs9XIpkQWC3?=
 =?us-ascii?Q?YAWW9HsdvHnJGW09TDhCdxIBpxhYVdGmtelzhe6eYvZfBJob9vurJOs1cLAt?=
 =?us-ascii?Q?JLDWBuST7g5fnwYsev2xWODsstka3cjlPR+6EwhmxOlKsqy5MF2I6ocRzHy9?=
 =?us-ascii?Q?O2Xm1vKDWPg4gSm25vD7JK+cMIzDntmv2ypdBSNWEW+WSVvVAooPK9cPVmPZ?=
 =?us-ascii?Q?vGg4eDd5fpKUzmvEKYTiOTEPGpvaPgw0nrnNlXg3vKd32CMvW78A79RD+JZN?=
 =?us-ascii?Q?PwI8K44ZRtQnfBVz6fzerZ+D8qInfkf6yWRPWwdBKZ8dYLH7T6wbOupDm9Bk?=
 =?us-ascii?Q?udNdQXVms9Ksw+gMh3P97jEQj7HaLC812Ho6K+Ir1qYTglaq6nId2HcPgC5O?=
 =?us-ascii?Q?qxTU5vpjmnn5NW+M4s2Y3hiHVjcF78zj4u46znxU9SWEMzTgFcDMqc4Vyj1V?=
 =?us-ascii?Q?XGRRruZ8nTjXnk6/vR0ZVv1vh16NEuN0nERwrtb8TNicWeG8akXqKUvqg0E1?=
 =?us-ascii?Q?Y/jD4zW6hhf4NbKJcbkh49DePVDHBbVkFsYg2SpAMhPEXQW9pd+WzjisOjLs?=
 =?us-ascii?Q?O3U32pbXrAiFxSBO2IL1AuJk0sAdLClzgltXx3AnM24J4EYX0+4LFHZCq5VS?=
 =?us-ascii?Q?1ELbrFz++/uT+hnMouOwrgTODCc1x3N0r0iehxSjrkKGbxMZEoyB?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c20a613-b1df-459e-00b5-08df072a6fb6
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 06:38:15.5493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AzzYqCvzV+J7rdA5nR99IZ5JFAuZOyfQBSC6Es5MSjZpeNwmiEKM0MEN/LAPHVKomCtlWcOz5aaoMlwFs7oLDdRNlyc8SC3rwVdJpOr+HlMGntTC8ldEqztXw6YojUcW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB17278

snd_soc_dai_name_get() is DAI related function.
And its parameter will be capsuled soon, will be not enable to access from
soc-core.c. Move it to soc-dai.c

It renames function name
-	snd_soc_dai_name_get()
+	snd_soc_dai_name()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dai.h               |  2 +-
 sound/soc/generic/simple-card-utils.c |  2 +-
 sound/soc/generic/simple-card.c       |  2 +-
 sound/soc/soc-core.c                  | 20 ++------------------
 sound/soc/soc-dai.c                   | 16 ++++++++++++++++
 5 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 4d825b1541e33..6cbec0994a31a 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -278,7 +278,7 @@ int snd_soc_dai_compr_get_metadata(struct snd_soc_dai *dai,
 				   struct snd_compr_stream *cstream,
 				   struct snd_compr_metadata *metadata);
 
-const char *snd_soc_dai_name_get(const struct snd_soc_dai *dai);
+const char *snd_soc_dai_name(const struct snd_soc_dai *dai);
 
 struct snd_soc_dai_ops {
 	/* DAI driver callbacks */
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 42019daa5e04f..3f97cefd8d43a 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -1116,7 +1116,7 @@ int graph_util_parse_dai(struct simple_util_priv *priv, struct device_node *ep,
 	args.np = ep;
 	dai = snd_soc_get_dai_via_args(&args);
 	if (dai) {
-		const char *dai_name = snd_soc_dai_name_get(dai);
+		const char *dai_name = snd_soc_dai_name(dai);
 		const struct of_phandle_args *dai_args = snd_soc_copy_dai_args(dev, &args);
 
 		ret = -ENOMEM;
diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index e7ad7af04714d..0a769c1771499 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -92,7 +92,7 @@ static int simple_parse_dai(struct simple_util_priv *priv,
 	dai = snd_soc_get_dai_via_args(&args);
 	if (dai) {
 		ret = -ENOMEM;
-		dlc->dai_name = snd_soc_dai_name_get(dai);
+		dlc->dai_name = snd_soc_dai_name(dai);
 		dlc->dai_args = snd_soc_copy_dai_args(dev, &args);
 		if (!dlc->dai_args)
 			goto end;
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 764ce12a694b9..4d0496833b2b5 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -276,7 +276,7 @@ static int snd_soc_is_matching_dai(const struct snd_soc_dai_link_component *dlc,
 	if (!dlc->dai_name)
 		return 1;
 
-	/* see snd_soc_dai_name_get() */
+	/* see snd_soc_dai_name() */
 
 	if (dai->driver->name &&
 	    strcmp(dlc->dai_name, dai->driver->name) == 0)
@@ -292,22 +292,6 @@ static int snd_soc_is_matching_dai(const struct snd_soc_dai_link_component *dlc,
 	return 0;
 }
 
-const char *snd_soc_dai_name_get(const struct snd_soc_dai *dai)
-{
-	/* see snd_soc_is_matching_dai() */
-	if (dai->driver->name)
-		return dai->driver->name;
-
-	if (dai->name)
-		return dai->name;
-
-	if (dai->component->name)
-		return dai->component->name;
-
-	return NULL;
-}
-EXPORT_SYMBOL_GPL(snd_soc_dai_name_get);
-
 static int snd_soc_rtd_add_component(struct snd_soc_pcm_runtime *rtd,
 				     struct snd_soc_component *component)
 {
@@ -3457,7 +3441,7 @@ int snd_soc_get_dlc(const struct of_phandle_args *args, struct snd_soc_dai_link_
 				id--;
 			}
 
-			dlc->dai_name	= snd_soc_dai_name_get(dai);
+			dlc->dai_name	= snd_soc_dai_name(dai);
 		} else if (ret) {
 			/*
 			 * if another error than ENOTSUPP is returned go on and
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 38244d8ac0ebe..6620abee5e811 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -1009,3 +1009,19 @@ int snd_soc_dai_add_controls(struct snd_soc_dai *dai,
 	return snd_soc_add_controls(card, dai->dev, controls, num_controls, NULL, dai);
 }
 EXPORT_SYMBOL_GPL(snd_soc_dai_add_controls);
+
+const char *snd_soc_dai_name(const struct snd_soc_dai *dai)
+{
+	/* see snd_soc_is_matching_dai() */
+	if (dai->driver->name)
+		return dai->driver->name;
+
+	if (dai->name)
+		return dai->name;
+
+	if (dai->component->name)
+		return dai->component->name;
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(snd_soc_dai_name);
-- 
2.53.0

