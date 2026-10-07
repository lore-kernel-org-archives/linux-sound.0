Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7292444605B
	for <linux-sound@vger.kernel.org>; Wed,  7 Oct 2026 08:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363015; cv=none; b=uw/OPzOudBmir89iT5Gd3f+L+c4YUdUXkKyQuMIx2Ly6RKXGgvIaGgd4sz+xMTv5dUOYVn8Se4u0fefE3auEGL5M8mb49SCyuL7tnxwsvM0GWjwW227uEL7Sc+6oc3+C1xopMp6PlidzAkZR9efojy76/0bMsyNwfsr3fpd9IbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363015; c=relaxed/simple;
	bh=UjihBO1ve9Il6isKH7IahT7d8FdFpyL9bVxo1HXwFbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YATLCg9hRMrzDaJr/qw1RVFHjPOXFOBLHuz6EuXDM6HaNougM38MWcaxJmFb/XcBcHX9/J0RZDgzu+zGiRdnjMtDRcyYrnpvGryI75R+3GTzsrS5TJ7pNfb56l3cqSEt3a52JNPAcFyvHa/KpgcC1NgtqB3KlrQHqYxJ3O+UNj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lg39/qBL; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lg39/qBL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791363015; x=1822899015;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UjihBO1ve9Il6isKH7IahT7d8FdFpyL9bVxo1HXwFbM=;
  b=lg39/qBLi6pYD5cKO8SWTPhcZdWCdyD/WnruvUFN5qdt394mLFn1kb1R
   7k5ltH6kN3wkA7xzwK43pFpP0FXVoi1XCP66J9G/Gs0KCQHSnxMXz1IxA
   W5fR3F87AF8ywULIpptkF8BWVYGCAIKGG/5s1Q6cQeu5cOFpLjc358ON7
   6dakmBP1BJt01t/DEv5GkoNqP75GAqfn9GTwb9K8XRiugNfQv/F6f9WXP
   o6pQ4Bg69xxtXqTKmQXAaC4Kq/PIJ0DD42asojQnQ3rwzQokFB3LcOABP
   ISOmkcX3zAySzAUxplQuLaWWFa0Au8DENBFxNCqahySPA+Z6IfWXuWL5U
   g==;
X-CSE-ConnectionGUID: 3sKwiAp5TPWy5Bq0m0Kejg==
X-CSE-MsgGUID: Ofvbl4gvQ6OIlau1gZkyWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="113946"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="113946"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 01:50:14 -0700
X-CSE-ConnectionGUID: 7wN2U8x6QA6fFG8I3bl+Sg==
X-CSE-MsgGUID: +inG+JBWT6KcJiCxFZA0dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="280670667"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.188])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 01:50:11 -0700
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
Subject: [PATCH v5 12/28] ASoC: SOF: sof-audio: do not dereference swidget->spipe unconditionally on free
Date: Wed,  7 Oct 2026 11:49:39 +0300
Message-ID: <20261007084955.1256-13-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261007084955.1256-1-peter.ujfalusi@linux.intel.com>
References: <20261007084955.1256-1-peter.ujfalusi@linux.intel.com>
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
2.56.0

