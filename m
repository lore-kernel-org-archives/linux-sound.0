Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010040.outbound.protection.outlook.com [52.101.61.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C9841B34F;
	Wed,  1 Apr 2026 13:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775049775; cv=fail; b=Tk7xDw0uUArl/TXfgvfzJ4u7TwQrS8oLRWymSwqi4ypxNP52tJ8SbJw9DaWeLpWughlfzWTI57wksJb3QSGm9BaRHr5iT3IWjZxpy0GGJ03O9fz3TyruGmaEJZG4s44AGt+LDMokvOOyCSZLh0dyyx435CCInGBmsksaGQWnMb4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775049775; c=relaxed/simple;
	bh=ngrfCbrUEFl/y2ta/AQzTaKzeuc5uwZTLvpMnXHjwV4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=odlBFbbjxhQnBBHAMQNSLQHbsSwQwT7V1Gro3+QcyNuMJrWGlwDrxXApNCJ362gccZsgx2o5YOUt8JyA5WyuKWx0EMyP8S3aZTCh066keFqho7bppq1h29OgiBBc3kghWeWAPDc6fs2tkfSKWqbI/8Uuu+MBIVdh/YyzjLDwxsc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=U3P+YukI; arc=fail smtp.client-ip=52.101.61.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="U3P+YukI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VhtX0cA0n50xYP0+UeJwe6PSbOJnPowAJHJs5u56YRDrsICly8Wfq2IwX4JEW/HdeHaGK5iWi1bYQ20+UmJQl+KpIwVYCwzn9x4Xn4fkR2IAyxqlqbPHKTVEcInDRe9QWA+NxdrfQu7E+gCkxlTVx+zKa9yGvwfsZ0GsP9KlCJ0WdnaiGeL/o6Mcm9LL/+cqQ1LsqmmHDauxrGm7hVs776gngRIZZ4pSKa6Rp4cTo0Q3ns0fBzKstKi3Ha91+ge5/2AEB+blTDzW8HX640+5Hv31PawPO0sFHMDzwrAdpg6qpCuj+Dmr/ZF73mxf39dGJLT45AdLoORnL53i+trY0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RENyg2lqJH6g2fMeWMI3BbAFTqZdoXOIoEqeLvnCwck=;
 b=G0pOKUAdj7j5xDT5u37XStFAQAHJhxFlXO+11NYJ9aBh0n429TqG7tfCr2YlBM0zGo7nBmlQja4U10vy0biq2HCfk7tFECZc/MDMnuDHu+Kl8ALuNCDa1wtcwpI/XFyO73Q1wwgj7MiM3/JoXIaQSzZJl6lyuiKbaB4EhamR5hZu1SP8UWLh8aTFZ8TKkuv7xQqz9Z+rLzmFHrQo2gbpBKzhEpo7e+uZO7wyRCWAtNhBVSyhvjRjwtn988J8XEbWFcwsK612sxMsZY0xuT/Sf/Wz2yHpEtiv/vNsTrBkbnWwysi2WYqtRN9DIazicbEwUPIgqfkLvqnPKKMUHni0yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=linux.dev smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RENyg2lqJH6g2fMeWMI3BbAFTqZdoXOIoEqeLvnCwck=;
 b=U3P+YukI9Oz0aL6pSJH/95ndnEelYDN4q7oP+ER7L4q1mwuuwvdW6TXh9k9jRhJnzt3nCsZBKVhSvPv7IO8SSf6rUtpau7ROTJ7lJWXgirkC4cn09NHFlpX4W7NYStdTKblwScnxcaJYfz9kWhnaQRY5rDtO9dN8tXaDffzDW/s=
Received: from BY5PR04CA0003.namprd04.prod.outlook.com (2603:10b6:a03:1d0::13)
 by DM6PR10MB4331.namprd10.prod.outlook.com (2603:10b6:5:222::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Wed, 1 Apr
 2026 13:22:47 +0000
Received: from SJ5PEPF00000204.namprd05.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::1a) by BY5PR04CA0003.outlook.office365.com
 (2603:10b6:a03:1d0::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.29 via Frontend Transport; Wed,
 1 Apr 2026 13:22:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF00000204.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 1 Apr 2026 13:22:46 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 1 Apr
 2026 08:22:45 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 1 Apr
 2026 08:22:44 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 1 Apr 2026 08:22:44 -0500
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 631DMHUT147568;
	Wed, 1 Apr 2026 08:22:40 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <broonie@kernel.org>,
	<ckeepax@opensource.cirrus.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <cezary.rojewski@intel.com>,
	<peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
	<ranjani.sridharan@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <baojun.xu@ti.com>, <shenghao-ding@ti.com>,
	<sandeepk@ti.com>, <v-hampiholi@ti.com>, Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v4 3/4] ASoC: sdw_utils: TI amp utility for tac5xx2 family
Date: Wed, 1 Apr 2026 18:51:47 +0530
Message-ID: <20260401132148.2367-3-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20260401132148.2367-1-niranjan.hy@ti.com>
References: <20260401132148.2367-1-niranjan.hy@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000204:EE_|DM6PR10MB4331:EE_
X-MS-Office365-Filtering-Correlation-Id: d7a7ff85-794f-4196-c8df-08de8ff1c3a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|7416014|376014|82310400026|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	uZNxuqoFpb3irRH6avWetrhseby8fE25Kf+rhG+uR+ebhYIarQ+kQ3MGDL49Rqa9wNuPu9U9JYY5OpDZoZD6qTXSDagcS9LPuU3apCbuNbt54MlM91jwzgwiUsK5Vn0FCH3fxDRFvT5SlWGp18oBcYgq0YjSwJRO1Xc/u3HOC//YVmFKDlLWTaUsBQgNhCXa5TK3T2mBLYD1RsPgnID62+KKKGOHoUq4kikZbzPdb3ICGaMCbjQu0jiH5RWHcahfau2+Fd8yHntOxMbHo4GZ+1QIGIAExphX6jna/PRb0LiMHCqXi+oIWXBLuTh/4sgQJCkKLVhpkjvK8wZDsSDvwT58Y+gwZHXMiKZ94sYdcDbZNkzYdiCQ7R/XFNdz9pTYy/38mSvEB7EWej8cfRZJN1uFu7R1LnpGMPtS6VJYGyytrh7ZliufPtY0fKron3w/twKXVQ7+0W7qB9Q15pxFix2QyQsx8E/otxaJ9x1/x2tUNlEM55XbS05aiPghJqrb30qau6sMjo/KO4/MZITGbWkD7si9A0Kh4Z+IqJHonh4rHe4h3+TWuFD1yDl7uNm5MJ5Jjb0jz4jmvAypEvqR8Qx9rpxbuMvTwBbNUwmoSIUUCHthAXn0wsyIDHtPp+KLqqawsydedlFsEOsYUVzUAdzL2C9fGm1v5tFDU7MrQmoKGmj6WaWqX/oRRfqhKoRpwDRrvs7i8K89AwgMFMwlm3kOYLh0IjrTHiR4STlg9anZ3eL1ZlIRtg5pxuvFz4Pqln0F3o/ABFZAit7B5tmobQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(7416014)(376014)(82310400026)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZKUw+KA4K/bx8xccUtv1qnmhNw7gRFpV1m0RP9AjVt5Za4yRkyhM/PKQngGaiFd880XTpJmQeWxMl840tGNubDCS9tnUgaOsqiFyhmwfbQIJBYffloFRpkYUS0+FwpgfEqN3MNr2ZXVyaiju15okQSzv1iENNohkUYznpjfq8pjC+SnSjqVFxmXQtQgbvf1DrOfSFGvJ4XdhSVjgLnxk2A/ev4mG0H48kRdlfUwslpV8B6a3FFM3zn+yi2toCMwW7vs5pKnyo3NMzum26501l9EUp3HKhSxqdK8Mcfrv4J/AMqBZ0YALWSqvfDYm0GO4TWfX3Nao13ietibIwiGOWJ0kM5AnmXqcqUOy4I+EgIT3uF3sHvDefxVQogl3DhjLWAlQ78NWLesnuKU+xYUUdo07CR0+dXAyzfYW+Lh7u3SOaF19asijQAQYiX1iWz6I
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 13:22:46.4364
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7a7ff85-794f-4196-c8df-08de8ff1c3a7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000204.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4331

 Add TI amp utility for supporting the tac5xx2 family
of devices to support tac5572, tac5672, tac5682 and
tas2883

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
---
v4:
- no change

v3:
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

