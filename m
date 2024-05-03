Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B188153BCE
	for <linux-sound@vger.kernel.org>; Fri,  3 May 2024 13:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714744355; cv=none; b=nFqTEEiYsQ33lqksSwzGKdwbBJtUaqR7+W8Opywetg+4l0BYQ+rDcLLENx4O0MUpv3tiVxQsYLfoFXbx1dOhJk+1/FJhRODLoNSdlDXHKW6jit7bn+9aSbbOxsu8xFs1sE0qiNV0P8Cui5ER6fUVS4sTWp7co0f7NO7Uerosyug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714744355; c=relaxed/simple;
	bh=eFNR+JqcybsABMcMvGl8rSovVLy67z3mX6vDmfwZpGY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YseYFA5HYkyXS3P8Ua65M62IdvgK0lKSGmE5DRz8lsyRmGvfkoUekwDOjEO1IZA5hBMh/1qzCgu+n9edx+zkxLEikyV/cgmG5NVwLKtRmRKhZqnjUoOhmDRVp29Uje64VJI1jj1wOSa/V947MQTM89IsMKNhHgV1onNlO+hoNgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eUMKTTl5; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eUMKTTl5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714744354; x=1746280354;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eFNR+JqcybsABMcMvGl8rSovVLy67z3mX6vDmfwZpGY=;
  b=eUMKTTl5M0O/wLQi6Iu7fH9HEvRhz+tTkfp0nT3oUlqZWPP8XCYmokkU
   9ZSp4adOTZmfEmBnVoKkRL++B6StUBeFUy2jpN0SVhuM6Gkzhf1crii7O
   /g8kOf3Zh+h2i1eWVdDGl9oWWupSYXvDZnWRGFmi98m8OM5W7SOAegA72
   AzO5y341bvjsJgEb5uXFGV6KpafupzgR5AjOz8hlvMatsVZF6HReSxcl0
   O7PbYOeae/s1VhTbqGJMLBKcPwDgv2gu3kDhMYCUFr9tczEQ9Lz/8jx6y
   0euqNrujFcDtSX09A5/SBIZV4rt7rMLEqaN4EhLCOv8hpqyTqMaq+aYT2
   g==;
X-CSE-ConnectionGUID: mHEvPNnXRsu5X05ngc9XLQ==
X-CSE-MsgGUID: hP4IZRO0SiiCGTD3WzwxYA==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="28029407"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="28029407"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 06:52:33 -0700
X-CSE-ConnectionGUID: Gbo4GFfOQbuNA47R9SJrdw==
X-CSE-MsgGUID: 0UYwXGLbShGyywQG7wxXqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="27548724"
Received: from sjslinke-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.113.3])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 06:52:32 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>
Subject: [PATCH 1/7] ASoC: SOF: Intel: hda-stream: export stream_get_position() helper
Date: Fri,  3 May 2024 08:52:15 -0500
Message-Id: <20240503135221.229202-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240503135221.229202-1-pierre-louis.bossart@linux.intel.com>
References: <20240503135221.229202-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Export this helper so that we can report the DPIB position if the BPT
DMA do not complete - this is very useful to see if the DMA started or
gets stuck somehow with invalid bandwidth configurations.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
---
 sound/soc/sof/intel/hda-stream.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index 91b1371745e6..c5afcda18359 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -1079,6 +1079,7 @@ snd_pcm_uframes_t hda_dsp_stream_get_position(struct hdac_stream *hstream,
 
 	return pos;
 }
+EXPORT_SYMBOL_NS(hda_dsp_stream_get_position, SND_SOC_SOF_INTEL_HDA_COMMON);
 
 #define merge_u64(u32_u, u32_l) (((u64)(u32_u) << 32) | (u32_l))
 
-- 
2.40.1

