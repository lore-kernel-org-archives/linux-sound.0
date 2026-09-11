Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3C5456DEB
	for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 11:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789125763; cv=none; b=nEMCIaBh3gN4GjM1X14MBSSC9RZ2flwWCFTbzOyTgVMlytQyNtIQohtUYJehZ4mrxi9dowb36ZbxjAeTENvR0cWXStN36Bf/RTEHUxqI7TJvBVWhvODtbznkZwOnlZUIx1YZ9URzffuQ2xFyhRmINkvW8bb7LAlJoqxr4KG4u/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789125763; c=relaxed/simple;
	bh=hakHFEiBnMn6B3AmWrYWjV78TSDtafMAaCvas/4P/QQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mJKLjxtCHO/+Mdp8ERx8yKx/gmcqjC8Jbm5iPD2+p8mdSPtRU7gvvfKvVUSCf+o6RjdC85cY6uc1I+szjVwPMxs31pcPvD/pnGDhZC+FQfQkcu28w+jSdPvp8jEPUGB9AYmUqj7GaB50PQtMR7qsqSGsJKplDC0Ln+IDwUgTcIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CLUbX1Hr; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CLUbX1Hr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789125760; x=1820661760;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hakHFEiBnMn6B3AmWrYWjV78TSDtafMAaCvas/4P/QQ=;
  b=CLUbX1HrZMCOao0lFmKtMwRs1Myq+O0uTcwG9nlzHp0mVdLNRINg85EC
   rBxpMmt1PAj9Bwwo8TwNDGFZ+PaxoP1aMw8ONMa2cDuKfiQUzxlNRQSWi
   GOBXBzSLkd11BNBxG9ZUyKU9RB2ybQagoLaUfQNHLWqA9vlEhXoGiBvYf
   JoOtRxMPIWj7aRGIaiuyrpXIuiaN25Rs1M7W+91pq4jrVeP8hAga0+K7q
   PWgjYezULDAAC+EpoLccuUW1AmmT7jw8efL74ErZ3i6S8B8VvWuOCx+iL
   uEW8RqxklUIxiBr9rxZokhzqUfXW0lDzYzYUx0rh7wOWrODIcj4YbYeny
   g==;
X-CSE-ConnectionGUID: qAFGOQVLSCiTaI/mwLTvMw==
X-CSE-MsgGUID: j7QRCX4XRuCqi8C2fdcvrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="100749974"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="100749974"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 04:22:19 -0700
X-CSE-ConnectionGUID: QE1CmKJnSY+w4H8lNwyZ/A==
X-CSE-MsgGUID: Z5GvMfCTTn2q/c79gij6Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="268213319"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.83])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 04:22:17 -0700
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
Subject: [PATCH v3 12/26] ASoC: SOF: sof-audio: Expose a couple of functions
Date: Fri, 11 Sep 2026 14:21:38 +0300
Message-ID: <20260911112152.28528-13-peter.ujfalusi@linux.intel.com>
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

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

These are common functions that will also be needed for the IPC4
compressed support.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/sof/pcm.c       | 6 +++---
 sound/soc/sof/sof-audio.h | 7 ++++++-
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 941baa48b275..8f59c200b8ec 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -66,7 +66,7 @@ void snd_sof_pcm_period_elapsed(struct snd_pcm_substream *substream)
 }
 EXPORT_SYMBOL(snd_sof_pcm_period_elapsed);
 
-static int
+int
 sof_pcm_setup_connected_widgets(struct snd_sof_dev *sdev, struct snd_soc_pcm_runtime *rtd,
 				struct snd_sof_pcm *spcm, struct snd_pcm_hw_params *params,
 				struct snd_sof_platform_stream_params *platform_params, int dir)
@@ -100,8 +100,8 @@ sof_pcm_setup_connected_widgets(struct snd_sof_dev *sdev, struct snd_soc_pcm_run
 	return 0;
 }
 
-static struct snd_sof_widget *snd_sof_find_swidget_by_comp_id(struct snd_sof_dev *sdev,
-							      int comp_id)
+struct snd_sof_widget *snd_sof_find_swidget_by_comp_id(struct snd_sof_dev *sdev,
+						       int comp_id)
 {
 	struct snd_sof_widget *swidget;
 
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index bd5bbaf9ae44..1b3e66037584 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -636,7 +636,12 @@ struct snd_sof_pcm *snd_sof_find_spcm_comp(struct snd_soc_component *scomp,
 					   int *direction);
 void snd_sof_pcm_period_elapsed(struct snd_pcm_substream *substream);
 void snd_sof_pcm_init_elapsed_work(struct work_struct *work);
-
+int sof_pcm_setup_connected_widgets(struct snd_sof_dev *sdev, struct snd_soc_pcm_runtime *rtd,
+				    struct snd_sof_pcm *spcm, struct snd_pcm_hw_params *params,
+				    struct snd_sof_platform_stream_params *platform_params,
+				    int dir);
+struct snd_sof_widget *snd_sof_find_swidget_by_comp_id(struct snd_sof_dev *sdev,
+						       int comp_id);
 /*
  * snd_sof_pcm specific wrappers for dev_dbg() and dev_err() to provide
  * consistent and useful prints.
-- 
2.55.0

