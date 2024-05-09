Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C9D4A29
	for <linux-sound@vger.kernel.org>; Thu,  9 May 2024 16:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715272475; cv=none; b=MMXa4ig/a3Oq3Bd6b+qTpZLiXXH3+R8rfue9E6116NObVc3Pk76jQqXl11PZgjcLp+BuzBofMogRBkz8zh6+p1zjnPMv0TcUt1T4HF0LeRrlb7/reX+x+Xq+jqH6mca3jbHOkYlFDYj5R9uuArf4sYlCz9BmOjEKvAxFT0SHFhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715272475; c=relaxed/simple;
	bh=/M2W1EKbKVeI74NfZtWa2d59GLcFZspImbuv/O3J74U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Xp2ehCu7QczucynoB3sR0V/XZRqVSGRiKoLyb50FOUytVDOio5AJFc+rC7T5st0dm0f9kATRivTTzDVLYmT9cxauRAr0YWwVHVWKVuGJvwI+IXfIsXa+R1vH9rk4oyoIA7Zd2d2ncDs4AVeoKdtHUhVK8Z7psrBcBzK5n+e0wNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j6bF+BTd; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j6bF+BTd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715272474; x=1746808474;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/M2W1EKbKVeI74NfZtWa2d59GLcFZspImbuv/O3J74U=;
  b=j6bF+BTd89snz6BhMBejlXacfRL6v4txAAs8At6C4zrjd/raxd2w8bj3
   eo+mBt63ISdcv03aWkEyTDTKrWpunE2Hps37CIpAHY8kNj56UDSqyIOoa
   +sMxTCRwvIxiGpbypTojrr3MvAahjoke+h6MTRxTea6pm66fA+j7vD2DC
   39xMfZOO9VLaWhkSKPSqU+GOLV/HaQmFRSX+aJzgaDtT1PW5AupvWzVb7
   Mt3NQnF2wgvvYNb+jvqzrLb4ztluTdShMzA3UKjI3DSB5BXZ/ZfVkt8bx
   57TiZO8SwigIo+BgShnzEIGyX3Fbd+S5+opspaibSe5SF7CeL41bXJ/2o
   w==;
X-CSE-ConnectionGUID: XEQy9mTVRcG2nJo7n89NeA==
X-CSE-MsgGUID: YwcYJ0IRTlye3VaehAudtg==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="15017588"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="15017588"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 09:34:32 -0700
X-CSE-ConnectionGUID: ndmaRf11STioyZmS7UxTow==
X-CSE-MsgGUID: rnAMvkvvQuifLR2qxG8BOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="33761037"
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
Subject: [PATCH 12/18] ASoC: Intel: maxim-common: change max98373 data to static
Date: Thu,  9 May 2024 11:34:12 -0500
Message-Id: <20240509163418.67746-13-pierre-louis.bossart@linux.intel.com>
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

Since there is dai link helper max_98373_dai_link, we could change all
functions and data of max98373 to static.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_maxim_common.c | 18 ++++++++----------
 sound/soc/intel/boards/sof_maxim_common.h |  6 ------
 2 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/sound/soc/intel/boards/sof_maxim_common.c b/sound/soc/intel/boards/sof_maxim_common.c
index c38c5598d87f..6c40ecc04723 100644
--- a/sound/soc/intel/boards/sof_maxim_common.c
+++ b/sound/soc/intel/boards/sof_maxim_common.c
@@ -39,14 +39,16 @@ static unsigned int get_num_codecs(const char *hid)
 	return dev_num;
 }
 
+/*
+ * Maxim MAX98373
+ */
 #define MAX_98373_PIN_NAME 16
 
-const struct snd_soc_dapm_route max_98373_dapm_routes[] = {
+static const struct snd_soc_dapm_route max_98373_dapm_routes[] = {
 	/* speaker */
 	{ "Left Spk", NULL, "Left BE_OUT" },
 	{ "Right Spk", NULL, "Right BE_OUT" },
 };
-EXPORT_SYMBOL_NS(max_98373_dapm_routes, SND_SOC_INTEL_SOF_MAXIM_COMMON);
 
 static struct snd_soc_codec_conf max_98373_codec_conf[] = {
 	{
@@ -59,7 +61,7 @@ static struct snd_soc_codec_conf max_98373_codec_conf[] = {
 	},
 };
 
-struct snd_soc_dai_link_component max_98373_components[] = {
+static struct snd_soc_dai_link_component max_98373_components[] = {
 	{  /* For Right */
 		.name = MAX_98373_DEV0_NAME,
 		.dai_name = MAX_98373_CODEC_DAI,
@@ -69,7 +71,6 @@ struct snd_soc_dai_link_component max_98373_components[] = {
 		.dai_name = MAX_98373_CODEC_DAI,
 	},
 };
-EXPORT_SYMBOL_NS(max_98373_components, SND_SOC_INTEL_SOF_MAXIM_COMMON);
 
 static int max_98373_hw_params(struct snd_pcm_substream *substream,
 			       struct snd_pcm_hw_params *params)
@@ -96,7 +97,7 @@ static int max_98373_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-int max_98373_trigger(struct snd_pcm_substream *substream, int cmd)
+static int max_98373_trigger(struct snd_pcm_substream *substream, int cmd)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *codec_dai;
@@ -139,15 +140,13 @@ int max_98373_trigger(struct snd_pcm_substream *substream, int cmd)
 
 	return ret;
 }
-EXPORT_SYMBOL_NS(max_98373_trigger, SND_SOC_INTEL_SOF_MAXIM_COMMON);
 
-struct snd_soc_ops max_98373_ops = {
+static const struct snd_soc_ops max_98373_ops = {
 	.hw_params = max_98373_hw_params,
 	.trigger = max_98373_trigger,
 };
-EXPORT_SYMBOL_NS(max_98373_ops, SND_SOC_INTEL_SOF_MAXIM_COMMON);
 
-int max_98373_spk_codec_init(struct snd_soc_pcm_runtime *rtd)
+static int max_98373_spk_codec_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
 	unsigned int num_codecs = get_num_codecs(MAX_98373_ACPI_HID);
@@ -186,7 +185,6 @@ int max_98373_spk_codec_init(struct snd_soc_pcm_runtime *rtd)
 
 	return ret;
 }
-EXPORT_SYMBOL_NS(max_98373_spk_codec_init, SND_SOC_INTEL_SOF_MAXIM_COMMON);
 
 void max_98373_dai_link(struct device *dev, struct snd_soc_dai_link *link)
 {
diff --git a/sound/soc/intel/boards/sof_maxim_common.h b/sound/soc/intel/boards/sof_maxim_common.h
index 2d8257cc5229..3d34c7dae6f5 100644
--- a/sound/soc/intel/boards/sof_maxim_common.h
+++ b/sound/soc/intel/boards/sof_maxim_common.h
@@ -20,14 +20,8 @@
 #define MAX_98373_DEV0_NAME	"i2c-" MAX_98373_ACPI_HID ":00"
 #define MAX_98373_DEV1_NAME	"i2c-" MAX_98373_ACPI_HID ":01"
 
-extern struct snd_soc_dai_link_component max_98373_components[2];
-extern struct snd_soc_ops max_98373_ops;
-extern const struct snd_soc_dapm_route max_98373_dapm_routes[];
-
-int max_98373_spk_codec_init(struct snd_soc_pcm_runtime *rtd);
 void max_98373_dai_link(struct device *dev, struct snd_soc_dai_link *link);
 void max_98373_set_codec_conf(struct snd_soc_card *card);
-int max_98373_trigger(struct snd_pcm_substream *substream, int cmd);
 
 /*
  * Maxim MAX98390
-- 
2.40.1

