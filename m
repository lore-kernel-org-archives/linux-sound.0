Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011059.outbound.protection.outlook.com [40.107.74.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A6634AB00
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 06:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788158294; cv=fail; b=l6+bgu5DI5aHBfNvoM93pkSV51cmYfs7hLbwNYlab+vCniQopDzEJeL9XxfX4vNKeKfxcbYipvdqXzhzBdNBHHnA9argiZAk9mVN35Yg6GoU7kmrFNh6SaF3Kc1BcjtspbibcdD2qiP9GDUm6Mcsuz+8b9+lhGFr8Dv1oO9ZpBI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788158294; c=relaxed/simple;
	bh=3GUkw/LYEw09khwqt5gV0uHDDhTKN4f19xtG67w0klA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=RjVUTd48mvonKT0IusxLpTjAsnOF9NeukMDVb/BHvuI4DF5S0YKmlOyfWNb7zOfj+7Bi/SyJZkSC2/65W9xVxa5K0tY1k40TOvrQd+Gqkc7cRoMaktGziHRJd5TEABAbVOar7mEvrOzIfto2hZrnpnDRZfTchr/LWoVOyIlFdp0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=mwPFxc+D; arc=fail smtp.client-ip=40.107.74.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="mwPFxc+D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OGoHsCKy2W8TR2ckqxCFQ41I7YoMv4pq66JsS+oJ7lY2i/wG2KcE7uFfl/YATkraDbkQL1XwG7o7wayBve+d5HpRWkSBJ1y4eZ4qbHPp0GKQSHKaRFNPUXuD9NMGRAKL6v0s1JuQiVE5P24+HHtK7KLG99tR0X+eNh2bVIxEBM4oRiobCgvxObJNcDVHDIJmHlH3X6Qmk3yYrT4FvhaRM4cdcFyMt1TWROVaQkRDlM8UAFKL35DWXTckk0lnbXKmLIJYcIOFR2Z3yATwfIYnslj8wUFL54fjavz2zHjSfPML91Zwdo19zvy4ep+2QMSzAU732RowHX5k090cZqXB1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/6zZmE+yRFzd7KABJAu1E00Q/jbAJ85UM4kZC6Ud8q8=;
 b=GMYh/2/TIFMhK/szrJX5ByAzkXA5w14pYAwuN9AiItRBemoWxzgoALQ0H8E5o7UnhBT2TZ35XPYAOK5Ky/9q4l11K0oF9ZRENtWUX5wpytvkW6zRILd3gx87as0AfDtHPAWtoeDNE7Xo20H0KWXykzgwAOOdRPYehFzoWi8AODWJPCywSc0UOzcIZ2BQxMKJQu89OJ4Z0O4J2JT26kF9uTcicwCLaCT+DP8/RDsODfP2lDVSDJ4QG5Com1u2x6onk8wok4RSRQx1j4fTfGGw/MyIbvPUDXgX4XWEJyiG2W7jkF7gJ/pbSf6DnwULQvMBqY740kTSyoYvi8lkRPjzNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/6zZmE+yRFzd7KABJAu1E00Q/jbAJ85UM4kZC6Ud8q8=;
 b=mwPFxc+DMDYY40nFYtveZs9k13BTMINvVqYM9onUSgNpW//iPYefm8jvUHapkgyNhbvfKN0J1/1xZbBDBinCXn32LzAX1eXUz7tP9tWfTX4a23l4nJ0IX+hzzdgR/sO916xOqDdwtUK2f44ANgsErDt0HmVP5bUfeEldJGiwj2s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by OS7PR01MB17278.jpnprd01.prod.outlook.com
 (2603:1096:604:424::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 06:38:10 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 06:38:10 +0000
Message-ID: <87zey2ssku.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 02/14] ASoC: soc-dai: move snd_soc_add_dai_controls()
To: Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Vinod Koul <vkoul@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <8733vuu75t.wl-kuninori.morimoto.gx@renesas.com>
References: <8733vuu75t.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 31 Aug 2026 06:38:10 +0000
X-ClientProxiedBy: TYCP286CA0199.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::17) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|OS7PR01MB17278:EE_
X-MS-Office365-Filtering-Correlation-Id: d9f948ad-509c-4961-a8e8-08df072a6c8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|23010399003|366016|38350700014|10067099003|56012099006|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	9AJ0IwzzMbaOIxR2QieNo3M10ntbMn6nX3R6LcbSWPq8EzUi/r9kJ8Zs2KGfrE5RH4pqKuMjV5pI18jNS5t/hnLlv5of3IujmStcSliUtuMVX7+abGRqVNoBPJ77m8sJY/dDts6cKIN5slKdLJSWdfDQ/p2Nnts1grvamaZOY8ANDjkQq3e9s9ePjbA6lCm2VPD474ZXpvDyTGU0N1x27IGOfbV+KlIoxSB94ANQOnHE1sQjfkTITBJYjq21njAw+XMfDKAO5ZQ7YrdhA7+jhaC6w2YKh16Ie4MLXNMB3zHOG2zm9gaDIkkWGX/bhjgOf1cY2czcQFwKW2/Rj5DJOJPmYUUmhVKn3qv7A123GPIyey/aNljiSjZXtPTWDODxi3G/uFzP3gEjO54XjYHXNkfo7+7PgBN85ix1NfU16CA54ZO2ZU7eEEa2Sb3aPU2xI6V2KJ2x1yn3620PAyOuX/TO7Qp1jcOnUymuyOgs7sqmfrqMiErt0NE1A4oRJh7nNuHixGEu0Zcqrkvk6m4K399BEiMn65SXEi4EcUKPee+d6fErPeK2EXar9fXEY0LUhHYieLr/72uRfu8TZUFR/vEpokEusVzD8Wk4D+1wg4vZttCjkziHHwfjux5hBqivjnWxPR8oGWBfnSA7HdEP/VWVJwgZj9EAgtBKty01OnQb6M1ti+Gs1BOe8dEM/3rKqWdOhSag62yV+6EsB5x3Zpan1d6ip5lNFkVjA7fTDzM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(23010399003)(366016)(38350700014)(10067099003)(56012099006)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PkvTCJEjowus4qvPZAIMLvgJFFhsF2mIFADVRz1BFHrC4giRlOdAIu5pl988?=
 =?us-ascii?Q?t45zV7zJvdVQEVM3eQLTG6Em8H5s8b69j15Bg8RWWuglb9qHvpInOrM90AIl?=
 =?us-ascii?Q?xx8TRTjt5OTWYdmyvcYk3ocABJk1XjpVi9to3NlpuiujaH2DvPhjUvY7Hux7?=
 =?us-ascii?Q?cF9UbXxLLKPTY0N1OvsC1hUwmJMEmDemeg7tMS+AHK9ljF6T4b4Hc0FFjPdW?=
 =?us-ascii?Q?EJiX3YRoKn8YNxc9zkW0849Tk66Xw9dNy+YJlM/+ichCWONK6oLNrbYyA9wz?=
 =?us-ascii?Q?7KfqbcWFGe6CgLxVhQJpbbbleGgrm3SC2p3QmS8EXiWyOtupP2EYGXUoAfM3?=
 =?us-ascii?Q?QCpXRHupV8CS6oQqDh6W3SWhcUM1fW3ijikYkZz6QPnBWGILHehMiR3QEI48?=
 =?us-ascii?Q?wVNQmG0+6Z9sZr97hx3l5gC8/OWIYyTYe27Kq/SNsLpdfJrQqUlUm+cWSI+e?=
 =?us-ascii?Q?LMI36zpB9ceRS8E++LEbyoEftYGV0pdQff7fIqo9yOtNt09pvc5QHuj+D0DL?=
 =?us-ascii?Q?HEgSebaHxc3aYqYrI74gUrBHwblreJ+3lad3We+66mU/SL0Gb0adZpBXjZur?=
 =?us-ascii?Q?3OUlQMbhblzPztaMLHUQnkzYGwUr4X8FLDTVLA8mDeCsLpJXztVke2XWlMIt?=
 =?us-ascii?Q?zN88REgvxCl9aioCPo85R3OHHpExerc9k9Y6eJ0IEGBzsjAokRT2iGtPeMoW?=
 =?us-ascii?Q?OxG7/Wb3TrgpphjGHuxqdjxxWdY7iu0TrlS1Q/BTDannK4JSG6/dDC3PHnra?=
 =?us-ascii?Q?TM8L+tXnLeJabONMwLfwAk29qOPfEhP5Z/vfuu979jXfMuz0/KxgDxLbnmQq?=
 =?us-ascii?Q?aP8eOFII523MpmO5mn4x7WWUTdkLJMELE+YjyuiWzHT8B2rhjBr2NGK5IADO?=
 =?us-ascii?Q?6NlVNupUpyDSQRWLgRerht2Xqmb4pjTWfeX2+fnUSf6WgElVBdxOn3qXCVhl?=
 =?us-ascii?Q?W1Dhrm8jTTKu1ySgEY5NCa5npRVvgQCQbFLLQErxpFqGj0/siyeuBPrprvG6?=
 =?us-ascii?Q?ath6d4kBitXdpvKRZsVJwL4rTHqBe2ezMHOPelprabPKOv1m3ZQ1qCTpW5kD?=
 =?us-ascii?Q?aEjjI5CgLLlUlDaFEdGhdJ0IQMFexrusN9EQA1i0YfRqi0ogIR4n5EgZUwje?=
 =?us-ascii?Q?zN73AEsMtNPYdArCSnhcseiGSHcZOM7QyPOYgc4YkwR/k93AdbsN3DFuXZSu?=
 =?us-ascii?Q?eRIYeVZhbjBmwXVLoi3jln6hIGlOs5WcZ13zoc7aOaCawNvA3SjevT37NPVb?=
 =?us-ascii?Q?lSX+p/d9DIr0YAjLQaI1mRcyYC/XmR2h1QD14Cnp/ltFx1WIVcij1oVYtwZl?=
 =?us-ascii?Q?HCzIEIyiAe7IGcM6Z9ywYdiOMPl/Oqd9WeXFOLPmrZnqFvq6Nt/icgbSfes0?=
 =?us-ascii?Q?5sKJIQ0ljr8VBh7CVbEYqIqatf04Zxkq7qOM+o8Vl6WjzT3/63sK5rkpREJw?=
 =?us-ascii?Q?2e4AjhmBTyZuz1gdOxi5p5EZh/TloA7EFyow6tXBSmo7+GbueVI8U1iScsnW?=
 =?us-ascii?Q?3aAzsg2g7WylXDgSlgN5MrZG/deGYi+0RjlltGabOF85QT5efLYZ7yaRMFx0?=
 =?us-ascii?Q?s4rm+oZp59CUdy24aqh5n3TYSFtBsDHLIqy7NyWZpobB0Ufxa0RxvWTQRa3o?=
 =?us-ascii?Q?nspQlvzJ5SPm79mTz4yFYaVmYM/OwtGYIivaVppHqCBKrHMh+p1UH3zO93Xz?=
 =?us-ascii?Q?2PaU5KqEcnm8onctZcK52U6y8atiABC3e33gvc6c8LihKfYjt2m7NSHEzV8L?=
 =?us-ascii?Q?wiEgbdWWV1rJ+oVBTrLZ5ajMQ8Z+l5x35aW5D7pEH2x1Lw1HkAKY?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9f948ad-509c-4961-a8e8-08df072a6c8d
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 06:38:10.2559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s7PpzyZtvhsO+iX++UeqPIM8lIXTeWyVniZOlNo9p2bH3BqAiH3SmNOcO7u2a/MYSfml/6Iw0j9n5U8fogNyFL/BJAUlpMx28CXUjq7N6eYcXjtQ/mXLRlFtReLRqncK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB17278

snd_soc_add_dai_controls() is DAI related function.
And its parameter will be capsuled soon, will be not enable to access from
soc-core.c. Move it to soc-dai.c

It renames function name
-	snd_soc_add_dai_controls()
+	snd_soc_dai_add_controls()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dai.h  |  3 ++-
 include/sound/soc.h      |  7 +++++--
 sound/soc/soc-core.c     | 26 +++-----------------------
 sound/soc/soc-dai.c      | 20 ++++++++++++++++++++
 sound/soc/soc-internal.h |  3 +++
 5 files changed, 33 insertions(+), 26 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index ba3ae56c6b062..4d825b1541e33 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -213,7 +213,8 @@ int snd_soc_dai_get_channel_map(const struct snd_soc_dai *dai,
 		unsigned int *rx_num, unsigned int *rx_slot);
 
 int snd_soc_dai_is_dummy(const struct snd_soc_dai *dai);
-
+int snd_soc_dai_add_controls(struct snd_soc_dai *dai,
+			     const struct snd_kcontrol_new *controls, int num_controls);
 int snd_soc_dai_hw_params(struct snd_soc_dai *dai,
 			  struct snd_pcm_substream *substream,
 			  struct snd_pcm_hw_params *params);
diff --git a/include/sound/soc.h b/include/sound/soc.h
index f46b2bc2a022b..e7bed64375bfc 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -555,8 +555,6 @@ int snd_soc_add_component_controls(struct snd_soc_component *component,
 	const struct snd_kcontrol_new *controls, unsigned int num_controls);
 int snd_soc_add_card_controls(struct snd_soc_card *soc_card,
 	const struct snd_kcontrol_new *controls, int num_controls);
-int snd_soc_add_dai_controls(struct snd_soc_dai *dai,
-	const struct snd_kcontrol_new *controls, int num_controls);
 int snd_soc_info_enum_double(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_info *uinfo);
 int snd_soc_get_enum_double(struct snd_kcontrol *kcontrol,
@@ -1550,4 +1548,9 @@ static inline void _snd_soc_dpcm_mutex_assert_held_r(struct snd_soc_pcm_runtime
 #include <sound/soc-card.h>
 #include <sound/soc-jack.h>
 
+/*
+ * REMOVE ME
+ */
+#define snd_soc_add_dai_controls			snd_soc_dai_add_controls
+
 #endif
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index d58fd8be03a97..764ce12a694b9 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2344,9 +2344,9 @@ struct snd_kcontrol *snd_soc_cnew(const struct snd_kcontrol_new *_template,
 }
 EXPORT_SYMBOL_GPL(snd_soc_cnew);
 
-static int snd_soc_add_controls(struct snd_card *card, struct device *dev,
-	const struct snd_kcontrol_new *controls, int num_controls,
-	const char *prefix, void *data)
+int snd_soc_add_controls(struct snd_card *card, struct device *dev,
+			 const struct snd_kcontrol_new *controls, int num_controls,
+			 const char *prefix, void *data)
 {
 	int i;
 
@@ -2403,26 +2403,6 @@ int snd_soc_add_card_controls(struct snd_soc_card *soc_card,
 }
 EXPORT_SYMBOL_GPL(snd_soc_add_card_controls);
 
-/**
- * snd_soc_add_dai_controls - add an array of controls to a DAI.
- * Convenience function to add a list of controls.
- *
- * @dai: DAI to add controls to
- * @controls: array of controls to add
- * @num_controls: number of elements in the array
- *
- * Return 0 for success, else error.
- */
-int snd_soc_add_dai_controls(struct snd_soc_dai *dai,
-	const struct snd_kcontrol_new *controls, int num_controls)
-{
-	struct snd_card *card = dai->component->card->snd_card;
-
-	return snd_soc_add_controls(card, dai->dev, controls, num_controls,
-			NULL, dai);
-}
-EXPORT_SYMBOL_GPL(snd_soc_add_dai_controls);
-
 /**
  * snd_soc_register_card - Register a card with the ASoC core
  *
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index b098d1100b4bb..38244d8ac0ebe 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -9,6 +9,7 @@
 #include <sound/soc.h>
 #include <sound/soc-dai.h>
 #include <sound/soc-link.h>
+#include "soc-internal.h"
 
 #define soc_dai_ret(dai, ret) _soc_dai_ret(dai, __func__, ret)
 static inline int _soc_dai_ret(const struct snd_soc_dai *dai,
@@ -989,3 +990,22 @@ int snd_soc_dai_compr_get_metadata(struct snd_soc_dai *dai,
 	return soc_dai_ret(dai, ret);
 }
 EXPORT_SYMBOL_GPL(snd_soc_dai_compr_get_metadata);
+
+/**
+ * snd_soc_dai_add_controls - add an array of controls to a DAI.
+ * Convenience function to add a list of controls.
+ *
+ * @dai: DAI to add controls to
+ * @controls: array of controls to add
+ * @num_controls: number of elements in the array
+ *
+ * Return 0 for success, else error.
+ */
+int snd_soc_dai_add_controls(struct snd_soc_dai *dai,
+			     const struct snd_kcontrol_new *controls, int num_controls)
+{
+	struct snd_card *card = dai->component->card->snd_card;
+
+	return snd_soc_add_controls(card, dai->dev, controls, num_controls, NULL, dai);
+}
+EXPORT_SYMBOL_GPL(snd_soc_dai_add_controls);
diff --git a/sound/soc/soc-internal.h b/sound/soc/soc-internal.h
index 6f6a7be0487ab..7dc296e94ce64 100644
--- a/sound/soc/soc-internal.h
+++ b/sound/soc/soc-internal.h
@@ -18,5 +18,8 @@
  */
 char *snd_soc_fmt_single_name(struct device *dev, int *id);
 char *snd_soc_fmt_multiple_name(struct device *dev, struct snd_soc_dai_driver *dai_drv);
+int snd_soc_add_controls(struct snd_card *card, struct device *dev,
+			 const struct snd_kcontrol_new *controls, int num_controls,
+			 const char *prefix, void *data);
 
 #endif /* __SOC_INTERNAL_H */
-- 
2.53.0

