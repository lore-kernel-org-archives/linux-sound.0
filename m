Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4184B04B1
	for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 12:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789560236; cv=none; b=DSGTE1e9FrVgbjoJOUSCrQWapjA1+g+qakpTDIh/kECmty/nwhe3VboNX/4kIUHGNA9jGci2ng3bS5Yhn3aADAkeTY/pdO2ElLK99vKNe2GiJgjgjRksqj2XdKlfhBNCIocGeZnKMvRJfPzQXjvNGsaFIGWWNTkzhtHUCQu6wu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789560236; c=relaxed/simple;
	bh=BgyBs3unxn74Qty5/MLuejP9kIRHVAgimB89a9E3hwg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PgX2E5dpgwZ+SaQpWsdAvUeD66RQAlbR5ki4RZmPg2Paacp3+CKaLTPpdYHPKIbYF7jnHhhwCmWfUqs26oFyj6ih8PZA1oSS2iCCUWmj0PxV0yQ8RhDhYWAuFjRo+J7jDi2XlFyIBFbLlJEo0XZ3OP96bg/MF6F+hFppIgtPpcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lh7eJkW4; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lh7eJkW4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789560232; x=1821096232;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BgyBs3unxn74Qty5/MLuejP9kIRHVAgimB89a9E3hwg=;
  b=Lh7eJkW4KHXy/C47m2YnUZnGaEeN5Yo8Td9+cJWPhnPdOUzgMcP+wYPS
   ImpSzF5maO/Jd/bv6yF00GcgFC2THrKLAZTu7rvPTmJZpENkvKqtV78bt
   +owQ3gFshBbfs4tfS30aF4xax5XOxkLkk/5E6mUNlThC6NVa68t/JJotq
   WT7U3tNZ0mgQlamj3OaB5jd81nbqJNwvxc1gMDxnldoLSMol5N1tAOUbR
   0ojNQJAZ/66pkQjuxn47FwwXdEqYecPIUFZmrDFuYrgjtkNLOZinb8hCn
   a4b7TeRZZp8B4xalJddqPO6XG+wH50AzUf4AF4CBWOlLTLvjmg7j/Pm8G
   Q==;
X-CSE-ConnectionGUID: GXE63UDWRcyQp4L0JBfEOg==
X-CSE-MsgGUID: j2kGEPulRpuohC+HGL24rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77496361"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="77496361"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 05:03:45 -0700
X-CSE-ConnectionGUID: vI5B1N2OQjulu9fYx5i/Lg==
X-CSE-MsgGUID: 9ER9wtUgSLWymenBIraSAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="273293437"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.100])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 05:03:42 -0700
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
Subject: [PATCH v4 11/26] ASoC: SOF: sof-audio: do not dereference swidget->spipe unconditionally on free
Date: Wed, 16 Sep 2026 15:03:05 +0300
Message-ID: <20260916120320.18318-12-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916120320.18318-1-peter.ujfalusi@linux.intel.com>
References: <20260916120320.18318-1-peter.ujfalusi@linux.intel.com>
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

