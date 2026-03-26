Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234553B2FE7
	for <linux-sound@vger.kernel.org>; Thu, 26 Mar 2026 07:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774511599; cv=none; b=PZMqaJoAoylPOq+t0DMMmiCkpiSZxvEaObDOyItZ9JWkarhXye1Qd51n3jc8njb6uvvc48Q4oQqlXkEnvvMpQg508n336lHI/zDkPWifsNiSel1DQJtXcn74/Yo1ywbyKuhzmma5Yud0v0ehgqw5gvRBTYZ1lAkJsIjzMfhyJhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774511599; c=relaxed/simple;
	bh=5VwND5tjEWyt5+f3iHa8LVmVythbGagLvu0PxKhk4W0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eMZ21X7bFgKzmRvcY6bp4F+AbW/nxnZUzJgVwiEFKlS0D/xJCzeMy6vtl87Wr2jROTkeWjkCSQUa/uIY+K9O9M9jXoLI6hoZSmeRJBMvUUi+NxVRPG3NI6hpSu/YYT7GibXtzqSr/RaKlUw4JlTlGtQLG+vP8bmyUBnuh+4D7hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jzzpWKiI; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jzzpWKiI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774511598; x=1806047598;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5VwND5tjEWyt5+f3iHa8LVmVythbGagLvu0PxKhk4W0=;
  b=jzzpWKiIlDkkahN506Ot6EszO/OW/tAENsGk5KCKrN7DT7RadDZbUR0g
   w1COnn5X/n1ANX9Hn3qGvfoSzmyffZZ3Prl/j6rL9YtOHTQWvroypnaSK
   vLaFi1CYJoX46BzW23t4lCKuo4HKMcCby+tCgsyVN4himdy2LdRJZLglN
   tju+1oEp8HWXa7Lx93xByKpZVhbZgYCCxAxPOYi169hv8h8848VCQqjEj
   z/NgPkZm/ZiOjfrUp7BlcaWNc1uL3SEkEz8j//kocwS+1kt/YaDhZVqi8
   +3RxDvE3Nt0OcL7h9bG0+ZbI3SR/swR4OmWLyB88QOglw3wS8xcH0Bo6H
   Q==;
X-CSE-ConnectionGUID: +U0hGuwATDu+h9NBv2Ux6A==
X-CSE-MsgGUID: CTu4/mrXSe2sNbsu3szyyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="78157961"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="78157961"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 00:53:18 -0700
X-CSE-ConnectionGUID: 5ZIPS4/qT6aBSwhtfYal8w==
X-CSE-MsgGUID: qVBP/yVvTPeMRfchXJ/k2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="220084923"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 00:53:16 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com,
	flove@realtek.com,
	derek.fang@realtek.com
Subject: [PATCH 3/3] ASoC: sdw_utils: add rt1320 and rt1321 dmic dai in codec_info_list
Date: Thu, 26 Mar 2026 15:53:02 +0800
Message-ID: <20260326075303.1083567-4-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326075303.1083567-1-yung-chuan.liao@linux.intel.com>
References: <20260326075303.1083567-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Derek Fang <derek.fang@realtek.com>

Add 'rt1320-aif2' dai infos for rt1320 and rt1321 dmic function.

Signed-off-by: Derek Fang <derek.fang@realtek.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sdw_utils/soc_sdw_rt_dmic.c | 46 +++++++++++++++++++++++++--
 sound/soc/sdw_utils/soc_sdw_utils.c   | 26 +++++++++++++--
 2 files changed, 67 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sdw_utils/soc_sdw_rt_dmic.c b/sound/soc/sdw_utils/soc_sdw_rt_dmic.c
index 97be110a59b6..fed85bad9e88 100644
--- a/sound/soc/sdw_utils/soc_sdw_rt_dmic.c
+++ b/sound/soc/sdw_utils/soc_sdw_rt_dmic.c
@@ -9,15 +9,20 @@
 
 #include <linux/device.h>
 #include <linux/errno.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_type.h>
 #include <sound/soc.h>
 #include <sound/soc-acpi.h>
 #include <sound/soc_sdw_utils.h>
+#include <sound/sdca_function.h>
 
 int asoc_sdw_rt_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct snd_soc_component *component;
+	struct sdw_slave *sdw_peripheral = NULL;
 	char *mic_name;
+	int rt1320_dmic_num = 0, part_id, i;
 
 	component = dai->component;
 
@@ -32,9 +37,44 @@ int asoc_sdw_rt_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_da
 	if (!mic_name)
 		return -ENOMEM;
 
-	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
-					  "%s mic:%s", card->components,
-					  mic_name);
+	/*
+	 * If there is any rt1320/rt1321 DMIC belonging to this card, try to count the `cfg-mics`
+	 * to be used in card->components.
+	 * Note: The rt1320 drivers register the peripheral dev to component->dev, so get the
+	 * sdw_peripheral from component->dev.
+	 */
+	if (is_sdw_slave(component->dev))
+		sdw_peripheral = dev_to_sdw_dev(component->dev);
+	if (sdw_peripheral &&
+	    (sdw_peripheral->id.part_id == 0x1320 || sdw_peripheral->id.part_id == 0x1321)) {
+		part_id = sdw_peripheral->id.part_id;
+		/*
+		 * This rtd init callback is called once, so count the rt1320/rt1321 with SDCA
+		 * function SmartMic type in this card.
+		 */
+		for_each_card_components(card, component) {
+			if (!is_sdw_slave(component->dev))
+				continue;
+			sdw_peripheral = dev_to_sdw_dev(component->dev);
+			if (sdw_peripheral->id.part_id != part_id)
+				continue;
+			for (i = 0; i < sdw_peripheral->sdca_data.num_functions; i++) {
+				if (sdw_peripheral->sdca_data.function[i].type ==
+				    SDCA_FUNCTION_TYPE_SMART_MIC) {
+					rt1320_dmic_num++;
+					break;
+				}
+			}
+		}
+		card->components = devm_kasprintf(card->dev, GFP_KERNEL,
+						  "%s mic:%s cfg-mics:%d", card->components,
+						  mic_name, rt1320_dmic_num);
+	} else {
+		card->components = devm_kasprintf(card->dev, GFP_KERNEL,
+						  "%s mic:%s", card->components,
+						  mic_name);
+	}
+
 	if (!card->components)
 		return -ENOMEM;
 
diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index 637c640001d6..2807f536eef0 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -331,6 +331,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		.vendor_id = 0x025d,
 		.part_id = 0x1320,
 		.name_prefix = "rt1320",
+		.is_amp = true,
 		.dais = {
 			{
 				.direction = {true, false},
@@ -346,13 +347,24 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 				.widgets = generic_spk_widgets,
 				.num_widgets = ARRAY_SIZE(generic_spk_widgets),
 			},
+			{
+				.direction = {false, true},
+				.dai_name = "rt1320-aif2",
+				.component_name = "rt1320",
+				.dai_type = SOC_SDW_DAI_TYPE_MIC,
+				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
+				.rtd_init = asoc_sdw_rt_dmic_rtd_init,
+				.widgets = generic_dmic_widgets,
+				.num_widgets = ARRAY_SIZE(generic_dmic_widgets),
+			},
 		},
-		.dai_num = 1,
+		.dai_num = 2,
 	},
 	{
 		.vendor_id = 0x025d,
 		.part_id = 0x1321,
 		.name_prefix = "rt1320",
+		.is_amp = true,
 		.dais = {
 			{
 				.direction = {true, false},
@@ -368,8 +380,18 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 				.widgets = generic_spk_widgets,
 				.num_widgets = ARRAY_SIZE(generic_spk_widgets),
 			},
+			{
+				.direction = {false, true},
+				.dai_name = "rt1320-aif2",
+				.component_name = "rt1320",
+				.dai_type = SOC_SDW_DAI_TYPE_MIC,
+				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
+				.rtd_init = asoc_sdw_rt_dmic_rtd_init,
+				.widgets = generic_dmic_widgets,
+				.num_widgets = ARRAY_SIZE(generic_dmic_widgets),
+			},
 		},
-		.dai_num = 1,
+		.dai_num = 2,
 	},
 	{
 		.vendor_id = 0x025d,
-- 
2.43.0

