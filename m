Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7735415623B
	for <linux-sound@vger.kernel.org>; Fri, 26 Apr 2024 15:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714145147; cv=none; b=gKWe1hitOkm5wsvKWVlxJ2DI+4slZ9lcF+mYynpQLBV1ZtJNENQPmLY1U9FlDPAd7a/u3RPiT8jFY/aQH6WfMYE/4l59hqKNVKltCXn7qePVxwHTSjAxBxxgcmSSKqOZXGQGmKAp1XQm7h9uLVn4D2qzAEEQzdBzrVm/RyB+fGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714145147; c=relaxed/simple;
	bh=Y21SU9XxrAyEM080Cip1iZrzybquTip/1dFNecmyagc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nbzPH4Qi/drXR+vzjX04yXYqVQDMTXtNYuYV/OtEWpamhjMhMnj+w9Ms68RPvbfEW3lwQBULhY/7p5FVgsu58qJLcxLeeiKI5/toiPoyaNtTKcBpq1d0GTzVlSlihcxjxCYJGhDeUtrRw/vskVQ2FgvnzmTt5ZFp/yDneiCzTXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XTPBvSCy; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XTPBvSCy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714145146; x=1745681146;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Y21SU9XxrAyEM080Cip1iZrzybquTip/1dFNecmyagc=;
  b=XTPBvSCyqMcGCA/MCn6Bz9k86h4YDoua6fzWVyRuKP0Iz3RvBHknLrN5
   JRe8qGuEE5SEcATTSbczgAyREa+wU9lNhVQ4G64p4KCyeEzr8MQO+zzsg
   CDnBqhA5SWbTLT5PXfyFP8dAhhEfe+OAul3EVmc44W+cjvHvuVlmGWr0k
   6nIyFRv5ykDb3bPC7rP2WCW8H0ZMD5/PjLwteHAbUfvsdW8fJsdKPcdlw
   Bke4K5gHx+4JaRNL1w3XmQk94W7mMa3gAOBuBn5XxL8nfIPUVY2rRCBuO
   YmngJEF/ycJC65GTvMRVttTF0zP/V1SzZPsvDHV5K0R0emFIzEO+Au+Jy
   A==;
X-CSE-ConnectionGUID: eivpYQopR7OVLhdIb5fwIQ==
X-CSE-MsgGUID: QL1ex+ovSDyXZcPdRX6MUA==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21291315"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="21291315"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:25:45 -0700
X-CSE-ConnectionGUID: mSZYyqzATiqXn91s39Lxkw==
X-CSE-MsgGUID: JFZ/4ERgRSOfNN9AWxTXcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="30259569"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:25:45 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 10/23] ASoC: Intel: bxt_da7219_max98357a: remove cml support
Date: Fri, 26 Apr 2024 10:25:16 -0500
Message-Id: <20240426152529.38345-11-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
References: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brent Lu <brent.lu@intel.com>

Remove cml platform support and use sof_da7219 machine driver instead
for existing cml boards with MAX98357A speaker amplifier.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig                |  6 ++--
 sound/soc/intel/boards/bxt_da7219_max98357a.c | 28 +------------------
 .../intel/common/soc-acpi-intel-cml-match.c   |  2 +-
 3 files changed, 4 insertions(+), 32 deletions(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 8dfc1cc0f08e..1d76c97c9c02 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -584,13 +584,11 @@ if (SND_SOC_SOF_COMETLAKE && SND_SOC_SOF_HDA_LINK)
 
 config SND_SOC_INTEL_CML_LP_DA7219_MAX98357A_MACH
 	tristate "CML_LP with DA7219 and MAX98357A in I2S Mode"
-	depends on I2C && ACPI
-	depends on MFD_INTEL_LPSS || COMPILE_TEST
-	select SND_SOC_INTEL_BXT_DA7219_MAX98357A_COMMON
 	imply SND_SOC_INTEL_SOF_DA7219_MACH
 	help
 	   This adds support for ASoC machine driver for Cometlake platforms
-	   with DA7219 + MAX98357A I2S audio codec.
+	   with DA7219 + MAX98357A I2S audio codec. This option is deprecated
+	   and please use SND_SOC_INTEL_SOF_DA7219_MACH instead.
 	   Say Y or m if you have such a device. This is a recommended option.
 	   If unsure select "N".
 
diff --git a/sound/soc/intel/boards/bxt_da7219_max98357a.c b/sound/soc/intel/boards/bxt_da7219_max98357a.c
index 9f167c828d1c..45fe1d7b8865 100644
--- a/sound/soc/intel/boards/bxt_da7219_max98357a.c
+++ b/sound/soc/intel/boards/bxt_da7219_max98357a.c
@@ -201,10 +201,7 @@ static int broxton_da7219_codec_init(struct snd_soc_pcm_runtime *rtd)
 	int clk_freq;
 
 	/* Configure sysclk for codec */
-	if (soc_intel_is_cml())
-		clk_freq = 24000000;
-	else
-		clk_freq = 19200000;
+	clk_freq = 19200000;
 
 	ret = snd_soc_dai_set_sysclk(codec_dai, DA7219_CLKSRC_MCLK, clk_freq,
 				     SND_SOC_CLOCK_IN);
@@ -721,28 +718,6 @@ static int broxton_audio_probe(struct platform_device *pdev)
 				broxton_dais[i].cpus->dai_name = "SSP2 Pin";
 			}
 		}
-	} else if (soc_intel_is_cml()) {
-		unsigned int i;
-
-		broxton_audio_card.name = "cmlda7219max";
-
-		for (i = 0; i < ARRAY_SIZE(broxton_dais); i++) {
-			if (!broxton_dais[i].codecs->dai_name)
-				continue;
-
-			/* MAXIM_CODEC is connected to SSP1. */
-			if (!strcmp(broxton_dais[i].codecs->dai_name,
-					BXT_MAXIM_CODEC_DAI)) {
-				broxton_dais[i].name = "SSP1-Codec";
-				broxton_dais[i].cpus->dai_name = "SSP1 Pin";
-			}
-			/* DIALOG_CODEC is connected to SSP0 */
-			else if (!strcmp(broxton_dais[i].codecs->dai_name,
-					BXT_DIALOG_CODEC_DAI)) {
-				broxton_dais[i].name = "SSP0-Codec";
-				broxton_dais[i].cpus->dai_name = "SSP0 Pin";
-			}
-		}
 	}
 
 	/* override platform name, if required */
@@ -762,7 +737,6 @@ static int broxton_audio_probe(struct platform_device *pdev)
 static const struct platform_device_id bxt_board_ids[] = {
 	{ .name = "bxt_da7219_mx98357a" },
 	{ .name = "glk_da7219_mx98357a" },
-	{ .name = "cml_da7219_mx98357a" },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, bxt_board_ids);
diff --git a/sound/soc/intel/common/soc-acpi-intel-cml-match.c b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
index 4217dbb716dc..f79d7558174a 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cml-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
@@ -68,7 +68,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_cml_machines[] = {
 	},
 	{
 		.id = "DLGS7219",
-		.drv_name = "cml_da7219_mx98357a",
+		.drv_name = "cml_da7219_def",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &max98357a_spk_codecs,
 		.sof_tplg_filename = "sof-cml-da7219-max98357a.tplg",
-- 
2.40.1

