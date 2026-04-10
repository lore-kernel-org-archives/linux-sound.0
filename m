Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012036.outbound.protection.outlook.com [40.93.195.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E0F3491C7;
	Fri, 10 Apr 2026 09:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775813165; cv=fail; b=AAcD+X9w2zKWkfT/hO+S1RKuClanhT212f7o4Zq/24FEs5h+oARChLhLcKLegWcBI2H0+TlWvcqNLDHzvl2t+xfqi3LGtsmb+Best2GkzPB6iT8fynAn9on6SMgwA0hyRhYIIFbDOvQumj4CqKfLmegjHhPCT9rjZJ7nXrxBSQk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775813165; c=relaxed/simple;
	bh=cXtCB7xMX1Urpx3Qfcu38MzAVsuRMEHQh4jmsBRYnqg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IhYbSud2SHWO2b+VNgRlxcLV4j1T0XED3DzrfxmAUvsncuTRQelvVkIBqA+1YTm2n6epcoZggyHRl29m4fCY6RbHAw+A0vANNX9FZTYbQA/FeTDAvaEVj6p5DdYFdbcFfT3b9rdqyi79STTzsbYyjfDVG53461S0WKEtN3wVxEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=S/B6oZ0+; arc=fail smtp.client-ip=40.93.195.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="S/B6oZ0+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kq6j7HPIVghSTG5IvCctd1Y4BQe3f/Szv/RWthnfCs8n7EsWH/jUb7EeUiqE+yENLXbHxHXUnYF7y1S0hATAK254lzU+sLYyDwwNJ4GG3Kf30iv2tzj1TeyN3BSTxBNy7lyMGrBloU235ao5NXltIlF5ZkVjsoD8McLQsj1zNDnClGagSxkvYpBqKdr11syFgOF/6k5BtLrP/B1V33wJFzopKyy/V+CwIRW+JMcokHbVBQ382yCnTvTLv6KnmRx5WkVTWhiQMGJMeV7666vopidOanURM2XebGNwMfoKDX8jn6Yggvc/xHZDGQQzxRNnotozNNS1cvptWE2/J05oRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=++33eyu3G5ChDEVoTpjkkTkgnpFw3pKoUEx8JAJpibc=;
 b=llLgpqkitwXRXAp2COywkWyM0dPxn/YQDN2rlL9wPEtk5dsyuOLvIa+RTDXnob9VQmfNOPV+2move8hHIZBikgMDJho2L3N+O4qMC3sXwrCjtAoYjLkQ/s6LXhE8IUf4ieMukajxjH/uAi1RUUmJBHy4RrDPgqXuLrVfT8ErsNr5e6W3asCUt2LeSsnVyC5j48qs8rTXPEMST4w2F1JWyfsYZp65Nqj3/udTu4J9ChTbf2bzskGnKGDXBKLKVIUCwjC2YVvd7ZagXWHD3NVyoZFiqh+KgK5SqIKAFUSzms2SxlLPB2SVX/eKlkvU8yrvmhL1Ao5nmlNqVJ/MRkSicQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=linux.dev smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=++33eyu3G5ChDEVoTpjkkTkgnpFw3pKoUEx8JAJpibc=;
 b=S/B6oZ0+q/8XUJggZ4uLxhsW+SV7pKaE0YhpbJ2NRC0Eo1mX0BeJ4e62O7e8WisElRRs3DDgME5kgh32djfd1MFUamhYhalMXAtPQ1wLK4Z77ytZZUVpsSaMr14gqeNCvc/rjmph/Ty5boju5n6PzJddKvsUNzU33L3q9x5YTL4=
Received: from CH5PR04CA0014.namprd04.prod.outlook.com (2603:10b6:610:1f4::26)
 by DM4PR10MB6767.namprd10.prod.outlook.com (2603:10b6:8:10d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Fri, 10 Apr
 2026 09:26:00 +0000
Received: from CH1PEPF0000A34A.namprd04.prod.outlook.com
 (2603:10b6:610:1f4:cafe::ca) by CH5PR04CA0014.outlook.office365.com
 (2603:10b6:610:1f4::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.42 via Frontend Transport; Fri,
 10 Apr 2026 09:26:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH1PEPF0000A34A.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Fri, 10 Apr 2026 09:25:58 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Apr
 2026 04:25:55 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Apr
 2026 04:25:55 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 10 Apr 2026 04:25:55 -0500
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63A9Pe9m1150015;
	Fri, 10 Apr 2026 04:25:49 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <broonie@kernel.org>,
	<ckeepax@opensource.cirrus.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <cezary.rojewski@intel.com>,
	<peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
	<ranjani.sridharan@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <baojun.xu@ti.com>, <shenghao-ding@ti.com>,
	<sandeepk@ti.com>, <v-hampiholi@ti.com>, Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v7 2/3] ASoC: sdw_utils: TI amp utility for tac5xx2 family
Date: Fri, 10 Apr 2026 14:55:35 +0530
Message-ID: <20260410092536.5521-2-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20260410092536.5521-1-niranjan.hy@ti.com>
References: <20260410092536.5521-1-niranjan.hy@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34A:EE_|DM4PR10MB6767:EE_
X-MS-Office365-Filtering-Correlation-Id: d4c482c5-e3ee-4235-09b5-08de96e32ccd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|7416014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	r9J16mAhCriZkRDoXq59fTEB2lFRRTKBFAPGD9EV451+BKt3VSoBf+qJJ44SLMxFmttcT/aVShpG0NnnSMXZRvgGPuPZ+bfMUZ2h+V99DZmGTHd/K3em55/36ee1mElqC9zgA3MYYlAlDAsQiNb3xIWyKgkbP65kBl8JtXAeMhm9pzsXLoZgAFdWLqHaasGmJPG1ZrogDGEGVFxtXcGT/eaF4Ev8zGdJFA5VmPsBbYJUuSmEzSjFJ/YQD3JBOztSwaqiYJx9kdzdpa9d55B/kbNcGMbTsJSuRBqoniKtWh5ZGDk1nKet8QhLb3ctPz7bJrRqVs9lVR5Mb5twrOp01b268TAoemSdWOdL8W160SN4sNIuWUZp+lfU1IyzZ4Di13BmtVOOoXkzMqfuue6b1Iwr4S2D3j6ZieV+QWucpxzHn1skKRW8Q4LwP3HqA0P0wXHiVdqvh5zogYvnIE5+UK9CYzTPk+Avoj/r9ickEgsQjQtY4bVxpk2BMQ1E0GxuI5mQs1Jm4izZXzzi12XNkHzE6Njo03Pp6vdhiNOKZ6vElggH8ePp1QstmsI07DU5nbjxxm6ss/UyeWnRrbFd5K21ia0WWGT3jpH+ThGGypbjofG4rtFwLDYvf/RBgFRg6XAPY3A8TFKLOJfj2bUzzr9uTK7/632Y2u8tdgFRJu1UauqVhMPK7i0ItTU6LmE65oU7uJqvpE/S6r5GPUzbjqOEeLczwK+gEPOVPf1OYkUCwbDNwJRYuHO1pn5k50mi22ZyUGBDBBG2zuLnJi4Vgw==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(7416014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EVWc6Ves/PT8Mpwag717nkoUdWIAnyDeLGHPKZDYUJW3X9YTx6jttTY+6kYR6Zm6RPm5shb191eXfy3ezdJKifHS4R+7d8lcNYLYm1XR7fmYVyTSpxUrJ6jRes1uCbhiQs00WrMGcdMyMMLtcuJKNf9d+8DQM1EY21AIgqihpc5QZcaDAXnKnOezAUp7E3pXDyWGvbol47jdMhyaR1mpm9QD7BXDzqsJ9AxWBqGC6sZh2xzPQC3ml8vQu3GyqrZNbtdvIZsefvNPfezGq9pSRbB+lnRlsOsaA60Rdfm0H0XXhV5wR3T5W2+qWRYlhHqK42d1JrS+vcjQC1V/a66YN9GiWvecu2oUtcU5oZKouW3raIK4LP+DT4DU11ueM6SOwLiBsO41yyc9H/lMBnhOohJkqRvaQLG4UgcwoR59iWGl/YtsM4t23pNYtgdU6z1R
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 09:25:58.5529
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4c482c5-e3ee-4235-09b5-08de96e32ccd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6767

 Add TI amp utility for supporting the tac5xx2 family
of devices to support tac5572, tac5672, tac5682 and
tas2883

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
---
v7:
- no change

v6:
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

