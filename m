Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66CB172764
	for <linux-sound@vger.kernel.org>; Thu,  4 Jul 2024 09:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720083689; cv=none; b=t8NeXv40k7vMh0CXHhr8HnrL/s/LuUtr7N65Zhv42QSeCnJrhxT9ijLTJo6Fx+CshJ9KKwEovPJ71IJ8p3bUpEGHCnSvXykWEfWHG+8Z+GyRIozIMipHvmpavg2mldCotf0GbHp2fpfOTS4cjr8/20wysUcrtuGbAIY+n7ULayg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720083689; c=relaxed/simple;
	bh=BOPqb+hr+MZ44Y3ZgaO8aUjGSpet7jahVHcXhP9ems8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cbjIOyOVRtdr7xJUanCKi7apmjBbDeoQVogS7XamRWAUIDCz/Yr0O8kq0uYFelnn9jsHFtzEF403Gleb+T3ZrFoPesjrEOlKrrCfDK+s6woKPGrr9FrsCsYXeDNM7mruszEqCA3meAe2JYNx8QzGAuEuosfhA1H68BlCkJw1ZAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IL7PwCQD; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IL7PwCQD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720083688; x=1751619688;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BOPqb+hr+MZ44Y3ZgaO8aUjGSpet7jahVHcXhP9ems8=;
  b=IL7PwCQDMNlOB8/yp+R2UDOjIcSQPiBBZJyepRRkBtpD+2ZU1um7GeqD
   Wr7JTSgkVLzwhRZaYBsDnwQHwQTF9dUBVUyjNHGXCPsTS6FpV52K/Wag2
   ucdzzJh4dluBFAikX+2erxaP9tX4E8lOeAW1rMvBCIntPm4WbUdxtBX3z
   TBbCrqhUQQuTHj4vWyyOtJxtzkoV+FcecQgejwLDS55F0DfHNHf+Kzi9I
   5PL8DcieAL56noyTwkeQmI+sXqN2Gw0UENoc9vYwqwAV4kakxpLgZVrEM
   Qtc30S6a+vwpk4Uuz+bF+El77weRIxXaijea8l3AsSjdogXHZ6Ktbo0On
   w==;
X-CSE-ConnectionGUID: RS4Gj+0tQpK+gbkve6ypxg==
X-CSE-MsgGUID: e2jsLFXSTUKER8cI0CGhpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="34799434"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="34799434"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 02:01:25 -0700
X-CSE-ConnectionGUID: 05o/pgpkQSuVbSCGnGLoRQ==
X-CSE-MsgGUID: QlC7CNToTlW7imCFZ5SMQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="50980484"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.245.246.90])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 02:01:20 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH] ASoC: SOF: Intel: hda-pcm: Limit the maximum number of periods by MAX_BDL_ENTRIES
Date: Thu,  4 Jul 2024 11:01:06 +0200
Message-ID: <20240704090106.371497-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

The HDaudio specification Section 3.6.2 limits the number of BDL entries to 256.

Make sure we don't allow more periods than this normative value.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-pcm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/sof/intel/hda-pcm.c b/sound/soc/sof/intel/hda-pcm.c
index 9fb8521b896b..f6e24edd7adb 100644
--- a/sound/soc/sof/intel/hda-pcm.c
+++ b/sound/soc/sof/intel/hda-pcm.c
@@ -258,6 +258,12 @@ int hda_dsp_pcm_open(struct snd_sof_dev *sdev,
 	snd_pcm_hw_constraint_integer(substream->runtime,
 				      SNDRV_PCM_HW_PARAM_PERIODS);
 
+	/* Limit the maximum number of periods to not exceed the BDL entries count */
+	if (runtime->hw.periods_max > HDA_DSP_MAX_BDL_ENTRIES)
+		snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_PERIODS,
+					     runtime->hw.periods_min,
+					     HDA_DSP_MAX_BDL_ENTRIES);
+
 	/* Only S16 and S32 supported by HDA hardware when used without DSP */
 	if (sdev->dspless_mode_selected)
 		snd_pcm_hw_constraint_mask64(substream->runtime, SNDRV_PCM_HW_PARAM_FORMAT,
-- 
2.43.0

