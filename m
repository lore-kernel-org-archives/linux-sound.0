Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012035.outbound.protection.outlook.com [52.101.53.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA679303A32;
	Tue, 28 Apr 2026 16:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777393787; cv=fail; b=D+qwVjVdBGaHDOv8MSwgwWw9/rZs1U+h2KiWelR4L3mD8xJNXmttd53htR5APYJKZoXq0be0sgkWM7qrtIFaKstFyHXUsnIABiXJfMxcwDeF3Hxm0n2tHiad7CsR72KWA4Q/OwyHynpIjJkQmxxXjYXoEIxQm2oCLebR7sb9wmw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777393787; c=relaxed/simple;
	bh=+OvRkLxnqVPiSL72upQg+ct6l9pumzCIMeCBjlY+zAw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DCW+Ihj/X6j2ch1221ASv5tDjCm/xrQYpAWoT45UroHCr8xnnHPVmrqfR+Jbtwv6y+VzjhFnUsROiPWhWzPO7GLR7Di2oUrla5VdWF09bietaN+M47lnBOUSHl0V+I/e1blmggCcflYKGgxDrU8n4GTawx8Y8ABN7j4E0LidylE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=uzcuoryD; arc=fail smtp.client-ip=52.101.53.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="uzcuoryD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pFbb2lJdEz1wp6EPHRKCGs4zfcZ8jpElz4S1V4uY0Z7Tgl4AjuY4BhMjRISiKIcto9HMFjbU7dG17ifvjlmcHk/SO+bgSPlJMrfUPkG3Nhldu5ADY4AitIA5KtXo4HOUqArKpeVXw/5xZOSRf4FFQQ/TzgpZUYUNGDvNsS+qgNKfM2AOCOXbWReTGJ1Dx8gKsyIwKodNJrvqqlK7wPhYERi4gH1eipMEXk5kgOd4vv5bWGSrEPRQSjmqsu0vqXMJhZCFDirX4asWrta8lOkKgCsXvB9EYYY/UFHaTc81YKHJJoc4YVKyhxVoOjm8krLicxkO5Tm451LHq759F6Il9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I/p4ZpnJ5a1naUAehyxwsstEEnMVdKfZkrwtmFE4LDI=;
 b=s9kZQ076HYyJRpFeZw9vQ54xLHySgEH8Jo2dy8JDeNf9dRcc/nfpQ8aLCFePcsvb31VAmBsji1GjzdXKdt7y8Ou0YJ1CohK1VSdZn35HHNnw00zLBpxKe54OiKgKnWDmUtgjPENn6eplfaZtRHDWJ6SxVlbRi8LqpuGtn2Dj8ZrS6BGV8U31E49+0EKOgDeVQr8VAln3N6lkafISGgypzJYigT3VHkJkuzMycgEz1nPdLzshC+H8cVuJVKMrdMzTYoss8T3HG82FXtDdMrLTKcBg3qseICPzQIAxdgO5dewnAY5yY8faklovo7iXgFFVVlc0uB6KvczWufkbAzg1Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=linux.dev smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I/p4ZpnJ5a1naUAehyxwsstEEnMVdKfZkrwtmFE4LDI=;
 b=uzcuoryDNC8tWerZdRlcVzE7vVk6RHofLYRoE2fUkkj9Q/3OxKJNCi1qmgDNcHiqUeXhdV3KoWdtX7poBiFsjLFGCUgiWL0JDSxMKpM5sRM75ae8Cb+GAzcTsltNV6M1fLfSAjJQUGCPpBiQca25OTBqblaiOH7jl2jFTOz26ko=
Received: from SJ0PR13CA0038.namprd13.prod.outlook.com (2603:10b6:a03:2c2::13)
 by SN7PR10MB6572.namprd10.prod.outlook.com (2603:10b6:806:2ab::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 16:29:41 +0000
Received: from SJ1PEPF00001CE6.namprd03.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::eb) by SJ0PR13CA0038.outlook.office365.com
 (2603:10b6:a03:2c2::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.28 via Frontend Transport; Tue,
 28 Apr 2026 16:29:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00001CE6.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Tue, 28 Apr 2026 16:29:40 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Apr
 2026 11:29:40 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Apr
 2026 11:29:39 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 28 Apr 2026 11:29:39 -0500
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63SGTNo11314937;
	Tue, 28 Apr 2026 11:29:35 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <broonie@kernel.org>,
	<ckeepax@opensource.cirrus.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <cezary.rojewski@intel.com>,
	<peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
	<ranjani.sridharan@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <baojun.xu@ti.com>, <shenghao-ding@ti.com>,
	<sandeepk@ti.com>, <v-hampiholi@ti.com>, Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v12 3/4] ASoC: sdw_utils: TI amp utility for tac5xx2 family
Date: Tue, 28 Apr 2026 21:59:10 +0530
Message-ID: <20260428162911.2372-3-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20260428162911.2372-1-niranjan.hy@ti.com>
References: <20260428162911.2372-1-niranjan.hy@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE6:EE_|SN7PR10MB6572:EE_
X-MS-Office365-Filtering-Correlation-Id: dbc15211-a007-482e-813f-08dea5435904
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|7416014|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	QBlnfnYSxvpAMqMoPiAYeUF4y8YhkbgfVaCXDjeqL+8/ip2ygLiLDseCyb/IpEyBm2NyR7w86fyQpn6ySSSlap2j9ub1Jrzv5TpDtW2A9XMBa8hNO8zo2YQ9iP8bh0aIHfJd5wMpO4qy7YKKOtX76LwJvlslamuGZPYVnaXO1bw1+m8KP4ZO7/724ls9C8OpyyP1nrKeCWctM6Vy3ofgfDbcuYH+y5gdQaO541oVTZcInEQ6JFlMbx0LFdlGvnERWLqONwaHwIH8TohAVzd4qK2OFQZH+YJE8VygT+lWGF5KMr5jzaeTG2GKOT7TJZpkaB7qkshS9QtymLKnGtKYKr05N6vAxrmefFYFM+jwfnHgkufpR+eQ7trlRTsKoKmwcE7qBu3P8x3CYnXTcpA+8Tov+V4RdatNJDb6vCiHA2PLO8gIMvOS78w1NSaR+dC4CWz3Qms6ZBg8MK0AqvJXLL5Mr1mEmMw3L/kMgX43HexBYNyh406jd4Ix2ih7Wio2aU9NHmy9P7H6QpInqyfIqcmqzj+W1+0kdGB5G7wIRCnV8tl3fWdXKi4aQrFbknclxuz3o0mw6XsTbaCF9VUnG7n4H7iSJ92cJPCLCDpFOLtz4FR4WFcZpRDsjjRwpeUPh8PMclmez6gwy+TEQYwe+eZyKMlrk19Awwf51conWmi8KG+n0IVxi1dFfOS1JR/+Jx2im8/SSY+ODo6N1EIPMmYgx9hAr5D7UnxsUGN6INgIIHCSB5H+z5waa0H6WRBFL1C7hiktyReh1ZyEfX0q7A==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(7416014)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8DL7osF92hNGiHC9L6xHRHd/FtionnlgooWLTC7TrXXWTHSrqn3XWuEoJnv0aNlkevDDj1ne2y5mPJVOk0FTtkya4skkRz3aXR9zrdSWA+On1JUduSdzAOC6OemlMW8azw6xyltIiU/pcRQAiB4X3HflevsCbssRG5fOCq68YiDgUWImY5XtbNIwPwU7+qAfL8WTVj2dXQBVfpteDg+wdQAsx+SDKQy1vw/wwNU04VxO/NFmWMWmgugIbDYwzY8dTCQjqZd46rzzyI87S9pijOKxRV/TIbrl7/iJihQAasP/lFk+LLiS8CdsAAGTYhafnEsudpHxMN/h5NlovNOslu8ibbQ8O3Vm/Q/gFXZWSJFO1uhrGTpSFI4c8EG5EDqAVgsEJ2A0vlJ7Sc3UkaBzFTD7eIZGTWVtHiGTVj/QgXbCGAHwBhkmeASappoZaiEJ
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 16:29:40.6739
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbc15211-a007-482e-813f-08dea5435904
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6572

 Add TI amp utility for supporting the tac5xx2 family
of devices to support tac5572, tac5672, tac5682 and
tas2883

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
---
v12:
- no change

v11:
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

