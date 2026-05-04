Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012009.outbound.protection.outlook.com [52.101.53.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D2E3D47C3;
	Mon,  4 May 2026 12:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777899520; cv=fail; b=kZoPF/haL/ttT8CeAsLbukGjgBauRm0IXCzKT2QDmCvv/vAykqXiqpEYLQmp6xWSEsKkvCmdX34Ty9PZsFin9lVMl2oEUuPoKfiMgOZaaIhhX3WBV+MpKKBw/7VbYxrXWOPfBrq2eE8lhoqOQTXPmYM095tFZEVKhNGss+fi/ng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777899520; c=relaxed/simple;
	bh=AgUq+TwDzYVhgFWrVxjBUXU0SWYdqvhxCGlgOZPAhUs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sj5Pl/h5R6qdxvCnlkfcyGFhVQGxSOpPSBrTm9V9mk039/lEiSvjOGQUeoGOi6XZ5xOwvUaCnFglwBDkFq8v3CdLesl2I75Kf627gOzSol7lkJYzl1v6Kkap15oBJxkbDaiOeb0JLUf4T10RcSkJd9CoLC1/NOP27Lj3lbrkxeU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=BKRjXQXN; arc=fail smtp.client-ip=52.101.53.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="BKRjXQXN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T0p2pHzBecBzsh4xFNYw67ujQBv+cql2SrEtUI911/63Iy5KskAcUToYNlPfLjOjwsS3EFi7SX8qh5Mj5P+X46ICUEKruU5nlvWXFGNywypWKJkK0OcyJ/6T21t7XgabbSTqQyhGJx3ruX41AieOpVcRhScBsv1T3klRLJKTMkEvPqlpA7jPVM+E94eMBvMJ0iwUa170JQETljNJYkw46MPq3m2Mgg35h+49XZYRiAUPWLEDocvzkLlnxJdLI/vmoOul4MHp1piJO3qzSAEFzAaDlmsvHfHJR79eQgOYzlRkdzT8iSvU+csHB06ei0duMOq6P60SoIwxnM3ha4BYCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AY6y6KZcfljG7CXx9nQxz8P2Pw7PzGB/ja+r2xZVTT8=;
 b=KCCYKxqhTc0ID6LNxxmR5DyRPxsjswIsEzTm3SORno0HgTcIkRh87lKEeAikm7zNWIP+bwQoD+Jp2hUttxioIbUs0KC5TPIDjTF8TQIpQA1jFjFp1mS/tMYOAor5oavmNX5XKrMao3KeNuCSOuop9OvtCcVnYhAMkZ6mlLNtpwOiRtOtjcuEX032LIaEA/SwSQy0tnpwRoOvYR+cSq4yRQjCWAew+BxD1MpZDK8lEf7Xtdov/xCeFTNb/V1sesOZDqdtylGnWjfPpdh/Am/0ZX0mkfL6mvcthEDd9WMRc0zZ5gyFSQg8bNBa6y7mXNMiz738hGpTIuyXBY+TLt0Oyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=linux.dev smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AY6y6KZcfljG7CXx9nQxz8P2Pw7PzGB/ja+r2xZVTT8=;
 b=BKRjXQXN7vvFNjzVjqKaASwJUGB4TTklIdvJwBThikNPcN6Z1xsrS9I7azdRmhkMjTbwDUM8p3XRbGkkgNxqMPpsG5TduS6jH/Kum7JyWlz+queBirjcXHqvWRN3O032yQK9IF0TfZMM03InqqiwFgaZNAtdAUaNHNSjPoxCFrM=
Received: from PH8PR07CA0042.namprd07.prod.outlook.com (2603:10b6:510:2cf::8)
 by SN7PR10MB7029.namprd10.prod.outlook.com (2603:10b6:806:346::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 12:58:35 +0000
Received: from CY4PEPF0000EDD0.namprd03.prod.outlook.com
 (2603:10b6:510:2cf:cafe::8e) by PH8PR07CA0042.outlook.office365.com
 (2603:10b6:510:2cf::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Mon,
 4 May 2026 12:58:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000EDD0.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Mon, 4 May 2026 12:58:33 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 4 May
 2026 07:58:01 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 4 May
 2026 07:58:01 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 4 May 2026 07:58:01 -0500
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 644Cvep9762893;
	Mon, 4 May 2026 07:57:56 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <broonie@kernel.org>,
	<ckeepax@opensource.cirrus.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <cezary.rojewski@intel.com>,
	<peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
	<ranjani.sridharan@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <baojun.xu@ti.com>, <shenghao-ding@ti.com>,
	<sandeepk@ti.com>, <v-hampiholi@ti.com>, Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v15 3/4] ASoC: sdw_utils: TI amp utility for tac5xx2 family
Date: Mon, 4 May 2026 18:27:15 +0530
Message-ID: <20260504125716.2015-4-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20260504125716.2015-1-niranjan.hy@ti.com>
References: <20260504125716.2015-1-niranjan.hy@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD0:EE_|SN7PR10MB7029:EE_
X-MS-Office365-Filtering-Correlation-Id: b7b833bd-1b31-479c-d1ca-08dea9dcd980
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|7416014|82310400026|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	NNDKFh+8bE300CWvyE6tvuQyVBpF0Qr8nMJsWGjz5DgTbWfa8klStJSTlNiYDWgZrDYk1pRiVNYnL+aXMNqFKIhUma0jKOVwhQrCoD4wynBDSg4ZPc6j4qLUHxWjFiuAV4j/yPdOlDW+NdxY6YENihT856ULInAKBHQmFvmDhIN/q72gHCimVzDsRdC2rRnIYdhg2HDGU+Tl+ge9fQnQhKbEkx3yy4E9K0d2Uto76vK6aW1UDHBAerrPWDKb9LFq2jYb+v5LSdVpERWBTtWxFTPZv/AN08P7t5wH2ZZOXekmViwLPHcl8q7iMJpzAYi7PsfQcZ3PO4U2ec62/Quad68Ls6REjpBZQugfaSufjDGgR0xqbT7oCgjOtCtOJ+JJEpRuIjnpllTFEOokr3w875EOlgAJdCSfjTkpdj7pr9fA4Mz9U4l2/dVCLvZEf4Jk/l+keHUpABSOzYrwYbrPMf2K81N4tZmyZoDdU/XWnfECHj8BzQ26fMlwg/DvqQW53kg1OgosvmlmRp0VExRE1tgmgzPASxAazw2BgHr8mL1Wz0N4pjZCilFoh8FZTGsYudBM+vS1levzdEvNmgrKkAPGQQtuv+c/6p5DQMYstxvt95ZfK2/a739s1uCxbbPE7FIvVjjjt3TeRFwCD10Oez8vmnh+AxdiYgMRkjAlKVOVfWhcRwMk3jlKLudT11ekBb1KrxH2qemxSAy4J43HZwJFcFwtYbAhE0tMI3/AFS8=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700016)(7416014)(82310400026)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	SHBHjD/2Z3p7gDt9I1CZNQfjfy2z8niOw/+zsX4su+QEtGIIrVvhpivOMAjuXoG0vMEUbfELyasNztlKBGsC6Zw6FzPhUqaoyGEXp+sFGsY1swYMduW0ryt13g/Yw4k2elCeQaueoi9RvYgcV2H7vapAZWHJfaX5p5wBGUVQZ9AsihrfAi3PqO7Lvgz0AAcaHhMbVrvQlqi+zezUuysxtaNZyK3O8tMxRRACHjhgnRLawxmI62AHJtcH3ffa/I8p/Xg0u16EsxYvhUpCCYEBfAo3RSJwYeL0ND1hpT8SsmrgSM2w8LlCtRkApjUyb5A4vF+RNLG8aDa9cIt/J23HLneGnC3+1rXJqtJQvCcvlNtJ5rZVasS20JYxiN+ER+iTTMnq1z7sjIG6QcW4v5KSG86z8E3735CvhwcgI/KEpDlN8djb4V9IUEF0jCQ0sYsw
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 12:58:33.9348
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7b833bd-1b31-479c-d1ca-08dea9dcd980
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB7029

 Add TI amp utility for supporting the tac5xx2 family
of devices to support tac5572, tac5672, tac5682 and
tas2883

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
---
v15:
- no change

v14:
- Resending complete series (v13 1/4 was accidentally sent alone)
- no change

v13:
- no change
---
 include/sound/soc_sdw_utils.h        |   4 +
 sound/soc/sdw_utils/soc_sdw_ti_amp.c | 144 ++++++++++++++++++++++++-
 sound/soc/sdw_utils/soc_sdw_utils.c  | 151 +++++++++++++++++++++++++++
 3 files changed, 298 insertions(+), 1 deletion(-)

diff --git a/include/sound/soc_sdw_utils.h b/include/sound/soc_sdw_utils.h
index 489083183..d713ab2f6 100644
--- a/include/sound/soc_sdw_utils.h
+++ b/include/sound/soc_sdw_utils.h
@@ -272,7 +272,11 @@ int asoc_sdw_ti_amp_init(struct snd_soc_card *card,
 			 struct asoc_sdw_codec_info *info,
 			 bool playback);
 int asoc_sdw_ti_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int asoc_sdw_ti_tac5xx2_spk_rtd_init(struct snd_soc_pcm_runtime *rtd,
+				     struct snd_soc_dai *dai);
 int asoc_sdw_ti_amp_initial_settings(struct snd_soc_card *card,
 				     const char *name_prefix);
+int asoc_sdw_ti_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int asoc_sdw_ti_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 
 #endif
diff --git a/sound/soc/sdw_utils/soc_sdw_ti_amp.c b/sound/soc/sdw_utils/soc_sdw_ti_amp.c
index 488ef2ef4..514340a3e 100644
--- a/sound/soc/sdw_utils/soc_sdw_ti_amp.c
+++ b/sound/soc/sdw_utils/soc_sdw_ti_amp.c
@@ -7,12 +7,15 @@
 
 #include <linux/device.h>
 #include <linux/errno.h>
-#include <sound/soc.h>
+#include <linux/input.h>
+#include <sound/jack.h>
 #include <sound/soc-acpi.h>
 #include <sound/soc-dai.h>
+#include <sound/soc.h>
 #include <sound/soc_sdw_utils.h>
 
 #define TIAMP_SPK_VOLUME_0DB		200
+#define TAC5XX2_WIDGET_NAME_MAX		32
 
 int asoc_sdw_ti_amp_initial_settings(struct snd_soc_card *card,
 				     const char *name_prefix)
@@ -95,3 +98,142 @@ int asoc_sdw_ti_amp_init(struct snd_soc_card *card,
 	return 0;
 }
 EXPORT_SYMBOL_NS(asoc_sdw_ti_amp_init, "SND_SOC_SDW_UTILS");
+
+static int asoc_sdw_ti_add_tac5xx2_routes(struct snd_soc_dapm_context *dapm,
+					  const char *name_prefix)
+{
+	struct snd_soc_dapm_route routes[2];
+	char left_widget[TAC5XX2_WIDGET_NAME_MAX];
+	char right_widget[TAC5XX2_WIDGET_NAME_MAX];
+	int ret;
+
+	if (strlen(name_prefix) > (TAC5XX2_WIDGET_NAME_MAX - 7))
+		return -ENAMETOOLONG;
+
+	ret = scnprintf(left_widget, sizeof(left_widget), "%s SPK_L", name_prefix);
+	if (ret <= 0)
+		return -EINVAL;
+
+	ret = scnprintf(right_widget, sizeof(right_widget), "%s SPK_R", name_prefix);
+	if (ret <= 0)
+		return -EINVAL;
+
+	routes[0] = (struct snd_soc_dapm_route){"Left Spk", NULL, left_widget};
+	routes[1] = (struct snd_soc_dapm_route){"Right Spk", NULL, right_widget};
+
+	return snd_soc_dapm_add_routes(dapm, routes, ARRAY_SIZE(routes));
+}
+
+int asoc_sdw_ti_tac5xx2_spk_rtd_init(struct snd_soc_pcm_runtime *rtd,
+				     struct snd_soc_dai *dai)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
+	int ret, i;
+	struct snd_soc_dai *codec_dai;
+	const char *prefix;
+
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		if (!strstr(codec_dai->name, "tac5") &&
+		    !strstr(codec_dai->name, "tas2883"))
+			continue;
+
+		prefix = codec_dai->component->name_prefix;
+		if (!prefix) {
+			dev_warn(card->dev,
+				 "No name prefix found for codec DAI: %s\n",
+				codec_dai->name);
+			continue;
+		}
+		ret = asoc_sdw_ti_add_tac5xx2_routes(dapm, prefix);
+		if (ret) {
+			dev_err(card->dev, "Failed to add routes for %s: %d\n",
+				prefix, ret);
+			return ret;
+		}
+	}
+
+	dev_dbg(card->dev, "Added TAC5XX2 speaker routes\n");
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(asoc_sdw_ti_tac5xx2_spk_rtd_init);
+
+int asoc_sdw_ti_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_component *component;
+	char *mic_name;
+
+	component = dai->component;
+	mic_name = devm_kasprintf(card->dev, GFP_KERNEL, "%s", component->name_prefix);
+	if (!mic_name)
+		return -ENOMEM;
+
+	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
+					  "%s mic:%s", card->components,
+					  mic_name);
+	if (!card->components)
+		return -ENOMEM;
+
+	dev_dbg(card->dev, "card->components: %s\n", card->components);
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(asoc_sdw_ti_dmic_rtd_init, "SND_SOC_SDW_UTILS");
+
+static struct snd_soc_jack_pin ti_sdca_jack_pins[] = {
+	{
+		.pin    = "Headphone",
+		.mask   = SND_JACK_HEADPHONE,
+	},
+	{
+		.pin    = "Headset Mic",
+		.mask   = SND_JACK_MICROPHONE,
+	},
+};
+
+int asoc_sdw_ti_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct snd_soc_component *component;
+	struct snd_soc_jack *jack;
+	int ret;
+
+	component = dai->component;
+
+	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
+					  "%s hs:%s", card->components,
+					  component->name_prefix);
+	if (!card->components)
+		return -ENOMEM;
+
+	ret = snd_soc_card_jack_new_pins(rtd->card, "Headset Jack",
+					 SND_JACK_HEADSET | SND_JACK_BTN_0 |
+						 SND_JACK_BTN_1 | SND_JACK_BTN_2 |
+						 SND_JACK_BTN_3 | SND_JACK_BTN_4,
+					&ctx->sdw_headset,
+					ti_sdca_jack_pins,
+					ARRAY_SIZE(ti_sdca_jack_pins));
+	if (ret) {
+		dev_err(rtd->card->dev, "Jack create failed%d\n", ret);
+		return ret;
+	}
+
+	jack = &ctx->sdw_headset;
+
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_4, KEY_NEXTSONG);
+
+	ret = snd_soc_component_set_jack(component, jack, NULL);
+	if (ret)
+		dev_err(rtd->card->dev, "Headset Jack call-back failed: %d\n",
+			ret);
+
+	return ret;
+}
+EXPORT_SYMBOL_NS(asoc_sdw_ti_sdca_jack_rtd_init, "SND_SOC_SDW_UTILS");
diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index 1637cc3f3..d74624efc 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -72,6 +72,157 @@ static const struct snd_kcontrol_new rt700_controls[] = {
 };
 
 struct asoc_sdw_codec_info codec_info_list[] = {
+	{
+		.vendor_id = 0x0102,
+		.part_id = 0x5572,
+		.name_prefix = "tac5572",
+		.dais = {
+			{
+				/* speaker */
+				.direction = {true, false},
+				.dai_name = "tac5xx2-aif1",
+				.dai_type = SOC_SDW_DAI_TYPE_AMP,
+				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
+				.init = asoc_sdw_ti_amp_init,
+				.rtd_init = asoc_sdw_ti_tac5xx2_spk_rtd_init,
+				.controls = lr_spk_controls,
+				.num_controls = ARRAY_SIZE(lr_spk_controls),
+				.widgets = lr_spk_widgets,
+				.num_widgets = ARRAY_SIZE(lr_spk_widgets),
+			},
+			{
+				/* mic */
+				.direction = {false, true},
+				.dai_name = "tac5xx2-aif2",
+				.dai_type = SOC_SDW_DAI_TYPE_MIC,
+				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
+				.rtd_init = asoc_sdw_ti_dmic_rtd_init,
+			},
+			{
+				/* UAJ */
+				.direction = {true, true},
+				.dai_name = "tac5xx2-aif3",
+				.dai_type = SOC_SDW_DAI_TYPE_JACK,
+				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
+				.controls = generic_jack_controls,
+				.num_controls = ARRAY_SIZE(generic_jack_controls),
+				.widgets = generic_jack_widgets,
+				.num_widgets = ARRAY_SIZE(generic_jack_widgets),
+				.rtd_init = asoc_sdw_ti_sdca_jack_rtd_init,
+			},
+		},
+		.dai_num = 3,
+	},
+	{
+		.vendor_id = 0x0102,
+		.part_id = 0x5672,
+		.name_prefix = "tac5672",
+		.dais = {
+			{
+				/* speaker with IV sense feedback */
+				.direction = {true, true},
+				.dai_name = "tac5xx2-aif1",
+				.dai_type = SOC_SDW_DAI_TYPE_AMP,
+				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_AMP_IN_DAI_ID},
+				.init = asoc_sdw_ti_amp_init,
+				.rtd_init = asoc_sdw_ti_tac5xx2_spk_rtd_init,
+				.controls = lr_spk_controls,
+				.num_controls = ARRAY_SIZE(lr_spk_controls),
+				.widgets = lr_spk_widgets,
+				.num_widgets = ARRAY_SIZE(lr_spk_widgets),
+			},
+			{
+				/* mic */
+				.direction = {false, true},
+				.dai_name = "tac5xx2-aif2",
+				.dai_type = SOC_SDW_DAI_TYPE_MIC,
+				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
+				.rtd_init = asoc_sdw_ti_dmic_rtd_init,
+			},
+			{
+				/* UAJ */
+				.direction = {true, true},
+				.dai_name = "tac5xx2-aif3",
+				.dai_type = SOC_SDW_DAI_TYPE_JACK,
+				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
+				.controls = generic_jack_controls,
+				.num_controls = ARRAY_SIZE(generic_jack_controls),
+				.widgets = generic_jack_widgets,
+				.num_widgets = ARRAY_SIZE(generic_jack_widgets),
+				.rtd_init = asoc_sdw_ti_sdca_jack_rtd_init,
+			},
+		},
+		.dai_num = 3,
+	},
+	{
+		.vendor_id = 0x0102,
+		.part_id = 0x5682,
+		.name_prefix = "tac5682",
+		.dais = {
+			{
+				/* speaker with echo reference feedback */
+				.direction = {true, true},
+				.dai_name = "tac5xx2-aif1",
+				.dai_type = SOC_SDW_DAI_TYPE_AMP,
+				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_AMP_IN_DAI_ID},
+				.init = asoc_sdw_ti_amp_init,
+				.rtd_init = asoc_sdw_ti_tac5xx2_spk_rtd_init,
+				.controls = lr_spk_controls,
+				.num_controls = ARRAY_SIZE(lr_spk_controls),
+				.widgets = lr_spk_widgets,
+				.num_widgets = ARRAY_SIZE(lr_spk_widgets),
+			},
+			{
+				/* mic */
+				.direction = {false, true},
+				.dai_name = "tac5xx2-aif2",
+				.dai_type = SOC_SDW_DAI_TYPE_MIC,
+				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
+				.rtd_init = asoc_sdw_ti_dmic_rtd_init,
+			},
+			{
+				/* UAJ */
+				.direction = {true, true},
+				.dai_name = "tac5xx2-aif3",
+				.dai_type = SOC_SDW_DAI_TYPE_JACK,
+				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
+				.controls = generic_jack_controls,
+				.num_controls = ARRAY_SIZE(generic_jack_controls),
+				.widgets = generic_jack_widgets,
+				.num_widgets = ARRAY_SIZE(generic_jack_widgets),
+				.rtd_init = asoc_sdw_ti_sdca_jack_rtd_init,
+			},
+		},
+		.dai_num = 3,
+	},
+	{
+		.vendor_id = 0x0102,
+		.part_id = 0x2883,
+		.name_prefix = "tas2883",
+		.dais = {
+			{
+				.direction = {true, false},
+				.dai_name = "tac5xx2-aif1",
+				.dai_type = SOC_SDW_DAI_TYPE_AMP,
+				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
+				.init = asoc_sdw_ti_amp_init,
+				.rtd_init = asoc_sdw_ti_tac5xx2_spk_rtd_init,
+				.controls = lr_spk_controls,
+				.num_controls = ARRAY_SIZE(lr_spk_controls),
+				.widgets = lr_spk_widgets,
+				.num_widgets = ARRAY_SIZE(lr_spk_widgets),
+			},
+			{
+				/* mic */
+				.direction = {false, true},
+				.dai_name = "tac5xx2-aif2",
+				.dai_type = SOC_SDW_DAI_TYPE_MIC,
+				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
+				.rtd_init = asoc_sdw_ti_dmic_rtd_init,
+			},
+		},
+		.dai_num = 2,
+	},
 	{
 		.vendor_id = 0x0102,
 		.part_id = 0x0000, /* TAS2783A */
-- 
2.34.1

