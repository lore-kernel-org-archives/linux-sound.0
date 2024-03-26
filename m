Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C3A13C908
	for <linux-sound@vger.kernel.org>; Tue, 26 Mar 2024 16:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711469134; cv=none; b=QV53aUF4wBgIEMYzGCH9tp9JXskE3+EXTRPZlArJQjHMMeKjShZUKAR4QsKKK+UnjaKA7Bc2QKcmLp/3FOKtpAhjE+p/lwkUD0xSKWEtmqXPAwrn6M2TcfLW8Kal5zNerBVjvM9mfo7rPCxy97cjH6nJ/6RRCfQsGkmjwDbNYZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711469134; c=relaxed/simple;
	bh=dKIIrBR+5IlIW8PfUvHWuroIi9TvHZfaA9fL/TlXcjE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KwcDQrg6I7EZLZVJWB+Q+4cd7SIWc4L2DztWRrr0eobwEPPZFd880DLJcMu4uifSrrosT0zTauAaLDRVtYqt1uQEGTuifY5NttLeKwnU5R3CSim8OqfJr1wpnJyQ7tNyJGGBWVasY6uupBWP7RPMSiNZwMV12yVdVfC3oNSqoHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cZjvc1lP; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cZjvc1lP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711469133; x=1743005133;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dKIIrBR+5IlIW8PfUvHWuroIi9TvHZfaA9fL/TlXcjE=;
  b=cZjvc1lP7sdEyHaZmuWrBuKvEnNlYL+AMRkU600CLjgtBrPDYtGJXJ22
   fvDozWjYIBm5zr0Y0Tj1LvDX0lCVq2BYkARUGKDnxPOg77ZCf21/atMLd
   ++U2s3zhZxWFxwc0Gqve19zQpvn4+1ersFZfU+aTWRk8wOrJq1kR6q8oj
   eh7dP6D53+hBxzOTc8tC+fGAe8/jEagI1otPDiEXsr4V2NOzjAcdYNPJl
   5drfUQst32kV7oz/foOtcZ60djfiaCozI6ABm/Z9JU2IU13fK5PAiQWNn
   3hkzNojEyf0M8waOMz6JhkuD9vU2r1pGfI4TxY45Tbk9MGe82v2062xP4
   Q==;
X-CSE-ConnectionGUID: fpZIO6jMQUiE1+Tb5L3OXw==
X-CSE-MsgGUID: QPBOY1G2SG+GLwBGwg+zYg==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17260419"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="17260419"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:04:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="20482244"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.65.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:04:51 -0700
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
Subject: [PATCH 14/34] ASoC: Intel: sof_sdw: Factor out codec name generation
Date: Tue, 26 Mar 2024 11:04:09 -0500
Message-Id: <20240326160429.13560-15-pierre-louis.bossart@linux.intel.com>
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

In preparation for future refactoring pull out a helper specifically for
generating the codec name.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 47 ++++++++++++++++++--------------
 1 file changed, 27 insertions(+), 20 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 6e2e934e1246..1253a2dc33d2 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1283,12 +1283,37 @@ static bool is_unique_device(const struct snd_soc_acpi_link_adr *adr_link,
 	return true;
 }
 
+static const char *get_codec_name(struct device *dev,
+				  const struct sof_sdw_codec_info *codec_info,
+				  const struct snd_soc_acpi_link_adr *adr_link,
+				  int adr_index)
+{
+	u64 adr = adr_link->adr_d[adr_index].adr;
+	unsigned int sdw_version = SDW_VERSION(adr);
+	unsigned int link_id = SDW_DISCO_LINK_ID(adr);
+	unsigned int unique_id = SDW_UNIQUE_ID(adr);
+	unsigned int mfg_id = SDW_MFG_ID(adr);
+	unsigned int part_id = SDW_PART_ID(adr);
+	unsigned int class_id = SDW_CLASS_ID(adr);
+
+	if (codec_info->codec_name)
+		return devm_kstrdup(dev, codec_info->codec_name, GFP_KERNEL);
+	else if (is_unique_device(adr_link, sdw_version, mfg_id, part_id,
+				  class_id, adr_index))
+		return devm_kasprintf(dev, GFP_KERNEL, "sdw:0:%01x:%04x:%04x:%02x",
+				      link_id, mfg_id, part_id, class_id);
+	else
+		return devm_kasprintf(dev, GFP_KERNEL, "sdw:0:%01x:%04x:%04x:%02x:%01x",
+				      link_id, mfg_id, part_id, class_id, unique_id);
+
+	return NULL;
+}
+
 static int fill_sdw_codec_dlc(struct device *dev,
 			      const struct snd_soc_acpi_link_adr *adr_link,
 			      struct snd_soc_dai_link_component *codec,
 			      int adr_index, int dai_index)
 {
-	unsigned int sdw_version, unique_id, mfg_id, link_id, part_id, class_id;
 	u64 adr = adr_link->adr_d[adr_index].adr;
 	struct sof_sdw_codec_info *codec_info;
 
@@ -1296,25 +1321,7 @@ static int fill_sdw_codec_dlc(struct device *dev,
 	if (!codec_info)
 		return -EINVAL;
 
-	sdw_version = SDW_VERSION(adr);
-	link_id = SDW_DISCO_LINK_ID(adr);
-	unique_id = SDW_UNIQUE_ID(adr);
-	mfg_id = SDW_MFG_ID(adr);
-	part_id = SDW_PART_ID(adr);
-	class_id = SDW_CLASS_ID(adr);
-
-	if (codec_info->codec_name)
-		codec->name = devm_kstrdup(dev, codec_info->codec_name, GFP_KERNEL);
-	else if (is_unique_device(adr_link, sdw_version, mfg_id, part_id,
-				  class_id, adr_index))
-		codec->name = devm_kasprintf(dev, GFP_KERNEL,
-					     "sdw:0:%01x:%04x:%04x:%02x", link_id,
-					     mfg_id, part_id, class_id);
-	else
-		codec->name = devm_kasprintf(dev, GFP_KERNEL,
-					     "sdw:0:%01x:%04x:%04x:%02x:%01x", link_id,
-					     mfg_id, part_id, class_id, unique_id);
-
+	codec->name = get_codec_name(dev, codec_info, adr_link, adr_index);
 	if (!codec->name)
 		return -ENOMEM;
 
-- 
2.40.1

