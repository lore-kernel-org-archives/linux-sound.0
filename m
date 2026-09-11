Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A79457E65
	for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 11:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789125763; cv=none; b=HfQ9i5NfT2mIRnEGMDWEuE1+venMqJpcbW7ZAU6QAWg1u4nBBvjUYcdrr2BKbIZod7uyQtlDtyTxExWNNhGIHohVtDW8BpF2xcisRXnTpj/iLhV3UQ1zxQwTYB+U+XanRSjR0lQQOSiOP7+7vMqNfE9iW3OqQ0RFfTo8wgInEW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789125763; c=relaxed/simple;
	bh=BgyBs3unxn74Qty5/MLuejP9kIRHVAgimB89a9E3hwg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vGYm9imz5/L2TlT16vGxjvFMQ98H3ywRI/340gN/j3zvuNoL9Wypj65c35d1/edErDrm4W89LupJyCVMLeKaYT0B8c+2eJ6k2+oW+v/N0PPr+/Ki3OsFTlWfPNyBGdIpRYljuwpy0PjiWKbKviIjjUlOLNAHD+pBop5wZ2S6q9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HHx5enRL; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HHx5enRL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789125751; x=1820661751;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BgyBs3unxn74Qty5/MLuejP9kIRHVAgimB89a9E3hwg=;
  b=HHx5enRLxbbtxme0sXVN/kcN+PKFpM5FxZWb/ccbL33MEBnuaOzoHzaF
   Aog7+H4PUkD3xqX+Yhvk1WosfMrgVcrMLQ3FUO9P/gHdZdFzF+VpQ8EYd
   pRdHVR50DCDWEaLtxFzJK+NJD5gWi2o/6ulTahWApPMvpB8dMgF0uEJU9
   lMYkNlpKNfNax0BJg54hHXLEt+q/+MrttOvQ/dyAdQ3kSeorLYTArx7/Y
   JNjVQxHF7Ah5EVbfQAQ2ri6MPAz1/2bNFKe+SqR+rzraZl4pVjtg+fb7s
   RXhbmBWNs0mKwq3bcNyfV/AC0J2VcKSHanaBWaN0gQ0bVp23vUEj2WqDc
   A==;
X-CSE-ConnectionGUID: rprPCsZUSfOJdEBvSv5XHQ==
X-CSE-MsgGUID: GFyZaHwGR2mKafBrRo+qMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="100749965"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="100749965"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 04:22:17 -0700
X-CSE-ConnectionGUID: T6gq3nU1T6uYVldMEoDCxw==
X-CSE-MsgGUID: PfyeQAjeQvu1Hxmp/Ia+Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="268213314"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.83])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 04:22:14 -0700
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
Subject: [PATCH v3 11/26] ASoC: SOF: sof-audio: do not dereference swidget->spipe unconditionally on free
Date: Fri, 11 Sep 2026 14:21:37 +0300
Message-ID: <20260911112152.28528-12-peter.ujfalusi@linux.intel.com>
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

sof_widget_free_unlocked() dereferences swidget->spipe without checking
it for two things: swidget->spipe->complete for a scheduler widget, and
swidget->spipe->pipe_widget for the recursive free of the pipeline's
scheduler widget. Both can be reached with spipe or pipe_widget not
set, which oopses in the free path - where there is nothing left to
bail out to.

Check both before use and cache swidget->spipe in the local spipe
variable that is already there. A widget with no pipeline has nothing
to put or complete, and no scheduler widget to free, so skipping is the
correct behaviour.

No functional change for a widget that was successfully set up:
sof_widget_setup_unlocked() already rejects a dynamic pipeline widget
with no spipe or no spipe->pipe_widget with -EINVAL.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/sof/sof-audio.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 850eb2bc2b44..9f9f18b3c935 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -103,7 +103,7 @@ static int sof_widget_free_unlocked(struct snd_sof_dev *sdev,
 	 * decrement ref count for cores associated with all modules in the pipeline and clear
 	 * the complete flag
 	 */
-	if (swidget->id == snd_soc_dapm_scheduler) {
+	if (swidget->id == snd_soc_dapm_scheduler && spipe) {
 		int i;
 
 		for_each_set_bit(i, &spipe->core_mask, sdev->num_cores) {
@@ -115,16 +115,16 @@ static int sof_widget_free_unlocked(struct snd_sof_dev *sdev,
 					err = ret;
 			}
 		}
-		swidget->spipe->complete = 0;
+		spipe->complete = 0;
 	}
 
 	/*
 	 * free the scheduler widget (same as pipe_widget) associated with the current swidget.
 	 * skip for static pipelines
 	 */
-	if (swidget->spipe && swidget->dynamic_pipeline_widget &&
+	if (spipe && spipe->pipe_widget && swidget->dynamic_pipeline_widget &&
 	    swidget->id != snd_soc_dapm_scheduler) {
-		ret = sof_widget_free_unlocked(sdev, swidget->spipe->pipe_widget);
+		ret = sof_widget_free_unlocked(sdev, spipe->pipe_widget);
 		if (ret < 0 && !err)
 			err = ret;
 	}
-- 
2.55.0

