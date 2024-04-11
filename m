Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3653BBDF
	for <linux-sound@vger.kernel.org>; Thu, 11 Apr 2024 22:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712873057; cv=none; b=f5wOU69ZWJzAVmrWRswKIqyccsZKbYBQCliOyZiy9hW6u/11T7YnKTi+FbFYrEXqpA7Y4MSrYY+Di+g4/eG/oxAu+lq3Hz/2oxyvhgJP1NMF0hS3L+WTu+/dKOcxyV19gTdOhpA3xIHBEbK62mgijbYYeco+Yzn80A7tg+ob/b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712873057; c=relaxed/simple;
	bh=TMR07NZyxBMzozdVg2PV5pehrtCgmfaAUxJuFw/xcPM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ntao59T4nYUzikl8LrRg9gMFJdYAwbnTiuq0mhesrEyLK5fuhjX+YuQyzFNsSE2QiRffwWdIo//fhWGlp++8uvh+QZuT3s41100d8OA/hudQqSEM3OXcBW5TiFuzBCOLvHrOM/1nHwzdMjCLNR2UU7iJ3oC60irLfpiV3c58Mhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h3Y8wBKK; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h3Y8wBKK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712873056; x=1744409056;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TMR07NZyxBMzozdVg2PV5pehrtCgmfaAUxJuFw/xcPM=;
  b=h3Y8wBKKFEXs8Bz4CtGaJnuBVev5lUhZTYLRl93bfqKRB3xL2iNv2sw0
   MoP4aMptFuAlAlqVdeg7FpRjx9/6TCEbeVLo2t5RenbWkNSYcNEoRJubZ
   I/Lq0gRnWr5lIw+gkcLQd1R6TR181EEfwyxVSwly/WWRmQmIP43Sl3TxI
   911HAviFj7wMYirCOqtA3JyP6myFTVz5X3GV7DtWdQ3CSaIJl2usizcwT
   Gcryl3v8ECOWWvTusaCOLmF8NR2kCn/t5pt/IWDHR8wYP4SjW3KUpOnxL
   MSMEv9rUWZsn5PN+hCBB6k4XJmu1wPRKn+hvbc7U17jkOFydzS8FGggFu
   A==;
X-CSE-ConnectionGUID: Xgq4zmCsRiSr1BHsDcqcmA==
X-CSE-MsgGUID: Yg+xHRTlRSWvhtDvjv71TQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="19708357"
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000"; 
   d="scan'208";a="19708357"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 15:04:15 -0700
X-CSE-ConnectionGUID: PI80/Y/ZQDOGpo10emHSqw==
X-CSE-MsgGUID: hwQG/UANRSiHyV2r4LRchQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000"; 
   d="scan'208";a="21628738"
Received: from aramana1-mobl.amr.corp.intel.com (HELO pbossart-mobl6.lan) ([10.213.177.233])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 15:04:15 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 05/12] ASoC: Intel: sof_sdw: remove FOUR_SPEAKER quirks
Date: Thu, 11 Apr 2024 17:03:40 -0500
Message-Id: <20240411220347.131267-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240411220347.131267-1-pierre-louis.bossart@linux.intel.com>
References: <20240411220347.131267-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch removes a confusion between speakers and amplifiers.

The existing code keeps track of the number of amplifiers and reports
it in the 'cfg-amp' component string.

The number of speakers is defined with quirks, but those quirks are
not consistently added: in the MeteorLake case, none of the supported
platforms used such a quirk, and UCM does not use the values reported
anyways. The notion of 'FOUR_SPEAKERS' is also obsolete now with some
platforms having more than four speakers.

Let's just remove all this and only report the number of amplifiers.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c        | 68 ++++++++-----------------
 sound/soc/intel/boards/sof_sdw_common.h |  1 +
 2 files changed, 23 insertions(+), 46 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 6253fc464198..d65c5da49000 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -27,7 +27,7 @@ static void log_quirks(struct device *dev)
 		dev_dbg(dev, "quirk realtek,jack-detect-source %ld\n",
 			SOF_JACK_JDSRC(sof_sdw_quirk));
 	if (sof_sdw_quirk & SOF_SDW_FOUR_SPK)
-		dev_dbg(dev, "quirk SOF_SDW_FOUR_SPK enabled\n");
+		dev_err(dev, "quirk SOF_SDW_FOUR_SPK enabled but no longer supported\n");
 	if (sof_sdw_quirk & SOF_SDW_TGL_HDMI)
 		dev_dbg(dev, "quirk SOF_SDW_TGL_HDMI enabled\n");
 	if (sof_sdw_quirk & SOF_SDW_PCH_DMIC)
@@ -80,8 +80,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
 			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "098F"),
 		},
-		.driver_data = (void *)(RT711_JD2 |
-					SOF_SDW_FOUR_SPK),
+		.driver_data = (void *)(RT711_JD2),
 	},
 	{
 		.callback = sof_sdw_quirk_cb,
@@ -89,8 +88,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
 			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0990"),
 		},
-		.driver_data = (void *)(RT711_JD2 |
-					SOF_SDW_FOUR_SPK),
+		.driver_data = (void *)(RT711_JD2),
 	},
 	/* IceLake devices */
 	{
@@ -141,8 +139,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0A5D")
 		},
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
-					RT711_JD2 |
-					SOF_SDW_FOUR_SPK),
+					RT711_JD2),
 	},
 	{
 		.callback = sof_sdw_quirk_cb,
@@ -151,8 +148,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0A5E")
 		},
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
-					RT711_JD2 |
-					SOF_SDW_FOUR_SPK),
+					RT711_JD2),
 	},
 	{
 		.callback = sof_sdw_quirk_cb,
@@ -162,7 +158,6 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		},
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
 					SOF_SDW_PCH_DMIC |
-					SOF_SDW_FOUR_SPK |
 					SOF_BT_OFFLOAD_SSP(2) |
 					SOF_SSP_BT_OFFLOAD_PRESENT),
 	},
@@ -173,8 +168,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Ripto"),
 		},
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
-					SOF_SDW_PCH_DMIC |
-					SOF_SDW_FOUR_SPK),
+					SOF_SDW_PCH_DMIC),
 	},
 	{
 		/*
@@ -258,8 +252,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0A32")
 		},
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
-					RT711_JD2 |
-					SOF_SDW_FOUR_SPK),
+					RT711_JD2),
 	},
 	{
 		.callback = sof_sdw_quirk_cb,
@@ -290,7 +283,6 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		},
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
 					SOF_SDW_PCH_DMIC |
-					SOF_SDW_FOUR_SPK |
 					SOF_BT_OFFLOAD_SSP(2) |
 					SOF_SSP_BT_OFFLOAD_PRESENT),
 	},
@@ -301,8 +293,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0AF0")
 		},
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
-					RT711_JD2 |
-					SOF_SDW_FOUR_SPK),
+					RT711_JD2),
 	},
 	{
 		.callback = sof_sdw_quirk_cb,
@@ -311,8 +302,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0AF3"),
 		},
 		/* No Jack */
-		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
-					SOF_SDW_FOUR_SPK),
+		.driver_data = (void *)(SOF_SDW_TGL_HDMI),
 	},
 	{
 		.callback = sof_sdw_quirk_cb,
@@ -321,8 +311,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0AFE")
 		},
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
-					RT711_JD2 |
-					SOF_SDW_FOUR_SPK),
+					RT711_JD2),
 	},
 	{
 		.callback = sof_sdw_quirk_cb,
@@ -331,8 +320,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0AFF")
 		},
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
-					RT711_JD2 |
-					SOF_SDW_FOUR_SPK),
+					RT711_JD2),
 	},
 	{
 		.callback = sof_sdw_quirk_cb,
@@ -341,8 +329,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0B00")
 		},
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
-					RT711_JD2 |
-					SOF_SDW_FOUR_SPK),
+					RT711_JD2),
 	},
 	{
 		.callback = sof_sdw_quirk_cb,
@@ -351,8 +338,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0B01")
 		},
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
-					RT711_JD2 |
-					SOF_SDW_FOUR_SPK),
+					RT711_JD2),
 	},
 	{
 		.callback = sof_sdw_quirk_cb,
@@ -361,8 +347,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0B11")
 		},
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
-					RT711_JD2 |
-					SOF_SDW_FOUR_SPK),
+					RT711_JD2),
 	},
 	{
 		.callback = sof_sdw_quirk_cb,
@@ -371,8 +356,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0B12")
 		},
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
-					RT711_JD2 |
-					SOF_SDW_FOUR_SPK),
+					RT711_JD2),
 	},
 	{
 		.callback = sof_sdw_quirk_cb,
@@ -400,8 +384,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0B29"),
 		},
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
-					RT711_JD2 |
-					SOF_SDW_FOUR_SPK),
+					RT711_JD2),
 	},
 	{
 		.callback = sof_sdw_quirk_cb,
@@ -429,8 +412,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0BDA")
 		},
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
-					RT711_JD2 |
-					SOF_SDW_FOUR_SPK),
+					RT711_JD2),
 	},
 	{
 		.callback = sof_sdw_quirk_cb,
@@ -449,8 +431,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0C10"),
 		},
 		/* No Jack */
-		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
-					SOF_SDW_FOUR_SPK),
+		.driver_data = (void *)(SOF_SDW_TGL_HDMI),
 	},
 	{
 		.callback = sof_sdw_quirk_cb,
@@ -459,8 +440,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0C11")
 		},
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
-					RT711_JD2 |
-					SOF_SDW_FOUR_SPK),
+					RT711_JD2),
 	},
 	{
 		.callback = sof_sdw_quirk_cb,
@@ -469,8 +449,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0C40")
 		},
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
-					RT711_JD2 |
-					SOF_SDW_FOUR_SPK),
+					RT711_JD2),
 	},
 	{
 		.callback = sof_sdw_quirk_cb,
@@ -479,8 +458,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0C4F")
 		},
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
-					RT711_JD2 |
-					SOF_SDW_FOUR_SPK),
+					RT711_JD2),
 	},
 	/* MeteorLake devices */
 	{
@@ -2010,9 +1988,7 @@ static int mc_probe(struct platform_device *pdev)
 		amp_num += codec_info_list[i].amp_num;
 
 	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
-					  "cfg-spk:%d cfg-amp:%d",
-					  (sof_sdw_quirk & SOF_SDW_FOUR_SPK)
-					  ? 4 : 2, amp_num);
+					  "cfg-amp:%d", amp_num);
 	if (!card->components)
 		return -ENOMEM;
 
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index 8468487a6bd6..89253938ebaa 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -45,6 +45,7 @@ enum {
 };
 
 #define SOF_JACK_JDSRC(quirk)		((quirk) & GENMASK(3, 0))
+/* Deprecated and no longer supported by the code */
 #define SOF_SDW_FOUR_SPK		BIT(4)
 #define SOF_SDW_TGL_HDMI		BIT(5)
 #define SOF_SDW_PCH_DMIC		BIT(6)
-- 
2.40.1

