Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC5B13C9A2
	for <linux-sound@vger.kernel.org>; Tue, 26 Mar 2024 16:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711469145; cv=none; b=JhXQzO7z2pYBx1a/hUYfF7H85Fne60zxJ0vQEmqbkmqDNzpGqGmsjjQ2qXL36H0OdOxu+ZkjKm5Bxdkt1PwVL+LCE1+4Zb8r9/7CjVvkccXoVkvyF/tSEJ+582sSef4llbQ3S1xl/pxPhxOBhkljB1SauQSnRce9WuncecEHvB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711469145; c=relaxed/simple;
	bh=ZgXWLJa803Tcz4lHMH5IzQhQvBYtscxSaM1zxM0uUrc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=vAxuC/3fiVeC59U0yMtKwaii8tPaWJ7LogoHKMGGyFoL819zuVsaKBANQu84hhJYN4f3Rfi/h00WeebfDNgy8XRmTlN92Tfr7mLKnfdLJglgHAR0l95YHqaQSiPnfkojLW/T8BrzXzVVp/pdU8MfEaXsy+vuwfwSJJI1q5dxBTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Af+zl8RV; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Af+zl8RV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711469142; x=1743005142;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZgXWLJa803Tcz4lHMH5IzQhQvBYtscxSaM1zxM0uUrc=;
  b=Af+zl8RVSzYM1V/06q7ZznC5+puGrZrN2xwHBVwruJg0odSfn4KvFHVm
   Yu2gcJZelTHFExZbRSP27bhHzZMVFe/VV4IHpk/RQhDuyuZmqej0GBM9k
   T3nB95zt8Po1UJKfIIGLzHGqkfUtUnv3upzRMAysXXVpSeozrt75tqeP5
   yHJ9FojKZuRFN3GpJQLqZyEkjN5lYBV3WNC3MuFGI2E6glkAQhTmSGO/E
   QFjZkSVUYnC7PU/QuC9lOwuJ2J6n5BHZuaJQmKDIbzZzv2o057Z6cUsAe
   Nhtx6mFC3liFZGpsRZCVjO7ZgUDce/3EvhvlbGh/BuI1uN2irm+eaDq7B
   A==;
X-CSE-ConnectionGUID: tzfmpBwrS9uxwRkK/FOljQ==
X-CSE-MsgGUID: ERy7K+JlSRCKT0al8pIV3A==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17260574"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="17260574"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:05:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="20482510"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.65.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:05:06 -0700
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
Subject: [PATCH 33/34] ASoC: Intel: sof_sdw: Add quirk for optional codec speakers
Date: Tue, 26 Mar 2024 11:04:28 -0500
Message-Id: <20240326160429.13560-34-pierre-louis.bossart@linux.intel.com>
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

Some codecs have speaker drivers that may or may not be used in a
given system. Add a quirk (SOF_CODEC_SPKR) that defines if a system
uses the codec speaker, this is kept generic such that any codec
with such a speaker DAI can reuse the quirk.

For implementation of this, add a quirk field into the
sof_sdw_dai_info structure. This field is not used to specify
if a system uses a particular quirk, that is still done through
the sof_sdw_quirk variable, this field is used to flag a DAI as
conditional on a certain quirk. This means the DAI will only be
included in the card if sof_sdw_quirk and the DAI quirk field have
a matching set bit.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c        | 5 +++++
 sound/soc/intel/boards/sof_sdw_common.h | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 5a7014d82d6c..4fc15f597e28 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -37,6 +37,8 @@ static void log_quirks(struct device *dev)
 			SOF_SSP_GET_PORT(sof_sdw_quirk));
 	if (sof_sdw_quirk & SOF_SDW_NO_AGGREGATION)
 		dev_err(dev, "quirk SOF_SDW_NO_AGGREGATION enabled but no longer supported\n");
+	if (sof_sdw_quirk & SOF_CODEC_SPKR)
+		dev_dbg(dev, "quirk SOF_CODEC_SPKR enabled\n");
 }
 
 static int sof_sdw_quirk_cb(const struct dmi_system_id *id)
@@ -1382,6 +1384,9 @@ static int parse_sdw_endpoints(struct snd_soc_card *card,
 				dai_info = &codec_info->dais[adr_end->num];
 				sof_dai = find_dailink(sof_dais, adr_end);
 
+				if (dai_info->quirk && !(dai_info->quirk & sof_sdw_quirk))
+					continue;
+
 				dev_dbg(dev,
 					"Add dev: %d, 0x%llx end: %d, %s, %c/%c to %s: %d\n",
 					ffs(adr_link->mask) - 1, adr_dev->adr,
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index 8d8c2ca68a7f..81181627b406 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -52,6 +52,8 @@ enum {
 #define SOF_SSP_GET_PORT(quirk)	(((quirk) >> 7) & GENMASK(5, 0))
 /* Deprecated and no longer supported by the code */
 #define SOF_SDW_NO_AGGREGATION		BIT(14)
+/* If a CODEC has an optional speaker output, this quirk will enable it */
+#define SOF_CODEC_SPKR			BIT(15)
 
 /* BT audio offload: reserve 3 bits for future */
 #define SOF_BT_OFFLOAD_SSP_SHIFT	15
@@ -80,6 +82,7 @@ struct sof_sdw_dai_info {
 	int (*exit)(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link);
 	int (*rtd_init)(struct snd_soc_pcm_runtime *rtd);
 	bool rtd_init_done; /* Indicate that the rtd_init callback is done */
+	unsigned long quirk;
 };
 
 struct sof_sdw_codec_info {
-- 
2.40.1

