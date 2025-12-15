Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0552DC322
	for <linux-sound@vger.kernel.org>; Mon, 15 Dec 2025 13:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765805380; cv=none; b=cfRtkLkxUMPzi3ee128KN7KceUmrhO64PseIJdFZRrNqyD0Gif4ss6G+lUWYtiXRXcawKB8wKShmHdS1Tr1D+/qTghczSbrUgJBOzPGGhdFFV+F2jlb2AabZrTm7oq5gisCsYPAdJTjjBoJwcTIcfGBjOaHUg39+kytniaHHVhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765805380; c=relaxed/simple;
	bh=Ig7i7F+XzYjWimLGH1QeAfn+Fui8KNFhprlLVqeZWzA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P6QFGtAHohdDqaUBk2eC+X2HkqPiGxVnoKdxG4eZ7hTqxYP713KHNDNMCWW3CYr09TOgacy/JydYdhKcE4rBDpIt2QHXjDB6qI5cFLThi77jTAX9hzl0NMeI5KYaA/ERGyGM49ja4GcbhOLeWky3lhO96rCYK34LleQNG8DBTmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P+VVKRje; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P+VVKRje"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765805379; x=1797341379;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ig7i7F+XzYjWimLGH1QeAfn+Fui8KNFhprlLVqeZWzA=;
  b=P+VVKRje1vd8Dqkq0HYrX28QWGcKEPTAQ/CIsE/t/fyrmSh3HAiA6+6B
   +YLI8rpD+h2YAr/smHgJI75aZLdiygy7FkDeOuLZUn0o1BhkJBmCbaxuA
   f70EvlPV+iJGckqJ7d2EqyC2cik6dZKtsCvOss4/ETI27JDzM4nUOG/Ae
   Y4sbX14vghlU41XgvJKhtEkBUwoDJY3CwzTmu0wTa0wkrY0fRm7Vr3j/e
   2vHEgDyYpir65Ezc6WPhyFpOolyx3I2En3pLniB9zF6uybpOr+HwIVZFF
   fvXS7XQ3oMSy+s6lueKWhEiX+t3C6NqFVPr8hWem1HjtDWY67BhuEt6Km
   Q==;
X-CSE-ConnectionGUID: pcWOmSz3QsOD4e00e5kxOQ==
X-CSE-MsgGUID: JIPEF2POTbe9ttv8g6tHkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="93179483"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="93179483"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 05:29:39 -0800
X-CSE-ConnectionGUID: 9GmvoZwiRpGaH5AmRub3NA==
X-CSE-MsgGUID: Hyvag4OMTraWDZy9w45Dnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="228376994"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.95])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 05:29:37 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com
Subject: [PATCH 5/8] ASoC: SOF: Intel: hda-sdw-bpt: Add support for on-demand DSP boot
Date: Mon, 15 Dec 2025 15:29:43 +0200
Message-ID: <20251215132946.2155-6-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215132946.2155-1-peter.ujfalusi@linux.intel.com>
References: <20251215132946.2155-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If on-demand DSP boot is used we need to make sure that the DSP is booted
up - which might not be the case - since we need ChainDMA in normal, non
DSPless mode for the BRA to work.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/sof/intel/hda-sdw-bpt.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/sof/intel/hda-sdw-bpt.c b/sound/soc/sof/intel/hda-sdw-bpt.c
index e45dd051ab8c..ae2f8d55dbd0 100644
--- a/sound/soc/sof/intel/hda-sdw-bpt.c
+++ b/sound/soc/sof/intel/hda-sdw-bpt.c
@@ -98,6 +98,17 @@ static int hda_sdw_bpt_dma_prepare(struct device *dev, struct hdac_ext_stream **
 	struct hdac_ext_stream *bpt_stream;
 	unsigned int format = HDA_CL_STREAM_FORMAT;
 
+	if (!sdev->dspless_mode_selected) {
+		int ret;
+
+		/*
+		 * Make sure that the DSP is booted up, which might not be the
+		 * case if the on-demand DSP boot is used
+		 */
+		ret = snd_sof_boot_dsp_firmware(sdev);
+		if (ret)
+			return ret;
+	}
 	/*
 	 * the baseline format needs to be adjusted to
 	 * bandwidth requirements
-- 
2.52.0

