Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D511465B4
	for <linux-sound@vger.kernel.org>; Fri,  5 Apr 2024 09:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712308101; cv=none; b=ehgoVTddLzVTuEtY/l2JKxpkFBBYAlJNwmLlOZQ4q/RWOqbT3Qu4Gj3HNITMsTh7o2bZUUf5DJbm8dfo4f65QUurf/rBWhnym02LcLyXMAPh65cK9pne1Ok8fSy6HYO4ISJq3F/7w4Lu/1D+sZhZxGT1Fex8ZnTI5Hvmfd6EAUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712308101; c=relaxed/simple;
	bh=57TGCSCkjrsonGnK9tulnMl2oRX3ewM3Ljw5o763Gfs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XgpmuJOGdC1kUc/Y//FR05qEmNZvR8Dv1hqUNhE8M+JD4+c2w6QbROR5C7orf/KD0Yti4jh90F31r//YfVhTt9fw7Yk3ypcM13Bd9tjApbE7jAc+paHpiTH0IalHWZUREgxWm7rbk57ePs2SDYQXg9FEPRaf+6w+6uV2J7hM3NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HFLwr6X7; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HFLwr6X7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712308100; x=1743844100;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=57TGCSCkjrsonGnK9tulnMl2oRX3ewM3Ljw5o763Gfs=;
  b=HFLwr6X7c0rw2lWuiUuP2AVd6uYubVkqRETAD0WoU/tlR6PTk0+tHFBh
   RI6dOWDN1HOFIWH4rStvpVpF9yoOaeO3zeyqN6Cj1gfkJyxmgUA3SfYCI
   ujx3ZbpOJBk7p/IUSJ4onkjk/XkS26UBqSY66f7Hdy3W9RNrdL1WQhqpw
   QuNobfz4s1sJd23kG5qDhnRmkh9EJcizOXypCeGY2qVFZ6lTJl1xpFoDU
   BqLDTk59z5T6v13LPT224heMYH63eSgaMcB/Y6GHaMvyMg51PchUHt+OG
   PY61phQBFBjYgJAMRNgdDKw6zfWQX82U3jagU00J1TNAiGSyVSzVPnHav
   w==;
X-CSE-ConnectionGUID: B31WyWUYTVuBS6ftsc6pmA==
X-CSE-MsgGUID: s0j0eOd/T2iSuKchCfIV6Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7787449"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="7787449"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 02:08:20 -0700
X-CSE-ConnectionGUID: QmZPM82BR9WvruM1H3RJDg==
X-CSE-MsgGUID: uQ0JU06KTxySXF9any7D8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="19042433"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa009.jf.intel.com with ESMTP; 05 Apr 2024 02:08:18 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 07/13] ASoC: Intel: avs: Fix potential integer overflow
Date: Fri,  5 Apr 2024 11:09:23 +0200
Message-Id: <20240405090929.1184068-8-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240405090929.1184068-1-cezary.rojewski@intel.com>
References: <20240405090929.1184068-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While stream_tag for CLDMA on SKL-based platforms is always 1, function
hda_cldma_setup() uses AZX_SD_CTL_STRM() macro which does:
	stream_tag << 20

what combined with stream_tag type of 'unsigned int' generates a
potential overflow issue. Update the field type to fix that.

Fixes: 45864e49a05a ("ASoC: Intel: avs: Implement CLDMA transfer")
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/cldma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/cldma.c b/sound/soc/intel/avs/cldma.c
index d7a9390b5e48..585579840b64 100644
--- a/sound/soc/intel/avs/cldma.c
+++ b/sound/soc/intel/avs/cldma.c
@@ -35,7 +35,7 @@ struct hda_cldma {
 
 	unsigned int buffer_size;
 	unsigned int num_periods;
-	unsigned int stream_tag;
+	unsigned char stream_tag;
 	void __iomem *sd_addr;
 
 	struct snd_dma_buffer dmab_data;
-- 
2.25.1

