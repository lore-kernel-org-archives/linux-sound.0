Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817151ADFFB
	for <linux-sound@vger.kernel.org>; Fri, 13 Dec 2024 10:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734084680; cv=none; b=YRwVyhNR465RXXFeCGYcoAyQJwafWivrFrKIV1s3F7VyzdvtS38qtAQbP7/A3+nXb2BGZ3yFyrGBnllbQf+ZN8AZiidP9n5N/2lq8vgrFUMfSTAf+gWHRcHZinScS5vmQHxbjjFQ8JBOoWtBvq9hUT0tEazS9zNUK8cMAAftKGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734084680; c=relaxed/simple;
	bh=XUjRsAFcKaWR5yu92AdYpog9S9FhuVClQFSfl6r+8fc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eVBgjh/2KglAVi8ExVrpULZwTfvHzK3OlHE1Zl7JfySx41guK08tIrXcvtULdrhEzAwLL3GzyVkPH3/x9ZeMz+P8S9c832QAfbnMZWUj/SPnqh+6hru7GeIzkbG4ASmTVIt/sdP4z1VF7mdM7MV5gMo5kap+t/Ipr8yE/8U45mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f+Y83jum; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f+Y83jum"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734084679; x=1765620679;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XUjRsAFcKaWR5yu92AdYpog9S9FhuVClQFSfl6r+8fc=;
  b=f+Y83jumPc8HQDy+CeH+uNvAhVCXvAP+1fp6+MHTC61f/3hvBSxETDeg
   nnL01EJ2eAEynRarRFuvIOBim0E+ZPQOtyiYflXO1qebzPWyJncdkvMk4
   RglnoItMLE514o6LIOVka96FEPY19qEfm448zPsX5Qm1GGNPE+MjtPTN3
   t4HXVPCBOFzOisgP2eFMmHlB4j6KfkhR42DJ9aEDTRDJ9+15g4AkKyobd
   mny6dCoWLss1LZ/3lIwspU00AAEmhcwBHhoyt++GuauXmGZn2KdNE9dgX
   V26urWiUKsbb3TC+3Karawv6RYyOE51zMCM9tDWu8wT8PFWLR4pn9ZYiF
   w==;
X-CSE-ConnectionGUID: Xuk+72UhTMm5MQ/NbOaGlA==
X-CSE-MsgGUID: KOM3iV6xTDKwbjxUn3iOVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="34263351"
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; 
   d="scan'208";a="34263351"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 02:11:18 -0800
X-CSE-ConnectionGUID: ep86eXDPT7iGuc84LehIdg==
X-CSE-MsgGUID: Zj0xp5vDQ1CcUzqjWRjdXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; 
   d="scan'208";a="96570743"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.245.190])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 02:11:15 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com
Subject: [PATCH 2/2] ASoC: SOF: Intel: hda-pcm: Follow the pause_supported flag to drop PAUSE support
Date: Fri, 13 Dec 2024 12:11:23 +0200
Message-ID: <20241213101123.27318-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241213101123.27318-1-peter.ujfalusi@linux.intel.com>
References: <20241213101123.27318-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the stream's pause_supported flag is false then mask out the PAUSE
support, so user space will be prevented to use it.

Introduce a module parameter to ignore the pause_supported flag, named as
force_pause_support to allow testing of the PAUSE feature.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/sof/intel/hda-pcm.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/sound/soc/sof/intel/hda-pcm.c b/sound/soc/sof/intel/hda-pcm.c
index 5b5e484f9acf..1dd8d2092c3b 100644
--- a/sound/soc/sof/intel/hda-pcm.c
+++ b/sound/soc/sof/intel/hda-pcm.c
@@ -37,6 +37,11 @@ static bool hda_disable_rewinds;
 module_param_named(disable_rewinds, hda_disable_rewinds, bool, 0444);
 MODULE_PARM_DESC(disable_rewinds, "SOF HDA disable rewinds");
 
+static int hda_force_pause_support = -1;
+module_param_named(force_pause_support, hda_force_pause_support, int, 0444);
+MODULE_PARM_DESC(force_pause_support,
+		 "Pause support: -1: Use default, 0: Disable, 1: Enable (default -1)");
+
 u32 hda_dsp_get_mult_div(struct snd_sof_dev *sdev, int rate)
 {
 	switch (rate) {
@@ -240,6 +245,16 @@ int hda_dsp_pcm_open(struct snd_sof_dev *sdev,
 	if (hda_always_enable_dmi_l1 && direction == SNDRV_PCM_STREAM_CAPTURE)
 		runtime->hw.info &= ~SNDRV_PCM_INFO_PAUSE;
 
+	/*
+	 * Do not advertise the PAUSE support if it is forced to be disabled via
+	 * module parameter or if the pause_supported is false for the PCM
+	 * device
+	 */
+	if (hda_force_pause_support == 0 ||
+	    (hda_force_pause_support == -1 &&
+	     !spcm->stream[substream->stream].pause_supported))
+		runtime->hw.info &= ~SNDRV_PCM_INFO_PAUSE;
+
 	if (hda_always_enable_dmi_l1 ||
 	    direction == SNDRV_PCM_STREAM_PLAYBACK ||
 	    spcm->stream[substream->stream].d0i3_compatible)
-- 
2.47.1

