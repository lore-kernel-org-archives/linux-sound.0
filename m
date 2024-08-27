Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9AE1BC073
	for <linux-sound@vger.kernel.org>; Tue, 27 Aug 2024 12:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724761955; cv=none; b=Txb6UonwQZLLEK1h8JH6/V7wrk3SkO+cKZUUnQG7jN6gkBR4SFi5Ny/OPPN00+PkVQUXW2PzlEzDQkpsqsLKQCV+k5/85t+9v3/6yGZQAs2l52j2eV6za+eZDzel2dbK6EwkUnYFEQsGsBv66gYQSWdKBaHeXEE5j4CjkJYkqL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724761955; c=relaxed/simple;
	bh=kEwY1c5jCHqQo3mClaPg/ISlbhMxoF+ffjISSZVISy0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cf6vuOPSujYLW8TMU6xgOd6Ru+UJ07iA44rRcVqKuR1GmZnSefQ+R7tRxVnIWPJD+Xkx9x62EULMb9uNiUL95O+YSkQMwMs3I5No42RTaU4aKr9nFI4PVIQHT13hA7xpzwlOdUieUhb5WpIR7UrO8BjS2dUrYz4NduUnQjR8cwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lAJUWzI7; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lAJUWzI7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724761954; x=1756297954;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kEwY1c5jCHqQo3mClaPg/ISlbhMxoF+ffjISSZVISy0=;
  b=lAJUWzI7LILMli4KEAr/Ju+TZrRpCrLiyMtdG2fpOYqcA2ADCbbEZBIR
   /UPe0pqVK46s2FLDEybw7VDmncFMReBKrZJeDDj2jjeiPNvyS6CcN4S9f
   /cigt7r3dIrSGX+wu6TDj+4j942PS9Btc7A10Z899/Wf4LxQWdTU+jJH9
   cfre71/w322B3LTt5U4QOPD32JK5PP9Ut6ImSRQdLlbmJq81+3P5Uv2EP
   B70t/piI9APjVw21YC+C9xguzjp7liIBx4Z53+1VxTivsLAOie4PNH8JG
   TxPlWNwuNb4cPwqa29q6pCGUU066cdOlNSlagI2URbSYhRWwjc2mYLrPP
   A==;
X-CSE-ConnectionGUID: IYbSIrVTTeG2APiX1ckglw==
X-CSE-MsgGUID: EN1nOBYRRlW+yPMmKV96HA==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="13235488"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; 
   d="scan'208";a="13235488"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 05:32:34 -0700
X-CSE-ConnectionGUID: iL+uVjTUQi6EG+5I8CJGMw==
X-CSE-MsgGUID: vbjRIJ7hRR6dKrM0Qm3Acw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; 
   d="scan'208";a="62676766"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.118.39])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 05:32:31 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH v2 02/17] ASoC: Intel: sof_sdw: add rt1320 amp support
Date: Tue, 27 Aug 2024 20:32:00 +0800
Message-ID: <20240827123215.258859-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240827123215.258859-1-yung-chuan.liao@linux.intel.com>
References: <20240827123215.258859-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Realtek rt1320 amp support.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig       |  1 +
 sound/soc/sdw_utils/soc_sdw_rt_amp.c | 11 ++++++++++-
 sound/soc/sdw_utils/soc_sdw_utils.c  | 19 +++++++++++++++++++
 3 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index cb952183f5ed..1141fe1263ce 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -524,6 +524,7 @@ config SND_SOC_INTEL_SOUNDWIRE_SOF_MACH
 	select SND_SOC_RT1308
 	select SND_SOC_RT1316_SDW
 	select SND_SOC_RT1318_SDW
+	select SND_SOC_RT1320_SDW
 	select SND_SOC_RT5682_SDW
 	select SND_SOC_CS42L42_SDW
 	select SND_SOC_CS42L43
diff --git a/sound/soc/sdw_utils/soc_sdw_rt_amp.c b/sound/soc/sdw_utils/soc_sdw_rt_amp.c
index 42be01405ab4..6951dfb56526 100644
--- a/sound/soc/sdw_utils/soc_sdw_rt_amp.c
+++ b/sound/soc/sdw_utils/soc_sdw_rt_amp.c
@@ -160,6 +160,13 @@ static const struct snd_soc_dapm_route rt1318_map[] = {
 	{ "Speaker", NULL, "rt1318-2 SPOR" },
 };
 
+static const struct snd_soc_dapm_route rt1320_map[] = {
+	{ "Speaker", NULL, "rt1320-1 SPOL" },
+	{ "Speaker", NULL, "rt1320-1 SPOR" },
+	{ "Speaker", NULL, "rt1320-2 SPOL" },
+	{ "Speaker", NULL, "rt1320-2 SPOR" },
+};
+
 static const struct snd_soc_dapm_route *get_codec_name_and_route(struct snd_soc_dai *dai,
 								 char *codec_name)
 {
@@ -171,8 +178,10 @@ static const struct snd_soc_dapm_route *get_codec_name_and_route(struct snd_soc_
 		return rt1308_map;
 	else if (strcmp(codec_name, "rt1316") == 0)
 		return rt1316_map;
-	else
+	else if (strcmp(codec_name, "rt1318") == 0)
 		return rt1318_map;
+	else
+		return rt1320_map;
 }
 
 int asoc_sdw_rt_amp_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index e8d0f199155d..d59ccb56642c 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -254,6 +254,25 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		},
 		.dai_num = 1,
 	},
+	{
+		.part_id = 0x1320,
+		.dais = {
+			{
+				.direction = {true, false},
+				.dai_name = "rt1320-aif1",
+				.dai_type = SOC_SDW_DAI_TYPE_AMP,
+				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
+				.init = asoc_sdw_rt_amp_init,
+				.exit = asoc_sdw_rt_amp_exit,
+				.rtd_init = asoc_sdw_rt_amp_spk_rtd_init,
+				.controls = generic_spk_controls,
+				.num_controls = ARRAY_SIZE(generic_spk_controls),
+				.widgets = generic_spk_widgets,
+				.num_widgets = ARRAY_SIZE(generic_spk_widgets),
+			},
+		},
+		.dai_num = 1,
+	},
 	{
 		.part_id = 0x714,
 		.version_id = 3,
-- 
2.43.0

