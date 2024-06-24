Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8DA813B58D
	for <linux-sound@vger.kernel.org>; Mon, 24 Jun 2024 12:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719231344; cv=none; b=n67S41Ahd6Mq/Is0LHL5SDCsjSUZmEnVsIdFYx46deWv+eRvv0GkhtGU8q7aJXpDoNVdWYDKtUrp2xeBZAL8LlKWcvGMJvC6uai19ri3M8E+Geei7Rudlu5oej8RSB9/ZCaviceD1fw3I71SPC771IXU+x9aRu3PEjv+SA/qrAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719231344; c=relaxed/simple;
	bh=BOPqb+hr+MZ44Y3ZgaO8aUjGSpet7jahVHcXhP9ems8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oq3jRFv7Y+isMg/J8duZKH47R+mXmRxLHwWq4gYKmdhwK5KfC0jnRD27VFkBdlFoNgVYvevH7mQvlF3r5yOYjwo4nVjjAVTeH8HkdUZc3K/tRAqw35/TQhPhzKlGnT5+k6x1crWLoHFY2uGjkKobuny60Cnh1auY95deIkJXgBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cTcHWHgR; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cTcHWHgR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719231342; x=1750767342;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BOPqb+hr+MZ44Y3ZgaO8aUjGSpet7jahVHcXhP9ems8=;
  b=cTcHWHgRqCb9i4U2U2rYrgTVyut19pp+9/Ja8d5qDCdOw5Oog0i77CcZ
   FwPnwsBMe86vs8iiFpgQKaoLxrxkxCOflrcpF5SZR/J7ymDT1RB/ebnrs
   mXqjqgbAtbJTD+qxXRmvmRehfr3/NMnNCqa/zCujvAqV0gcL/y29kcuuM
   BpdXLcDLqQdAWbR25vq5Shkto4k3jiOj39vhEWgDBfcvxTJc6Dj7ZHtty
   RfF+XsXea6/evG/kE8xHJLJcY8xKhl+3ITiTtg/7ZDcMgpzmtF7tjdSIK
   +nvOFptBVLz0i6lbPNunvbSH8Zxq0bikrNFhli6eDSSMvIWEyR552X2Pv
   g==;
X-CSE-ConnectionGUID: 7P1JWzjwTKWV06U9zh7tIA==
X-CSE-MsgGUID: Xff2pMfnSN2KwynegOq2NA==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="15888071"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="15888071"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 05:15:42 -0700
X-CSE-ConnectionGUID: BQXIczlQRNGMoBOAxdFsqw==
X-CSE-MsgGUID: Xk9pZY6uSsy89wuLuxk1zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="43358850"
Received: from ksztyber-mobl2.ger.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.245.246.230])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 05:15:40 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 3/3] ASoC: SOF: Intel: hda-pcm: Limit the maximum number of periods by MAX_BDL_ENTRIES
Date: Mon, 24 Jun 2024 14:15:19 +0200
Message-ID: <20240624121519.91703-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240624121519.91703-1-pierre-louis.bossart@linux.intel.com>
References: <20240624121519.91703-1-pierre-louis.bossart@linux.intel.com>
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

