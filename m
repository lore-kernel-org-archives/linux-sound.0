Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220BC79DE
	for <linux-sound@vger.kernel.org>; Thu,  9 May 2024 16:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715272474; cv=none; b=bt+GWMGW3mwvm200z+FCRcSUyF/gG0AU+lqbjTvOTtxEWE+299JWzk4Ka3jDzwE8sDCIyLwQsFK6h9wfBN3UcrPX8ZarLOxT/t2d5tF+lfNA49Gl2mKouanMcuQIG4MRmkSmLA92Yrjz0+IsuZjaOCBgUuo2KztQscUpkUQFutY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715272474; c=relaxed/simple;
	bh=5p/ULIDJcgG6EicAZJS+bv/Iz0bKhiKlJfRY4VecTMk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jeKqhrR2cXkO7hA7TTKfJQrMEYZUYkniU9RDk2aly4Q2DshAmioKewyb5Njx5F9jDKkxDV9McmH+e/FqvumWsezdldODc5+y1+J7m82ggTAkf77M9fjZnIQbJcpOvuNey4RLwBmb0sFdxs5lb+hotKna81+W1cM0OsStdDHDgkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lf0zjQcO; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lf0zjQcO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715272473; x=1746808473;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5p/ULIDJcgG6EicAZJS+bv/Iz0bKhiKlJfRY4VecTMk=;
  b=lf0zjQcO1qIAnPrgekoiVXMSMK86cXuSklx9O16TKSXesOGLPencHOAs
   8num0OF/G9SJ69gjHXM+tPZd9wSapMSZIXsUgy4swqGt0FuUF/+HVh72I
   SrFXdsp47Lq5jkL2tf33JyUE7R1a9kz96nK0H/e7afuTrO0Ch3RwFf7yb
   jfYNvxp64/QEYEq/LvnEsjjRcuOYZfvlNU726jtF7JIFGxHXbiDATO42w
   W7Bd9KlgTm0G0/gti8Glve5ups9xhnJJI24WD54d6JgXgxnFRNAswmqtW
   xYsSxJQbRmhuLTLwAmkfv7Fkt8PkSpjE8gaGxdVNCvYKWvah3JOm3OkBJ
   g==;
X-CSE-ConnectionGUID: 9q4MztgISNKKoGC/wFEPEw==
X-CSE-MsgGUID: UCYU2h+8RFGg6pO96yLDPw==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="15017583"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="15017583"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 09:34:31 -0700
X-CSE-ConnectionGUID: KdXl9t/DSvejQT5YJUi0bQ==
X-CSE-MsgGUID: yMK/7CQ6TiiSPnADrvEMUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="33761030"
Received: from ajunnare-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.213.181.85])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 09:34:31 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 11/18] ASoC: Intel: sof_sdw: add max98373 dapm routes
Date: Thu,  9 May 2024 11:34:11 -0500
Message-Id: <20240509163418.67746-12-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240509163418.67746-1-pierre-louis.bossart@linux.intel.com>
References: <20240509163418.67746-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brent Lu <brent.lu@intel.com>

Add dapm routes of max98373 to sdw driver and remove dependency of
maxim-common module.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig         | 1 -
 sound/soc/intel/boards/sof_sdw.c       | 1 -
 sound/soc/intel/boards/sof_sdw_maxim.c | 6 +++++-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 17bd0f883b9e..3ed81ab649c5 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -681,7 +681,6 @@ config SND_SOC_INTEL_SOUNDWIRE_SOF_MACH
 	select SND_SOC_CS35L56_SDW
 	select SND_SOC_DMIC
 	select SND_SOC_INTEL_HDA_DSP_COMMON
-	select SND_SOC_INTEL_SOF_MAXIM_COMMON
 	imply SND_SOC_SDW_MOCKUP
 	help
 	  Add support for Intel SoundWire-based platforms connected to
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index b1595fdb500d..2b97972f85ef 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -2067,4 +2067,3 @@ MODULE_AUTHOR("Rander Wang <rander.wang@linux.intel.com>");
 MODULE_AUTHOR("Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>");
 MODULE_LICENSE("GPL v2");
 MODULE_IMPORT_NS(SND_SOC_INTEL_HDA_DSP_COMMON);
-MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_MAXIM_COMMON);
diff --git a/sound/soc/intel/boards/sof_sdw_maxim.c b/sound/soc/intel/boards/sof_sdw_maxim.c
index 432e5112415a..57c1a5fb17a9 100644
--- a/sound/soc/intel/boards/sof_sdw_maxim.c
+++ b/sound/soc/intel/boards/sof_sdw_maxim.c
@@ -11,7 +11,6 @@
 #include <sound/soc-acpi.h>
 #include <sound/soc-dapm.h>
 #include "sof_sdw_common.h"
-#include "sof_maxim_common.h"
 
 static int maxim_part_id;
 #define SOF_SDW_PART_ID_MAX98363 0x8363
@@ -27,6 +26,11 @@ static const struct snd_kcontrol_new maxim_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Right Spk"),
 };
 
+static const struct snd_soc_dapm_route max_98373_dapm_routes[] = {
+	{ "Left Spk", NULL, "Left BE_OUT" },
+	{ "Right Spk", NULL, "Right BE_OUT" },
+};
+
 int maxim_spk_rtd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
-- 
2.40.1

