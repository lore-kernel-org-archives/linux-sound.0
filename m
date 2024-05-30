Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F792176FB3
	for <linux-sound@vger.kernel.org>; Thu, 30 May 2024 11:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717067943; cv=none; b=YNhuynBjkL5dtr5Yr3COxx8CyVFSrA/o45Nr1uIxRikM9R2BYTZJyeb3LlQv8+VUUPtlUrG7WqKDpyKEyyeSCbyV+crCF+XhZKoIyPVmfApRjJ5dCKrpnjo9JRsUCR5O/9vh2q9nvuRsG89wk/iQJVZh3XPYN/q8YjmuzHXVmWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717067943; c=relaxed/simple;
	bh=Y3Fmq1pYZTev3EpIfS1eL1XQJ+89sMgywbfv94qEeiM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cCjaMgINjqhq9vhlxa2QM057v2P4YrG0sZZ/9m2mtxP3GiXUH9vdv7KwmVoePXUOCUkevyKq4ZZJTJIw/6DVMlVqD/eh3Dn09j+WhHzvgRrZEnikHBAtpM55YhUkQVg1+LAiURkr3k8HjGvII2DBG+Hf6P42Uetjqz1bnx1+1Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WtueYcWa; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WtueYcWa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717067942; x=1748603942;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Y3Fmq1pYZTev3EpIfS1eL1XQJ+89sMgywbfv94qEeiM=;
  b=WtueYcWaVxDDAxV0kOiirbt/IXmNFtCByHWd6lWB2W9A+2DXT0mHhwro
   SUEbOkvh3H3RkkSm3cwdLw03j72+tv3WNjvyUyC2GEFlyjYaIFeQaZSQ8
   itX4hD9H6pCQvYBY6PLWJY51ZHygz6THvFW2j7XgH2U82+S4COifSQUiC
   b2VSkxtiSNkEWclthl4rEKcxRcjv81RFG23AhYdoWVot/8Abj1lprpQRb
   GB9JDrTDWhlxTmd2WDD98MWT85rmlbCFypv/B3IJPSk9Kdt/905bg226X
   kdC2CtUCRWGg+hR5CQWajxruWmY07YHWvj6SwLLAWYivUrJcXHd0JZIB+
   A==;
X-CSE-ConnectionGUID: xB8w0PNdR9ScitBt9VCHFQ==
X-CSE-MsgGUID: klZaQY+IRo+dbULHumWmgA==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="31065196"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; 
   d="scan'208";a="31065196"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 04:19:01 -0700
X-CSE-ConnectionGUID: bdpmFeO+RFGa5nc6koKJSw==
X-CSE-MsgGUID: O3lhAtf9QTKlbEBI0yBA4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; 
   d="scan'208";a="73258712"
Received: from unknown (HELO pujfalus-desk.intel.com) ([10.124.223.207])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 04:18:59 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	seppo.ingalsuo@linux.intel.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 6.10 2/5] ASoC: SOF: ipc4-topology: Print out the channel count in sof_ipc4_dbg_audio_format
Date: Thu, 30 May 2024 14:19:15 +0300
Message-ID: <20240530111918.21974-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240530111918.21974-1-peter.ujfalusi@linux.intel.com>
References: <20240530111918.21974-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Print out the number of channels for the format explicitly instead of
having the reader to understand how to interpret the ch_map and ch_cfg
values.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index d653e39ee3ac..b47370b2f503 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -195,9 +195,10 @@ static void sof_ipc4_dbg_audio_format(struct device *dev, struct sof_ipc4_pin_fo
 	for (i = 0; i < num_formats; i++) {
 		struct sof_ipc4_audio_format *fmt = &pin_fmt[i].audio_fmt;
 		dev_dbg(dev,
-			"Pin index #%d: %uHz, %ubit (ch_map %#x ch_cfg %u interleaving_style %u fmt_cfg %#x) buffer size %d\n",
-			pin_fmt[i].pin_index, fmt->sampling_frequency, fmt->bit_depth, fmt->ch_map,
-			fmt->ch_cfg, fmt->interleaving_style, fmt->fmt_cfg,
+			"Pin index #%d: %uHz, %ubit, %luch (ch_map %#x ch_cfg %u interleaving_style %u fmt_cfg %#x) buffer size %d\n",
+			pin_fmt[i].pin_index, fmt->sampling_frequency, fmt->bit_depth,
+			SOF_IPC4_AUDIO_FORMAT_CFG_CHANNELS_COUNT(fmt->fmt_cfg),
+			fmt->ch_map, fmt->ch_cfg, fmt->interleaving_style, fmt->fmt_cfg,
 			pin_fmt[i].buffer_size);
 	}
 }
-- 
2.45.1

