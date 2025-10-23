Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B1A2EC09C
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 08:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761207243; cv=none; b=a229pxiC3BmrFjftS41iCAi5/hxKyhejae3xGYmW10vQMm2lgBoRtyycl539DPfYm+pODJgYkB3jtD2ZDOW4KSbs8Ttt4QnBs0C9ch9FPBP62S+PuUpSrvfM/yszZZNrh0p7CxVktBd0MEuj0S4TJ+AlKKg5AsxjiPbjCv1hUDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761207243; c=relaxed/simple;
	bh=8/SS3BGYztJ4PRwUpumMsdmo9LKX2aeQx1zT1tRjU5M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TZM08uHfhJuQfO1oKueRly23ICGltPM/rXN2TNpdSZ1YLzF5yac8H6TGmPb7+ZZuJi76+tz3YzOQxQn7YxLb/k3Tz6xduTX+wf0xD+zg/OFBthEHsVcVb/EfjfWlCyo7fHyHZ9Kd4/y3jBPr07jsjGwt+GhnBlXC68HTufd2NM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dzd4/beK; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dzd4/beK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761207241; x=1792743241;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8/SS3BGYztJ4PRwUpumMsdmo9LKX2aeQx1zT1tRjU5M=;
  b=Dzd4/beKoI6R4XKi9i2nVKDjqIOUtPpYxzposhe0ORyk3Ih2AEiVOfvO
   lw03l8MaKFYY7io8uwNL5d5oezvurw0zQTWVRcwEu/ulR4T7VUvhhDMZk
   MgfYszKx5tQV345QSGpqmyzV5OtGNp1+YLuQrea3y9v1u2TILvkDwal2J
   EAJHCs0nlDmOfL7s41VYwrh54lpV9AQb2tbEZGyKxsJ8gjHTOlKWMgCHY
   TOMRIFN69LVKPSF4ByfKaQTed6UK3a0cjqapdpa0/HCl6dzQFHddt1hsO
   pMS3iAfTsxF6frFZvwZfJde6RxgqC4Um9v/6KV1L6VtAMhUsyOtdf+bLF
   w==;
X-CSE-ConnectionGUID: y4yYKmBjSjCHLuc8P4Sm1g==
X-CSE-MsgGUID: TMvDvwZJSjCBLIfQ7za9OQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67015161"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="67015161"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 01:14:00 -0700
X-CSE-ConnectionGUID: 0mbtiHANTpGcH2T2IGCLFQ==
X-CSE-MsgGUID: S6XTHwVyQSCRpHbdDxZvmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="183989162"
Received: from carterle-desk.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.145])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 01:13:58 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	shengjiu.wang@nxp.com
Subject: [PATCH] ASoC: soc-pcm: Preserve hw parameters from components in dpcm_runtime_setup_fe
Date: Thu, 23 Oct 2025 11:14:04 +0300
Message-ID: <20251023081404.3740-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.51.1.dirty
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Component drivers can prepare snd_pcm_hardware struct based on the hardware
capabilities which information should not be discarded.

Only touch the rates, channels_max and formats if they were left to 0,
otherwise keep the provided configuration intact for the parameter cross
checking decision.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
Hi,

Changes since RFC [1]:
- move the hw parameter initialization/preserve code inline to
  dpcm_runtime_setup_fe

this patch in essence extends the special casing of formats done by
083a25b18d6a ("ASoC: soc-pcm: fix hw->formats cleared by soc_pcm_hw_init() for dpcm")

Other parameters might have been set in the same way as the formats
and preserving these are equally important.

A case for this is SOF used with HDA codec (analog or more importantly, HDMI)
where the hw-> params are set based on the connected display/device and
should be preserved so we can report correct rate, format and channels
supported by the equipment.

If the hw-> parameters are left uninitialized then we still need to
set the UINT/ULLONG_MAX for the refining code to work.

This applies only for FE setup, in other cases we shall (as before) do
a full re-initialization.

I think this makes sense and I cannot think where this might flop, but
sent as RFC to see what people think. 

Br,
Peter

[1] https://lore.kernel.org/linux-sound/20251020073750.27784-1-peter.ujfalusi@linux.intel.com/

 sound/soc/soc-pcm.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 2c21fd528afd..0877daab7b38 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1738,13 +1738,21 @@ static void dpcm_runtime_setup_fe(struct snd_pcm_substream *substream)
 	struct snd_pcm_hardware *hw = &runtime->hw;
 	struct snd_soc_dai *dai;
 	int stream = substream->stream;
-	u64 formats = hw->formats;
 	int i;
 
-	soc_pcm_hw_init(hw);
-
-	if (formats)
-		hw->formats &= formats;
+	/*
+	 * Initialize only pcm hardware patameters that has not been initialized
+	 * and preserve the configuration which might have been provided by
+	 * component drivers
+	 */
+	if (!hw->rates)
+		hw->rates = UINT_MAX;
+	if (!hw->rate_max)
+		hw->rate_max = UINT_MAX;
+	if (!hw->channels_max)
+		hw->channels_max = UINT_MAX;
+	if (!hw->formats)
+		hw->formats = ULLONG_MAX;
 
 	for_each_rtd_cpu_dais(fe, i, dai) {
 		const struct snd_soc_pcm_stream *cpu_stream;
-- 
2.51.1.dirty

