Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87D346EC66
	for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 11:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789125750; cv=none; b=uZFv8ysUGrq/crFOXWT9VRRZTHE9eye9AfBkOrHmY7aU9eWyq0WCscLKMWtPn5YZbA84ctLhhog1HDu2M/CYEPMTJHAo7V2Ej1r+gZlmukOrkygvnqfVa5VGdWLxkIQCpHhSpzfyFojhixbPleDAq3kenS5aWM+0ifwagfDAc5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789125750; c=relaxed/simple;
	bh=Mo+ObBylqF1Fc/oCwM6Acv8RFU18zsM0n2iuDvdQJBA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JfG2T01YyMfRt+7GtQVWqIT09wLp1v1vewu00FxLl9dlG57vL0qqooMzuAGj9uF4VsCWsdF+DJjj03B6JwXS35vqy/P119UYsgZorTbmhrTOTlNhYeBYqRFfsaa+8xY/fsitAX9Q2C5gHwWCtptcrTd3+mxDDFlplP7iqLTmJ30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Efp0Kpm4; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Efp0Kpm4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789125735; x=1820661735;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Mo+ObBylqF1Fc/oCwM6Acv8RFU18zsM0n2iuDvdQJBA=;
  b=Efp0Kpm4Cgyl3oAvHQjyk8O/f0Ir9pthdt176zomJQIxDgZ35Xvxf31H
   xgqGXdJv3sohsjLEN9QPNz80/J9HwfzrM8PZoATjtclogW+c9M38V+q/9
   yiPmArB9JaH9uY4Cfs6itJGHF6tHeJWgIfMxBJxvJDD0tkbvYqlVBf9Mb
   bWO28AbtX1lseAfmEgEJXPeqaWPY4SQs942vykUNtC/gB9TlSXMepTwXw
   UA3xKyVYbX0mJKkfz3CVAvup7PILWbnFnvtZ1Yietk3goFcFTxEXcX3Up
   9OUAWJbRzhUm9mGpD7j2nlGWjxHTLxydNt11hlSATl96VflU62sUGr4TP
   A==;
X-CSE-ConnectionGUID: 0lvB6/u5QpyRjvomGfv0Tg==
X-CSE-MsgGUID: 7OgElw9fQ06438rxq4x+Vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="100749918"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="100749918"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 04:22:02 -0700
X-CSE-ConnectionGUID: TrWNcmLATXSrg8wBtKDBaA==
X-CSE-MsgGUID: 4yDLqF7qRPaSZggI2AQ/jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="268213273"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.83])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 04:22:00 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: vkoul@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	srinivas.kandagatla@oss.qualcomm.com
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	daniel.baluta@nxp.com
Subject: [PATCH v3 06/26] ASoC: soc-compress: Stop running dpcm on free
Date: Fri, 11 Sep 2026 14:21:32 +0300
Message-ID: <20260911112152.28528-7-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911112152.28528-1-peter.ujfalusi@linux.intel.com>
References: <20260911112152.28528-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the last trigger that the compr device received is a DRAIN then the
DPCM is left in running state (no stop trigger is sent).
Before we execute the free we need to send a STOP trigger to make sure that
both BE and FE is in expected state and prepared for closing.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/soc-compress.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index 9fd2eeeeabb4..a941ed0908c6 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -312,6 +312,16 @@ static int soc_compr_free_fe(struct snd_compr_stream *cstream)
 	struct snd_soc_dpcm *dpcm;
 	int stream = cstream->direction; /* SND_COMPRESS_xxx is same as SNDRV_PCM_STREAM_xxx */
 
+	/*
+	 * The core will not send a STOP trigger on free if the device is in
+	 * DRAIN state, but we need to stop BE and FE before we can proceed to
+	 * free the stream.
+	 * Run the STOP trigger if the DPCM state is START (DRAIN is not
+	 * changing the DPCM state).
+	 */
+	if (fe->dpcm[stream].state == SND_SOC_DPCM_STATE_START)
+		cstream->ops->trigger(cstream, SNDRV_PCM_TRIGGER_STOP);
+
 	snd_soc_card_mutex_lock(fe->card);
 
 	snd_soc_dpcm_mutex_lock(fe);
-- 
2.55.0

