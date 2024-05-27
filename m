Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6349161309
	for <linux-sound@vger.kernel.org>; Mon, 27 May 2024 19:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716838585; cv=none; b=YWvVTZa4SOnpQwHAEwgrwL4oqBNdpGBpVyjU0awlQ7i1fe53hx9LwRqZgiza9xtpjzB2NFBm7t7ufOZS9x8Ovji7GwIKyqYU09iTpAuTqNzJKq/EdEau6oId6gdLdoqBol/vp1Uo87Rz6RtZOnRozLp1nenCd0TkjJhffUUQUNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716838585; c=relaxed/simple;
	bh=xbtyfMP+dOw4ckNn9T0gy9jjMzAo2gIJpbMQ1H4TmOA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HuSIfIhayVg8FisYBWoEOlf3XzhU/EvMPBqo70kBvPqL9Vm1GhcAUONB5DFARTkT1l8MtItlo3IoN6iLYwHc9VEcuYflcoOxCVcn0PWXAO7vLnS61lQ3MZxt7CIf8P7OEG9PMgHlDNCZTtdRLjtW37Ui2TY3UjMR86fLcs1SDjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B83l41cb; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B83l41cb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716838584; x=1748374584;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xbtyfMP+dOw4ckNn9T0gy9jjMzAo2gIJpbMQ1H4TmOA=;
  b=B83l41cbU3lJtXjy4iHOnOBs6VZlUCH1D/NUGmojKhP+lYmWEQ8OVjLE
   WA3zQrhYH8Z6FMwXTM4SR6MvbpeU+13a6hGWjJiM9vt3KAaR9rx08SHZv
   i97kCmg+0yCqPdCHCYihSUSp4k1dpsfywxfwx//XQIGaUGdmE/Ejm7OIU
   plEFIlj99clJAvZGGN+CfRn5mjlYHwQE5su/kjtuNiwtSyjcuDGdDpGGG
   lTRjCoIahErGlaeC5S+PBIRfBrHU1tEX3nnr/mHjFZA1kXiQL4VJ5700W
   b0A5kfpx/3wtOefLQyPya3/hTOO4/qnDrItfkEMTkFX1ThlGlIMPWLcXw
   w==;
X-CSE-ConnectionGUID: Q+Vl2H2QR/Ss1a5vbAB/Ow==
X-CSE-MsgGUID: 907YXstGSR2jjAVxkyJq6w==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13339404"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="13339404"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 12:36:23 -0700
X-CSE-ConnectionGUID: kgm4U/XGRfKKkf10mf7Q6Q==
X-CSE-MsgGUID: JhswT7RSRQ+jrCL2p9xU+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="58029803"
Received: from unknown (HELO pbossart-mobl6.lan) ([10.125.110.221])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 12:36:22 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 18/18] ASoC: Intel: sof_da7219: disable max98373 speaker pins in late_probe
Date: Mon, 27 May 2024 14:35:52 -0500
Message-ID: <20240527193552.165567-19-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240527193552.165567-1-pierre-louis.bossart@linux.intel.com>
References: <20240527193552.165567-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brent Lu <brent.lu@intel.com>

Commit 94d2d0897474 ("ASoC: Intel: Boards: tgl_max98373: add dai_trigger
function") disables speaker pins in late_probe to allow DSP to enter
low power state. Add same code to sof_da7219 driver.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_da7219.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/soc/intel/boards/sof_da7219.c b/sound/soc/intel/boards/sof_da7219.c
index 0e3c352a1672..fa1f7d2d8278 100644
--- a/sound/soc/intel/boards/sof_da7219.c
+++ b/sound/soc/intel/boards/sof_da7219.c
@@ -180,6 +180,19 @@ static void da7219_codec_exit(struct snd_soc_pcm_runtime *rtd)
 
 static int card_late_probe(struct snd_soc_card *card)
 {
+	struct sof_card_private *ctx = snd_soc_card_get_drvdata(card);
+	struct snd_soc_dapm_context *dapm = &card->dapm;
+	int err;
+
+	if (ctx->amp_type == CODEC_MAX98373) {
+		/* Disable Left and Right Spk pin after boot */
+		snd_soc_dapm_disable_pin(dapm, "Left Spk");
+		snd_soc_dapm_disable_pin(dapm, "Right Spk");
+		err = snd_soc_dapm_sync(dapm);
+		if (err < 0)
+			return err;
+	}
+
 	return sof_intel_board_card_late_probe(card);
 }
 
-- 
2.43.0

