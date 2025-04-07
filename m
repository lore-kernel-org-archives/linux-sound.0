Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B604524E4A9
	for <linux-sound@vger.kernel.org>; Mon,  7 Apr 2025 12:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744029649; cv=none; b=FaAckPTsGT8SOuKluiwvKodir56+C4Z5F/v/33sl52EwTYw95ce/RT2kIWTf/yrKigBIsVI2j+3PWEp+WOTAa6WUQga3opkUi1McifSC0h+TyKOVA4cvxDmnEdRUUfqs3Zp3rUdZZZatUJtqEbD+PxTQ67wME0VCaUh7+P7nSrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744029649; c=relaxed/simple;
	bh=rm/X2eKjrsaqOQxH4fDzcCQJEKCs4iJ8EjjNqZRLk7g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YU2e90BX6TG1W7DcXQBKmQFk2IWOZOwYYVlbQEoh/GXwebVnx/EfJB2wv55jcXq2geybG6gpqVbw3NtVTPTqDeocVt50HrdExh19hM2Bt7wliqTLJvSgD+HTRWesAWACvxdVyxTBNZC6usp7CghsnK5Rg2ARfZ4KLkoNFG4M7SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bRWmXfbE; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bRWmXfbE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744029648; x=1775565648;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rm/X2eKjrsaqOQxH4fDzcCQJEKCs4iJ8EjjNqZRLk7g=;
  b=bRWmXfbEEpKQ67aYAjBCF6X0vl6QJS4xmFX9UTyGwhl0hxIxFilTb06T
   Lua6n6xP5gcM5RuYjgoMFMTJFZ9sIluyipT9pDDKpzEACs/HIGp6jJxks
   3k9JZwD8lFVTg4QVtkjQ8kbMzytIsQuj5g3NSMqL5m02awNnK+rOoCp5s
   cnAbWF/9sJ9wrQjVTRgIi1tAUrnXiPWB15dTnrnosFtIk4Hn73c1Kc1vi
   mVbu/p4ZedtXpQs+yOCYevcfLc49omNMWWlbTrlfMJlh3/wXR/LaGFUtP
   CRaOUo+qzJI04CsXge86hqfL0NHxh3YAw5/770u3DvQMGk1PPETKGSDtK
   g==;
X-CSE-ConnectionGUID: 7ZaP43ZiQumd3kMCAsbyug==
X-CSE-MsgGUID: vfM/FfezRwe8rq8upHBefA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56778969"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="56778969"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 05:40:47 -0700
X-CSE-ConnectionGUID: e/TZOhmJS9OuFO4Omf1f8A==
X-CSE-MsgGUID: Fo2+anQTRm+rEdyYfpr46Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="151134032"
Received: from dev2.igk.intel.com ([10.237.148.94])
  by fmviesa002.fm.intel.com with ESMTP; 07 Apr 2025 05:40:43 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 02/20] ASoC: Intel: avs: Use topology information for endpoint numbers
Date: Mon,  7 Apr 2025 14:41:36 +0200
Message-Id: <20250407124154.1713039-3-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250407124154.1713039-1-amadeuszx.slawinski@linux.intel.com>
References: <20250407124154.1713039-1-amadeuszx.slawinski@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use DAI PCM ID from topology as Front End device endpoint number. This
allows devices to be more naturally enumerated starting from 0, like
most cards, instead of values like 1 or 2.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/avs.h             | 2 +-
 sound/soc/intel/avs/board_selection.c | 2 +-
 sound/soc/intel/avs/pcm.c             | 8 +++++---
 sound/soc/intel/avs/probes.c          | 2 +-
 sound/soc/intel/avs/utils.h           | 2 ++
 5 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index 585543f872fcc..71973918e027b 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -340,7 +340,7 @@ struct avs_soc_component {
 extern const struct snd_soc_dai_ops avs_dai_fe_ops;
 
 int avs_soc_component_register(struct device *dev, const char *name,
-			       const struct snd_soc_component_driver *drv,
+			       struct snd_soc_component_driver *drv,
 			       struct snd_soc_dai_driver *cpu_dais, int num_cpu_dais);
 int avs_dmic_platform_register(struct avs_dev *adev, const char *name);
 int avs_i2s_platform_register(struct avs_dev *adev, const char *name, unsigned long port_mask,
diff --git a/sound/soc/intel/avs/board_selection.c b/sound/soc/intel/avs/board_selection.c
index d00addb24d40a..d021503149a39 100644
--- a/sound/soc/intel/avs/board_selection.c
+++ b/sound/soc/intel/avs/board_selection.c
@@ -23,7 +23,7 @@ static bool i2s_test;
 module_param(i2s_test, bool, 0444);
 MODULE_PARM_DESC(i2s_test, "Probe I2S test-board and skip all other I2S boards");
 
-static bool obsolete_card_names = IS_ENABLED(CONFIG_SND_SOC_INTEL_AVS_CARDNAME_OBSOLETE);
+bool obsolete_card_names = IS_ENABLED(CONFIG_SND_SOC_INTEL_AVS_CARDNAME_OBSOLETE);
 module_param_named(obsolete_card_names, obsolete_card_names, bool, 0444);
 MODULE_PARM_DESC(obsolete_card_names, "Use obsolete card names 0=no, 1=yes");
 
diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 7e077c97123bb..0f4e35dab7e48 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -1267,7 +1267,7 @@ static int avs_component_construct(struct snd_soc_component *component,
 	return 0;
 }
 
-static const struct snd_soc_component_driver avs_component_driver = {
+static struct snd_soc_component_driver avs_component_driver = {
 	.name			= "avs-pcm",
 	.probe			= avs_component_probe,
 	.remove			= avs_component_remove,
@@ -1282,7 +1282,7 @@ static const struct snd_soc_component_driver avs_component_driver = {
 };
 
 int avs_soc_component_register(struct device *dev, const char *name,
-			       const struct snd_soc_component_driver *drv,
+			       struct snd_soc_component_driver *drv,
 			       struct snd_soc_dai_driver *cpu_dais, int num_cpu_dais)
 {
 	struct avs_soc_component *acomp;
@@ -1300,6 +1300,8 @@ int avs_soc_component_register(struct device *dev, const char *name,
 	acomp->base.name = name;
 	INIT_LIST_HEAD(&acomp->node);
 
+	drv->use_dai_pcm_id = !obsolete_card_names;
+
 	return snd_soc_add_component(&acomp->base, cpu_dais, num_cpu_dais);
 }
 
@@ -1626,7 +1628,7 @@ static int avs_component_hda_open(struct snd_soc_component *component,
 	return 0;
 }
 
-static const struct snd_soc_component_driver avs_hda_component_driver = {
+static struct snd_soc_component_driver avs_hda_component_driver = {
 	.name			= "avs-hda-pcm",
 	.probe			= avs_component_hda_probe,
 	.remove			= avs_component_hda_remove,
diff --git a/sound/soc/intel/avs/probes.c b/sound/soc/intel/avs/probes.c
index f0b0109563038..a42736b9aa55b 100644
--- a/sound/soc/intel/avs/probes.c
+++ b/sound/soc/intel/avs/probes.c
@@ -284,7 +284,7 @@ static struct snd_soc_dai_driver probe_cpu_dais[] = {
 },
 };
 
-static const struct snd_soc_component_driver avs_probe_component_driver = {
+static struct snd_soc_component_driver avs_probe_component_driver = {
 	.name			= "avs-probe-compr",
 	.compress_ops		= &avs_probe_compress_ops,
 	.module_get_upon_open	= 1, /* increment refcount when a stream is opened */
diff --git a/sound/soc/intel/avs/utils.h b/sound/soc/intel/avs/utils.h
index a7aa13a48cf3d..955a40d2c30c2 100644
--- a/sound/soc/intel/avs/utils.h
+++ b/sound/soc/intel/avs/utils.h
@@ -11,6 +11,8 @@
 
 #include <sound/soc-acpi.h>
 
+extern bool obsolete_card_names;
+
 struct avs_mach_pdata {
 	struct hda_codec *codec;
 	unsigned long *tdms;
-- 
2.34.1

