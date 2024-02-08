Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1258E81AAB
	for <linux-sound@vger.kernel.org>; Thu,  8 Feb 2024 16:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707411370; cv=none; b=tT0GG+jxxou6LX2Y+PiKwJrQ9iZpwpE6/nrfU2wLKQySJlh1GoVmUFWAFktKztsRqv4VIeba3mlLaLzSXI2ZLHne6twEy2AGrAmW2FYl5X096Xh0hLqip+9yDE6F16y2BSoBsca6Zi9hD8XECviGQWRdufXwNZEgBstZ3TTMb+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707411370; c=relaxed/simple;
	bh=lEHyeoUjOvDABSfQ8AI9NYBoAOp6zb3qSZVX8RMi9nw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rpClKF7RPpyjfefmvV5rfV0K0BUSaBe5FK3c/rEjz3NyCFNt5kktqGUfdc90Bnc9lEQKlLHO6XY0yEcCFY8xnZ6tstPlv3h+YTyabsGipIxniaRFgPVLXz3wqhzecAos8F00JfY3V/IEExG6ac6aK4cboTDJGs+Ma+7PnWCEUGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NRSiCFZX; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NRSiCFZX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707411369; x=1738947369;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lEHyeoUjOvDABSfQ8AI9NYBoAOp6zb3qSZVX8RMi9nw=;
  b=NRSiCFZXxkMQGDwgoic6CStyzJAZv2o7+VDa82VUkYifhwhO7zK5F9BH
   TveSExNc20TPez+asvqQlJmVrA0QpxnF/Gzog3GQlcCQdwOvukqJDpN6d
   Uke8ZkOEneRc4YsbTFJN7zuTMIUyfuGs8HDMmISHLs2zAEf9XaSo7A7vJ
   NAxqpaD9SpUCdFd4j/dbj/A/Q01sBmrRAccDqQIfGeYrGE+Gyd0QvryAq
   NAIfQ9dVh5UbAiiDUCzh5M8kmSf8XizhI42PvxBITZctX8mn6z1PX9w0s
   1zYXuFmasX2lqNYeRznHAPZoR8WoYZAa0m/W0Q/X8Yapx9+gNM8uQ6D70
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="395675431"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="395675431"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 08:56:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="1690278"
Received: from stang1-mobl1.amr.corp.intel.com (HELO localhost.localdomain) ([10.212.92.130])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 08:56:06 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 21/24] ASoC: Intel: sof_sdw: Remove unused function prototypes
Date: Thu,  8 Feb 2024 10:55:42 -0600
Message-Id: <20240208165545.93811-22-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240208165545.93811-1-pierre-louis.bossart@linux.intel.com>
References: <20240208165545.93811-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Charles Keepax <ckeepax@opensource.cirrus.com>

Recent commits remove a lot of init functions remove their function
prototypes as well.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw_common.h | 62 -------------------------
 1 file changed, 62 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index ab444dae46ab..b1d57034361c 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -139,25 +139,6 @@ int sof_sdw_rt_sdca_jack_init(struct snd_soc_card *card,
 			      bool playback);
 int sof_sdw_rt_sdca_jack_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link);
 
-/* RT712-SDCA support */
-int sof_sdw_rt712_spk_init(struct snd_soc_card *card,
-			   const struct snd_soc_acpi_link_adr *link,
-			   struct snd_soc_dai_link *dai_links,
-			   struct sof_sdw_codec_info *info,
-			   bool playback);
-int sof_sdw_rt712_sdca_dmic_init(struct snd_soc_card *card,
-				 const struct snd_soc_acpi_link_adr *link,
-				 struct snd_soc_dai_link *dai_links,
-				 struct sof_sdw_codec_info *info,
-				 bool playback);
-
-/* RT700 support */
-int sof_sdw_rt700_init(struct snd_soc_card *card,
-		       const struct snd_soc_acpi_link_adr *link,
-		       struct snd_soc_dai_link *dai_links,
-		       struct sof_sdw_codec_info *info,
-		       bool playback);
-
 /* RT1308 I2S support */
 extern struct snd_soc_ops sof_sdw_rt1308_i2s_ops;
 
@@ -169,22 +150,6 @@ int sof_sdw_rt_amp_init(struct snd_soc_card *card,
 			bool playback);
 int sof_sdw_rt_amp_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link);
 
-/* RT1316 support */
-
-/* RT715 support */
-int sof_sdw_rt715_init(struct snd_soc_card *card,
-		       const struct snd_soc_acpi_link_adr *link,
-		       struct snd_soc_dai_link *dai_links,
-		       struct sof_sdw_codec_info *info,
-		       bool playback);
-
-/* RT715-SDCA support */
-int sof_sdw_rt715_sdca_init(struct snd_soc_card *card,
-			    const struct snd_soc_acpi_link_adr *link,
-			    struct snd_soc_dai_link *dai_links,
-			    struct sof_sdw_codec_info *info,
-			    bool playback);
-
 /* RT722-SDCA support */
 int sof_sdw_rt722_spk_init(struct snd_soc_card *card,
 			   const struct snd_soc_acpi_link_adr *link,
@@ -204,33 +169,6 @@ int sof_sdw_maxim_init(struct snd_soc_card *card,
 		       struct sof_sdw_codec_info *info,
 		       bool playback);
 
-/* RT5682 support */
-int sof_sdw_rt5682_init(struct snd_soc_card *card,
-			const struct snd_soc_acpi_link_adr *link,
-			struct snd_soc_dai_link *dai_links,
-			struct sof_sdw_codec_info *info,
-			bool playback);
-
-/* CS42L42 support */
-int sof_sdw_cs42l42_init(struct snd_soc_card *card,
-			 const struct snd_soc_acpi_link_adr *link,
-			 struct snd_soc_dai_link *dai_links,
-			 struct sof_sdw_codec_info *info,
-			 bool playback);
-
-/* CS42L43 support */
-int sof_sdw_cs42l43_hs_init(struct snd_soc_card *card,
-			    const struct snd_soc_acpi_link_adr *link,
-			    struct snd_soc_dai_link *dai_links,
-			    struct sof_sdw_codec_info *info,
-			    bool playback);
-
-int sof_sdw_cs42l43_dmic_init(struct snd_soc_card *card,
-			      const struct snd_soc_acpi_link_adr *link,
-			      struct snd_soc_dai_link *dai_links,
-			      struct sof_sdw_codec_info *info,
-			      bool playback);
-
 /* CS AMP support */
 int sof_sdw_cs_amp_init(struct snd_soc_card *card,
 			const struct snd_soc_acpi_link_adr *link,
-- 
2.40.1

