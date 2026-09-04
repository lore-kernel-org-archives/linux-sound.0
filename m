Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4AFB391E77
	for <linux-sound@vger.kernel.org>; Fri,  4 Sep 2026 07:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788507115; cv=none; b=TrgbaxsxMBYk3GjtLhXKibW8TjJleXjCZ8v3mNc3KkORnKPiEl/jk/31XbW9drRJRxGWa/WP6x6jRIJVrpjvg/5nGUsuqSFDNPUleuDurQwAc1DjLyNxv6niXQOBr0jQzjjoqppXsouFQutO7KzqS+MFbTS7kfb0eCEawjs79ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788507115; c=relaxed/simple;
	bh=RpXB0zCO+Zau3rjmYkV93BUflOdMclr/vU0ORtUF+A8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=irzEg5kD7PU1l+FlsJBpVLh6c7UUhA371hHbiqYdsOQiayihheB+Sf0XJEgZVtSPFY0pbliuXdLkWBIAWtunXK3KHsSBhEQdBMCzcQFwYZmFScQQV0gpuZuiJpTLXjw8OUaXv170Ec3q8aiUrpSNesb84hg3dzjUG5/vWXGmgMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VlOYRI/u; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VlOYRI/u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788507114; x=1820043114;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RpXB0zCO+Zau3rjmYkV93BUflOdMclr/vU0ORtUF+A8=;
  b=VlOYRI/un3CxVc5ZD3fCXEFWbLbkrWfJNXq7JQGxHAGgV2GlqdForx2t
   cZZQbMtxUWZbXOnMj1WUnvxknR94xDSqITYPW3AxDBVT+5nZP9DRpjYWx
   Rs6DQXLgyHfXcFdJQaPUznNte5ETwd0y5o3I2VCjIh7fHIl4ApRYaNQUb
   9agDsGzT1zVV3wOVOVBCihs3SB1xsjmrq5eyz7qu4Mi7PKHxbsKuMQtp/
   LpEXlDv9iD9Jnw/CmmPNejIxBxB80xbRwKhVcBMDlMkdBvjQUZuHz+++e
   4m8xZ+Rr53+5bEjhsH0DXqPWAx8aiVVAic5aottxiR5iByPIY9Jar2Xcu
   A==;
X-CSE-ConnectionGUID: PZh8BqzlTw60XG+ktOpEOQ==
X-CSE-MsgGUID: gtfnttywSjubDY4xAMbJbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="111777870"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="111777870"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 00:31:53 -0700
X-CSE-ConnectionGUID: JkDqUNeRRUusTSxXUPSMVQ==
X-CSE-MsgGUID: CDoiWx29TOavF5ggf/ETHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="293480586"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.213])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 00:31:50 -0700
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
	daniel.baluta@nxp.com,
	Vijendar.Mukunda@amd.com
Subject: [PATCH 08/23] ASoC: SOF: sof-audio: do not dereference swidget->spipe unconditionally on free
Date: Fri,  4 Sep 2026 10:31:19 +0300
Message-ID: <20260904073134.29648-9-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904073134.29648-1-peter.ujfalusi@linux.intel.com>
References: <20260904073134.29648-1-peter.ujfalusi@linux.intel.com>
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

