Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D5D14900B
	for <linux-sound@vger.kernel.org>; Fri, 26 Apr 2024 15:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714144904; cv=none; b=bpeZ2CDvkg3XTJv3hzMx8TSBSALN4XvPLMwMDzwUjag9r8kwyvzjwnb2pLUGDdSitmwgVHNK4tYuBxuPhHVXyXS6jMiqo6gJBu/enXCX4cIm2ctuLl+xbG/Uxzuc56evuTVbw5m17zza0VyGyfDjn0ISI3Z8sxIv08dFDVBDYfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714144904; c=relaxed/simple;
	bh=PEhn8HQcSVd6mSeWV30RYAJSQWq9dxPGiCp9O1JeE+o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aFWTKObwcFql7/3kORuoxtvRhWzRDCQuqWQ2L/DxKaetg9cOVi2AVXzshv2C7gtBVIlI/Lq974SSzzChwSfhjDvdz31R4aIDO49e7sJrdmi3x8Knt04DR6xk6yIzUjDHqzQIuNkOh4FsxFh8/L2Nn5yvROkJIQWFmAlpI3Y0Kt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PttWn9uO; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PttWn9uO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714144903; x=1745680903;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PEhn8HQcSVd6mSeWV30RYAJSQWq9dxPGiCp9O1JeE+o=;
  b=PttWn9uOWe6yvX1eRokD3bmzBibmy+WZdTZ3/c56sAKZyxgt+MvS66G0
   YHgcCoxslKvshfSACQdWAI85S3oSFjOSTVFeQP3dKuSCEr0FrmYfP8vby
   eCt8+YyVu5LpcXLVzq7aa2GECO+qDgpKqAgO8ZpD6sI+WwNAq71abfBS+
   Lf6qz0NiSj2PYewITjWHxb+7WHdVkwQq2hbQ4tcvQx2tU8F3sb8YB33Ra
   LfJbM3n1cP0AuWZVIb+viebMinTAkWad3ue7m2xoZ+WPvE6oBwoUv5EpD
   RAfhJcvErDKmoZYXkou9wz2TdMnGWycp8+R46CAQH1lHW+T3ZeCS4wzzA
   w==;
X-CSE-ConnectionGUID: K7KAA13QQJC8CcdX18lV7w==
X-CSE-MsgGUID: grq6o48YT76WemIw7TOjOw==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21290618"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="21290618"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:21:43 -0700
X-CSE-ConnectionGUID: 6HKKzj6bTdWsV+vqO8bB8Q==
X-CSE-MsgGUID: zEUUyN3TTdKBKXE+HfltGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="30259031"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:21:42 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 06/12] ASoC: Intel: sof_sdw: Allocate snd_soc_card dynamically
Date: Fri, 26 Apr 2024 10:21:17 -0500
Message-Id: <20240426152123.36284-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240426152123.36284-1-pierre-louis.bossart@linux.intel.com>
References: <20240426152123.36284-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

The static card_sof_sdw struct is modified during runtime and in case the
module is not removed, but the card is, then the next time the card is
created the card_sof_sdw will contain information from the previous card
which might lead to hard to debug issues, side effects.

Move the snd_soc_card into mc_private and use that to make sure that the
card is initialized correctly.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c        | 20 +++++++++-----------
 sound/soc/intel/boards/sof_sdw_common.h |  1 +
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index d65c5da49000..384c3d41a9ad 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1882,12 +1882,6 @@ static int sof_sdw_card_late_probe(struct snd_soc_card *card)
 /* SoC card */
 static const char sdw_card_long_name[] = "Intel Soundwire SOF";
 
-static struct snd_soc_card card_sof_sdw = {
-	.name = "soundwire",
-	.owner = THIS_MODULE,
-	.late_probe = sof_sdw_card_late_probe,
-};
-
 /* helper to get the link that the codec DAI is used */
 static struct snd_soc_dai_link *mc_find_codec_dai_used(struct snd_soc_card *card,
 						       const char *dai_name)
@@ -1939,20 +1933,24 @@ static void mc_dailink_exit_loop(struct snd_soc_card *card)
 
 static int mc_probe(struct platform_device *pdev)
 {
-	struct snd_soc_card *card = &card_sof_sdw;
 	struct snd_soc_acpi_mach *mach = dev_get_platdata(&pdev->dev);
+	struct snd_soc_card *card;
 	struct mc_private *ctx;
 	int amp_num = 0, i;
 	int ret;
 
-	card->dev = &pdev->dev;
+	dev_dbg(&pdev->dev, "Entry\n");
 
-	dev_dbg(card->dev, "Entry\n");
-
-	ctx = devm_kzalloc(card->dev, sizeof(*ctx), GFP_KERNEL);
+	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
 		return -ENOMEM;
 
+	card = &ctx->card;
+	card->dev = &pdev->dev;
+	card->name = "soundwire",
+	card->owner = THIS_MODULE,
+	card->late_probe = sof_sdw_card_late_probe,
+
 	snd_soc_card_set_drvdata(card, ctx);
 
 	dmi_check_system(sof_sdw_quirk_table);
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index 89253938ebaa..853278c6e525 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -101,6 +101,7 @@ struct sof_sdw_codec_info {
 };
 
 struct mc_private {
+	struct snd_soc_card card;
 	struct snd_soc_jack sdw_headset;
 	struct sof_hdmi_private hdmi;
 	struct device *headset_codec_dev; /* only one headset per card */
-- 
2.40.1

