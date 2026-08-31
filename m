Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010037.outbound.protection.outlook.com [52.101.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841C2281530
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 06:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788158303; cv=fail; b=GLYVmxy8yEdBsGVQ1pP1wIu64c7Nccj6uHGDxFsDNYk0mwfAD0kJxaBJRnrXQUV6dA1tOvyqAIu9nP/QLbIiqojDUDv+bSa53fBWz2fT9RKumof/AtCwrxtT02GwupoA51uNlSf2YTC4hsxbYPlDjW2dv0sZrtbNVnQ60ZbxcQM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788158303; c=relaxed/simple;
	bh=A3sZ4yvATTL+wDRt3shoLWyS6HIGg+Ogdwr5YNYtAHI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Rm6IJ0bwVvDzvFdVy33kYlj2T2Ym5shg6lXFUv9oVcYg8lk85oij4S9SyvD73zPLBA090gSh0QelNGD5FBCDrfdGHWnpRcarR5u6b5oYmAcRMYOsiTnp2hstzM3hX3FnVtiFdHrwQfq4dhhLqeE2xcYdQP96rkMrhVDwz8NUDFU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=DPt4Ae3z; arc=fail smtp.client-ip=52.101.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="DPt4Ae3z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YxXMX0VsRpNNR76yPebch4G6u36IaZqEr82qnkPqyBTDbYmWvpwya2qp34IOKoDrOXWF+nQ7mG+gnDiAFSRnCdwavwBeZmvQ+95Ya8U+2Oh8CoZR4n4Q7BizrkKjWro4kkd9RF2I0OvjeuWsDGG+R2EHwxD0DeFLRsCbNNw5hAzH/2i8Uxs6dnvQ3mGO6tDFevh5Fg+8GvdQJEF95r5Lk7OOtUkJSx1VFS3TIjVEQv/o25s47lzIellWIMZ4DJCqTBbZXTNOBHuz2VQSFv+lo0DyU8Qg/80CQk+5Ki+UB0BFShvwWgnKCxJuKG4xQ6Lsigj9DSV1gBm0b5L1mDqErQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dTtLV8vx85fRRfjFF0v0LAUenw5hEczNy43Pj9o0PDo=;
 b=QyxHiNjEcQTOA7bajykisNzdIcaOffyuAPaaENDtJ77vcYmp7zP7spVf7huCIne9XVNA+9ZFfezUjEgM2N23VhecHbnxlu8xUYkA6RLKZEjRPjqinTtv4xYZEMV+DodyVa1RuJ0bPVIydL4idwgT9ID7khyUpiDMEsO0PJBPtID+jn8YV1+BqBMweKqGRRziXEG4MVhzGCBdariCzNHuVESBDmczXbT8G74Pao/L2RtZqVO+qW7SkGo6nipaV2cSZ+1sxL/tkCLAwYcFTLwAl7GNqG1JxoZpy4aZhAezTyCwlz/nu9LhhMAY6SjFNEHQIiY7fBWaAHAxvzLlO4rmuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dTtLV8vx85fRRfjFF0v0LAUenw5hEczNy43Pj9o0PDo=;
 b=DPt4Ae3z1bwNp/IIkpI/tASQiOP6AMEAIGdgGCBrwLZpbwILDC69e5pKUEI0O1n6wP376jFyFFH5B53OAtKCB2Q79zcevZqbMVUOdMLJlj5ZxY5smGZJ4AaS2p88PKjix6lQxolgpdNn+aogsn8XXgk4QCN8yE6a9qOnZ2fVdwY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by OS7PR01MB17278.jpnprd01.prod.outlook.com
 (2603:1096:604:424::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 06:38:19 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 06:38:19 +0000
Message-ID: <87wlt6sskk.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 04/14] ASoC: soc-dai: move snd_soc_is_match_dai_args()
To: Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Vinod Koul <vkoul@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <8733vuu75t.wl-kuninori.morimoto.gx@renesas.com>
References: <8733vuu75t.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 31 Aug 2026 06:38:19 +0000
X-ClientProxiedBy: TY4PR01CA0096.jpnprd01.prod.outlook.com
 (2603:1096:405:37d::19) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|OS7PR01MB17278:EE_
X-MS-Office365-Filtering-Correlation-Id: 860d3616-6dae-4fd7-e3a9-08df072a721c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|23010399003|366016|38350700014|10067099003|56012099006|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	J28XVwC2LOJXeM3vnUUbuXcdinvCq6loCPwSJpvxW7oCLQ9Zn+hE9J6We/1Y1fbGNpE9ywHkdCI3Dw3miPlqh6lrTradbxQd+mDEZKBtHrqCVhNn5o3mlvChYdbctizRjCpjLGz7icPeLzbRTaEexXqg2eZ1KuxSm3RSClSgXuWLR3YJuyW4hP1zr0hNNqKam1dMSBO18xlnI6SxegRHgjqk4uj5dx9FSoTaGOyPtfSM+iK+qcZfcy83wjzKE/2SVGCcbwZWiEP5nTaF8d7qoxhgq2ZBp8GaT1alWmhGS8jWgRyBrm3jsgJcrpx3hjpga8gjuWE5ku8NeMDTSrDZPh2SWCnKKI9WKN4yZxXdkk520JVV3WiUBgl9tBprnsTcfC8svbah6lCeDmnA0Q150WVBtX0NgPxNea+sANz52po8rjZaHBLQFTPtOtXqn1XjMyooq6iTuU8ITA7Ebdsma7VnoBsFeHqav5tqt45daGn3VyiFzCc0TtH9cSRTdl1iKA8Dt7QAIgIQASAqOIZhos4NRaNx/5AU8C0G0HL0LhEGZTIPr2pp8DKWku94aKOCh0bP6Cn4XtVpQo5vjiSGHNYK35PD5LYwe+DCKHyXMNX8bs02+Uq4ncssgSBmy+UtFo4Y+ngQVnsftRhZ+uGHy6PSYPjwozUUZR4voxdnk5nJJGvH8wZWQpt/E4KNRWQKYvWU59MtRm2uHJ1dhuxWy8uILaQPDJAn4qjr+MOMlaE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(23010399003)(366016)(38350700014)(10067099003)(56012099006)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gEySn7552+F+rx8Pc6fBpGglqxfEsBtOlq2VbjwMKSGzPJb1ItW0wZ2b354b?=
 =?us-ascii?Q?QKWYCsXfbZ12wkNpDx2L7ksoeVYebF/i+M3YksmrlsCdnUheC5OPbIGpDuZx?=
 =?us-ascii?Q?McfjgD634Tr/6J2cuoZ5+2F8g7RYgY9Am5laKpgx4wF1lM/YRk0rBqhfjSY8?=
 =?us-ascii?Q?ZJq/VAW/+Wy6qzm7UmemP9OHdCSATEu24uSGFB2dr/MFdNlnpnob7yapCDdQ?=
 =?us-ascii?Q?MDNvqZhreJz3q7Hk3EuYeyDPmhoeU4QUMM7w10ABdqmWaKrpl3MenlcWCFUE?=
 =?us-ascii?Q?v9Y6ZjEtmGC33Eg6yXKgX0rsY7x6qtgcJfUKYB+oPUNaUFr9q8mPnFV8KEa6?=
 =?us-ascii?Q?/cA4Uo+Ak/xhmi4GJ3yRQ8RgP9mPEcJys9AjqNV3Z39LixO71WxZt/A39azF?=
 =?us-ascii?Q?Nh1dawpOV5Uhmz0ubQnlmIuZVQGS5jGj5Qqy66rzBklesLJdNiXeeEXKzcKb?=
 =?us-ascii?Q?+g9Vu6zq/UGfwiH/nnJalus+zq3jOuUzar44+cz/Q64r1xl/mDDs7h14fnrD?=
 =?us-ascii?Q?PPXXxvR3NpuO00bhbIO2dDbfOgHaYTaDCvAKeekxij1x/Q+ecH6DPcp2n/o1?=
 =?us-ascii?Q?hx9WpyMUSc07xg2uiO5KIsoI3zokgROQbvGDFB+KY8WJTP2HcHiSFPOOMokY?=
 =?us-ascii?Q?tckW9ih7AgD188gnCJAmxcKpyfV5KEDe9MdAyUw6BTNYd04V95tHVIF5sGNn?=
 =?us-ascii?Q?P604i0psOT4HN4B9stvUZDcPsuGRZvGkrrmfCA10iGjTrEA/R05V0kubvRbO?=
 =?us-ascii?Q?i8AIa47flRSBC+R3iGBc1EGjNoYWi/EIlpjiG0Smzm/dE60ZiqI4hL5ijNgk?=
 =?us-ascii?Q?c0686zNeeUuD0/tDn9TiQoF83+d+ogvNrSgWCrwcXLVLDA3wZysJmQCFccK5?=
 =?us-ascii?Q?z3FvR6mOxw5tv9dU8KZYP7VStgylOJ90TnykriOUzwnTrJblhvs7SRKMHWqS?=
 =?us-ascii?Q?yuCnr2R2Pt40PzaxepBftvbsBekjwOIq9vR18HrbinZzwgVsUvMsUt8WQzyB?=
 =?us-ascii?Q?FsdgS4Ropj0MDjp4VyRDu33kIrIae43xIMISavbMKb08mwqFzxHnfEVewiOZ?=
 =?us-ascii?Q?8DL63yrxABFek5rIBEgSRytx5G/5pTH6Tm3Fq6/xOtK0dyj70bcpHuGO69VP?=
 =?us-ascii?Q?lFvyHOyw+/9J/VhquJIT8tbxD8tzrNjzEDNBNTd06IFpqFtOjVldQfb7ruHy?=
 =?us-ascii?Q?Wo5n46EwjTbZEPIT+c1G3Z7joAzU1gbsLs8/92CGfMF/MxaOiz/4eljJD3G9?=
 =?us-ascii?Q?c1+qEGjwNavNLft9HiIMUBHtPf5K8QTmmZdcQ99RW2n6vanjv8I6pvU6W9+T?=
 =?us-ascii?Q?yH3l1XeXeuKR2VFKAv3etPeOgreR4rQFXAD5PUBFhtAOMGos3/VPMl+wEru+?=
 =?us-ascii?Q?dPXmX8i8iPu1VeMe3o4UnHcvyA49kP24MhIPCZfgtz6k1ndmXw9712G9EeWz?=
 =?us-ascii?Q?kf6Sd0fErP3gI3gJ9WxEcl83n8sKednswuwboTr/+MMIA8V3wNCIMKQ7qACI?=
 =?us-ascii?Q?UuM5caHIzufl18EsoM7uVzscuIGSgo5FmzQGJATmENgLzGv5VLiBs2vijko4?=
 =?us-ascii?Q?zeBhXC2U/JcgwQwjK02GEqAY60gpOO1dF0c4ZUWPFHSJZ+TMug74A2cjM5Qw?=
 =?us-ascii?Q?wKqkiXUUmQ2Rz0VH1VxZR1TrYrc8sxcJet/ztuhBaw5krF+vdB3U6khUsWb/?=
 =?us-ascii?Q?PeTssZ0Q6Z7KWz5GnSIloC5HxTLTck7fzQpIIEVwuILez78X8FvT452206tr?=
 =?us-ascii?Q?zwj4cPPQeFp5MekXDFwYKeLSwJagCGMvIopilIZypdTes9MOqvmE?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 860d3616-6dae-4fd7-e3a9-08df072a721c
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 06:38:19.5657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gPGowdTcZuXsmZ++jeQM7kQK1b8BDD2W9e2vohj7EJslzcmrZj8A97EhgMIUfGMPc8bkzFewFTLaKEwqNEfBRHZ1HvQim+z/ukJCs4BeRRi+e8LtK1bjW6CU3mBkcRnM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB17278

snd_soc_is_match_dai_args() is DAI related function.
And its parameter will be capsuled soon, will be not enable to access from
soc-core.c. Move it to soc-dai.c

It renames function name
-	snd_soc_is_match_dai_args()
+	snd_soc_dai_matches_args()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dai.h |  2 ++
 sound/soc/soc-core.c    | 20 ++------------------
 sound/soc/soc-dai.c     | 18 ++++++++++++++++++
 3 files changed, 22 insertions(+), 18 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 6cbec0994a31a..e2d995bb1c788 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -278,6 +278,8 @@ int snd_soc_dai_compr_get_metadata(struct snd_soc_dai *dai,
 				   struct snd_compr_stream *cstream,
 				   struct snd_compr_metadata *metadata);
 
+int snd_soc_dai_matches_args(const struct snd_soc_dai *dai,
+			     const struct of_phandle_args *args2);
 const char *snd_soc_dai_name(const struct snd_soc_dai *dai);
 
 struct snd_soc_dai_ops {
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 4d0496833b2b5..9d67db679336c 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -233,22 +233,6 @@ static inline void snd_soc_debugfs_exit(void) { }
 
 #endif
 
-static int snd_soc_is_match_dai_args(const struct of_phandle_args *args1,
-				     const struct of_phandle_args *args2)
-{
-	if (!args1 || !args2)
-		return 0;
-
-	if (args1->np != args2->np)
-		return 0;
-
-	for (int i = 0; i < args1->args_count; i++)
-		if (args1->args[i] != args2->args[i])
-			return 0;
-
-	return 1;
-}
-
 static inline int snd_soc_dlc_component_is_empty(struct snd_soc_dai_link_component *dlc)
 {
 	return !(dlc->dai_args || dlc->name || dlc->of_node);
@@ -271,7 +255,7 @@ static int snd_soc_is_matching_dai(const struct snd_soc_dai_link_component *dlc,
 		return 0;
 
 	if (dlc->dai_args)
-		return snd_soc_is_match_dai_args(dai->driver->dai_args, dlc->dai_args);
+		return snd_soc_dai_matches_args(dai, dlc->dai_args);
 
 	if (!dlc->dai_name)
 		return 1;
@@ -3516,7 +3500,7 @@ struct snd_soc_dai *snd_soc_get_dai_via_args(const struct of_phandle_args *dai_a
 
 	for_each_component(component) {
 		for_each_component_dais(component, dai)
-			if (snd_soc_is_match_dai_args(dai->driver->dai_args, dai_args))
+			if (snd_soc_dai_matches_args(dai, dai_args))
 				return dai;
 	}
 	return NULL;
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 6620abee5e811..ac815aa212d3d 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -1010,6 +1010,24 @@ int snd_soc_dai_add_controls(struct snd_soc_dai *dai,
 }
 EXPORT_SYMBOL_GPL(snd_soc_dai_add_controls);
 
+int snd_soc_dai_matches_args(const struct snd_soc_dai *dai,
+			     const struct of_phandle_args *args2)
+{
+	const struct of_phandle_args *args1 = dai->driver->dai_args;
+
+	if (!args1 || !args2)
+		return 0;
+
+	if (args1->np != args2->np)
+		return 0;
+
+	for (int i = 0; i < args1->args_count; i++)
+		if (args1->args[i] != args2->args[i])
+			return 0;
+
+	return 1;
+}
+
 const char *snd_soc_dai_name(const struct snd_soc_dai *dai)
 {
 	/* see snd_soc_is_matching_dai() */
-- 
2.53.0

