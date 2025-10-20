Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE642DCC04
	for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 07:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760945872; cv=none; b=Ph49BHh3dEf7936iO5v6ex+hrat4SrSDEIpuPcglUE+OQBshAn+mydFyZtNRrXCcFWvNjUjgIQavRQWrLXkJbi2UthrWvnlEfOy82CTBGAMDG9rznTGpuJ4heXUNL44ZA9nUer0U4D51+IobXPm08Z2AE5TeL5Z9oq8C+HDuq78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760945872; c=relaxed/simple;
	bh=XIUk+Wq8jpXviipMq1htE3X89aZIsqsVUOEhGsHsoE0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iFtnSzHBOBJvtFN6dsweGwDJoDxEur29XGgDgkajk9isOeOrk1AIHecnhivN0JFmI5ogqfxvhJM6mbwdqiXF83FsPNF2b7jdmG84+/Ydq4ZKRLXhrk+EdvqFnYYZqFUTArBhX8y+8Rbglvg3UPlm8mWUB85b/f/UrAF2/6/mOgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QeicvtYJ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QeicvtYJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760945870; x=1792481870;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XIUk+Wq8jpXviipMq1htE3X89aZIsqsVUOEhGsHsoE0=;
  b=QeicvtYJzjUBmXwPmHz0RvNezH8jhQU4DBHu4dmG0n+J768ZyMAd60bI
   fd0TegGWoqAwO+xZufXBmf4cqjvhGMUj91R2lfBKvmNKZ8o1lSQsuI5pM
   HR6r9uvX26256c8QH5Uqx1250IL8TwuDBYfFZlvj2LkMW9VnKx+BiX4dJ
   Hm8a54pkUAzRNJPXWR3CuXM0kVpwTt8wKnYIqa9xuo5atWS01mlEFGCy1
   OCStNc/4bHh6Ogt6sHudgTylSfJ8Wwwf3JULsAidnzOlZUdrfcx0BOs9W
   Q/mrg0C36iMYTaDrfA/ZoXTxiFuL31KBc4NL+iD5DjRy0Uyb5NsF2f3sd
   w==;
X-CSE-ConnectionGUID: lIqILK1uTnaBtjLdywZQVA==
X-CSE-MsgGUID: i5HVilmaTTuAvxdPmYDWXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11587"; a="73662266"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; 
   d="scan'208";a="73662266"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 00:37:50 -0700
X-CSE-ConnectionGUID: +uSnb1K6SxWXCnhfL3YjZA==
X-CSE-MsgGUID: rK8FOZb1T8WmHItVxaRZpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; 
   d="scan'208";a="182821202"
Received: from krybak-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.246])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 00:37:47 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	shengjiu.wang@nxp.com
Subject: [RFC] ASoC: soc-pcm: Use conditional PCM hardware parameter initialization
Date: Mon, 20 Oct 2025 10:37:50 +0300
Message-ID: <20251020073750.27784-1-peter.ujfalusi@linux.intel.com>
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


 sound/soc/soc-pcm.c | 39 ++++++++++++++++++++++++++-------------
 1 file changed, 26 insertions(+), 13 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 2c21fd528afd..e4bbcf4bcc9d 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -570,14 +570,31 @@ static void soc_pcm_apply_msb(struct snd_pcm_substream *substream)
 	soc_pcm_set_msb(substream, cpu_bits);
 }
 
-static void soc_pcm_hw_init(struct snd_pcm_hardware *hw)
+static void soc_pcm_hw_init(struct snd_pcm_hardware *hw, bool preserve_config)
 {
-	hw->rates		= UINT_MAX;
-	hw->rate_min		= 0;
-	hw->rate_max		= UINT_MAX;
-	hw->channels_min	= 0;
-	hw->channels_max	= UINT_MAX;
-	hw->formats		= ULLONG_MAX;
+	if (preserve_config) {
+		/*
+		 * preserve the configuration which might be done by components
+		 * Note: if the rates/rate_max/channels_max/formats are left to
+		 * 0 we still need to initialize them for the parameter updates
+		 * to work
+		 */
+		if (!hw->rates)
+			hw->rates = UINT_MAX;
+		if (!hw->rate_max)
+			hw->rate_max = UINT_MAX;
+		if (!hw->channels_max)
+			hw->channels_max = UINT_MAX;
+		if (!hw->formats)
+			hw->formats = ULLONG_MAX;
+	} else {
+		hw->rates = UINT_MAX;
+		hw->rate_min = 0;
+		hw->rate_max = UINT_MAX;
+		hw->channels_min = 0;
+		hw->channels_max = UINT_MAX;
+		hw->formats = ULLONG_MAX;
+	}
 }
 
 static void soc_pcm_hw_update_rate(struct snd_pcm_hardware *hw,
@@ -626,7 +643,7 @@ int snd_soc_runtime_calc_hw(struct snd_soc_pcm_runtime *rtd,
 	unsigned int cpu_chan_min = 0, cpu_chan_max = UINT_MAX;
 	int i;
 
-	soc_pcm_hw_init(hw);
+	soc_pcm_hw_init(hw, false);
 
 	/* first calculate min/max only for CPUs in the DAI link */
 	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
@@ -1738,13 +1755,9 @@ static void dpcm_runtime_setup_fe(struct snd_pcm_substream *substream)
 	struct snd_pcm_hardware *hw = &runtime->hw;
 	struct snd_soc_dai *dai;
 	int stream = substream->stream;
-	u64 formats = hw->formats;
 	int i;
 
-	soc_pcm_hw_init(hw);
-
-	if (formats)
-		hw->formats &= formats;
+	soc_pcm_hw_init(hw, true);
 
 	for_each_rtd_cpu_dais(fe, i, dai) {
 		const struct snd_soc_pcm_stream *cpu_stream;
-- 
2.51.1.dirty

