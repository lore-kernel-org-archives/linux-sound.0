Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3429512FB27
	for <linux-sound@vger.kernel.org>; Tue,  2 Apr 2024 15:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712071123; cv=none; b=mydcdm8Nalnrf6qKcRN+bvqx9Gab9Z3q+wjLOVFnpVyjoo0BfxO6nEZKh/LS9/CxS//zkAQC1Bj85ym5DcY/L1d3HQ0IbHPq40zz8oW6WoO9YLcRlWhVR4iCf/AuJyXUd7C7HzG+GQDiHFCK3h65Y+9K9GQGkrNAtw4vXXfrsKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712071123; c=relaxed/simple;
	bh=UwtYxBJyt3wQGzqEI4KWrGa53H0S9tKuqrOmRnTF6Sc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PlmXNFf0OfrIkRYwbZ3v3jkdjrlNXC5eOtcNC3FBnbugL753RQQUUyt2qn1ZoOv3eXy9I9IfV3HQHiJ5jo8o+qO/wsHXmZ6BiXQuDpsB3TmBWK56Xiuq3gkMlvEMmDp+mXUiwcaDMOEOBfQYMD3xZN5DnLl5kdJHRuXOKnyYcYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W0V7sX54; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W0V7sX54"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712071123; x=1743607123;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UwtYxBJyt3wQGzqEI4KWrGa53H0S9tKuqrOmRnTF6Sc=;
  b=W0V7sX54gMcWfW9Loqac+PsJhefi8CB+hJEXzdko9g0+HSJS2nO6iCye
   8zbg2L4vRk7hDbP87WJBD64LZt0mX3nJra9HfwCyjKwsfb1XMs6qi60zs
   WlDVNJ1ygdJoX/8A5OS19zYNwvRhAy6kp/lXuJ8QILocgXsPIL9X6fO7M
   NHWrp4gUa9Q+eNjcxBRE946mDWnSJaXClPuqUhJiXOtte+1OdeRjnzMRQ
   hlHuyTJ/jex4YqJr3gGnDBQnuYxt5/SWD6MYShxn64eUoQ+7t99HC81ka
   PJGHEow9JhPPylldviNKLYk2pKUzuWV5xCdvkgPJpSMDnn/NUFh1rV5dj
   A==;
X-CSE-ConnectionGUID: F43pAksITK6Tw29rf4DFZQ==
X-CSE-MsgGUID: m4C/eCgsRP+XBC/1epmH0Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="29730018"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="29730018"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 08:18:42 -0700
X-CSE-ConnectionGUID: zPRIZFbSSLWQAvUAgJ8+mQ==
X-CSE-MsgGUID: BHW7BdmLR7aSh/HeLSBHFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="22796510"
Received: from skhare-mobl5.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.8.83])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 08:18:41 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 08/17] ASoC: SOF: Intel: set the DMA TLV device as dai_index
Date: Tue,  2 Apr 2024 10:18:19 -0500
Message-Id: <20240402151828.175002-9-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240402151828.175002-1-pierre-louis.bossart@linux.intel.com>
References: <20240402151828.175002-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We've already defined the value for dai_index, let's use it instead of
open-coding the same thing. No functionality change.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index c48ac931753c..86efcbe8f0d8 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -533,7 +533,7 @@ int sdw_hda_dai_hw_params(struct snd_pcm_substream *substream,
 	ipc4_copier = widget_to_copier(w);
 	dma_config_tlv = &ipc4_copier->dma_config_tlv[cpu_dai_id];
 	dma_config = &dma_config_tlv->dma_config;
-	dma_config->dma_stream_channel_map.mapping[0].device = link_id << 8 | cpu_dai->id;
+	dma_config->dma_stream_channel_map.mapping[0].device = data.dai_index;
 	dma_config->dma_stream_channel_map.mapping[0].channel_mask = ch_mask;
 
 	/*
-- 
2.40.1

