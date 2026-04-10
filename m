Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010002.outbound.protection.outlook.com [52.101.193.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BA23CCA1C;
	Fri, 10 Apr 2026 14:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775830447; cv=fail; b=FBCAygTPhcvTSV2lG5Um7QI5nLicVZk0daoWDolPJm6O8QDlo9vQDll2bIUWvckQAQ5RBu9VPYkDLDnOoe+DFqvhbp16nV20HubkJdv1SyrbBCtrYjJqA/V53qtIf168ZmbhgJc5vfVg6nX9Ls3XXMKpY3Hc91eVWs0e99UUlCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775830447; c=relaxed/simple;
	bh=tYu4bUHuio6GHNS4Ns8jq7ZBfugejvVs2XIS01AEXvI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MZoC7UBOKf5wZNV5ybRJjVlG/f2xZBLJwnh3pw/gtRw+u6/KrhhDHbTYeyAUguiSBC1gETNA4CzMzWpH1dyR0b3yZxlPWgFnpwEw1GGzwV8uWj2yzwIY/OIJsMWLPNRyAhZNANEilSrgHrTaBHnrnRw9sgXTSBHYmQrwc2mdaa0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=lPJ1ZE6q; arc=fail smtp.client-ip=52.101.193.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="lPJ1ZE6q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ywv/HFU+RkzJRMVc+TfJZjppns74VUSRLiubs7Bbpn0oKaKtLHdMNbvbSC3LuNX2AiJ8efQS1VcZAt/0nVoXXI32EQSCNeMttSgkpUWCJgCTnFJRyTOL93M3V8nXSFUkf4hP39XR16Pc2fhKzar/YpSro5VBuZeh0bef8URFZfD4L3d+tc0tuOOVnygRx2LewZiznbgj9fyr9BVFbz0hOcI2gvQllifoA5APOyslJd5OND9N4nC2MQDIVh6W2j+4Pl4FV8d4sMBv4eJ87fuDCFFR5h9zaLBdH0JgsWvFMe/PtVxlm5TUtPADnl267+ZWKS+Q9zXSGBN+v8S0mT2qFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IG7QvKdg7MxoKFxFhC0LbgWIz3KwaZaT56pCfo7I/Vg=;
 b=XGm9d0UDGBdnRSbszGh3JhJpwc6t73H6ggFz/TojetaSncuAFjm3Z9pC4Bs5aD0Oh0ZiH7lp98hFnonPBA11pZkymPUdIIip/QIgh3ZxL8GZhmo1U4y4aTBCSOaodENex+eCFueyOowK+oPVC+c8X6n9/8RYhvIPI8AucKDwhT6PJAj4mKal51U8B4xGIrGtz2kw5po6T5gYXpq8TQFdxmcLshcCfAIvs7YEW+wUociRE8LbnZAWoLhHVYqXeByiImcYogEAJ0KWe1o3pxVv97Hqy+2gRv8Pt4QKXIJHNYJgLj12k2TR7ikTa3+sHqtr1Zuiqbd82DN0ZN1ra/7ndg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=linux.dev smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IG7QvKdg7MxoKFxFhC0LbgWIz3KwaZaT56pCfo7I/Vg=;
 b=lPJ1ZE6q4c5tisbyFP3Qdg4I+UqXwUkwxteUcJQhRDSl1ibEG8fINbhD9d5fh+Ki6+oqYfTCgjcCjvNVwoj2BOgW58OblfE7eAJ8RCQxpBcb3C8ZEINg/IkQ1aAf5SHPaxGyzxg+WCLwHVnzADDhr2Zi99YagwLAnUqHTit0Sl4=
Received: from BN0PR10CA0016.namprd10.prod.outlook.com (2603:10b6:408:143::23)
 by PH0PR10MB4406.namprd10.prod.outlook.com (2603:10b6:510:34::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.45; Fri, 10 Apr
 2026 14:14:01 +0000
Received: from BN1PEPF00004681.namprd03.prod.outlook.com
 (2603:10b6:408:143:cafe::60) by BN0PR10CA0016.outlook.office365.com
 (2603:10b6:408:143::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.43 via Frontend Transport; Fri,
 10 Apr 2026 14:13:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN1PEPF00004681.mail.protection.outlook.com (10.167.243.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Fri, 10 Apr 2026 14:13:59 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Apr
 2026 09:13:16 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Apr
 2026 09:13:16 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 10 Apr 2026 09:13:16 -0500
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63AED0Pg318380;
	Fri, 10 Apr 2026 09:13:10 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <broonie@kernel.org>,
	<ckeepax@opensource.cirrus.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <cezary.rojewski@intel.com>,
	<peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
	<ranjani.sridharan@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <baojun.xu@ti.com>, <shenghao-ding@ti.com>,
	<sandeepk@ti.com>, <v-hampiholi@ti.com>, Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v8 2/3] ASoC: sdw_utils: TI amp utility for tac5xx2 family
Date: Fri, 10 Apr 2026 19:42:49 +0530
Message-ID: <20260410141251.5563-2-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20260410141251.5563-1-niranjan.hy@ti.com>
References: <20260410141251.5563-1-niranjan.hy@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00004681:EE_|PH0PR10MB4406:EE_
X-MS-Office365-Filtering-Correlation-Id: 99dd1303-c523-42c6-129e-08de970b6913
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|7416014|82310400026|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	wOwCilyMc1wSwHcIMsaax+2gg0UqeESQxktce9Iw0ghc5SsJ+303i94P1MRdzSebciCKEtYPZ+nZ2tOGk8QQI8otWv48xO1EfBF/yPR8kn+J45+7/PpDRiMRl6q7J9rMHPX0vrbglgky/qXA3SuhYohfCQQgu2ngWt0Tm9TYTpsjX11Y3qNuiUS8biodkR9+6Zy9X0dMLhcr/VK484MqYhMLflhqedEM76zSEif0mJfX+DlOc4iv6nmFKFARxP0cQauVpctaU89/0ljxKZP6p+PAiz5JFK/Q2eZmkz25jpuOOGl3uEuKr9fm4cw8yhI+3CN4Bhxlj1ps0iusne/KAYTmacDHIqNcro5iIOrdDDHIpie4/TZzJwVQwk/csxAYfb5fGRnAOvUcTUwqwHIyMt4JpjnOlfirb4cySqQyEkOtMoKfyLU11JPfezFfuJa9diXXSJuUnUyRQXCNNibzhh4Fi6r2LiJ4IJ91WRH9SzCYp8B7BCqAQKPT6J8qDGrUTrS1vS6soFflAfPfKqfpSU8MOd8GM0zWeNxbaExnTResJtAhlEyI9fBDnvxCOOjBGjYcb/YF3ghCwxhd70nDekA+r0mu1l2qi4H5viYYimCl52OoKa1GIrwpGkvvoyHrYu6pbabkE+9mWpJ3a/GS6gIjwqnUxTBamSkfQeJul3ialABDKW++lz/CsFluCAioM38Uvtx09U6zNoqrgtDB2KkKhCHnfxiEIKWcoT0zQFte/ZwcqBDYJr0K66SX0+OP29CTkzUKeXuk7JjPsK4x9g==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(7416014)(82310400026)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HFQ9Sj4ocyAaglMQdfp0lBnHFmgFpK0fOUDmci09j7U68SmWeIvZ4UQgCFyLkKtrCsOD2XuY8yWxZHtI0jCXOey0V4gFL8821nEaoW5A/V9EIPYxLI9JaVg/8W1JOf2msgjK8cLNOLaHbn7q6ZkVjycHvJu5kXlZmbsfJ8AikbeFp5yNphTFxQJB7NYt6rIjg9WBIEh8E7w4LNvyPykcF8/07ksyazjpljU351jW4WSB0LdICZnfWZBjabkv1jmPVQiOP/ZuEUS3hp6Jzh3AXICwcuzOTCpCkGeKrEoT2N545m6NlJxW45A27M7L8OJOl4vSDM5E3aYN5uTAIFhnqROSTCF1HEjTbCl3928nPsmWhgZ+2ehuRxfx37u5Vksf2cjAm7cIM9PDZmLba6cvFSjzB07TSaM7EWc6hehFItOoKyDOB1uas9ItawLz0R4A
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 14:13:59.5256
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99dd1303-c523-42c6-129e-08de970b6913
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004681.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4406

 Add TI amp utility for supporting the tac5xx2 family
of devices to support tac5572, tac5672, tac5682 and
tas2883

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
---
v8:
- no change

v7:
- no change
---
 include/sound/soc_sdw_utils.h        |   4 +
 sound/soc/sdw_utils/soc_sdw_ti_amp.c | 144 ++++++++++++++++++++++++-
 sound/soc/sdw_utils/soc_sdw_utils.c  | 151 +++++++++++++++++++++++++++
 3 files changed, 298 insertions(+), 1 deletion(-)

diff --git a/include/sound/soc_sdw_utils.h b/include/sound/soc_sdw_utils.h
index 4890831836734..d713ab2f66203 100644
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
index 488ef2ef45d4f..514340a3e3f55 100644
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
index 2807f536eef0c..ffc342c79d5ea 100644
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

