Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700F621E3C2
	for <linux-sound@vger.kernel.org>; Wed, 16 Oct 2024 03:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729047839; cv=none; b=RDbXu2Tpt6M0Msbd1xLCdYxSw/C00d8SYHbxdHDd3fsLW+kKpBEsNR2mGCCsN+RDDFATMwkI0HqVBs05aHKBLcEGAt3d1jIxDKS1+zIie16K/kwd/b0q4IInZDPCYD/aFVfq4lg1urGvc+8Rt1HAl7GVwO54DhTSwBrAhtNjYnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729047839; c=relaxed/simple;
	bh=1uyd59oi/v0GnUCGO4ACvxD2/aegFyaIbYPOrqcjal0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sARTnuptMOfj8+R8VdzNcITjjtq+iCsFEZcBbISMnrFXp+jND2xxE5BA+dB8wOPJIfgHytAIM5QbTstUlUi7COM2+bKUvtsRfK1O2WJUO+yuJ/RNVCc56fQ0a6c7/+QYxuaWXbeNfPg0kwABpWRShd6qprE7inyl8aM7ZcmjHZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oEenz/p0; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oEenz/p0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729047839; x=1760583839;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1uyd59oi/v0GnUCGO4ACvxD2/aegFyaIbYPOrqcjal0=;
  b=oEenz/p0xL6Fo15w863RDAhFVEkhkPG8KekHKHdb6EFDR+XjOid7AOJZ
   0Dmfoea33253tQC2wG8qCxV79tdt1X07ksAEPqi1u25c+QQEVTzcyD8im
   CRvMosLu7MHTmYNhMtQMgSqzK9YDLoM63KdDwW+B1WKP+zeXuDfZS1qOQ
   2AWXzWtpuo+ky2OuFsdUsryk4vu2Q30jHdIWXPhrZrgwrwd+M0eI1TfvJ
   bwZi9kIbvCFLEKFHQWQL5Je1L9FllWbFOGQF6Zp8B3EM49tX7rxNxPmbD
   v8lTbXgBhYtTMMOmNXg8nZ2JrYLXoQEKGzyKdlwHm0Bb5zIrFhjoH2EGb
   A==;
X-CSE-ConnectionGUID: YqRSQJH/RaSkZ3EhFCQCnA==
X-CSE-MsgGUID: 6kJPCUA6T6qSIelHw+481w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28265527"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28265527"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 20:03:59 -0700
X-CSE-ConnectionGUID: 5wJQRkOLTq2ASO6Z3iHBaw==
X-CSE-MsgGUID: R73Hrc35Qu+oE5NquynzCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; 
   d="scan'208";a="77979231"
Received: from cvapit-mobl1.ger.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.118.236])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 20:03:56 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 1/4] ASoC: sdw_utils: Add support for exclusion DAI quirks
Date: Wed, 16 Oct 2024 11:03:41 +0800
Message-ID: <20241016030344.13535-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241016030344.13535-1-yung-chuan.liao@linux.intel.com>
References: <20241016030344.13535-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Charles Keepax <ckeepax@opensource.cirrus.com>

The system contains a mechanism for certain DAI links to be included
based on a quirk. Add support for certain DAI links to excluded based on
a quirk, this is useful in situations where the vast majority of SKUs
utilise a feature so it is easier to quirk on those that don't.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 include/sound/soc_sdw_utils.h       | 1 +
 sound/soc/sdw_utils/soc_sdw_utils.c | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/sound/soc_sdw_utils.h b/include/sound/soc_sdw_utils.h
index 2374e6df4e58..e16fccd48e6b 100644
--- a/include/sound/soc_sdw_utils.h
+++ b/include/sound/soc_sdw_utils.h
@@ -59,6 +59,7 @@ struct asoc_sdw_dai_info {
 	int (*rtd_init)(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 	bool rtd_init_done; /* Indicate that the rtd_init callback is done */
 	unsigned long quirk;
+	bool quirk_exclude;
 };
 
 struct asoc_sdw_codec_info {
diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index a9323cb444d0..f86d55cdaaf6 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -1153,7 +1153,8 @@ int asoc_sdw_parse_sdw_endpoints(struct snd_soc_card *card,
 				dai_info = &codec_info->dais[adr_end->num];
 				soc_dai = asoc_sdw_find_dailink(soc_dais, adr_end);
 
-				if (dai_info->quirk && !(dai_info->quirk & ctx->mc_quirk))
+				if (dai_info->quirk &&
+				    !(dai_info->quirk_exclude ^ !!(dai_info->quirk & ctx->mc_quirk)))
 					continue;
 
 				dev_dbg(dev,
-- 
2.43.0

