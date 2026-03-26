Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D3338E5CE
	for <linux-sound@vger.kernel.org>; Thu, 26 Mar 2026 07:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774511598; cv=none; b=ZFZibzmwZjsJ4NurnjjBC/ww/NZPgpsr+ga/82tPnv/StRGf56Iar2aiiZ8QhT6Xejl1cJc58hNvWSv3PnbT9akF34d/E3+RuZRzWIfjTZEePLn19PX9ppCpS1fRK3dwNjrIWCk6QG2/rTV1SZzCdNZuHY+y6TaYqEMBrF5awhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774511598; c=relaxed/simple;
	bh=g+jvkdf3LLsJ9KPMQZmoU6u4fDgqT0pq8qFsfecN7ag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dqWsIdULm/t81CC2mcvUbfH4fQB+99h8N27SAVE04XCTQF5RftAwuUmAT4v5sRM0/6Cg2DnUFvDfRjCCj8xch6AJYccoeeiwPZ/66t2UQMSLRHF0Bp3NfkeCG2wG0yDmiJ+nge/2LNcDYa7pij5jHPt23WxreKGe01hS1n5sa7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VzMvgd0b; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VzMvgd0b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774511598; x=1806047598;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=g+jvkdf3LLsJ9KPMQZmoU6u4fDgqT0pq8qFsfecN7ag=;
  b=VzMvgd0bQYA7io9FeVfMO/XIfX6e5jLjk51SKdiP0lZ6YG8t7xkHKfDQ
   2PyNafEPf0ZzRfMiK9TtyvZW1cWxMZxSR+Q2tzTz4Xt0WzG46Zi9Irmjr
   j+wagc1lE7eHG1YUDn3nzAz/3Lp5bp0Q1DS0EEdcRABkkS/NDMu2p1wwv
   oISGcsRtOQry3fcLlXqK3jzqzuA7aDWqVg5dbzCQywXzK1Rq8PBRZoCd9
   dnfcz39TF5HEtweGkXfuKSjVs9vg6yUT8Ihzbew9jjBxu2sYtlmyaL6ut
   X/KDn+eM0w84CnDcKL0jGpEiSKa0iY7ZBNLPse223vk7VY+R6RrHpyOaW
   g==;
X-CSE-ConnectionGUID: Rv5BKXn8SB2vxgjY9N8ovA==
X-CSE-MsgGUID: 8ElSwfCVS4ahu7V11JLyag==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="78157949"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="78157949"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 00:53:16 -0700
X-CSE-ConnectionGUID: Qfx50fXMT32sZ+75IAmBEw==
X-CSE-MsgGUID: GxrOcKq6SgCXMxo+5QewOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="220084920"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 00:53:14 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com,
	flove@realtek.com,
	derek.fang@realtek.com
Subject: [PATCH 2/3] ASoC: SOF: Intel: Add a is_amp flag to fix the wrong name prefix
Date: Thu, 26 Mar 2026 15:53:01 +0800
Message-ID: <20260326075303.1083567-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326075303.1083567-1-yung-chuan.liao@linux.intel.com>
References: <20260326075303.1083567-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Derek Fang <derek.fang@realtek.com>

According to the Intel sof design, it will create the name prefix
appended with amp index for the amp codec only, such as:
rt1318-1, rt1318-2, etc...

But the rt1320 is a codec with amp and mic codec functions, it doesn't
have the amp index in its name prefix as above.
And then it will be hard to identify the codec if in multi-rt1320 case.
So we add a flag to force the amp index to be appended.

Signed-off-by: Derek Fang <derek.fang@realtek.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 include/sound/soc_sdw_utils.h |  2 ++
 sound/soc/sof/intel/hda.c     | 10 ++++++++++
 2 files changed, 12 insertions(+)

diff --git a/include/sound/soc_sdw_utils.h b/include/sound/soc_sdw_utils.h
index 48f516ba682f..489083183673 100644
--- a/include/sound/soc_sdw_utils.h
+++ b/include/sound/soc_sdw_utils.h
@@ -83,6 +83,8 @@ struct asoc_sdw_codec_info {
 	const int dai_num;
 	struct asoc_sdw_aux_info auxs[SOC_SDW_MAX_AUX_NUM];
 	const int aux_num;
+	/* Force AMP-style name_prefix handling (append AMP index) even if MIC/Jack DAIs exist */
+	const bool is_amp;
 
 	int (*codec_card_late_probe)(struct snd_soc_card *card);
 
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 9ec33147d9af..edb80c2fa770 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1232,6 +1232,16 @@ static struct snd_soc_acpi_adr_device *find_acpi_adr_device(struct device *dev,
 		return NULL;
 	}
 
+	/*
+	 * codec_info_list[].is_amp is a codec-level override: for multi-function
+	 * codecs we must treat the whole codec as an AMP when it is described as
+	 * such in the codec info table, even if some endpoints were detected as
+	 * non-AMP above. Callers/UCM rely on this to keep name_prefix and AMP
+	 * indexing stable and backwards compatible.
+	 */
+	if (codec_info_list[i].is_amp)
+		is_amp = true;
+
 	adr_dev[index].adr = ((u64)sdw_device->id.class_id & 0xFF) |
 			((u64)sdw_device->id.part_id & 0xFFFF) << 8 |
 			((u64)sdw_device->id.mfg_id & 0xFFFF) << 24 |
-- 
2.43.0

