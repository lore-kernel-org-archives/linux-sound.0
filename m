Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BBE524C
	for <linux-sound@vger.kernel.org>; Mon, 28 Oct 2024 07:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730100403; cv=none; b=Rvl1wp0+6KvGFNYI0T7bmdh5sMNfgJSB6vAqHNyvLgw++jdnH5ZJMPx26hfn5o/05GxeVdxRhW3ZOPODjWBwO3lY0rB1xo5HeCINiSeoyW15L6Eco7w5o4XK8gVsLk89j7xhz9l3wC5KEDMyt7AjZn0kweo8nyS00AHxg6XZZDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730100403; c=relaxed/simple;
	bh=ePH03o+NpbhX9YGcM2QEtJHU+L4LR83LYspOT2sL5yY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HcYIiVXPwwzVJ2n2bXWnWqCQjrTp4jpu7cgZVOqL9SyvFKQMzeaTejOSsPI6nrsde0/DaaiqtmJWYHwNiPQ6hDIHsqIM6Q7broFilasi3vZKrf/m8ju6dRkzoVNK/Zv0v4JTEDb0IxETj+F9JXF4hU3kSWb8IKMELM/IcZlDhH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RhYNKD8Z; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RhYNKD8Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730100402; x=1761636402;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ePH03o+NpbhX9YGcM2QEtJHU+L4LR83LYspOT2sL5yY=;
  b=RhYNKD8ZLQU7o/q82PJ+rXO1fPfhkK3h+l9WeXahdfE201mWmTqfGZhF
   NTLa6yudY1iz2o0CdpEdU8/0FpykKKk+5pg7ZGoV4PTRAUTsXKzCW4kwZ
   ohB7D2dCkMiQgbJ7ZeudYc3tlD9ZtG9cgc2/Ib/ceBD3eglA2sI8BbFgA
   NdkjqAMP1cdTxU4A8gTi1n0PmzwYyEsgVP4xeGALnWIKdJ/tps4NcMDf8
   +KUxIOKJr+dDSvqf+E5zzrC+qu6aa50ozTwyC/hcaylZ/gvLWErxdglwZ
   +7ntCBkJRmydvIR1vjKv4pJLYhrnwEYPdBwtoEqeigH2wCdCJ2mKE+3Pc
   Q==;
X-CSE-ConnectionGUID: kBW+4k+DRLWfiK9zQ/U/aQ==
X-CSE-MsgGUID: 2e2OVsddRNuwHSJalVnxRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="47145527"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="47145527"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 00:26:41 -0700
X-CSE-ConnectionGUID: i38RYHI3TPGxu/jks+AKSg==
X-CSE-MsgGUID: kCZnXZ2hRF+fQLKv1gIirQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,238,1725346800"; 
   d="scan'208";a="81975572"
Received: from mdroper-mobl2.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.222.159])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 00:26:40 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 1/3] ASoC: sdw_utils: Add quirk to exclude amplifier function
Date: Mon, 28 Oct 2024 15:26:29 +0800
Message-ID: <20241028072631.15536-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028072631.15536-1-yung-chuan.liao@linux.intel.com>
References: <20241028072631.15536-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mac Chiang <mac.chiang@intel.com>

When SKUs use the multi-function codec, which integrates
Headset, Amplifier and DMIC. The corresponding quirks provide
options to support internal amplifier/DMIC or not.

In the case of RT722, this SKU excludes the internal amplifier and
use an additional amplifier instead.

Signed-off-by: Mac Chiang <mac.chiang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sdw_utils/soc_sdw_utils.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index 8196177ff5e7..6610efe8af18 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -418,6 +418,8 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 				.num_controls = ARRAY_SIZE(generic_spk_controls),
 				.widgets = generic_spk_widgets,
 				.num_widgets = ARRAY_SIZE(generic_spk_widgets),
+				.quirk = SOC_SDW_CODEC_SPKR,
+				.quirk_exclude = true,
 			},
 			{
 				.direction = {false, true},
-- 
2.43.0

