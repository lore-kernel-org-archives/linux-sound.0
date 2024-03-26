Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28CD13CABC
	for <linux-sound@vger.kernel.org>; Tue, 26 Mar 2024 16:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711469144; cv=none; b=U7PKMpvGffWlJwzXBWOVJStaAWK8DVi50kjU4QKXlcJHgg2VETJfrRaacGAPoH2MnSx5VjvID5SqnlokgHz+W6x7vEn3uDtRsxk6dgpsyqciLz5WxePV2SDRms8kQqlbHTiCLNDE+whBr5dsP0RwajYwpZbzjsetXq1pYOMvHwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711469144; c=relaxed/simple;
	bh=un6JUsVkZ+4aDf8r/KdzFVrt0MBjo+jMm6gVJfWVgjU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CYuLKcJqVcv77+9ji3qjPOrKnI3T0nHgAd1p+/MYt3tHDRCyFtJIJ8msR83arwG32Ur8yVNYcnQVEITe4GG/6iUY11ZS+MqrkcF2Ze0CTfl2Y3+S48hWdgmleuJ+SIJQJMhY6BPItwluGLwsn5c5sEUNcvRoCTjt0+Uzk+gP0y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NYqAp2Ad; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NYqAp2Ad"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711469143; x=1743005143;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=un6JUsVkZ+4aDf8r/KdzFVrt0MBjo+jMm6gVJfWVgjU=;
  b=NYqAp2Adma/S1Q+Ki32LOIkOwJqGU5zmNyqp/elolAPxlDf7jHjUL7ap
   L/k7DWzFUtJmlnJTIiUTjzVtjTIdkqXNp7qryrUAy5Tq8PCIDlCjcwVZO
   TKJJTqXW/gPfEzJ2cG+ExSvjL+F7nO+Kxo3O0A/0m7kPQM+ZK9NAHbZ4b
   uqNTvMZ3YqqinTKvhRxk3WlTDD9POlTtT0PRbC+iQvjASraLcNA959YBZ
   GuHbDEj316S9Kj7cR2gQpxj9AWByUnShJflwqnrthbp4DWAhta1OyBr7a
   iSGXyGzU3KaKlXMLP1o1hl6Mmvxn+rvxXEkvBEZKpy0ErRhHZVPxONxfU
   Q==;
X-CSE-ConnectionGUID: ZySxeup0Q8+ZoppJSkbQxQ==
X-CSE-MsgGUID: /KZLFhX9RZuuAE3MjYRafw==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17260584"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="17260584"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:05:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="20482520"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.65.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:05:07 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>,
	Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Bard liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 34/34] ASoC: Intel: sof_sdw: Add support for cs42l43 optional speaker output
Date: Tue, 26 Mar 2024 11:04:29 -0500
Message-Id: <20240326160429.13560-35-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
References: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Charles Keepax <ckeepax@opensource.cirrus.com>

Add support for the optional speaker output on the cs42l43, this uses
the new SOF_CODEC_SPKR quirk to conditional include the speaker DAI
link. It is worth noting that currently no systems are included that
utilise this feature, but the feature is added as several systems are on
the horizon. As part of this SOF_SDW_MAX_DAI_NUM must be increased, it
is currently 3 but cs42l43 will now have 4 DAI links. This value is
increased to 8 to give some head room for future devices.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c              | 11 +++-
 sound/soc/intel/boards/sof_sdw_common.h       |  9 +++-
 sound/soc/intel/boards/sof_sdw_cs42l43.c      | 50 +++++++++++++++++++
 .../intel/common/soc-acpi-intel-mtl-match.c   |  6 +++
 .../intel/common/soc-acpi-intel-tgl-match.c   |  6 +++
 5 files changed, 80 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 4fc15f597e28..b94835448b1b 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1016,8 +1016,17 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dai_type = SOF_SDW_DAI_TYPE_JACK,
 				.dailink = {SDW_UNUSED_DAI_ID, SDW_JACK_IN_DAI_ID},
 			},
+			{
+				.direction = {true, false},
+				.dai_name = "cs42l43-dp6",
+				.dai_type = SOF_SDW_DAI_TYPE_AMP,
+				.dailink = {SDW_AMP_OUT_DAI_ID, SDW_UNUSED_DAI_ID},
+				.init = sof_sdw_cs42l43_spk_init,
+				.rtd_init = cs42l43_spk_rtd_init,
+				.quirk = SOF_CODEC_SPKR,
+			},
 		},
-		.dai_num = 3,
+		.dai_num = 4,
 	},
 	{
 		.part_id = 0xaaaa, /* generic codec mockup */
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index 81181627b406..8468487a6bd6 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -66,7 +66,7 @@ enum {
 #define SOF_SDW_DAI_TYPE_AMP		1
 #define SOF_SDW_DAI_TYPE_MIC		2
 
-#define SOF_SDW_MAX_DAI_NUM		3
+#define SOF_SDW_MAX_DAI_NUM		8
 
 struct sof_sdw_codec_info;
 
@@ -162,6 +162,12 @@ int sof_sdw_maxim_init(struct snd_soc_card *card,
 		       struct sof_sdw_codec_info *info,
 		       bool playback);
 
+/* CS42L43 support */
+int sof_sdw_cs42l43_spk_init(struct snd_soc_card *card,
+			     struct snd_soc_dai_link *dai_links,
+			     struct sof_sdw_codec_info *info,
+			     bool playback);
+
 /* CS AMP support */
 int sof_sdw_cs_amp_init(struct snd_soc_card *card,
 			struct snd_soc_dai_link *dai_links,
@@ -172,6 +178,7 @@ int sof_sdw_cs_amp_init(struct snd_soc_card *card,
 
 int cs42l42_rtd_init(struct snd_soc_pcm_runtime *rtd);
 int cs42l43_hs_rtd_init(struct snd_soc_pcm_runtime *rtd);
+int cs42l43_spk_rtd_init(struct snd_soc_pcm_runtime *rtd);
 int cs42l43_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd);
 int cs_spk_rtd_init(struct snd_soc_pcm_runtime *rtd);
 int maxim_spk_rtd_init(struct snd_soc_pcm_runtime *rtd);
diff --git a/sound/soc/intel/boards/sof_sdw_cs42l43.c b/sound/soc/intel/boards/sof_sdw_cs42l43.c
index a9b6edac2ecd..5361249f0f53 100644
--- a/sound/soc/intel/boards/sof_sdw_cs42l43.c
+++ b/sound/soc/intel/boards/sof_sdw_cs42l43.c
@@ -30,6 +30,17 @@ static const struct snd_soc_dapm_route cs42l43_hs_map[] = {
 	{ "cs42l43 ADC1_IN1_N", NULL, "Headset Mic" },
 };
 
+static const struct snd_soc_dapm_widget cs42l43_spk_widgets[] = {
+	SND_SOC_DAPM_SPK("Speaker", NULL),
+};
+
+static const struct snd_soc_dapm_route cs42l43_spk_map[] = {
+	{ "Speaker", NULL, "cs42l43 AMP1_OUT_P", },
+	{ "Speaker", NULL, "cs42l43 AMP1_OUT_N", },
+	{ "Speaker", NULL, "cs42l43 AMP2_OUT_P", },
+	{ "Speaker", NULL, "cs42l43 AMP2_OUT_N", },
+};
+
 static const struct snd_soc_dapm_widget cs42l43_dmic_widgets[] = {
 	SND_SOC_DAPM_MIC("DMIC", NULL),
 };
@@ -108,6 +119,45 @@ int cs42l43_hs_rtd_init(struct snd_soc_pcm_runtime *rtd)
 	return ret;
 }
 
+int cs42l43_spk_rtd_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	int ret;
+
+	card->components = devm_kasprintf(card->dev, GFP_KERNEL, "%s spk:cs42l43-spk",
+					  card->components);
+	if (!card->components)
+		return -ENOMEM;
+
+	ret = snd_soc_dapm_new_controls(&card->dapm, cs42l43_spk_widgets,
+					ARRAY_SIZE(cs42l43_spk_widgets));
+	if (ret) {
+		dev_err(card->dev, "cs42l43 speaker widgets addition failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_dapm_add_routes(&card->dapm, cs42l43_spk_map,
+				      ARRAY_SIZE(cs42l43_spk_map));
+	if (ret)
+		dev_err(card->dev, "cs42l43 speaker map addition failed: %d\n", ret);
+
+	return ret;
+}
+
+int sof_sdw_cs42l43_spk_init(struct snd_soc_card *card,
+			     struct snd_soc_dai_link *dai_links,
+			     struct sof_sdw_codec_info *info,
+			     bool playback)
+{
+	/* Do init on playback link only. */
+	if (!playback)
+		return 0;
+
+	info->amp_num++;
+
+	return 0;
+}
+
 int cs42l43_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
index 7e53266d831d..27d1313e6686 100644
--- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
@@ -357,6 +357,12 @@ static const struct snd_soc_acpi_endpoint cs42l43_endpoints[] = {
 		.group_position = 0,
 		.group_id = 0,
 	},
+	{ /* Speaker Playback Endpoint */
+		.num = 3,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
 };
 
 static const struct snd_soc_acpi_adr_device cs42l43_0_adr[] = {
diff --git a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
index 0cef3d788a5b..77226d1eb1cf 100644
--- a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
@@ -433,6 +433,12 @@ static const struct snd_soc_acpi_endpoint cs42l43_endpoints[] = {
 		.group_position = 0,
 		.group_id = 0,
 	},
+	{ /* Speaker Playback Endpoint */
+		.num = 3,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
 };
 
 static const struct snd_soc_acpi_adr_device cs42l43_3_adr[] = {
-- 
2.40.1

