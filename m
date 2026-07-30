Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AFD4248A1
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 12:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785414128; cv=none; b=oKvQXTBzHNv7s8kKIHvZQnrLgJby16PhHeF0HRTJeFBQ+1k3R0A8wBSpoYw2Xba0MkUuRCwZJE+Qd/Ks/CKKwC80akEMqwuvpl9HdR9cK5TS24xJ4MJQUcl4DtAlWVip0F9JbuLZ+fGSoyJO5UQvPrg92p9YOGlUqw05f2XHQy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785414128; c=relaxed/simple;
	bh=bMd9mBzbdF63/uaW1og2/oaK/1yNCv1lBDC+xN0Tozk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m8pLqL56WpdvktvihDW5lkmOOfRQHNt9uSaGyyYa8hqi+FJ79ac11rkusDNtxzZ5Q5B1F4/9WHptZcAcMVr4B6zCJvHAAfFWuRSNDIIwvCMCyF65kpIQjegCLkEnKmC+uhxV6q12G+f5gp0g3t3M2i5V/PG9hvLP9s9ejBOE+vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TArwJ8pq; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TArwJ8pq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785414126; x=1816950126;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bMd9mBzbdF63/uaW1og2/oaK/1yNCv1lBDC+xN0Tozk=;
  b=TArwJ8pqn4BbEIh6+PTE4pJ8uG/i/LXRtTujsmLEbxgRsnaD3/zYL3wY
   /U1BZ86viK2WIXFwjFoLPBElToXpF3/UpsoQHLiEiIk0+5DU3bpfTDxJn
   R/Ah5/l0/j3OMTWExfoiKPp/m8ZZVHv4JfuBaEENCxWWBMzAMXeZp9fTy
   bWppXuvlU6hMiPISc3FPEu2uKhms3S1cQOXzWExrh9P1/SsIqG6j/vaJf
   7GBPxbUZEfW0cSLNDuN3XjQEVolZyH7EaLxvtyj1PN/Qi9M389y3YY1IN
   msB/qsYXNLSsa8w2VMyUEvTWOOeDJkFWlz3sbyCWAgrHiRc1EzTtHv3Sx
   Q==;
X-CSE-ConnectionGUID: eXz+i9kGRUOr6gX1Bx/eGg==
X-CSE-MsgGUID: tE4dMvH0Q3Sp+l4DZCZ1TA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="89712013"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="89712013"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 05:22:05 -0700
X-CSE-ConnectionGUID: xKfwf8xOSa+3fbnWvirPFA==
X-CSE-MsgGUID: EXnUVPV2SgychvyIis2SJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="264095195"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.79])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 05:22:05 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev
Subject: [PATCH] ASoC: SOF: Intel: hda-stream: clear hstream->running flag in hw_params
Date: Thu, 30 Jul 2026 15:22:41 +0300
Message-ID: <20260730122241.30541-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During hw_params call we make sure that the host DMA is stopped but the
hstream->running flag is not explicitly cleared at the same time.

If the host DMA fails to stop during previous use then the flag is left
set and on next start the host DMA will be left disabled since the
trigger:STOP will skip the DMA enable.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/hda-stream.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index 0778002e2bd6..c95230487a1b 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -613,6 +613,9 @@ int hda_dsp_stream_hw_params(struct snd_sof_dev *sdev,
 		return ret;
 	}
 
+	/* Host DMA is not running */
+	hstream->running = false;
+
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR,
 				sd_offset + SOF_HDA_ADSP_REG_SD_STS,
 				SOF_HDA_CL_DMA_SD_INT_MASK,
-- 
2.55.0

