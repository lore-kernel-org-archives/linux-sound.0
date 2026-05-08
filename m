Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3323937F01E;
	Fri,  8 May 2026 10:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778235489; cv=none; b=QiAkvYvPu97b30dmNzlxbuVJt5DP8jnq9onX1u3j5te7lMB2qre8CRufOUnd9uStw6P88dstjsrlpdxc7M/gH/KREUV88Tol0qbFG9vx4mAUXjeDObEULd/A6Kjm1XIWgzduP4WqQUdnHdk19whtFWCzDgL4lzDH8M3llUN1hcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778235489; c=relaxed/simple;
	bh=56NKr4PTTWwpPL2Q8gVwwsd/Qs6q4NZTVA1pUWUlGxY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dkr0T4mjjvDgXv604/e1tyGINJERzX9+sCuNRq8Jqr7ixqeC/mrHzEbSgw3u2boWDHM8sKUxWR+fJxwjgo5IM1WRzLs1ebp/aI+zP6se6kW9u8mYFQyPO+Jg8WWOgs4Jy2eMKXCL3qzgUVNdG5NNNRmdG0bqJ0zrlctItGKKXuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SUFvNz2p; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SUFvNz2p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778235487; x=1809771487;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=56NKr4PTTWwpPL2Q8gVwwsd/Qs6q4NZTVA1pUWUlGxY=;
  b=SUFvNz2pyIt4B3SWFjuxGwLh9t7AZ9UyA21g9N3bE2S33Xa2d/XgA3+G
   bI/8UquctJ7hhnUQtbrTXMs/8eOoM0+78RoZa3JNL7Afy9e5t+9U8Q3Oj
   YqmdVDzHZfPGKa2rnJzmP6s+Eqg7uw/gW2l0VqCtFCHcSZ9Yf7Gl5ZUoX
   yexjMCBkcHi1iGHsNS0TwCNRzCYrpObpfbOc4ij5rNq3jQLdTmKa/iSr2
   Y7MC81kC/ClSoQar6ZWzJA2kcpFeT7SQN9oWpCiXmacDjtp7GmcKd1AFA
   VvxDiiNaQ5KjFCjs8zVZ0i+eqnDgVNmNP8SWZZ1r7QLnqg9wL0XhwZ0TZ
   Q==;
X-CSE-ConnectionGUID: /A+Gps21Tga/p6DlPSFGjg==
X-CSE-MsgGUID: JL7x7XVuTA6E9ep4hcCylg==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="104661093"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="104661093"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 03:18:06 -0700
X-CSE-ConnectionGUID: LAxqK8xnTPK1ARRt0VZuNA==
X-CSE-MsgGUID: rG7sBKnzSIi4igbcSTu9/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="234070163"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 03:18:04 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	peter.ujfalusi@linux.intel.com,
	bard.liao@intel.com,
	mac.chiang@intel.com
Subject: [PATCH] soundwire: intel: Move suspend tracking from trigger to pm suspend
Date: Fri,  8 May 2026 18:17:55 +0800
Message-ID: <20260508101755.1247039-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

Mark all open DAI runtimes as suspended in the component .suspend
callback instead of relying on SNDRV_PCM_TRIGGER_SUSPEND, which is
not delivered during PAUSE or xrun states.

If during system suspend a dai is open it means that it is in either in
SUSPENDED, PAUSED or STOPPED  (due to xrun) state and they will need to be
re-initialized during resume (which is done in .prepare callback).

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.c       | 31 ++++++--------------------
 drivers/soundwire/intel_ace2x.c | 39 ++++++++++++++++++++++-----------
 2 files changed, 33 insertions(+), 37 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index dcd7440e78fa..af65214836b4 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -906,19 +906,6 @@ static int intel_trigger(struct snd_pcm_substream *substream, int cmd, struct sn
 	}
 
 	switch (cmd) {
-	case SNDRV_PCM_TRIGGER_SUSPEND:
-
-		/*
-		 * The .prepare callback is used to deal with xruns and resume operations.
-		 * In the case of xruns, the DMAs and SHIM registers cannot be touched,
-		 * but for resume operations the DMAs and SHIM registers need to be initialized.
-		 * the .trigger callback is used to track the suspend case only.
-		 */
-
-		dai_runtime->suspended = true;
-
-		break;
-
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 		dai_runtime->paused = true;
 		break;
@@ -955,10 +942,12 @@ static int intel_component_dais_suspend(struct snd_soc_component *component)
 	struct snd_soc_dai *dai;
 
 	/*
-	 * In the corner case where a SUSPEND happens during a PAUSE, the ALSA core
-	 * does not throw the TRIGGER_SUSPEND. This leaves the DAIs in an unbalanced state.
-	 * Since the component suspend is called last, we can trap this corner case
-	 * and force the DAIs to release their resources.
+	 * Mark all open streams as suspended.
+	 * Open streams at this point can be in SUSPENDED, PAUSED or STOPPED
+	 * state and during prepare the DMAs and SHIM registers need to be
+	 * initialized for them.
+	 * The STOPPED state is a special corner case which can happen if audio
+	 * experiences xrun at suspend time.
 	 */
 	for_each_component_dais(component, dai) {
 		struct sdw_cdns *cdns = snd_soc_dai_get_drvdata(dai);
@@ -966,13 +955,7 @@ static int intel_component_dais_suspend(struct snd_soc_component *component)
 
 		dai_runtime = cdns->dai_runtime_array[dai->id];
 
-		if (!dai_runtime)
-			continue;
-
-		if (dai_runtime->suspended)
-			continue;
-
-		if (dai_runtime->paused)
+		if (dai_runtime)
 			dai_runtime->suspended = true;
 	}
 
diff --git a/drivers/soundwire/intel_ace2x.c b/drivers/soundwire/intel_ace2x.c
index 20422534baf1..0a97253fe0c2 100644
--- a/drivers/soundwire/intel_ace2x.c
+++ b/drivers/soundwire/intel_ace2x.c
@@ -894,19 +894,6 @@ static int intel_trigger(struct snd_pcm_substream *substream, int cmd, struct sn
 	}
 
 	switch (cmd) {
-	case SNDRV_PCM_TRIGGER_SUSPEND:
-
-		/*
-		 * The .prepare callback is used to deal with xruns and resume operations.
-		 * In the case of xruns, the DMAs and SHIM registers cannot be touched,
-		 * but for resume operations the DMAs and SHIM registers need to be initialized.
-		 * the .trigger callback is used to track the suspend case only.
-		 */
-
-		dai_runtime->suspended = true;
-
-		break;
-
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 		dai_runtime->paused = true;
 		break;
@@ -930,8 +917,34 @@ static const struct snd_soc_dai_ops intel_pcm_dai_ops = {
 	.get_stream = intel_get_sdw_stream,
 };
 
+static int intel_component_dais_suspend(struct snd_soc_component *component)
+{
+	struct snd_soc_dai *dai;
+
+	/*
+	 * Mark all open streams as suspended.
+	 * Open streams at this point can be in SUSPENDED, PAUSED or STOPPED
+	 * state and during prepare the DMAs and SHIM registers need to be
+	 * initialized for them.
+	 * The STOPPED state is a special corner case which can happen if audio
+	 * experiences xrun at suspend time.
+	 */
+	for_each_component_dais(component, dai) {
+		struct sdw_cdns *cdns = snd_soc_dai_get_drvdata(dai);
+		struct sdw_cdns_dai_runtime *dai_runtime;
+
+		dai_runtime = cdns->dai_runtime_array[dai->id];
+
+		if (dai_runtime)
+			dai_runtime->suspended = true;
+	}
+
+	return 0;
+}
+
 static const struct snd_soc_component_driver dai_component = {
 	.name			= "soundwire",
+	.suspend		= intel_component_dais_suspend,
 };
 
 /*
-- 
2.43.0

