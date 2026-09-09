Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521FA48E0DA
	for <linux-sound@vger.kernel.org>; Wed,  9 Sep 2026 09:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788945008; cv=none; b=pM9yLsw2p0cK4YJ06xnvimwrYWwly168MtHvoQZLMSMNUC4+D2aKG6bFvBzDcaL/Q+pAMeM5HL2G5llJ02m2CgLAFwTNxEAObwXqHYZ3m+cLQYlgaGbhz+H6sQONLwy0O5EOUGve7cZRGSCaDzOUmr/TuFqBaUy3BettUbLYUVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788945008; c=relaxed/simple;
	bh=RpXB0zCO+Zau3rjmYkV93BUflOdMclr/vU0ORtUF+A8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XY0/SymWDXtNOvYRY/7Gsaxf0G5aPUvDheV099dKmRdwtHdUdXtnYMl7IeIMQ1P1SPe+VIc5DX3F9FWF2VJbqGW3eYZRLvvguFbEHRdPbeYWe1HzfUqfAlN4Pp/4ygkiiyFqT42GIkU/shQd2ThvaQ4qtQ8L7HLQjSlCZwbxPfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V5cvZQez; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V5cvZQez"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788945008; x=1820481008;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RpXB0zCO+Zau3rjmYkV93BUflOdMclr/vU0ORtUF+A8=;
  b=V5cvZQezZES8RmYV7fXyxRern/V4wrOQYIVYOzQx1LWyeoiqdTSrwVP0
   /zIQJT/qs3HX1mZPyfCVTnAWWFFbRZOXol+vLaZg/rWqeIKtfQOc77ODU
   qRXr1Kn8r4sX66jWFmXWHNqiHbGuqFke4JW30wPqqvzZQNpl1DJmf94dd
   26YXUPKQNJRefDB+UMDHDMOOY9/zSgg8y+nNfpyzZpPwENGchCHbFp6rx
   bynB5LIQJf8Oz2sn187PtXJeNwi+YAvp+LKrwuxBfM2ni3Uc6+OgAnvCe
   JyJw8se2Mz40ik0AgjrVN/gmSnyeccgC1WupiRoPc1C2UUyfmRA8c90hG
   A==;
X-CSE-ConnectionGUID: 2vXTDo0jT2up2SVelEi6nQ==
X-CSE-MsgGUID: sUe8+KvWSz6U9/CREJLC8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89200683"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="89200683"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 02:10:08 -0700
X-CSE-ConnectionGUID: j5QbVmR+TCS5XqNFf8QNPw==
X-CSE-MsgGUID: T1octNciSJC7Ie1bnAj3NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="266972944"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.252])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 02:10:04 -0700
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
Subject: [PATCH v2 09/24] ASoC: SOF: sof-audio: do not dereference swidget->spipe unconditionally on free
Date: Wed,  9 Sep 2026 12:09:34 +0300
Message-ID: <20260909090949.7503-10-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909090949.7503-1-peter.ujfalusi@linux.intel.com>
References: <20260909090949.7503-1-peter.ujfalusi@linux.intel.com>
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
index d244e90a734b..0b2f41f4a59b 100644
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

