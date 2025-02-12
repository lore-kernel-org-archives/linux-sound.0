Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011039.outbound.protection.outlook.com [40.107.74.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11E518D65E
	for <linux-sound@vger.kernel.org>; Wed, 12 Feb 2025 02:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739327037; cv=fail; b=NaMmXIRjSAn9hBzx4pz8V8BPDl3tVHXqlc9gsv04yqNB0EQmyIyw/74Zpc47fHkgHAHU8TDD7CeIfdAjp8YnmcGNV4X/xzBZ4+39Uks0ncenhcNO+uIjtGsTdTqVlHun0smWgQ0hLm2y7XaO85bI5yeWyfuEFUQTq01C8kjOCGU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739327037; c=relaxed/simple;
	bh=dRZs0azUVxOQzndpgmglintx10IUHFnZIPHIFTO3R4E=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=sM+Nna3cG/1zUepVEwZSGu7qVcm4VGMiWmfv1WbDGF9IBaqhsuLewtzjjlG3XEj59+cjtZUqpApJ4C55/Bu55nDC8BjLV1tZF7GS8j/cllmqeFF46xr56uyHJlOogA6M361SqADm5jdgoI3ajkmBMh02wtpz8MkXr1+8r7iMEag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=bqC47f3T; arc=fail smtp.client-ip=40.107.74.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="bqC47f3T"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HCDN5/oNKPaHdmKVlE4g2YmDvNetF7c+X59lrM+ZvXf5QcRU4izo+j/+y4r78iEQGwg42peGLT8MF8GBxYy/AVa8jbMCUCq2Uqhp8roqmiTV7zAZMybe03d7VWcvqiAJGVF5DjAWGQaCX6c7dTiw0wa83h23xoMxoeiiRulMFH5iZqfELTupSkiDku5yApXz+TUqFvgPLlAL4ci53wBh94RMPA1jvckGwQjAH0NuzoeOWgLZI9+5S2p6VUWdTXStJHrCzGwysHdlJOtWD3lFfsDwsMFFU4TSg33iayIIiwaOklaR/xERCSTYkdsNCcImoOCqRnSo9bI72XkWLohdyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VJQ+nom6oovn7JIoXv58gg9WGN12dqsZGRPRA1CmIpA=;
 b=L7v8WOOfi112PC4Af0iy4iIbLXkn0XdL1BRLBCKsB4R2+QOuu8UQiE0Vf1I27Yb51dhwABWJnQIFM2jJ63r82MIgJCZBAs2umILcXmEWsl+bx2VLo4KV37izmrnaiva0yTWxLAKCYJgbJM+TLx6VcY3gN6ZZBFz5O/ZPZYL4kGMYjpymz1u2CGGrZtjWTo27rEL9UaqP8472Hb1U0bfejNkh8n1P/ReaxU/Wvpf5jVfYnUg+M54zf3O02esYO3eGkyT1+Pt559oR/pS/LKFHEJhG9LEqN5IrokOJcTGfz/tn4PLT1kDoWA7Ku5pxmVGqBvPbZHBnMJKy7T3C/ZATAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VJQ+nom6oovn7JIoXv58gg9WGN12dqsZGRPRA1CmIpA=;
 b=bqC47f3TRbu5nqF6aKdMKjWmfufjIjx4nXQM1TGno2yfw0lrPNwwMa/sUPjIOBo1p2AYh57MUqVfGrrtnVOYuOMqeHkvCI6VRzUZ04V/1bbakZzvOsOHfKfQZf5F0/jMMnlLNp1SOBrCkfdPCSNL5NFoBve70kOmOySH9wsf0hY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY7PR01MB13706.jpnprd01.prod.outlook.com
 (2603:1096:405:1ed::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Wed, 12 Feb
 2025 02:23:52 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 02:23:52 +0000
Message-ID: <87v7tfyk7b.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 02/12] ASoC: soc-core: makes snd_soc_set_dmi_name() local
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87y0ybyk8p.wl-kuninori.morimoto.gx@renesas.com>
References: <87y0ybyk8p.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 12 Feb 2025 02:23:52 +0000
X-ClientProxiedBy: TY2PR04CA0019.apcprd04.prod.outlook.com
 (2603:1096:404:f6::31) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY7PR01MB13706:EE_
X-MS-Office365-Filtering-Correlation-Id: e9127605-f5e6-4a42-9281-08dd4b0c4ad9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9JMghnYFM6jZeQNNtrmWwo7kxmAYSCDXaUTi3Mblar7va6HLjXOQg8XtaEMy?=
 =?us-ascii?Q?orrnCivRGw34ke8xpSDAh18L0pw5/cweRCN9U/RmFPOvMphLUDKcf2N0vKoe?=
 =?us-ascii?Q?WBIEOZZbgIly3qJE/icfDzZZrT5rUV7y4bWd4BpQRjjgSibwIYLveMHB7jqm?=
 =?us-ascii?Q?0Llw19aHY46dIt7kMLOWZzJ12oleqoFs++Lmlty/X9uLnRb4DM9d/y36tNUG?=
 =?us-ascii?Q?laZn6uAeVh7C6bKmv1Z6dQWu5oyPfJih1Vn9BsvxqvPg6u5KfmVldFRhA4RB?=
 =?us-ascii?Q?+bmgz/hFZa/yt65R/9a7+Byrb6Rl3UwHSgOt5YzJwhD8+fPkXBihu+qPrBNW?=
 =?us-ascii?Q?Mc0bwMaA1g6NGbC9qlFvB+neGDqHGcspIiq6DNg671WIv5bYgNJrZAy24Zo2?=
 =?us-ascii?Q?jtOL38JbXXzyPcZRcA9DxX0d4NjM+Lux3JeddxlvrWv6e89QNPUUN/QPKEC5?=
 =?us-ascii?Q?6bc1eKvv3Rh3xDN3y5H0IilEBsvSO+ob119WXMxtZuJESqsaFPkUbS7ym8Ol?=
 =?us-ascii?Q?65fHRgTXNecGY9mCYg1ku4pDz4tKxFmsyxTH5ump888S5E/LRekosF2UTZED?=
 =?us-ascii?Q?YVOAQLFha97Q2c6n001w3u5pb691xe1wu+E2nAcHpeoG+/BH1VEt/G2g+Cx7?=
 =?us-ascii?Q?6QtbV1C7u4dv8ov1YESqPGhE7bPDhOprOTmf3gfEhclHOCtpEYtx+1wio1zA?=
 =?us-ascii?Q?xATO0m97vLfZ6TaCWCp8mY5D/SBKGg9UiX9eFXBeycS63JC6KlcTFF/9IoXq?=
 =?us-ascii?Q?PeIM6a9hyptx+sALZNZkpYUvBOJQPKnp2r8P7M7Q4/lz3NFE2nOJwb38kluX?=
 =?us-ascii?Q?RufIGO8vltMaHEVRZUx0Q+oo/Zeio06K+PIa8DllRps6Zqq5Va2pwBvh3N/m?=
 =?us-ascii?Q?LZC9mlAvhFa6CwM/YfegbMc1DV28rC6jRcncMoueSN/Mgh6St/hMOUGEZ6lh?=
 =?us-ascii?Q?EtYyavBS/56T/8ASnpj4HzixCjsUncp6yVm9vbytuxI2k/mrtDymv0hThbl7?=
 =?us-ascii?Q?SsyPY6PgF3v0MJX3vx8V2XmU97H8FPZdoKjCld5q0XOg4V/naFTIM4Xd6FeA?=
 =?us-ascii?Q?wIo9i7h0zhisTnxSCUk59hjHEmGQ2+3Fnow2O+iqVUVuQUKXiyqCAl5+fvx6?=
 =?us-ascii?Q?HvaCHXkln2TgQrC8cVZkrBVhFn36vRt1rNOlghrCO/D5MfP4UmGT1HhJRoXb?=
 =?us-ascii?Q?Q8DI+MrbdaS+G94j98PaTkr9LVByviOOfdIdVi7tzdG2bTUaVx96IbxjUko8?=
 =?us-ascii?Q?uuoM5Hqqr669t/47CN2sJSPS/hIsRnWnxOcvlb0AheNZLd6LYKlY/fZW72HT?=
 =?us-ascii?Q?guOJZ3Z+XWjRpqtQ2ungmrVnzvCkfE24Bz6ruHhlRlyYw0cbezzkNtRtbnpl?=
 =?us-ascii?Q?lPKjkxuYdIga1vOAw5oElWRzOYKBcNSAk8X9+loxNyI6RTqdK4Ylz0Chl1Uz?=
 =?us-ascii?Q?NzeDcioUG57gwcwcODxah/0bdD2YzpvP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EX/651x50A9MHfN2NuYYcJALFSs5dxe9GPCLzpbaHmSWCqAY8nIbXCpThkDr?=
 =?us-ascii?Q?2a4EcxnFzLmAI1TPaPsobf2pt2ubQZ+CAd9cQqcql3A7HrhsqSQyQWTwSogn?=
 =?us-ascii?Q?y/MsqG5QDiks+/870UanjLsJZ02WJcIuK+vC4npbVyUfSxd+ZFXBX070QTQv?=
 =?us-ascii?Q?/PAyMEglHSY+g+QmyFW9UJy+tAqgljXf3/jd7oz7QOjqcpQ70aKh3KedUpKf?=
 =?us-ascii?Q?6uRKASAU1/MiZLXPiLoL0YYcna3jrU9XISGDckehWV/QHPl05fuXxKEjbBXP?=
 =?us-ascii?Q?ZADxdJlLMkY4/JLNzuC/kuoqOcbk2ERkNXZA2UeqCS7IXd3RK/Wa/Z/Kiyo3?=
 =?us-ascii?Q?AVdUm1+6vbGjfi0VVDcxgerUslhP/lq1p3AVWk9a2MMi1QmQUZ2RoDw0BG6B?=
 =?us-ascii?Q?l8kyGDLHGQ3V4F7+LLWF5q/LXWsODlrnHBYxhhwTwVwTvVu8P60o3Mntp25M?=
 =?us-ascii?Q?HIHswpWB7KKxDUhKPEeytZNs1pjTIc83jSaFHEKuyc+3CzJPaxD3Hi12a4gq?=
 =?us-ascii?Q?tL230x9v/h210R16FwciNcA7xRTRH6MtUXX7e5onzzRp7aq0w2J085UiYnkw?=
 =?us-ascii?Q?X15aoLm4Lx1XBuHoZYAky+SBmWWlEDJKbxWQy/YJxOW714K5NWbmr93wkxZT?=
 =?us-ascii?Q?bmKDlb5dgBq3aStdp9cG+HJmUTfoVx6GKyEGvTeVcJtH1TsqKl4Pl7PBYe1O?=
 =?us-ascii?Q?vm4IGjxPf/FfN1EPeqXgIhpErhcAwyOt0IfrhQ9YW3Z+yL/xnkAbS9E8dXrs?=
 =?us-ascii?Q?EhuQEdEjZpb4Vl8N2GmGO7byotihxwnJk0t0zf+lQE97sab6KjXI2pb1FhBT?=
 =?us-ascii?Q?TT07hkzcACmOHpwpQRKngAtaghOctlvsFWYhYYTsrJ0WfiCfX0VoIv1k+pNO?=
 =?us-ascii?Q?gq0qanoAV2+S5gpzw87e2//R7Hn2r3LmHEbLvMu05cTBN1jaN6PKBbQDs6bN?=
 =?us-ascii?Q?vQGUJXB0YarIIcLomXwoe6m+6DO/oGPsy4c7Oq2qyJTmakWnfQFEvnsmCcHB?=
 =?us-ascii?Q?VMJYZDNr68+dUZJQssv5DwNIrRZJJ99Vj2+Itek+WSC0JjqtlIYUuC5pPmmN?=
 =?us-ascii?Q?v6RnjstZ1TbqY/yVZzMiXZ5+oOGze20sOrHfILZ2S55EVCo6oNE/j5ZY5mLO?=
 =?us-ascii?Q?LunBwvK0R5pdThKdt6NDCL4H5Ezz3cwZj2n9/2mYTfwzSzOZOVjWuurjpeQ7?=
 =?us-ascii?Q?EaZsi/yLci+FFkrf5g0AIBBD+/5BF2Y/nvl7r5meCizectISn0Cmlx8mNp4L?=
 =?us-ascii?Q?9gSnd51uvDfheyFg55ULHrhhNTBebFo1mDXSKpJMeiec/NAnfslxgXqJ3uoN?=
 =?us-ascii?Q?yw0iCeUcG2E5IbZxB2QQNsqZvmyZgn/hGR2uUEyBqow1Hpp+HydY9XFZMblk?=
 =?us-ascii?Q?eKYEBI7BabJM8Jh6RMG1m7uw1Wxrvs3dmGeiTA6wUFIMXkUJGSVyhEdy68IZ?=
 =?us-ascii?Q?/Kdsl87EEXKGXtjirnFLCaON5ZDEi8qSDsyrzNfQRoqvhq92aN5PPqRQCZK+?=
 =?us-ascii?Q?46Pk+gtNtB3KNdW5XyLtL2/nm0cyMBQLJYjSX0nI/eW7+7q+kN39UC8DlHmL?=
 =?us-ascii?Q?URR0ZhI/GtG86NoQbRshC8tgZqkq+eY0+RltNiZJZ5mCuw3DOQFGyJJZdZH5?=
 =?us-ascii?Q?iKDkOofuOro+tLm1Lbq3qGM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9127605-f5e6-4a42-9281-08dd4b0c4ad9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 02:23:52.4885
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XjOMHP1YodlGO29qUg6lC9kXffqjr+hZhuLlGnRW46s9FPZgkWMgyfzwqqcWTbNglZABIfLPgnJuGdTNaNeDctJbeaWNsNDYqwDZSglF7Bd8RkCVAr5d6q+C1FSFpO7/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB13706

soc-core.c only calls snd_soc_set_dmi_name(), so we don't need to have
EXPORT_SYMBOL_GPL() for it. Let's makes it local function.

No one uses *flavour parameter, let's remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h  | 10 ----------
 sound/soc/soc-core.c | 15 +++++++--------
 2 files changed, 7 insertions(+), 18 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 16e4e488521c0..62c90ef40f1a5 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -522,16 +522,6 @@ int snd_soc_runtime_calc_hw(struct snd_soc_pcm_runtime *rtd,
 int snd_soc_runtime_set_dai_fmt(struct snd_soc_pcm_runtime *rtd,
 	unsigned int dai_fmt);
 
-#ifdef CONFIG_DMI
-int snd_soc_set_dmi_name(struct snd_soc_card *card, const char *flavour);
-#else
-static inline int snd_soc_set_dmi_name(struct snd_soc_card *card,
-				       const char *flavour)
-{
-	return 0;
-}
-#endif
-
 /* Utility functions to get clock rates from various things */
 int snd_soc_calc_frame_size(int sample_size, int channels, int tdm_slots);
 int snd_soc_params_to_frame_size(const struct snd_pcm_hw_params *params);
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 26b34b6885083..ae7b3e39d5ffb 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1887,7 +1887,6 @@ static void append_dmi_string(struct snd_soc_card *card, const char *str)
 /**
  * snd_soc_set_dmi_name() - Register DMI names to card
  * @card: The card to register DMI names
- * @flavour: The flavour "differentiator" for the card amongst its peers.
  *
  * An Intel machine driver may be used by many different devices but are
  * difficult for userspace to differentiate, since machine drivers usually
@@ -1915,7 +1914,7 @@ static void append_dmi_string(struct snd_soc_card *card, const char *str)
  *
  * Returns 0 on success, otherwise a negative error code.
  */
-int snd_soc_set_dmi_name(struct snd_soc_card *card, const char *flavour)
+static int snd_soc_set_dmi_name(struct snd_soc_card *card)
 {
 	const char *vendor, *product, *board;
 
@@ -1959,16 +1958,16 @@ int snd_soc_set_dmi_name(struct snd_soc_card *card, const char *flavour)
 		return 0;
 	}
 
-	/* Add flavour to dmi long name */
-	if (flavour)
-		append_dmi_string(card, flavour);
-
 	/* set the card long name */
 	card->long_name = card->dmi_longname;
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(snd_soc_set_dmi_name);
+#else
+static inline int snd_soc_set_dmi_name(struct snd_soc_card *card)
+{
+	return 0;
+}
 #endif /* CONFIG_DMI */
 
 static void soc_check_tplg_fes(struct snd_soc_card *card)
@@ -2256,7 +2255,7 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 		goto probe_end;
 
 	/* try to set some sane longname if DMI is available */
-	snd_soc_set_dmi_name(card, NULL);
+	snd_soc_set_dmi_name(card);
 
 	soc_setup_card_name(card, card->snd_card->shortname,
 			    card->name, NULL);
-- 
2.43.0

